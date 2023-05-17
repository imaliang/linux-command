#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# git配置
mkdir -p ~/.ssh/
echo "$GIT_SSH_RSA_PRIVATE_KEY" | tr -d '\r' >~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
rm -rf ~/.ssh/known_hosts
ssh-keyscan github.com >>~/.ssh/known_hosts
git config --global user.name 'imaliang'
git config --global user.email 'aliang.link@foxmail.com'
echo '🎉 🎉 🎉 git set done 🎉🎉🎉'

git clone -b gh-pages git@github.com:jaywcjlove/linux-command.git
cp README.md linux-command/README.md
cp img/banner.svg linux-command/img/banner.svg
cd linux-command
echo 'linux.aliang.link' > CNAME

rm -rf .git/
git init
git add -A
git branch -m master
git commit -m 'GitHub Actions 自动更新部署 🚀'
git push -f git@github.com:imaliang/linux-command.git master:gh-pages
echo '🎉 🎉 🎉 linux-command deploy to gitHub pages success 🎉 🎉 🎉'


# 测试用
#echo 按任意键继续
#read -n 1
#echo 继续
