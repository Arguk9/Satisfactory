#!/bin/bash

echo "============================================"
echo "  SATISFACTORY SAVE SYNC - Wrapping Up"
echo "============================================"
echo

# Move up one level to the repo root (where the .sav files live)
cd "$(dirname "$0")/.."

# Check if there's anything to commit
if git status --porcelain | grep -q .; then
    echo "[1/3] Staging save files..."
    git add -A

    echo "[2/3] Committing..."
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
    git commit -m "Save: ${USER} on ${TIMESTAMP}"
    if [ $? -ne 0 ]; then
        echo
        echo "[ERROR] Commit failed!"
        exit 1
    fi

    echo "[3/3] Pushing to remote..."
    git push origin main
    if [ $? -ne 0 ]; then
        echo
        echo "[ERROR] Push failed! Check your connection."
        exit 1
    fi

    echo
    echo "============================================"
    echo "  All saves pushed! See you next time."
    echo "============================================"
else
    echo "No changes detected in save files. Nothing to push."
fi
