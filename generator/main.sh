#!/bin/bash

mkdir -p ../tmp/


### HELMETS
nodejs main.js

rm ../public/helmets/index.html

mkdir -p ../public/helmets/
cat head.html >> ../public/helmets/index.html
cat ../tmp/helmets.html >> ../public/helmets/index.html
cat footer.html >> ../public/helmets/index.html

for ID in $( cat ../tmp/helmets.txt )
        do
        echo " > Helmets - downloading ID: "$ID
        wget "https://cstone.space/uifimages/"$ID".png" -O "../public/helmets/"$ID".png" 2>/dev/null
        done
