#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Tashkent /etc/localtime
hwclock --systohc
reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy
sed -i '398s/.//' /etc/locale.gen
locale-gen
echo "LANG=ru_RU.UTF-8" >> /etc/locale.conf
echo "KEYMAP=ru" > /etc/vconsole.conf
echo "FONT=cyr-sun16" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S --noconfirm grub htop sudo networkmanager network-manager-applet dialog iwd wireless_tools smartmontools wpa_supplicant mtools dosfstools linux-headers xdg-user-dirs xdg-utils nfs-utils bash-completion openssh rsync acpi acpi_call ipset firewalld sof-firmware acpid os-prober ntfs-3g terminus-font zram-generator btrfs-progs grub-btrfs

# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=i386-pc /dev/sda # replace sdx with your disk name, not the partition
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
#systemctl enable bluetooth
#systemctl enable cups.service
#systemctl enable sshd
#systemctl enable avahi-daemon
#systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
systemctl enable reflector.timer
systemctl enable fstrim.timer
#systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

useradd -mG wheel orif
echo orif:password | chpasswd
sed -i '85s/.//' EDITOR=nano visudo
#usermod -aG libvirt ermanno

#echo "orif ALL=(ALL) ALL" >> /etc/sudoers.d/orif


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




