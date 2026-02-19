# Bash-para-acceder-a-tu-git-continuamente-con-ssh-Key
Script en Bash que configura automáticamente tu propio Git y genera una clave SSH para permitir autenticación segura y permanente con GitHub, evitando ingresar usuario y contraseña en cada operación, asociando tu computador con SSH.


## 🔐 Configuración Git + SSH (Multi-Distro)

Script para configurar automáticamente Git y SSH en sistemas:

- ✅ Arch Linux
- ✅ Debian
- ✅ Ubuntu

Incluye:
- Configuración global de Git
- Generación de clave SSH (ed25519)
- Activación del agente SSH
- Prueba de conexión con GitHub



## 📦 Uso

### 1️⃣ Dar permisos de ejecución

```bash
chmod +x setup_git_ssh.sh
```

### 2️⃣ Ejecutar el script

```bash
./setup_git_ssh.sh
```

### 3️⃣ Ingresar:

- Usuario de GitHub
- Correo electrónico asociado a GitHub



## ⚙️ ¿Qué hace el script?

### 🔎 1. Detecta la distribución

```bash
if command -v pacman &> /dev/null; then
```

Detecta Arch Linux.

```bash
elif command -v apt &> /dev/null; then
```

Detecta Debian/Ubuntu.



### 📦 2. Instala dependencias necesarias

Instala automáticamente:

- git
- openssh / openssh-client



### 👤 3. Configura Git globalmente

```bash
git config --global user.name "TU_USUARIO"
git config --global user.email "TU_EMAIL"
git config --global init.defaultBranch main
```

Esto define tu identidad para todos los repositorios.



## 🔑 Configuración SSH

### 📌 ¿Por qué usar SSH?

SSH permite:

- No ingresar contraseña cada vez
- Autenticación segura por clave criptográfica
- Mayor seguridad que HTTPS



### 🔐 Generación de clave SSH

El script genera una clave tipo:

```bash
ed25519
```

Ubicación:

```
~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub
```



### 🤖 Activación del agente SSH

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Esto permite que el sistema use tu clave automáticamente.


### 📋 Agregar clave a GitHub

El script mostrará tu clave pública:

```bash
cat ~/.ssh/id_ed25519.pub
```

Debes copiarla y pegarla en:

GitHub → Settings → SSH and GPG Keys → New SSH Key



### 🧪 Probar conexión

```bash
ssh -T git@github.com
```

Si todo está correcto verás:

```
Hi usuario! You've successfully authenticated.
```



## 🧹 Limpieza de HTTPS

El script elimina credenciales antiguas:

```bash
~/.git-credentials
```

Y desactiva el helper de credenciales para evitar conflictos.



## 📂 Resultado Final

Después de ejecutar el script podrás clonar usando:

```bash
git clone git@github.com:usuario/repositorio.git
```

En lugar de:

```bash
https://github.com/usuario/repositorio.git
```



## 🎯 Estructura generada

```
~/.ssh/
 ├── id_ed25519
 └── id_ed25519.pub
```



## ✅ Listo

Tu entorno queda configurado para usar Git con autenticación SSH de forma segura y profesional.

---

# ⚙️ **Instalación desde Cero**

Arch Linux

```bash
sudo pacman -Syu
sudo pacman -S git

cd ~/Downloads 2>/dev/null || cd ~/Descargas

git clone https://github.com/wabohorquezr/Bash-para-acceder-a-tu-git-continuamente-con-ssh-Key.git

cd Bash-para-acceder-a-tu-git-continuamente-con-ssh-Key

chmod +x confGit.sh

./confGit.sh
```



Debian / Ubuntu

```bash
sudo apt update
sudo apt install git -y

cd ~/Downloads 2>/dev/null || cd ~/Descargas

git clone https://github.com/wabohorquezr/Bash-para-acceder-a-tu-git-continuamente-con-ssh-Key.git

cd Bash-para-acceder-a-tu-git-continuamente-con-ssh-Key

chmod +x confGit.sh

./confGit.sh
```

Tras copiar y copilar en un apartado aparecera un codigo similar copialo todo menos el correo y pegalo en la seccion de ssh en github.
<img width="977" height="61" alt="2026-02-19-055314_hyprshot" src="https://github.com/user-attachments/assets/65fc3d1b-d47f-425a-bd47-18ebd2685df6" />


Asi lo podemos poner en SHH en github:

<img width="3624" height="1850" alt="edit1" src="https://github.com/user-attachments/assets/21b1a323-796a-4c9a-8e9f-2e53f8f68094" />

<img width="3624" height="1850" alt="edit2" src="https://github.com/user-attachments/assets/c2989eb2-7684-4c04-9bf6-daa0d4e5eddb" />

<img width="3624" height="1850" alt="edit3" src="https://github.com/user-attachments/assets/c4464cf0-6321-4cbe-b7b5-077e6fe7ae8c" />

<img width="3624" height="1850" alt="edit4" src="https://github.com/user-attachments/assets/0a0e0729-c9bd-4a9c-9cfd-6870121517ca" />






