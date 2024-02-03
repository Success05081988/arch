#!/bin/bash
print "НАЧИНАЕТСЯ УСТАНОВКА ARCH-LINUX"

pacman -Syy
ln -sf /usr/share/zoneinfo/Asia/Tashkent /etc/localtime
hwclock --systohc
sed -i '398s/.//' /etc/locale.gen
locale-gen
sleep 5
echo "LANG=ru_RU.UTF-8" >> /etc/locale.conf
echo "KEYMAP=ru" >> /etc/vconsole.conf
echo "FONT=cyr-sun16" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
sleep 5
echo root:password | chpasswd

pacman -S --noconfirm grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-zen-headers bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync acpi tlp sof-firmware acpid ntfs-3g terminus-font ttf-terminus-nerd ttf-roboto man fwupd

sleep 5

pacman -S --noconfirm grub-btrfs

sleep 5

pacman -S --noconfirm xorg

sleep 5

pacman -S --noconfirm plasma 

sleep 10

pacman -S --noconfirm egl-wayland konsole dolphin plasma-wayland-session neofetch htop inxi bpytop elisa vlc chromium okular gwenview obs-studio

sleep 5

grub-install --target=i386-pc /dev/sdb
#grub-install --target=i386-pc /dev/sda # replace sdx with your disk name, not the partition
grub-mkconfig -o /boot/grub/grub.cfg

sleep 5

systemctl enable NetworkManager
#systemctl enable bluetooth
#systemctl enable cups.service
#systemctl enable sshd
#systemctl enable avahi-daemon
systemctl enable sddm 
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable acpid

sleep 5

useradd -m test
echo test:password | chpasswd
echo "test ALL=(ALL) ALL" >> /etc/sudoers.d/test
usermod -c 'Orif Ismailov' test

cd /home/test/Загрузки
git clone https://aur.archlinux.org/yay-bin
cd /yay-bin
--noconfirm makepkg -si

sleep 5

printf "\e[1;32mDone! Type exit, umount -a /mnt and reboot.\e[0m"




