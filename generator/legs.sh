#!/bin/bash


### HELMETS
rm -rf ../public/legs-* 2>/dev/null 

nodejs legs.js

mkdir -p ../public/legs/
mkdir -p ../public/legs-light/
mkdir -p ../public/legs-medium/
mkdir -p ../public/legs-heavy/

cat ../website/header.html >> ../public/legs-light/index.html
cat ../website/header.html >> ../public/legs-medium/index.html
cat ../website/header.html >> ../public/legs-heavy/index.html

cat ../tmp/legs-light.html >> ../public/legs-light/index.html
cat ../tmp/legs-medium.html >> ../public/legs-medium/index.html
cat ../tmp/legs-heavy.html >> ../public/legs-heavy/index.html

cat ../website/footer.html >> ../public/legs-light/index.html
cat ../website/footer.html >> ../public/legs-medium/index.html
cat ../website/footer.html >> ../public/legs-heavy/index.html

for ID in $( cat ../tmp/legs.txt )
        do
	if [ -f "../public/legs/"$ID".png" ]
		then
	        echo " > Legs - already downloaded ID: "$ID
	else
	        echo " > Legs - downloading ID: "$ID
	        wget "https://cstone.space/uifimages/"$ID".png" -O "../public/legs/"$ID".png" 2>/dev/null
		fi
        done
