#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root. Use sudo to execute."
    exit 1
fi

# Update and upgrade the system
apt update && apt upgrade -y

# Remove Snap and its related packages, then clean up
echo "Removing Snap packages..."
snap remove --purge firefox snap-store snapd || true
apt purge -y snapd
rm -rf /snap /var/snap /var/lib/snapd ~/snap

# Add Mozilla PPA and install Firefox (Deb package)
echo "Installing Firefox from Mozilla PPA..."
add-apt-repository ppa:mozillateam/ppa -y
apt update
apt install -y firefox

# Install essential APT packages
echo "Installing essential packages..."
apt install -y \
    gnome-tweaks \
    gnome-shell-extension-manager \
    dconf-editor \
    git \
    python3 \
    python3-pip \
    python3-venv \
    default-jdk \
    neofetch \
    htop \
    preload \
    software-properties-common

# Install Microsoft TrueType core fonts with EULA accepted
echo "Installing Microsoft fonts..."
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula boolean true | debconf-set-selections
apt install -y ttf-mscorefonts-installer

# Install and configure Cloudflare WARP
echo "Installing Cloudflare WARP..."
curl https://pkg.cloudflareclient.com/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ bookworm main" | tee /etc/apt/sources.list.d/cloudflare-client.list
apt update && apt install -y cloudflare-warp

# Install ProtonVPN
echo "Installing ProtonVPN..."
wget -q https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.6_all.deb -O protonvpn.deb
sha256sum -c <<< "e5e03976d0980bafdf07da2f71b14fbc883c091e72b16772199742c98473002f  protonvpn.deb"
dpkg -i protonvpn.deb
apt update && apt install -y protonvpn
rm protonvpn.deb

# Install GNOME Network Stats extension
echo "Installing GNOME Network Stats extension..."
git clone https://github.com/noroadsleft000/gnome-network-stats.git /tmp/gnome-network-stats
cd /tmp/gnome-network-stats
echo "Configuring and building Network Stats..."
./scripts/configure && make build && make install
cd - && rm -rf /tmp/gnome-network-stats

# Install File Roller from .deb
echo "Installing File Roller (Archive Manager)..."
wget -q http://launchpadlibrarian.net/775837054/file-roller_44.5-1_amd64.deb -O /tmp/file-roller.deb
apt install -y /tmp/file-roller.deb
rm /tmp/file-roller.deb

# Install Folder Color extension for Nautilus
echo "Installing Folder Color..."
add-apt-repository ppa:costales/folder-color -y
apt update && apt install -y folder-color
nautilus -q

# Install Ubuntu Cleaner
echo "Installing Ubuntu Cleaner..."
add-apt-repository ppa:gerardpuig/ppa -y
apt update && apt install -y ubuntu-cleaner

# Install Flatpak and GNOME Software Flatpak plugin
echo "Installing Flatpak and plugin..."
apt install -y flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Telegram via Flatpak
echo "Installing Telegram (Flatpak)..."
flatpak install -y flathub org.telegram.desktop

# Install Visual Studio Code from Microsoft APT repository
echo "Installing Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list
apt update && apt install -y code

# Install and apply WhiteSur GTK theme
echo "Installing WhiteSur GTK theme..."
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git /tmp/WhiteSur-gtk-theme
cd /tmp/WhiteSur-gtk-theme
./install.sh -d ~/.themes
cd - && rm -rf /tmp/WhiteSur-gtk-theme

echo "Applying WhiteSur Dark theme..."
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-dark"
gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-dark"

# Customize GNOME Dock settings
echo "Customizing GNOME Dock..."
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode "FIXED"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true

# Customize GNOME Terminal appearance
echo "Customizing GNOME Terminal..."
PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
PROFILE_PATH="/org/gnome/terminal/legacy/profiles:/:$PROFILE"
gsettings set $PROFILE_PATH use-theme-colors false
gsettings set $PROFILE_PATH background-color "#171717"
gsettings set $PROFILE_PATH foreground-color "#2777FF"
gsettings set $PROFILE_PATH use-transparent-background true
gsettings set $PROFILE_PATH background-transparency-percent 15

# Final system update
echo "Performing final system update..."
apt update && apt upgrade -y

echo -e "\n✅ Ubuntu setup and customization completed successfully! Please reboot your system to apply all changes. 🚀"
