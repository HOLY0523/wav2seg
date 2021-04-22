#!/bin/bash
touch segments
while read line; do
    ID=${line% *}
    WAV=${line#* }
    sox --i -D ${WAV} | awk '{printf("%.3f\n",$1)}' | sed -e "s/^/$ID $ID 0 /" >> segments
done < ./wav.scp
