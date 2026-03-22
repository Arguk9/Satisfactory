#!/bin/bash
echo "============================================"
echo "  SATISFACTORY SAVE SYNC - Saving Progress"
echo "============================================"
echo
# Move up one level to the repo root (where the .sav files live)
cd "$(dirname "$0")/.."

echo "[1/3] Staging save files..."
git add *.sav
if [ $? -ne 0 ]; then
    echo
    echo "[ERROR] git add failed!"
    exit 1
fi
echo

echo "[2/3] Committing saves..."
git commit -m "save: $(date '+%Y-%m-%d %H:%M')"
if [ $? -ne 0 ]; then
    echo
    echo "[ERROR] git commit failed! There may be nothing new to save."
    exit 1
fi
echo

echo "[3/3] Pushing saves to remote..."
git push origin main
if [ $? -ne 0 ]; then
    echo
    echo "[ERROR] git push failed! Check your connection or resolve conflicts."
    exit 1
fi
echo

echo "All saves pushed! Good game :)"
echo
