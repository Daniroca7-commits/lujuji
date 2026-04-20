#!/bin/bash
# Deploy Lujuji - copia index.html Y spain.svg al repo y hace push

REPO_DIR="$HOME/Desktop/Lujuji"
DOWNLOADS="$HOME/Downloads"

echo "🚀 Desplegando Lujuji..."

# Check if repo exists
if [ ! -d "$REPO_DIR" ]; then
  echo "❌ No encuentro el repo en $REPO_DIR"
  echo "   Clona el repo primero: git clone https://github.com/daniroca7-commits/lujuji.git $REPO_DIR"
  exit 1
fi

# Copy index.html from Downloads
if [ -f "$DOWNLOADS/index.html" ]; then
  cp "$DOWNLOADS/index.html" "$REPO_DIR/index.html"
  echo "✅ index.html copiado"
  rm "$DOWNLOADS/index.html"
else
  echo "⚠️  No hay index.html en Descargas"
fi

# Copy spain.svg from Downloads if exists
if [ -f "$DOWNLOADS/spain.svg" ]; then
  cp "$DOWNLOADS/spain.svg" "$REPO_DIR/spain.svg"
  echo "✅ spain.svg copiado"
  rm "$DOWNLOADS/spain.svg"
elif [ -f "$HOME/Desktop/Lujuji/spain.svg" ]; then
  cp "$HOME/Desktop/Lujuji/spain.svg" "$REPO_DIR/spain.svg"
  echo "✅ spain.svg copiado desde Desktop/Lujuji"
fi

# Git push
cd "$REPO_DIR"
git add -A
DATE=$(date '+%d/%m %H:%M')
git commit -m "update $DATE"
git push

echo ""
echo "🎉 ¡Lujuji desplegado!"
echo "   https://daniroca7-commits.github.io/lujuji/"
echo ""
