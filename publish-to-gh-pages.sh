#!/bin/bash
set -ev

# get clone master
git clone https://${GH_REF} .deploy_git
cd .deploy_git
git checkout master

cd ../
mv .deploy_git/.git/ ./public/

cd ./public

git config user.name "Leafney"
git config user.email "babycoolzx@126.com"

# add commit timestamp
git add .
git commit -m "Travis CI Auto Builder at `date +"%Y-%m-%d %H:%M"`"

# Github Pages
git push --force --quiet "https://${TravisCIToken}@${GH_REF}" master:master

# Coding Pages
git push --force --quiet "https://Leafney:${CodingToken}@${CD_REF}" master:master