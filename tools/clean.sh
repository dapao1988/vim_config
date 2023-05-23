#! /bin/bash

#================================================================
#   Copyright (C) 2019 All rights reserved.
#
#   File Name      ：clean.sh
#   Author         ：Wenbing.Wang
#   Created Time   ：2018-12-24
#   Description    ：a tool of experience, used for clean linux-baseds ystem
#================================================================

# 这是我多年使用慢慢积累下来的清理ubuntu /var 以及 /boot 等磁盘冗余垃圾的脚本
# 从18.04、20.04、22.04一直在使用，无副作用
# 清理旧版本的软件缓存
sudo apt-get autoclean
# 清理所有软件缓存
sudo apt-get clean
# 删除系统不再使用的孤立软件
sudo apt-get autoremove
# check the storage used in old logs
journalctl --disk-usage
# to clear logs before 3 days - number before d can be changed
sudo journalctl --vacuum-time=3d

#dpkg --get-selections | grep linux
#apt-get remove **
#sudo synaptic
sudo apt purge libreoffice-common
sudo apt purge unity-webapps-common
sudo apt purge thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese gnome-sudoku transmission-common gnome-orca webbrowser-app landscape-client-ui-install
sudo apt purge deja-dup

# 清除安装的中间临时文件
make dist-clean

# decide whether to delete it
# 包管理的临时文件目录
ls -al /var/cache/apt/archives
sudo du -sh /var/cache/apt/archives
# 没有下载完的在
ls -al /var/cache/apt/archives/partial
sudo du -sh /var/cache/apt/archives/partial
sudo rm -rf /var/tmp
# 清除残余的配置文件
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P
# 删除多余内核
dpkg --get-selections|grep linux
#sudo apt-get remove linux-image-2.6.32-22-generic


# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        echo "$snapname --revision=$revision"
        sudo snap remove "$snapname" --revision="$revision"
    done

#Ubuntu自动创建缩略图，以在文件管理器中查看。它将这些缩略图存储在用户帐户中~/ .cache/thumbnails位置的隐藏目录中。
#因此，每隔几个月左右清除缩略图缓存是一个好习惯
rm -rf ~/.cache/thumbnails/*

#一种通过正则表达式匹配内核然后除最新的统统删除
sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge
#sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'
