#!/bin/bash

echo "============================================"
echo "  SATISFACTORY SAVE SYNC - Starting Up"
echo "============================================"
echo

# Move up one level to the repo root (where the .sav files live)
cd "$(dirname "$0")/.."

echo "[1/2] Pulling latest saves from remote..."
git pull origin main
if [ $? -ne 0 ]; then
    echo
    echo "[ERROR] git pull failed! Check your connection or resolve conflicts."
    exit 1
fi

echo
echo "[2/2] Saves are up to date! Happy playing :)"
echo

# Optional: launch Satisfactory automatically via Steam
# Uncomment the line below to auto-launch after pulling
# steam steam://rungameid/526870
