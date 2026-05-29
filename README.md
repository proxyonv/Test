# Test — Claude Code Remote

[![CI](https://github.com/proxyonv/Test/actions/workflows/ci.yml/badge.svg)](https://github.com/proxyonv/Test/actions/workflows/ci.yml)

Dépôt de test et d'exploration de Claude Code en environnement distant (remote).

## Démarrage rapide

```bash
pip install -r requirements.txt
python -m pytest tests/ -v
```

## Structure

```
Test/
├── .claude/           # Config Claude Code (hooks, permissions)
├── .github/           # CI, templates PR et issues
├── .githooks/         # Hook pre-commit (détection de secrets)
├── tests/             # Tests unitaires
├── hello.py
└── requirements.txt
```

## Sécurité

- Hook `pre-commit` : bloque les secrets avant chaque commit
- CI : scan de sécurité automatique sur chaque PR
- Dependabot : alertes hebdomadaires sur les dépendances
- Branch protection : PR obligatoire pour merger sur `main`
