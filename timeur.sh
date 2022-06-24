#!/bin/bash
 hour=0
 #min
 sec=0
        while [ $hour -ge 0 ]; do
                 while [ $1 -ge 0 ]; do
                         while [ $sec -ge 0 ]; do
                                 echo -ne "$hour:$1:$sec\033[0K\r"
                                 let "sec=sec-1"
                                 sleep 1
                         done
                         sec=59
                         let "min=min-1"
                 done
                 min=59
                 let "hour=hour-1"
         done
