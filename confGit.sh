#!/bin/bash

echo "====================================="
echo " CONFIGURACIÓN GIT + SSH (MULTI-DISTRO)"
echo "====================================="

# ===== INPUT DATOS =====
read -p "Ingresa tu nombre de usuario de GitHub: " GIT_NAME
read -p "Ingresa tu correo electrónico de GitHub: " GIT_EMAIL

echo
echo "Usuario: $GIT_NAME"
echo "Correo: $GIT_EMAIL"
echo

# ===== DETECTAR DISTRO =====
if command -v pacman &> /dev/null; then
    echo "📦 Detectado: Arch Linux"
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm git openssh

elif command -v apt &> /dev/null; then
    echo "📦 Detectado: Debian / Ubuntu"
    sudo apt update -y
    sudo apt install -y git openssh-client

else
    echo "❌ Distribución no soportada automáticamente."
    echo "Instala manualmente git y openssh."
    exit 1
fi

# ===== CONFIGURAR GIT =====
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch main

# ===== LIMPIAR HTTPS =====
git config --global --unset credential.helper 2>/dev/null
rm -f ~/.git-credentials

# ===== GENERAR SSH =====
SSH_KEY="$HOME/.ssh/id_ed25519"

if [ ! -f "$SSH_KEY" ]; then
    echo "🔑 Generando clave SSH..."
    ssh-keygen -t ed25519 -C "$GIT_EMAIL" -N "" -f "$SSH_KEY"
else
    echo "🔑 Clave SSH existente detectada"
fi

# ===== AGENTE SSH =====
eval "$(ssh-agent -s)"
ssh-add "$SSH_KEY"

# ===== MOSTRAR CLAVE =====
echo
echo "===== COPIA ESTA CLAVE Y AGRÉGALA EN GITHUB ====="
cat "$SSH_KEY.pub"
echo "================================================"
echo

# ===== TEST GITHUB =====
echo "Probando conexión con GitHub..."
ssh -T git@github.com

echo
echo "✅ Configuración finalizada correctamente"

