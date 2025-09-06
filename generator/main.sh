#!/bin/bash


mkdir -p ../tmp/

rm  ../public/index.html 2>/dev/null
cat ../website/header.html >> ../public/index.html
cat ../website/footer.html >> ../public/index.html
cp  ../website/default.css ../public/

./helmets.sh

  
