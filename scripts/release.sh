#!/bin/sh
# Pubblica una release su Codeberg: compila il PDF, crea il tag, fa il push
# di main e del tag e crea la release con allegato AnalisiDueTyp.pdf.
# Con RELEASE_GITHUB=yes la rispecchia anche su GitHub (e quindi su Zenodo).
#
# Uso: sh scripts/release.sh TAG [remoto-codeberg]
#
# Il token di Codeberg (permesso repository: lettura e scrittura) viene letto
# dalla variabile CODEBERG_TOKEN oppure dal file
# ~/.config/analisidue/codeberg-token.
# Le note di rilascio sono l'elenco dei commit dal tag precedente, a meno che
# NOTES_FILE indichi un file con il testo da usare.
set -eu

tag=${1:?Uso: $0 TAG [REMOTO]}
remote=${2:-origin}
codeberg_api=https://codeberg.org/api/v1/repos/paolini/AnalisiDue
token_file=${CODEBERG_TOKEN_FILE:-$HOME/.config/analisidue/codeberg-token}
root=$(git rev-parse --show-toplevel)
cd "$root"

die() { echo "Errore: $*" >&2; exit 1; }

# --- Controlli preliminari: nulla viene modificato prima che passino tutti.

if [ -z "${CODEBERG_TOKEN:-}" ]; then
  [ -r "$token_file" ] || die "token mancante: imposta CODEBERG_TOKEN o crea $token_file"
  CODEBERG_TOKEN=$(tr -d ' \n\r' < "$token_file")
fi
[ -n "$CODEBERG_TOKEN" ] || die "il token è vuoto"

[ "$(git branch --show-current)" = main ] || die "non sei sul branch main"

# AnalisiDue.html è generato da make html: le sue modifiche non contano.
if [ -n "$(git status --porcelain --untracked-files=no -- . ':!AnalisiDue.html')" ]; then
  die "ci sono modifiche non committate"
fi

git fetch -q "$remote" main
[ -z "$(git rev-list HEAD..FETCH_HEAD)" ] || die "$remote/main contiene commit che non hai in locale"

# Se il tag esiste già (per esempio dopo un tentativo interrotto) deve
# puntare a HEAD sia in locale sia sul remoto: in quel caso si crea solo
# la release.
head=$(git rev-parse HEAD)
local_tag=$(git rev-parse -q --verify "refs/tags/$tag^{commit}" || true)
remote_tag=$(git ls-remote "$remote" "refs/tags/$tag^{}" "refs/tags/$tag" | sort -k2 -r | head -n1 | cut -f1)
if [ -z "$local_tag$remote_tag" ]; then
  create_tag=yes
elif [ "$local_tag" = "$head" ] && [ "$remote_tag" = "$head" ]; then
  create_tag=no
  echo "Il tag $tag esiste già su HEAD: creo solo la release."
else
  die "il tag $tag esiste già e non corrisponde a HEAD pubblicato su $remote"
fi

temp_dir=$(mktemp -d)
trap 'rm -rf "$temp_dir"' EXIT
trap 'exit 1' HUP INT TERM

# Il token passa a curl tramite file, così non compare nell'elenco dei processi.
(umask 077; printf 'Authorization: token %s\n' "$CODEBERG_TOKEN" > "$temp_dir/auth")

status=$(curl -sS -o "$temp_dir/repo.json" -w '%{http_code}' -H "@$temp_dir/auth" "$codeberg_api")
[ "$status" = 200 ] || die "Codeberg ha rifiutato il token (HTTP $status)"
python3 -c 'import json,sys; sys.exit(0 if json.load(open(sys.argv[1]))["permissions"]["push"] else 1)' \
  "$temp_dir/repo.json" || die "il token non ha il permesso di scrittura sul repository"

status=$(curl -sS -o /dev/null -w '%{http_code}' -H "@$temp_dir/auth" "$codeberg_api/releases/tags/$tag")
[ "$status" = 404 ] || die "la release $tag esiste già su Codeberg (HTTP $status)"

# --- Note di rilascio.

if [ -n "${NOTES_FILE:-}" ]; then
  cp "$NOTES_FILE" "$temp_dir/notes"
elif previous=$(git describe --tags --abbrev=0 --exclude "$tag" HEAD 2> /dev/null); then
  { echo "Modifiche da $previous:"; echo; git log --format='- %s' "$previous..HEAD"; } > "$temp_dir/notes"
else
  echo "Release $tag" > "$temp_dir/notes"
fi

echo "Note di rilascio:"
sed 's/^/  /' "$temp_dir/notes"

# --- Compilazione, tag e push.

make pdf
[ -s AnalisiDue.pdf ] || die "AnalisiDue.pdf non è stato generato"

if [ "$create_tag" = yes ]; then
  git tag "$tag"
  git push "$remote" main "refs/tags/$tag"
fi

# --- Release su Codeberg.

python3 - "$tag" "$temp_dir/notes" > "$temp_dir/release-request.json" <<'EOF'
import json, sys
tag, notes = sys.argv[1], open(sys.argv[2]).read()
print(json.dumps({"tag_name": tag, "name": tag, "body": notes}))
EOF

curl -fsS -X POST "$codeberg_api/releases" \
  -H "@$temp_dir/auth" -H "Content-Type: application/json" \
  --data-binary "@$temp_dir/release-request.json" -o "$temp_dir/release.json"
release_id=$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["id"])' "$temp_dir/release.json")

curl -fsS -X POST "$codeberg_api/releases/$release_id/assets?name=AnalisiDueTyp.pdf" \
  -H "@$temp_dir/auth" -F "attachment=@AnalisiDue.pdf;type=application/pdf" -o /dev/null

echo "Release creata: https://codeberg.org/paolini/AnalisiDue/releases/tag/$tag"

if [ "${RELEASE_GITHUB:-no}" = yes ]; then
  sh scripts/github-release.sh "$tag"
else
  echo "Per rispecchiarla su GitHub e Zenodo: make github-release TAG=$tag"
fi
