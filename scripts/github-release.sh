#!/bin/sh
# Rispecchia su GitHub una release pubblicata su Codeberg: push del tag sul
# remoto GitHub e creazione della release con lo stesso titolo, testo e
# allegati. GitHub notifica Zenodo, che archivia la release.
#
# Uso: sh scripts/github-release.sh v1.2.0 [remoto-github]
set -eu

tag=${1:?Uso: $0 TAG [REMOTO]}
remote=${2:-github}
codeberg_api=https://codeberg.org/api/v1/repos/paolini/AnalisiDue
github_repo=paolini/AnalisiDue

# La directory temporanea sta nella home perché gh installato via snap
# non può leggere /tmp.
temp_dir=$(mktemp -d "$HOME/.analisidue-release.XXXXXX")
trap 'rm -rf "$temp_dir"' EXIT
trap 'exit 1' HUP INT TERM

curl -fsSL "$codeberg_api/releases/tags/$tag" -o "$temp_dir/release.json"

python3 - "$temp_dir" <<'EOF'
import json, sys, urllib.request, os
d = sys.argv[1]
r = json.load(open(os.path.join(d, "release.json")))
open(os.path.join(d, "title"), "w").write(r["name"] or r["tag_name"])
open(os.path.join(d, "notes"), "w").write(r["body"] or "")
os.mkdir(os.path.join(d, "assets"))
for a in r["assets"]:
    print("Scarico", a["name"])
    urllib.request.urlretrieve(a["browser_download_url"], os.path.join(d, "assets", a["name"]))
EOF

git push "$remote" "refs/tags/$tag"
gh release create "$tag" "$temp_dir"/assets/* \
  --repo "$github_repo" --verify-tag \
  --title "$(cat "$temp_dir/title")" --notes-file "$temp_dir/notes"
