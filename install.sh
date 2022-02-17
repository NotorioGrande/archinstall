#!/bin/bash

hostname=
user=



#time zone
ln -sf usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
echo "Time zone updated..."
#localization 
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen #uncomment en_US UTF-8 line
sed -i 's/#pt_BR.UTF-8 UTF-8/pt_PT.UTF-8 UTF-8/g' /etc/locale.gen #uncomment pt_BR UTF-8 line
locale-gen
echo LANG=pt_BR.UTF-8 > /etc/locale.conf
echo "Localization configured"
#hostname and hosts file
echo $hostname > /etc/hostname
echo "127.0.0.1	localhost.localdomain	localhost" >> /etc/hosts
echo "::1		localhost.localdomain	localhost" >> /etc/hosts
echo "127.0.1.1	$hostname.localdomain	$hostname" >> /etc/hosts
echo "Hostname and hosts file created"
#packages
#shell
pacman -S zsh --noconfirm
#nvidia
pacman -S nvidia nvidia-utils --noconfirm
#xdg
pacman -S xdg-utils xdg-user-dirs --noconfirm
#browser
pacman -S firefox --noconfirm
#i3 gaps and xorg
pacman -S xorg xorg-init xterm i3-gaps i3-status ttf-dejavu --noconfirm
#lightdm and greeter
pacman -S lightdm lightdm-webkit2-greeter --noconfirm
systemctl enable lightdm.service

sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf
#sound - pipewire and alsa and pulseaudio volume control
pacman -S alsa-utils pipewire wireplumber pipewire-alsa pipewire-pulse --noconfirm
#terminal
pacman -S alacritty --noconfirm
#rofi and dmenu - dmenu if rofi stops working, just in case
pacman -S rofi dmenu --noconfirm






#install network manager and enable it
pacman -S networkmanager network-manager-applet --noconfirm
systemctl enable NetworkManager
#sudo
pacman -S sudo --noconfirm
echo "Must update sudo config with visudo"
useradd -mG wheel $user
