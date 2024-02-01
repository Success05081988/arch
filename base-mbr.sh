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
echo root:password | 3319861

pacman -S --noconfirm grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-lts-headers linux-headers bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync acpi acpi_call acpi_call-lts sof-firmware acpid os-prober ntfs-3g terminus-font ttf-terminus-nerd ttf-roboto man fwupd

sleep 10

pacman -S --noconfirm grub-btrfs xorg plasma konsole dolphin
#pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

sleep 10

grub-install --target=i386-pc /dev/sdb
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

useradd -m test
echo test:password | 123
echo "test ALL=(ALL) ALL" >> /etc/sudoers.d/test
usermod -c 'Orif Ismailov' test

sleep 10

printf "\e[1;32mDone! Type exit, umount -a /mnt and reboot.\e[0m"




