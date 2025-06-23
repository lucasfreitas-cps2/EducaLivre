#!/bin/sh

# Altere as variáveis abaixo conforme necessário
export name='Narutex216Bits'
export email="djxan@yahoo.com.br"
export repositorio="https://github.com/lucasfreitas-cps2/EducaLivre.git"

# Configuração do usuário local
git config user.name "Narutex216Bits"
git config user.email "djxan@yahoo.com"

# Garante que está na branch main
git checkout main 2>/dev/null || git checkout -b main

# Atualiza o .gitignore se necessário
if ! grep -q "windows" .gitignore; then
  echo "" >> .gitignore
  echo "# Ignorando pastas específicas de sistemas operacionais" >> .gitignore
  echo "windows" >> .gitignore
  echo "macos" >> .gitignore
  echo "linux" >> .gitignore
  git add .gitignore
  git commit -m "Atualizando .gitignore com pastas ignoradas (windows/macos/linux)"
fi

# Adiciona e commita todos os arquivos
git add .
git commit -m "Código atualizado em $(date +%d/%m/%Y)" || echo "Nada novo para commitar."

# Garante que o repositório remoto esteja configurado
if ! git remote | grep -q origin; then
  git remote add origin $repositorio
else
  git remote set-url origin $repositorio
fi

# Faz pull antes de dar push, evitando conflitos
git pull origin main --rebase

# Push das alterações para a main
git push origin main
