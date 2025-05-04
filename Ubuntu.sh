#!/bin/bash

# Ensure the script is run with sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Use: sudo ./Ubuntu.sh"
    exit 1
fi

# Update & Upgrade system
apt update && apt upgrade -y

# Add Folder Color PPA and install folder-color
add-apt-repository ppa:costales/folder-color -y
apt update
apt install -y folder-color
# Restart Nautilus to apply folder-color extension
nautilus -q

# Install essential packages
deb_packages=(
    "gnome-tweaks"
    "gnome-shell-extension-manager"
    "dconf-editor"
    "git"
    "python3"
    "python3-pip"
    "python3-venv"
    "openjdk-17-jdk"
    "neofetch"
    "htop"
    "preload"
)

for package in "${deb_packages[@]}"; do
    apt install -y "$package"
done

# Install Snap packages
snap install telegram-desktop --classic
snap install code --classic

# Install Microsoft Fonts with auto-accept EULA
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula boolean true | debconf-set-selections
apt install -y ttf-mscorefonts-installer

# Install Cloudflare WARP
curl https://pkg.cloudflareclient.com/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ bookworm main" | tee /etc/apt/sources.list.d/cloudflare-client.list
apt update && apt install -y cloudflare-warp

# Install ProtonVPN
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.6_all.deb
dpkg -i protonvpn-stable-release_1.0.6_all.deb && apt update && apt install -y protonvpn
rm protonvpn-stable-release_1.0.6_all.deb

# Install Network Stats GNOME Extension
git clone https://github.com/noroadsleft000/gnome-network-stats.git
cd gnome-network-stats
./scripts/configure
make build
make install
cd .. && rm -rf gnome-network-stats

# Install File Roller
deb_url="http://launchpadlibrarian.net/775837054/file-roller_44.5-1_amd64.deb"
wget "$deb_url" -O file-roller.deb
apt install -y ./file-roller.deb
rm file-roller.deb

# Apply WhiteSur Theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
./install.sh -d ~/.themes
cd .. && rm -rf WhiteSur-gtk-theme
gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-dark"
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-dark"

# Customize GNOME Dock
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode "FIXED"
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.0
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true

# Customize Terminal Appearance
profile=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
profile_path="/org/gnome/terminal/legacy/profiles:/:$profile"
gsettings set $profile_path use-theme-colors false
gsettings set $profile_path background-color "#171717"
gsettings set $profile_path foreground-color "#2777FF"
gsettings set $profile_path use-transparent-background true
gsettings set $profile_path background-transparency-percent 15

echo -e "\nUbuntu customization complete! Please restart your system for all changes to take effect. 🚀"
