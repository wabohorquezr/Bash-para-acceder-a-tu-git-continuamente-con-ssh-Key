# Bash-para-acceder-a-tu-git-continuamente-con-ssh-Key
Script en Bash que configura automáticamente tu propio Git y genera una clave SSH para permitir autenticación segura y permanente con GitHub, evitando ingresar usuario y contraseña en cada operación, asociando tu computador con SSH.


# 🔐 Configuración Git + SSH (Multi-Distro)

Script para configurar automáticamente Git y SSH en sistemas:

- ✅ Arch Linux
- ✅ Debian
- ✅ Ubuntu

Incluye:
- Configuración global de Git
- Generación de clave SSH (ed25519)
- Activación del agente SSH
- Prueba de conexión con GitHub

---

# 📦 Uso

## 1️⃣ Dar permisos de ejecución

```bash
chmod +x setup_git_ssh.sh
```

## 2️⃣ Ejecutar el script

```bash
./setup_git_ssh.sh
```

## 3️⃣ Ingresar:

- Usuario de GitHub
- Correo electrónico asociado a GitHub

---

# ⚙️ ¿Qué hace el script?

## 🔎 1. Detecta la distribución

```bash
if command -v pacman &> /dev/null; then
```

Detecta Arch Linux.

```bash
elif command -v apt &> /dev/null; then
```

Detecta Debian/Ubuntu.

---

## 📦 2. Instala dependencias necesarias

Instala automáticamente:

- git
- openssh / openssh-client

---

## 👤 3. Configura Git globalmente

```bash
git config --global user.name "TU_USUARIO"
git config --global user.email "TU_EMAIL"
git config --global init.defaultBranch main
```

Esto define tu identidad para todos los repositorios.

---

# 🔑 Configuración SSH

## 📌 ¿Por qué usar SSH?

SSH permite:

- No ingresar contraseña cada vez
- Autenticación segura por clave criptográfica
- Mayor seguridad que HTTPS

---

## 🔐 Generación de clave SSH

El script genera una clave tipo:

```bash
ed25519
```

Ubicación:

```
~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub
```

---

## 🤖 Activación del agente SSH

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Esto permite que el sistema use tu clave automáticamente.

---

## 📋 Agregar clave a GitHub

El script mostrará tu clave pública:

```bash
cat ~/.ssh/id_ed25519.pub
```

Debes copiarla y pegarla en:

GitHub → Settings → SSH and GPG Keys → New SSH Key

---

## 🧪 Probar conexión

```bash
ssh -T git@github.com
```

Si todo está correcto verás:

```
Hi usuario! You've successfully authenticated.
```

---

# 🧹 Limpieza de HTTPS

El script elimina credenciales antiguas:

```bash
~/.git-credentials
```

Y desactiva el helper de credenciales para evitar conflictos.

---

# 📂 Resultado Final

Después de ejecutar el script podrás clonar usando:

```bash
git clone git@github.com:usuario/repositorio.git
```

En lugar de:

```bash
https://github.com/usuario/repositorio.git
```

---

# 🎯 Estructura generada

```
~/.ssh/
 ├── id_ed25519
 └── id_ed25519.pub
```

---

# ✅ Listo

Tu entorno queda configurado para usar Git con autenticación SSH de forma segura y profesional.
