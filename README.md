# Ubuntu Starter Pack

Ubuntu Starter Pack is a comprehensive shell script designed to automate the installation and configuration of essential software, themes, extensions, and system tweaks on Ubuntu. This script ensures a seamless setup experience for users who want a polished and optimized system without manual configurations.

## Features

### 🛠 System Enhancements
- Installs **GNOME Tweaks** and **GNOME Extension Manager**
- Applies **WhiteSur Dark Theme** for both **Shell** and **Legacy Applications**
- Customizes **GNOME Dock** (centered, panel mode off, auto-hide enabled, icon size: 32px)

### 🖥 Terminal Customization
- Configures **GNOME Terminal Profile**:
  - Font: **Liberation Mono**
  - Background Color: **#171717**
  - Text Color: **#2777FF**
  - **85% transparency** for a sleek, semi-transparent look

### 📦 Essential Software Installations
- Installs **Git, Python (pip & venv), Java, VS Code**
- Installs **Neofetch & htop** for system monitoring
- Installs **File Roller** (Download & Install: [file-roller_44.5-1_amd64.deb](http://launchpadlibrarian.net/775837054/file-roller_44.5-1_amd64.deb))
- Installs **Microsoft Fonts** with auto-accept EULA

### 🌐 Network & VPN Tools
- Installs **Cloudflare WARP** for secure internet browsing
- Installs **Proton VPN** for additional privacy

### 🔌 GNOME Extensions
- Installs **User Themes** extension automatically
- Installs **Network Stats** extension ([GitHub Repository](https://github.com/noroadsleft000/gnome-network-stats))

### 📩 Messaging & Communication
- Installs **Telegram Desktop** via Snap

### 🔄 System Update
- Performs **`sudo apt update && sudo apt upgrade`** at the end of the script

---

## Installation

To run this script on your Ubuntu system, execute the following command:

```bash
wget -O Ubuntu.sh "https://raw.githubusercontent.com/ZAYUVALYA/Ubuntu-Starter-Pack/refs/heads/main/Ubuntu.sh" && chmod +x Ubuntu.sh && sudo bash Ubuntu.sh
```

This command will:
1. **Download the script**
2. **Make it executable**
3. **Run it with sudo privileges**

---

## Repository
🔗 **GitHub Repo:** [Ubuntu Starter Pack](https://github.com/ZAYUVALYA/Ubuntu-Starter-Pack)

---

This script is perfect for users looking to **quickly set up and optimize Ubuntu** with a **modern look and essential tools**. 🚀
