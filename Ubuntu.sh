#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root! Please use sudo."
    exit 1
fi

# Install essential packages
apt install -y gnome-tweaks gnome-shell-extension-manager dconf-editor git python3 python3-pip python3-venv default-jdk neofetch htop

# Install Telegram (Snap package)
snap install telegram-desktop

# Install VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list
apt update && apt install -y code

# Install Microsoft fonts (auto-accept EULA)
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula boolean true | debconf-set-selections
apt install -y ttf-mscorefonts-installer

# Install Cloudflare WARP
curl https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor -o /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ bookworm main" | tee /etc/apt/sources.list.d/cloudflare-client.list
apt update && apt install -y cloudflare-warp

# Install ProtonVPN
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.6_all.deb
dpkg -i protonvpn-stable-release_1.0.6_all.deb
apt update && apt install -y protonvpn

# Install GNOME Network Stats extension
git clone https://github.com/noroadsleft000/gnome-network-stats.git
cd gnome-network-stats
./scripts/configure
make build
make install
cd ..
rm -rf gnome-network-stats

# Install WhiteSur theme
wget -O WhiteSur.tar.xz https://github.com/vinceliuice/WhiteSur-gtk-theme/archive/refs/heads/main.tar.gz
tar -xf WhiteSur.tar.xz
cd WhiteSur-gtk-theme-main
./install.sh -d /usr/share/themes
cd ..
rm -rf WhiteSur-gtk-theme-main WhiteSur.tar.xz

# Apply WhiteSur theme
mkdir -p ~/.themes
ln -s /usr/share/themes/WhiteSur-dark ~/.themes/WhiteSur-dark
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-dark"
gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-dark"

# Configure GNOME Dock
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode "FIXED"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true

# Configure GNOME Terminal Profile
PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
PROFILE_PATH="/org/gnome/terminal/legacy/profiles:/:$PROFILE"
gsettings set "$PROFILE_PATH" use-theme-colors false
gsettings set "$PROFILE_PATH" background-color "rgb(23,23,23)"
gsettings set "$PROFILE_PATH" foreground-color "rgb(39,119,255)"
gsettings set "$PROFILE_PATH" use-transparent-background true
gsettings set "$PROFILE_PATH" background-transparency-percent 15
gsettings set "$PROFILE_PATH" font "Liberation Mono 12"

# Install File Roller (Archive Manager)
wget http://launchpadlibrarian.net/775837054/file-roller_44.5-1_amd64.deb
dpkg -i file-roller_44.5-1_amd64.deb
apt install -f -y
rm file-roller_44.5-1_amd64.deb

# Final update & upgrade
apt update && apt upgrade -y

# Done
echo "Ubuntu setup is complete! Please restart your system for all changes to take effect."
