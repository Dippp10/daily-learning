#!/bin/bash

cd ~/daily-learning

# Ensure the file exists
touch commit_log.txt

# Loop for 2000 commits
for i in $(seq 1 2000)
do
    echo "Commit number $i at $(date '+%Y-%m-%d %H:%M:%S')" >> commit_log.txt
    git add commit_log.txt
    git commit -m "Auto commit #$i from UserLAnd"
done

# Push all commits at once
git push origin main
