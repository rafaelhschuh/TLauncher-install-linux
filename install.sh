#!/bin/bash
# Script para instalar o TLauncher como aplicativo no Linux
# Este script foi desenvolvido para Debian e derivados (Ubuntu, Mint, etc.)

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

# Variáveis
LINK_DOWNLOAD="https://raw.githubusercontent.com/rafaelhschuh/TLauncher-install-linux/refs/heads/main/minecraft.zip"
PASTA_INSTALACAO="$HOME/TLauncher"
DESKTOP_FILE="$HOME/.local/share/applications/tlauncher.desktop"

clear
echo "========================================="
echo " INSTALADOR DO TLAUNCHER (LINUX - Debian)"
echo "      by: github.com/rafaelhschuh        "
echo "========================================="

# Passo 1: Baixar o minecraft.zip
echo "\n>>> Baixando o TLauncher..."
wget -O minecraft.zip "$LINK_DOWNLOAD"

# Passo 2: Instalar o Java (se não instalado)
echo "\n>>> Verificando instalação do Java..."
if ! java -version &>/dev/null; then
  echo "-> Java não encontrado. Instalando..."
  sudo apt update
  sudo apt install -y openjdk-17-jre
else
  echo "-> Java já está instalado."
fi

# Passo 3: Extrair o ZIP
echo "\n>>> Extraindo arquivos..."
mkdir -p "$PASTA_INSTALACAO"
unzip -o minecraft.zip -d "$PASTA_INSTALACAO"
rm minecraft.zip

# Passo 4: Criar o arquivo .desktop
echo "\n>>> Criando atalho no menu..."
mkdir -p ~/.local/share/applications
cat <<EOL > "$DESKTOP_FILE"
[Desktop Entry]
Name=TLauncher Minecraft
Comment=Launcher de Minecraft
Exec=java -jar $PASTA_INSTALACAO/TLauncher.jar
Icon=$PASTA_INSTALACAO/icon.png
Terminal=false
Type=Application
Categories=Game;
EOL

# Passo 5: Dar permissão
chmod +x "$DESKTOP_FILE"

# Passo 6: Atualizar banco de dados de atalhos
echo "\n>>> Atualizando atalhos..."
update-desktop-database ~/.local/share/applications/

# Fim
echo "\n========================================="
echo "TLauncher instalado com sucesso! \U0001F389"
echo "Abra o menu de aplicativos e procure por 'TLauncher Minecraft'."
echo "========================================="
