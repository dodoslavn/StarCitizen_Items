#!/bin/bash


mkdir -p ../tmp/


cat ../website/header.html >> ../public/index.html
cat ../website/footer.html >> ../public/index.html

./helmets.sh

  
