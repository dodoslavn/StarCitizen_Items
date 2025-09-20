#!/bin/bash


### HELMETS
rm -rf ../public/arms-* 2>/dev/null 

nodejs arms.js

mkdir -p ../public/arms/
mkdir -p ../public/arms-light/
mkdir -p ../public/arms-medium/
mkdir -p ../public/arms-heavy/

cat ../website/header.html >> ../public/arms-light/index.html
cat ../website/header.html >> ../public/arms-medium/index.html
cat ../website/header.html >> ../public/arms-heavy/index.html

cat ../tmp/arms-light.html >> ../public/arms-light/index.html
cat ../tmp/arms-medium.html >> ../public/arms-medium/index.html
cat ../tmp/arms-heavy.html >> ../public/arms-heavy/index.html

cat ../website/footer.html >> ../public/arms-light/index.html
cat ../website/footer.html >> ../public/arms-medium/index.html
cat ../website/footer.html >> ../public/arms-heavy/index.html

for ID in $( cat ../tmp/arms.txt )
        do
	if [ -f "../public/arms/"$ID".png" ]
		then
	        echo " > Arms - already downloaded ID: "$ID
	else
	        echo " > Arms - downloading ID: "$ID
	        wget "https://cstone.space/uifimages/"$ID".png" -O "../public/arms/"$ID".png" 2>/dev/null
		fi
        done
