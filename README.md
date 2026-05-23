# Ne1 Chalk | Sway WM Dotfiles

![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Sway](https://img.shields.io/badge/Sway-111111?style=for-the-badge&logo=sway&logoColor=white)

![Ne1 Chalk Desktop](./images/desktop.jpg)

> Ne1 Chalk is a clean, fully automated, and keyboard-driven Wayland environment built on the Sway Window Manager. Designed specifically for Ubuntu and Debian systems, it features a monochromatic aesthetic, deep terminal integration, and a modular architecture managed entirely via GNU Stow.

---

## 🛠️ Tools Used

* **Sway:** A Wayland tiling window manager configured with custom gaps, borders, and auto-tiling logic.
* **Waybar:** A highly customizable status bar featuring interactive hardware controls and custom script toggles (Caffeine, DND).
* **Rofi (Wayland):** The application launcher, heavily modified to serve as the system's central graphical UI.
* **Kitty:** A GPU-accelerated terminal emulator styled perfectly with JetBrainsMono Nerd Fonts.
* **Zsh & Powerlevel10k:** A fast, feature-rich shell environment packed with modern CLI replacements (Zoxide, Eza, Bat).
* **Neovim (LazyVim):** A blazing-fast, extensible text editor tailored for developer productivity.
* **GNU Stow:** A symlink farm manager used to perfectly version-control and 1-click deploy this entire setup.

---

## ⚙️ The Ne1 Control Center

![Ne1 Control Center](./images/control-center.png)

Built entirely from scratch using Rofi, the Control Center acts as the brain of the desktop. Triggered via **`Win + /`**, it provides instant access to system keybindings, architecture documentation, default application lists, and a built-in wallpaper picker.

---

## ⏻ Session Management

![Ne1 Power Menu](./images/power-menu.png)

A sleek, heavily customized Rofi power menu handles system states (Triggered via **`Win + Shift + E`**). Additionally, the lock screen (`Win + Escape`) utilizes a custom script leveraging `grim`, `imagemagick`, and `swaylock` to instantly capture and smoothly blur your active workspace before locking.

---

## 🚀 Installation Architecture

This repository uses **GNU Stow** to manage symbolic links, keeping your actual configuration files safely version-controlled. 

### 1. System Requirements (Ubuntu / Debian)
\`\`\`bash
sudo apt update
sudo apt install sway waybar rofi kitty zsh stow imagemagick grim slurp
\`\`\`

### 2. Clone the Repository
\`\`\`bash
git clone https://github.com/Harinandan-K/Ne1-Sway-Rice.git ~/dotfiles
cd ~/dotfiles
\`\`\`

### 3. Deploy the Configurations
*Ensure your target configuration folders (e.g., `~/.config/sway`) are empty or backed up before running this, otherwise Stow will fail to prevent overwriting your existing files.*

\`\`\`bash
stow assets zsh btop fastfetch gtk kitty mako nvim nvtop rofi sway waybar wlogout wob xdg core scripts
\`\`\`
