#!/bin/bash

while true
do
    # Get current UTC hour and minute
    current_hour=$(date -u +%H)
    current_minute=$(date -u +%M)

    # Calculate seconds until next 11:35 PM UTC (3:35 AM Oman)
    target_hour=23
    target_minute=35
    seconds_now=$((10#$current_hour*3600 + 10#$current_minute*60))
    seconds_target=$((target_hour*3600 + target_minute*60))

    if [ $seconds_target -le $seconds_now ]; then
        # If time already passed, schedule for next day
        seconds_target=$((seconds_target + 86400))
    fi

    sleep_seconds=$((seconds_target - seconds_now))

    # Wait until 3:35 AM Oman
    sleep $sleep_seconds

    # Run the commit script
    ~/daily-learning/auto_commit_2000.sh

    # Sleep 24 hours until next run
    sleep 86400
done
