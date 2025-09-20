#!/bin/bash


### HELMETS
rm -rf ../public/backpacks-* 2>/dev/null 

nodejs backpacks.js

mkdir -p ../public/backpacks/
mkdir -p ../public/backpacks-light/
mkdir -p ../public/backpacks-medium/
mkdir -p ../public/backpacks-heavy/

cat ../website/header.html >> ../public/backpacks-light/index.html
cat ../website/header.html >> ../public/backpacks-medium/index.html
cat ../website/header.html >> ../public/backpacks-heavy/index.html

cat ../tmp/backpacks-light.html >> ../public/arms-light/index.html
cat ../tmp/backpacks-medium.html >> ../public/arms-medium/index.html
cat ../tmp/backpacks-heavy.html >> ../public/arms-heavy/index.html

cat ../website/footer.html >> ../public/backpacks-light/index.html
cat ../website/footer.html >> ../public/backpacks-medium/index.html
cat ../website/footer.html >> ../public/backpacks-heavy/index.html

for ID in $( cat ../tmp/backpacks.txt )
        do
	if [ -f "../public/backpacks/"$ID".png" ]
		then
	        echo " > Backpacks - already downloaded ID: "$ID
	else
	        echo " > Backpacks - downloading ID: "$ID
	        wget "https://cstone.space/uifimages/"$ID".png" -O "../public/backpacks/"$ID".png" 2>/dev/null
		fi
        done
