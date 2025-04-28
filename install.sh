#!/bin/bash
# Script to install TLauncher as an application on Linux
# This script was developed for Debian and derivatives (Ubuntu, Mint, etc.)

# @@@@@@@@@@@@                           @@@@@@@@@@@
# @@@@@@@@@@@@                           @@@@@@@@@@@
# @@@@@@@@@@@@                           @@@@@@@@@@@
# @@@@@@@@@@@@       @@@@@@@@@@@@@       @@@@@@@@@@@
#                  @@@@@@@@@@@@@@@@@@@              
# @@@@@@@@@@@@   @@@@@@@@@@ @@@@@@@@@@@  @@@@@@@@@@@
# @@@@@@@@@@@@  @@@@@@@@@      @@@@@@@@  @@@@@@@@@@@
# @@@@@@@@@@@@  @@@@@@@@@@@@@   @@@@@@@  @@@@@@@@@@@
# @@@@@@@@@@@@  @@@@@@@@@@@@@@@@@@@      @@@@@@@@@@@
#                @@@@@@@@@@@@@@@@@@@@@              
# @@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@
# @@@@@@@@@@@@       @@@@@@@@@@@@@@@@@@  @@@@@@@@@@@
# @@@@@@@@@@@@  @@@@@@    @@@@@@@@@@@@@  @@@@@@@@@@@
# @@@@@@@@@@@@  @@@@@@@@      @@@@@@@@@  @@@@@@@@@@@
#               @@@@@@@@@@@@@@@@@@@@@@              
# @@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@     @@@@@@@@@@@
# @@@@@@@@@@@@         @@@@@@@@          @@@@@@@@@@@
# @@@@@@@@@@@@                           @@@@@@@@@@@
# @@@@@@@@@@@@                           @@@@@@@@@@@
# @@@@@@@@@@@@       schuh.dev.br        @@@@@@@@@@@

# Variables
LINK_DOWNLOAD="https://raw.githubusercontent.com/rafaelhschuh/TLauncher-install-linux/refs/heads/main/minecraft.zip"
INSTALL_FOLDER="$HOME/TLauncher"
DESKTOP_FILE="$HOME/.local/share/applications/tlauncher.desktop"

clear
echo "========================================="
echo "  TLAUNCHER INSTALLER (LINUX - Debian)   "
echo "      by: github.com/rafaelhschuh        "
echo "========================================="

# Step 1: Download minecraft.zip
echo ">>> Downloading TLauncher..."
wget -O minecraft.zip "$LINK_DOWNLOAD"

# Step 2: Install Java (if not installed)
echo ">>> Checking Java installation..."
if ! java -version &>/dev/null; then
  echo "-> Java not found. Installing..."
  sudo apt update
  sudo apt install -y openjdk-17-jre
else
  echo "-> Java is already installed."
fi

# Step 3: Extract ZIP
echo ">>> Extracting files..."
mkdir -p "$INSTALL_FOLDER"
unzip -o minecraft.zip -d "$INSTALL_FOLDER"
rm minecraft.zip

# Step 4: Create .desktop file
echo ">>> Creating shortcut in menu..."
mkdir -p ~/.local/share/applications
cat <<EOL > "$DESKTOP_FILE"
[Desktop Entry]
Name=TLauncher Minecraft
Comment=Minecraft Launcher
Exec=java -jar $INSTALL_FOLDER/TLauncher.jar
Icon=$INSTALL_FOLDER/minecraft.png
Terminal=false
Type=Application
Categories=Game;
EOL

# Step 5: Grant permission
chmod +x "$DESKTOP_FILE"

# Step 6: Update shortcut database
echo "\n>>> Updating shortcuts..."
update-desktop-database ~/.local/share/applications/

# End
echo "========================================================="
echo "TLauncher installed successfully! \U0001F389"
echo "Open the application menu and search for 'TLauncher Minecraft'."
echo "========================================================="
