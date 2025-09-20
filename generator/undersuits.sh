#!/bin/bash


### HELMETS
rm -rf ../public/undersuits-* 2>/dev/null 

nodejs undersuits.js

mkdir -p ../public/undersuits/
#mkdir -p ../public/undersuits-light/
#mkdir -p ../public/undersuits-medium/
#mkdir -p ../public/undersuits-heavy/

cat ../website/header.html >> ../public/undersuits/index.html
#cat ../website/header.html >> ../public/undersuits-light/index.html
#cat ../website/header.html >> ../public/undersuits-medium/index.html
#cat ../website/header.html >> ../public/undersuits-heavy/index.html

cat ../tmp/undersuits.html >> ../public/undersuits/index.html
#cat ../tmp/undersuits-light.html >> ../public/arms-light/index.html
#cat ../tmp/undersuits-medium.html >> ../public/arms-medium/index.html
#cat ../tmp/undersuits-heavy.html >> ../public/arms-heavy/index.html

cat ../website/footer.html >> ../public/undersuits/index.html
#cat ../website/footer.html >> ../public/undersuits-light/index.html
#cat ../website/footer.html >> ../public/undersuits-medium/index.html
#cat ../website/footer.html >> ../public/undersuits-heavy/index.html

for ID in $( cat ../tmp/undersuits.txt )
        do
	if [ -f "../public/undersuits/"$ID".png" ]
		then
	        echo " > Undersuits - already downloaded ID: "$ID
	else
	        echo " > Undersuits - downloading ID: "$ID
	        wget "https://cstone.space/uifimages/"$ID".png" -O "../public/undersuits/"$ID".png" 2>/dev/null
		fi
        done
