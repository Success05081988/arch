#!/bin/bash
echo "<<------ START INSTALL ARCH-LINUX ------>>"
sleep 3
pacman -Syy
ln -sf /usr/share/zoneinfo/Asia/Tashkent /etc/localtime
hwclock --systohc
sed -i '398s/.//' /etc/locale.gen
locale-gen
sleep 3
echo "LANG=ru_RU.UTF-8" >> /etc/locale.conf
echo "KEYMAP=ru" >> /etc/vconsole.conf
echo "FONT=cyr-sun16" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
sleep 3
echo root:password | chpasswd

pacman -S --noconfirm linux-lts-headers sof-firmware grub alsa-utils \
efibootmgr networkmanager network-manager-applet dialog \
wpa_supplicant mtools dosfstools reflector bash-completion \
openssh rsync acpi acpi_call-lts tlp acpid ntfs-3g \
terminus-font ttf-terminus-nerd ttf-roboto man fwupd git os-prober
#for printers and bluetoth (bluez bluez-utils cups hplip)

sleep 3

pacman -S --noconfirm xorg

sleep 3

pacman -S --noconfirm plasma 

sleep 5

pacman -S --noconfirm egl-wayland konsole dolphin plasma-wayland-session \
neofetch htop inxi bpytop elisa vlc chromium \
okular gwenview ark vim vim-plugins partitionmanager \
spectacle telegram-desktop clipgrab 

sleep 5

grub-install --target=i386-pc /dev/sda
#grub-install --target=i386-pc /dev/sda # replace sdx with your disk name, not the partition
grub-mkconfig -o /boot/grub/grub.cfg

sleep 3

systemctl enable NetworkManager
#systemctl enable bluetooth
#systemctl enable cups.service
systemctl enable sshd
#systemctl enable avahi-daemon
systemctl enable sddm 
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable acpid

sleep 3

useradd -m orif1988
echo orif1988:password | chpasswd
echo "orif1988 ALL=(ALL) ALL" >> /etc/sudoers.d/orif1988
usermod -c 'Orif Ismailov' orif1988

sleep 3

printf "\e[1;32mDone! Type exit, umount -a /mnt and reboot.\e[0m"




