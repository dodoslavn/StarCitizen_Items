#!/bin/bash


### HELMETS
nodejs helmets.js

rm ../public/helmets/ 2>/dev/null 

mkdir -p ../public/helmets/
mkdir -p ../public/helmets-light/
mkdir -p ../public/helmets-medium/
mkdir -p ../public/helmets-heavy/

cat ../website/header.html >> ../public/helmets-light/index.html
cat ../website/header.html >> ../public/helmets-medium/index.html
cat ../website/header.html >> ../public/helmets-heavy/index.html

cat ../tmp/helmets-light.html >> ../public/helmets-light/index.html
cat ../tmp/helmets-medium.html >> ../public/helmets-medium/index.html
cat ../tmp/helmets-heavy.html >> ../public/helmets-heavy/index.html

cat ../website/footer.html >> ../public/helmets-light/index.html
cat ../website/footer.html >> ../public/helmets-medium/index.html
cat ../website/footer.html >> ../public/helmets-heavy/index.html

for ID in $( cat ../tmp/helmets.txt )
        do
        echo " > Helmets - downloading ID: "$ID
        wget "https://cstone.space/uifimages/"$ID".png" -O "../public/helmets/"$ID".png" 2>/dev/null
        done
