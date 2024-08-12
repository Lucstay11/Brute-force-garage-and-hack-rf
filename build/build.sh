#!/bin/bash
#Autheur Lucstay11
#Install APP RF binary for Raspberry PI

make && sudo make install
cp -f /usr/bin/piopera ../
cp -f /usr/bin/sendiq ../
cp -f /usr/bin/tune ../
cd fm/;make;make clean;cp -f fm_transmitter ../../
