#!/bin/bash
old_count=$(cat /home/kevin/filecheck/count.txt)
new_count=$(ls -ltr /data | wc -l)

if [ "$old_count" != "$new_count" ]; then
echo "$(date "+%FT%T"): Change in filecount detected. Restarting minidlna" >> /home/kevin/filecheck/update.log
sudo systemctl restart minidlna
ls -ltr /data | wc -l > /home/kevin/filecheck/count.txt
echo "$(date "+%FT%T"): Updating current count to $new_count" >> /home/kevin/filecheck/update.log
else
echo "$(date "+%FT%T"): No changes to filecount detected and there is no need to do anything" >> /home/kevin/filecheck/update.log
fi
