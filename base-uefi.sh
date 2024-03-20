#!/bin/bash
echo "<<------ START INSTALL ARCH-LINUX ------>>"
pacman -Syy
ln -sf /usr/share/zoneinfo/Asia/Tashkent /etc/localtime
hwclock --systohc
sed -i '171s/.//' /etc/locale.gen
sed -i '400s/.//' /etc/locale.gen
locale-gen
echo "LANG=ru_RU.UTF-8" >> /etc/locale.conf
echo "KEYMAP=ru" >> /etc/vconsole.conf
echo "FONT=cyr-sun16" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts

pacman -S --noconfirm linux-lts-headers sof-firmware grub alsa-utils alsa-tools alsa-oss \
alsa-firmware alsa-card-profiles alsa-plugins efibootmgr networkmanager \
network-manager-applet dialog wpa_supplicant mtools dosfstools \
bash-completion openssh rsync acpi acpi_call-lts \
gst-plugins-bad gst-plugins-ugly gst-plugins-base gst-plugins-good gst-plugin-opencv gst-plugins-espeak \
gst-plugin-pipewire gst-plugins-bad-libs gst-plugin-libcamera gst-plugins-base-libs \
acpid ntfs-3g terminus-font ttf-terminus-nerd ttf-roboto man fwupd git


pacman -S --noconfirm xorg


pacman -S --noconfirm plasma 


pacman -S --noconfirm konsole dolphin neofetch htop inxi bpytop elisa chromium okular gwenview obs-studio


grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=VIRT
#grub-install --target=i386-pc /dev/sda # replace sdx with your disk name, not the partition
grub-mkconfig -o /boot/grub/grub.cfg


systemctl enable NetworkManager
#systemctl enable bluetooth
#systemctl enable cups.service
#systemctl enable sshd
#systemctl enable avahi-daemon
systemctl enable sddm 
#systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable acpid


useradd -m virt
echo virt:password | chpasswd
echo "virt ALL=(ALL) ALL" >> /etc/sudoers.d/virt
#usermod -c 'Orif Ismailov' virt


printf "\e[1;32mDone! Type exit, umount -a /mnt and reboot.\e[0m"
