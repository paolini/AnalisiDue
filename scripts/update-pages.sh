#!/bin/sh
set -eu

remote=${1:-origin}
root=$(git rev-parse --show-toplevel)
html="$root/AnalisiDue.html"

if [ ! -f "$html" ]; then
  echo "File HTML mancante: eseguire make html." >&2
  exit 1
fi

# FETCH_HEAD permette di usare anche remoti senza un refspec per pages.
git -C "$root" fetch "$remote" pages
base=$(git -C "$root" rev-parse FETCH_HEAD)
temp_dir=$(mktemp -d)
worktree="$temp_dir/pages"
cleanup() {
  if [ -d "$worktree" ]; then
    git -C "$root" worktree remove --force "$worktree"
  fi
  rmdir "$temp_dir"
}
trap cleanup EXIT
trap 'exit 1' HUP INT TERM

git -C "$root" worktree add --detach "$worktree" "$base"
cp "$html" "$worktree/index.html"
git -C "$worktree" add -- index.html

if git -C "$worktree" diff --cached --quiet; then
  echo "Il branch pages contiene già questo HTML."
  exit 0
fi

git -C "$worktree" commit -m "Aggiorna la versione HTML"
# Il push normale rifiuta aggiornamenti concorrenti senza sovrascriverli.
git -C "$worktree" push "$remote" HEAD:refs/heads/pages
