# Ubuntu Starter Pack

A powerful setup script to instantly configure a fresh Ubuntu 24+ system with modern UI, essential tools, and useful tweaks for developers and daily users.

---

## 🧰 Features

- Removes all Snap-related packages (including Snap Store and Snap Firefox)
- Installs Firefox from Mozilla's official PPA
- Installs essential GNOME tools:
  - GNOME Tweaks
  - GNOME Shell Extension Manager
  - Dconf Editor
- Installs and enables WhiteSur-dark theme
- Installs Microsoft Fonts with automatic EULA acceptance
- Customizes GNOME Dock:
  - Dock at bottom
  - Panel mode off
  - Auto-hide enabled
  - Icon size set to 32
- Customizes Terminal profile:
  - Font: Liberation Mono
  - Background: `#171717`
  - Foreground/Text: `#2777FF`
  - Transparent background with 85% opacity
- Installs and enables:
  - Network Stats GNOME Extension
  - Folder Color support in Nautilus
- Installs from Flatpak:
  - Telegram Desktop
- Installs system tools:
  - Git, Python 3, pip, venv, Java (OpenJDK 17)
  - htop, neofetch, preload
- Installs Cloudflare WARP
- Installs ProtonVPN
- Installs VS Code
- Installs updated File Roller from .deb

---

## 🚀 One-liner installation

Run this single command in your terminal (requires `sudo` privileges):

```bash
wget https://raw.githubusercontent.com/ZAYUVALYA/Ubuntu-Starter-Pack/refs/heads/main/Ubuntu.sh -O Ubuntu.sh && sudo bash Ubuntu.sh
```

> 💡 Make sure to run `sudo apt update && sudo apt upgrade -y` **before** executing the script for optimal results.

---

## 📎 Repository
GitHub: [ZAYUVALYA/Ubuntu-Starter-Pack](https://github.com/ZAYUVALYA/Ubuntu-Starter-Pack)

---

Created with ❤️ by [ZAYUVALYA](https://github.com/ZAYUVALYA)
