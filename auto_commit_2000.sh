#!/bin/bash

for i in $(seq 1 2000)
do
  echo "Commit $i - $(date)" >> commit_log_2000.txt
  git add commit_log_2000.txt
  git commit -m "Auto commit $i"
done

git push origin main

