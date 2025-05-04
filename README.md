# Ubuntu Starter Pack

Ubuntu Starter Pack is a comprehensive shell script designed to automate the installation and configuration of essential software, themes, extensions, and system tweaks on Ubuntu 24. It delivers a polished, secure, and optimized desktop environment with minimal effort.

## Features

### 🛠 System Enhancements
- **Folder Color**: Adds PPA and installs `folder-color`, allowing custom folder icons via Nautilus.
- **GNOME Tweaks & Extension Manager**: Provides advanced settings and extension control.
- **User Themes Extension**: Enables custom Shell themes.
- **WhiteSur Dark Theme**: Applies a macOS-inspired theme for both Shell and Legacy Applications.
- **GNOME Dock Customization**: Centers the Dock, disables panel mode, enables auto-hide, sets icon size to 32px.

### 🚀 Performance & Optimization
- **Preload**: Speeds up frequently used applications by preloading.
- **Neofetch & htop**: System information and process monitoring tools.

### 🖥 Development Tools
- **Git**: Version control system.
- **Python 3** with **pip** and **venv**: For scripting and virtual environments.
- **OpenJDK 17**: Java runtime and development kit.
- **VS Code**: Installed via Snap for code editing.

### 📦 Essential Applications
- **Telegram Desktop**: Messaging client via Snap.
- **File Roller 44.5**: Archive manager installed from a Debian package.
- **Microsoft Fonts**: Automatically installs core fonts with EULA acceptance.

### 🌐 Network & VPN Tools
- **Cloudflare WARP**: Secure DNS and WAN tunneling.
- **ProtonVPN**: Privacy-focused VPN client repository installation.
- **Network Stats** Extension: GNOME extension showing network usage in the top bar.

### 🔄 System Update & Upgrade
- The script concludes with `sudo apt update && sudo apt upgrade -y` to ensure all packages are current.

---

## Installation

Run the following single command to set up your system:

```bash
wget -O Ubuntu.sh "https://raw.githubusercontent.com/ZAYUVALYA/Ubuntu-Starter-Pack/refs/heads/main/Ubuntu.sh" \
  && chmod +x Ubuntu.sh \
  && sudo bash Ubuntu.sh
```

This command will:
1. **Download** the latest `Ubuntu.sh` script.
2. **Make it executable**.
3. **Execute** it with root privileges.

---

## Repository
🔗 **GitHub**: [ZAYUVALYA/Ubuntu-Starter-Pack](https://github.com/ZAYUVALYA/Ubuntu-Starter-Pack)

---

Make your Ubuntu 24 installation **secure**, **stylish**, and **ready for productivity** in one step! 🚀
