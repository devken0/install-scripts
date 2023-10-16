#!/bin/sh

# Initial updates

sudo dnf clean all 
sudo dnf update && sudo dnf upgrade
read -rns1 -p "Press any key to continue..";echo

sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update
read -rns1 -p "Press any key to continue..";echo

# Install/setup system packages 

sudo dnf in https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia
sudo dnf in akmod-nvidia
sudo dnf in polkit-gnome
read -rns1 -p "Press any key to continue..";echo

# ----------------------------------

# required packages for the script

sudo dnf in wget

# security 

sudo dnf in https://repo.protonvpn.com/fedora-38-unstable/protonvpn-beta-release/protonvpn-beta-release-1.0.1-2.noarch.rpm
wget -P ~/.local/bin https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=appimage
sudo dnf in https://launchpad.net/veracrypt/trunk/1.26.7/+download/veracrypt-1.26.7-CentOS-8-x86_64.rpm
sudo dnf in keepassxc firewalld

# vms

sudo dnf in qemu @Virtualization

# package manager

sudo dnf in dnfdragora 

# cleanup utils

sudo dnf in bleachbit

# development  

sudo dnf in https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-8.0.34-1.fc38.x86_64.rpm
sudo sh -c 'echo -e "[unityhub]\nname=Unity Hub\nbaseurl=https://hub.unity3d.com/linux/repos/rpm/stable\nenabled=1\ngpgcheck=1\ngpgkey=https://hub.unity3d.com/linux/repos/rpm/stable/repodata/repomd.xml.key\nrepo_gpgcheck=1" > /etc/yum.repos.d/unityhub.repo'
sudo yum check-update
sudo yum in unityhub
sudo dnf in https://www.gitkraken.com/download/linux-rpm
sudo dnf group in "C Development Tools and Libraries"
sudo dnf in cmake code 

# downloaders

sudo dnf in qbittorrent uget 

# browsers

sudo dnf in dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf in brave-browser
sudo dnf in https://go.microsoft.com/fwlink?linkid=2149137&brand=M102

# file sync utilities

sudo dnf in https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2023.09.06-1.fedora.x86_64.rpm
sudo dnf in rclone

# file backup utilities

wget https://www.idrivedownloads.com/downloads/linux/download-for-linux/LinuxScripts/IDriveForLinux.zip

# system backup

sudo dnf in timeshift

# multimedia 

sudo dnf in feh vlc picard peek kdenlive simplescreenrecorder flameshot ffmpeg ffmpeg-devel yt-dlp 

# communication

sudo dnf in kdeconnect

# office

sudo dnf in https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm
wget -P ~/.local/bin https://github.com/obsidianmd/obsidian-releases/releases/download/v1.4.16/Obsidian-1.4.16.AppImage

# cli utils 

sudo dnf in vim htop screenfetch ncdu ranger ytfzf

# others

sudo dnf in scrcpy mintstick catfish gpick gprename gip guvcview gparted soundconverter 
read -rns1 -p "Press any key to continue..";echo

# ----------------------------------

# Flatpak 

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.signal.Signal com.github.tchx84.Flatseal
flatpak override --user --env=SIGNAL_START_IN_TRAY=1 org.signal.Signal

read -rns1 -p "Please reboot..";echo




