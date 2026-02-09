#!/bin/bash

# Go to your repo
cd ~/daily-learning || exit

# Loop 10,000 times
for i in $(seq 1 10000)
do
  # Append random content
  echo "Commit $i $(date) $RANDOM" >> commits.txt

  # Stage and commit
  git add commits.txt
  git commit -m "Auto commit $i"
done

# Push all commits at once
git push origin main

