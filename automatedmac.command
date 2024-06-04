#!/bin/sh
diskutil list
diskutil eraseVolume JHFS+ Ventura disk2s2
diskutil eraseVolume JHFS+ Monterey disk2s3

sudo /usr/sbin/asr imagescan --source /Users/school_tech/Desktop/Ventura_13_5_1.dmg --nostream
sudo /usr/sbin/asr restore --source /Users/school_tech/Desktop/Ventura_13_5_1.dmg --target /Volumes/Ventura --erase --noprompt

sudo /usr/sbin/asr imagescan --source /Users/school_tech/Desktop/Monterey_12_6_8.dmg --nostream
sudo /usr/sbin/asr restore --source /Users/school_tech/Desktop/Monterey_12_6_8.dmg --target /Volumes/Monterey --erase --noprompt