#!/usr/bin/env bash
set -e

# ===== CONFIG =====
PRIMARY_REPO="git@github.com:serajurahmanit-coder/Primary-Repo1.git"
SECONDARY_REPO="git@github.com:serajurahmanit-coder/Secondary-Repo.git"
MIRROR_DIR="$HOME/primary-repo-mirror.git"
# ==================

echo "Starting Git mirror sync..."

# Clone primary repo as mirror if it doesn't exist
if [ ! -d "$MIRROR_DIR" ]; then
  echo "Cloning Primary Repository as Mirror..."
  git clone --mirror "$PRIMARY_REPO" "$MIRROR_DIR"
else
  echo "Mirror repo already exists."
fi

cd "$MIRROR_DIR"

echo "Fetching latest changes from primary..."
git remote update --prune

echo "Pushing mirror to secondary..."
git push --mirror "$SECONDARY_REPO"

echo "Mirror sync completed successfully."
