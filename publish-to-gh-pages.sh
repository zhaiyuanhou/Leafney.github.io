#!/bin/bash
set -ev

# modify time zone
# sudo ln -sf /usr/share/zoneinfo/Asia/ShangHai /etc/localtime
# sudo echo "Asia/Shanghai" > /etc/timezone
# sudo dpkg-reconfigure -f noninteractive tzdata

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

git push --force --quiet "https://${TravisCIToken}@${GH_REF}" master:master