#!/bin/bash


### HELMETS
rm -rf ../public/torsos-* 2>/dev/null 

nodejs torsos.js

mkdir -p ../public/torsos/
mkdir -p ../public/torsos-light/
mkdir -p ../public/torsos-medium/
mkdir -p ../public/torsos-heavy/

cat ../website/header.html >> ../public/torsos-light/index.html
cat ../website/header.html >> ../public/torsos-medium/index.html
cat ../website/header.html >> ../public/torsos-heavy/index.html

cat ../tmp/torsos-light.html >> ../public/torsos-light/index.html
cat ../tmp/torsos-medium.html >> ../public/torsos-medium/index.html
cat ../tmp/torsos-heavy.html >> ../public/torsos-heavy/index.html

cat ../website/footer.html >> ../public/torsos-light/index.html
cat ../website/footer.html >> ../public/torsos-medium/index.html
cat ../website/footer.html >> ../public/torsos-heavy/index.html

for ID in $( cat ../tmp/torsos.txt )
        do
	if [ -f "../public/torsos/"$ID".png" ]
		then
	        echo " > Arms - already downloaded ID: "$ID
	else
	        echo " > Arms - downloading ID: "$ID
	        wget "https://cstone.space/uifimages/"$ID".png" -O "../public/torsos/"$ID".png" 2>/dev/null
		fi
        done
