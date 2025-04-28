# Installation of **TLauncher v14** on Linux (Debian and Derivatives)

This repository provides an **automated script** for installing **TLauncher**, the Minecraft launcher, on Debian-based distributions (such as Ubuntu, Mint, etc.).

## 🚀 Automated Installation

For a quick and simple installation, just run the following command in the terminal:

```bash
bash -c "$(wget -qLO - https://raw.githubusercontent.com/rafaelhschuh/TLauncher-install-linux/refs/heads/main/install.sh)"
```

The **script** will handle the entire process automatically, including:

- Installing **Java**
- Downloading **TLauncher**
- Creating a shortcut in the application menu

## 🛠️ Manual Step-by-Step

If you prefer to install manually, follow the steps below:

### 1. Download the TLauncher File

Download the **ZIP** file of TLauncher using the command:

```bash
wget -O minecraft.zip https://raw.githubusercontent.com/rafaelhschuh/TLauncher-install-linux/refs/heads/main/minecraft.zip
```

### 2. Check Java Installation

TLauncher requires **Java**. To check if it is already installed, use the command:

```bash
java -version
```

If it's not installed, just run:

```bash
sudo apt update
sudo apt install -y openjdk-17-jre
```

### 3. Extract the TLauncher Files

Create a folder for the installation and extract the **ZIP** file:

```bash
mkdir -p $HOME/TLauncher
unzip -o minecraft.zip -d $HOME/TLauncher
rm minecraft.zip
```

### 4. Create the Shortcut in the Application Menu

To add the **shortcut** in the application menu, create the `.desktop` file using the following command:

```bash
mkdir -p ~/.local/share/applications
cat <<EOL > ~/.local/share/applications/tlauncher.desktop
[Desktop Entry]
Name=TLauncher Minecraft
Comment=Minecraft Launcher
Exec=java -jar $HOME/TLauncher/TLauncher.jar
Icon=$HOME/TLauncher/minecraft.png
Terminal=false
Type=Application
Categories=Game;
EOL
```

### 5. Grant Execution Permission

Grant execution permission to the `.desktop` file:

```bash
chmod +x ~/.local/share/applications/tlauncher.desktop
```

### 6. Update the Shortcut Database

Update the shortcut database so that **TLauncher** appears in the menu:

```bash
update-desktop-database ~/.local/share/applications/
```

### 7. Complete the Installation

Now, **TLauncher** is installed! Open the application menu and search for "TLauncher Minecraft".

## ❓ Support

If you have any questions or encounter issues, feel free to open an **issue** on the [GitHub repository](https://github.com/rafaelhschuh/TLauncher-install-linux).

## 📜 License

This project is licensed under the **MIT License**.

---

This version enhances presentation with icons, clear section separation, and a more visually appealing layout.