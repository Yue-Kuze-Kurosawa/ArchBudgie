# ArchBudgie

Installing notes for my personal use

Super Ultra Flat Numix Remix Breeze Dark at AUR and [Github](https://github.com/erikdubois/Super-Ultra-Flat-Numix-Remix)

![Screenshots](http://i.imgur.com/ZC5xpeL.jpg)


Sardi v 7.5.0 at AUR and [Sourceforge](https://sourceforge.net/projects/sardi/files/)

![Screenshots](http://i.imgur.com/KjZPupw.jpg)


Sardi v 7.4.3 at AUR and [Sourceforge](https://sourceforge.net/projects/sardi/files/)

![Screenshots](http://i.imgur.com/q9tLrHK.jpg)



Sardi v 7.2.9 at AUR and [Sourceforge](https://sourceforge.net/projects/sardi/files/)

![Screenshots](http://i.imgur.com/kFWc9Bb.jpg)



Sardi v 7.2.1 at AUR and [Sourceforge](https://sourceforge.net/projects/sardi/files/)

![Screenshots](http://i.imgur.com/3teJbPR.jpg)



# FASE 1

Steps to take when installing Budgie from scratch

Pop in the latest arch usb

loadkeys be-latin1

cfdisk /dev/sda

delete all partitions

sda1 	/ everything minus 8GB for swap making sure it is primary and bootable (asterisk!)

sda2 		/swap	8 GB primary type swap (82)	

write - yes -quit

mkfs.ext4 /dev/sda1

mkswap /dev/sda2

swapon /dev/sda2

mount /dev/sda1 /mnt

pacman -Sy


pacstrap -i /mnt base base-devel

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash

nano /etc/locale.gen

uncomment these lines

	be_BY.UTF8
	en_GB.UTF8
	en_US.UTF8

CTRL + X , yes, enter

locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf


export LANG=en_US.UTF-8

nano /etc/vconsole.conf

	KEYMAP=be-latin1
	FONT=lat9w-16

CTRL + X , yes, enter

ln -s /usr/share/zoneinfo/Europe/Brussels /etc/localtime

hwclock --systohc --utc

echo ArchErik > /etc/hostname

nano /etc/hosts


	<ip-address> <hostname.domain.org> <hostname>
	127.0.0.1 localhost.localdomain localhost ArchErik
	::1   localhost.localdomain localhost ArchErik
	touch /etc/udev/rules.d/80-net-setup-link.rules

pacman -S networkmanager

systemctl enable NetworkManager

mkinitcpio -p linux

passwd

pacman -S grub os-prober

grub-install --target=i386-pc --recheck /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

umount /dev/sda1

exit

reboot







#FASE 2 root

login with root
and use the password

useradd -m -g users -G wheel,storage,power -s /bin/bash erik

passwd erik

EDITOR=nano visudo

Look for these lines with an hashtag in front
	
	 %wheel ALL=(ALL) ALL

hashtag (#) should be gone

CTRL = X , yes and enter


pacman -S bash-completion

if no internet - again

sudo systemctl enable NetworkManager

sudo systemctl start NetworkManager


exit







# FASE 3 Personal login and xserver


Login with new account i.e. here erik and password



sudo pacman -S xorg-server xorg-server-utils xorg-xinit xorg-twm xterm


sudo pacman -S xf86-video-nouveau





# FASE 4 Desktop environment


sudo pacman -S budgie-desktop gnome 

may be also gnome-extra?


# FASE 5 Display manager

easy switching between desktop environments and login

sudo pacman -S gdm

systemctl enable gdm.service

systemctl start gdm.service


change your keyboard to belgian in the settings



# Fase 5 Getting our software

export EDITOR=nano


sudo pacman -S firefox

Surf to https://github.com/erikdubois/ArchBudgie

If you download the zip

	
sudo pacman -S file-roller

Download and right mouse click to extract

If you work with git

sudo pacman -S git

git clone https://github.com/erikdubois/ArchBudgie


Go inside the folder and run every program in there

./1 and press tab etcetera


./2 ...


./3 ...

run forest run




printscreen keyboard shortcut

scrot -e ~/Pictures/capt-$(date '+%Y-%m-%d-%H%M%S').png





Installing notes for my personal use











