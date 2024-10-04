#!/bin/bash
hour=0 
min=$1 
sec=0

# Timer
while [ $hour -ge 0 ]; do
    while [ $min -ge 0 ]; do
        while [ $sec -ge 0 ]; do
            printf "%02d:%02d:%02d\033[0K\r" $hour $min $sec
            let "sec=sec-1"
            sleep 1
        done
        sec=59
        let "min=min-1"
    done
    min=59
    let "hour=hour-1"
done

echo "Finish!"

