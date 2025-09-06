#!/bin/bash


### HELMETS
nodejs helmets.js

rm -rf ../public/helmets/ 2>/dev/null 

mkdir ../public/helmets/
mkdir ../public/helmets/light/
cat ../website/header.html >> ../public/helmets/light/index.html
cat ../tmp/helmets.html >> ../public/helmets/light/index.html
cat ../website/footer.html >> ../public/helmets/light/index.html

exit
for ID in $( cat ../tmp/helmets.txt )
        do
        echo " > Helmets - downloading ID: "$ID
        wget "https://cstone.space/uifimages/"$ID".png" -O "../public/helmets/"$ID".png" 2>/dev/null
        done
