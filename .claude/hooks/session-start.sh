#!/bin/bash
# Hook SessionStart — s'exécute à chaque ouverture de session Claude Code

echo "======================================"
echo "  Claude Code Remote — Session Start"
echo "======================================"
echo ""

# Branche courante
BRANCH=$(git branch --show-current 2>/dev/null || echo "inconnu")
echo "Branche : $BRANCH"

# Derniers commits
echo ""
echo "Derniers commits :"
git log --oneline -5 2>/dev/null || echo "  (aucun commit)"

# Fichiers modifiés non commités
DIRTY=$(git status --porcelain 2>/dev/null)
if [ -n "$DIRTY" ]; then
  echo ""
  echo "Fichiers non commités :"
  git status --short 2>/dev/null
else
  echo ""
  echo "Dépôt propre."
fi

# Vérification de l'environnement Python
echo ""
echo "Environnement :"
python --version 2>/dev/null || echo "Python non disponible"

# Installation des dépendances si requirements.txt existe
if [ -f "requirements.txt" ]; then
  pip install -q -r requirements.txt 2>/dev/null && echo "Dépendances OK" || echo "Erreur installation dépendances"
fi

# Activation du hook pre-commit de sécurité
if [ -d ".githooks" ]; then
  git config core.hooksPath .githooks
  chmod +x .githooks/pre-commit 2>/dev/null
  echo "Hook pre-commit sécurité : actif"
fi

echo ""
echo "Prêt."
echo "======================================"
