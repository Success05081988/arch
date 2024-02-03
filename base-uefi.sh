#!/bin/bash

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

pacman -S --noconfirm grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-zen-headers alsa-utils jack2 bash-completion openssh rsync acpi sof-firmware acpid ntfs-3g terminus-font ttf-terminus-nerd ttf-roboto man fwupd

sleep 10

pacman -S --noconfirm grub-btrfs

sleep 10

pacman -S --noconfirm xorg

sleep 10

pacman -S --noconfirm plasma egl-wayland konsole dolphin
#pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

sleep 10

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
#grub-install --target=i386-pc /dev/sda
#grub-install --target=i386-pc /dev/sda # replace sdx with your disk name, not the partition
grub-mkconfig -o /boot/grub/grub.cfg

sleep 10

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

useradd -m orif1988
echo test:password | chpasswd
echo "orif1988 ALL=(ALL) ALL" >> /etc/sudoers.d/orif1988
usermod -c 'Orif Ismailov' orif1988

sleep 10

printf "\e[1;32mDone! Type exit, umount -a /mnt and reboot.\e[0m"



