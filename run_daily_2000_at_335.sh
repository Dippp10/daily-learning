#!/bin/bash

while true
do
    echo "Waiting for next 3:35 AM Oman run..."
    echo "Current UTC time: $(date -u)"

    current_hour=$(date -u +%H)
    current_minute=$(date -u +%M)

    target_hour=23
    target_minute=35

    seconds_now=$((10#$current_hour*3600 + 10#$current_minute*60))
    seconds_target=$((target_hour*3600 + target_minute*60))

    if [ $seconds_target -le $seconds_now ]; then
        seconds_target=$((seconds_target + 86400))
    fi

    sleep_seconds=$((seconds_target - seconds_now))

    echo "Sleeping for $sleep_seconds seconds..."
    sleep $sleep_seconds

    echo "Running 2000 commits now..."
    ~/daily-learning/auto_commit_2000.sh

    echo "Done. Sleeping 24 hours..."
    sleep 86400
done
