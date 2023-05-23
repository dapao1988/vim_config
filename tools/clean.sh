#! /bin/bash

#================================================================
#   Copyright (C) 2019 All rights reserved.
#
#   File Name      ��clean.sh
#   Author         ��Wenbing.Wang
#   Created Time   ��2018-12-24
#   Description    ��a tool of experience, used for clean linux-baseds ystem
#================================================================

# �����Ҷ���ʹ��������������������ubuntu /var �Լ� /boot �ȴ������������Ľű�
# ��18.04��20.04��22.04һֱ��ʹ�ã��޸�����
# ����ɰ汾���������
sudo apt-get autoclean
# ���������������
sudo apt-get clean
# ɾ��ϵͳ����ʹ�õĹ������
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

# �����װ���м���ʱ�ļ�
make dist-clean

# decide whether to delete it
# ���������ʱ�ļ�Ŀ¼
ls -al /var/cache/apt/archives
sudo du -sh /var/cache/apt/archives
# û�����������
ls -al /var/cache/apt/archives/partial
sudo du -sh /var/cache/apt/archives/partial
sudo rm -rf /var/tmp
# �������������ļ�
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P
# ɾ�������ں�
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

#Ubuntu�Զ���������ͼ�������ļ��������в鿴��������Щ����ͼ�洢���û��ʻ���~/ .cache/thumbnailsλ�õ�����Ŀ¼�С�
#��ˣ�ÿ�������������������ͼ������һ����ϰ��
rm -rf ~/.cache/thumbnails/*

#һ��ͨ��������ʽƥ���ں�Ȼ������µ�ͳͳɾ��
sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge
#sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'
