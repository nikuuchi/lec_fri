#!/bin/bash

mkdir $1
cd $1
cp ../../util/template.y "${1}.y"
cp ../../util/template.l "${1}.l"
sed -e "s/_/${1}/g" ../../util/make.sh  >  make.sh
chmod +x make.sh
