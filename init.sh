#!/bin/sh
ssh-keygen -t rsa -b 4096 -C "cjfq@users.noreply.github.com"
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
git config user.email "cjfq@users.noreply.github.com"
echo "# dbg" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:cjfq/dbg.git
git push -u origin master
