# Ubuntu Starter Pack

Ubuntu Starter Pack is a comprehensive shell script designed to automate the installation, removal, and configuration of essential software, themes, extensions, and performance tweaks on Ubuntu 24.04. This script ensures a **seamless, fast, and modern** setup experience by removing unwanted Snap packages, adding Flatpak support, and applying a polished GNOME desktop environment.

## Features

### 🧹 Snap Removal & Alternative Browsers
- **Removes Snapd** and all Snap packages (including Firefox and Snap Store)
- **Installs Firefox** from the official Mozilla PPA (Deb package)

### 🛠 System Enhancements
- **Installs essential APT packages**: GNOME Tweaks, Extension Manager, Dconf Editor, Git, Python (pip & venv), Java (OpenJDK), Neofetch, Htop, Preload
- **Installs Ubuntu Cleaner** via PPA for easy system cleanup
- **Installs Folder Color** for Nautilus via PPA and restarts Nautilus

### 🌐 Network & VPN Tools
- **Cloudflare WARP** for secure DNS and browsing
- **ProtonVPN** (official Debian package) for privacy

### 🖥 Flatpak & GNOME Software
- **Installs Flatpak** and **GNOME Software Flatpak plugin**
- **Adds Flathub repository**
- **Installs Telegram Desktop** via Flatpak

### 💻 Development & Productivity
- **Installs VS Code** (Deb package) from Microsoft APT repository
- **Installs File Roller** (Archive Manager) from Launchpad .deb
- **Installs Git, Python, Java**, and sets up Python virtual environments

### 🎨 GNOME Customization
- **Installs Network Stats GNOME extension** from GitHub
- **Applies WhiteSur Dark GTK theme** for Shell & Legacy Applications
- **Customizes GNOME Dock**: Centered, panel mode off, auto-hide enabled, icon size 32px
- **Customizes GNOME Terminal**: Liberation Mono 12, background `#171717`, text `#2777FF`, 85% transparency

### 🔄 Final System Update
- Performs a final `apt update && apt upgrade -y` to ensure all components are up-to-date

---

## Installation

Copy and paste this single command in your terminal to download and execute the setup script:

```bash
wget -O Ubuntu.sh "https://raw.githubusercontent.com/ZAYUVALYA/Ubuntu-Starter-Pack/refs/heads/main/Ubuntu.sh" \
  && chmod +x Ubuntu.sh \
  && sudo bash Ubuntu.sh
```

This command will:
1. **Download** the latest `Ubuntu.sh` from the repository
2. **Make it executable**
3. **Run it with root privileges** to apply all changes

---

## Repository

🔗 **GitHub Repo:** [https://github.com/ZAYUVALYA/Ubuntu-Starter-Pack](https://github.com/ZAYUVALYA/Ubuntu-Starter-Pack)

---

**Enjoy a faster, cleaner, and more beautiful Ubuntu setup in just one command!** 🚀
