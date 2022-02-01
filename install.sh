#!/bin/bash

#time zone
ln -sf usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc

#localization 
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen #uncomment en_US UTF-8 line
sed -i 's/#pt_BR.UTF-8 UTF-8/pt_PT.UTF-8 UTF-8/g' /etc/locale.gen #uncomment pt_BR UTF-8 line
locale-gen
echo LANG=pt_BR.UTF-8 > /etc/locale.conf

#hostname and hosts file
echo arch > /etc/hostname
