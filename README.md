# Instalação do **TLauncher v14** no Linux (Debian e Derivados)

Este repositório oferece um **script automatizado** para a instalação do **TLauncher**, o launcher de Minecraft, em distribuições baseadas no Debian (como Ubuntu, Mint, etc.).

## 🚀 Instalação Automática

Para uma instalação rápida e simples, basta rodar o seguinte comando no terminal:

```bash
sudo bash -c "$(wget -qLO - https://raw.githubusercontent.com/rafaelhschuh/TLauncher-install-linux/refs/heads/main/install.sh)"
```

O **script** irá realizar todo o processo automaticamente, incluindo:

- Instalação do **Java**
- Download do **TLauncher**
- Criação do atalho no menu de aplicativos

## 🛠️ Passo a Passo Manual

Se preferir fazer a instalação manualmente, siga os passos abaixo:

### 1. Baixar o arquivo do TLauncher

Baixe o arquivo **ZIP** do TLauncher com o comando:

```bash
wget -O minecraft.zip https://raw.githubusercontent.com/rafaelhschuh/TLauncher-install-linux/refs/heads/main/minecraft.zip
```

### 2. Verificar a instalação do Java

O TLauncher requer o **Java**. Para verificar se já está instalado, use o comando:

```bash
java -version
```

Se não estiver instalado, basta executar:

```bash
sudo apt update
sudo apt install -y openjdk-17-jre
```

### 3. Extrair os arquivos do TLauncher

Crie uma pasta para a instalação e extraia o arquivo **ZIP**:

```bash
mkdir -p $HOME/TLauncher
unzip -o minecraft.zip -d $HOME/TLauncher
rm minecraft.zip
```

### 4. Criar o atalho no menu de aplicativos

Para adicionar o **atalho** no menu de aplicativos, crie o arquivo `.desktop` com o seguinte comando:

```bash
mkdir -p ~/.local/share/applications
cat <<EOL > ~/.local/share/applications/tlauncher.desktop
[Desktop Entry]
Name=TLauncher Minecraft
Comment=Launcher de Minecraft
Exec=java -jar $HOME/TLauncher/TLauncher.jar
Icon=$HOME/TLauncher/icon.png
Terminal=false
Type=Application
Categories=Game;
EOL
```

### 5. Dar permissão de execução

Conceda permissão de execução ao arquivo `.desktop`:

```bash
chmod +x ~/.local/share/applications/tlauncher.desktop
```

### 6. Atualizar o banco de dados de atalhos

Atualize o banco de dados de atalhos para que o **TLauncher** apareça no menu:

```bash
update-desktop-database ~/.local/share/applications/
```

### 7. Concluir a instalação

Agora, o **TLauncher** está instalado! Abra o menu de aplicativos e procure por "TLauncher Minecraft".

## ❓ Suporte

Caso tenha dúvidas ou encontre algum problema, não hesite em abrir uma **issue** no [repositório GitHub](https://github.com/rafaelhschuh/TLauncher-install-linux).

## 📜 Licença

Este projeto está licenciado sob a **Licença MIT**.

---

Essa versão melhora a apresentação com ícones, separação clara entre as seções e uma organização visual mais atraente.