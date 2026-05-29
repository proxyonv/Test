# CLAUDE.md — Contexte du projet

## Vue d'ensemble
Dépôt de test et d'exploration de Claude Code en environnement distant (remote).
Utilisé pour valider les workflows, les intégrations MCP et les automatisations.

## Commandes essentielles

```bash
# Lancer les tests
python -m pytest tests/ -v

# Vérifier le style
python -m flake8 . --max-line-length=100

# Formater le code
python -m black .

# Installer les dépendances
pip install -r requirements.txt
```

## Architecture

```
Test/
├── .claude/
│   ├── settings.json       # Permissions et hooks Claude Code
│   └── hooks/              # Scripts exécutés automatiquement
│       ├── session-start.sh
│       └── post-edit.sh
├── .github/
│   ├── pull_request_template.md
│   └── ISSUE_TEMPLATE/
│       ├── feature_request.md
│       └── bug_report.md
├── tests/                  # Tests unitaires
├── CLAUDE.md               # Ce fichier — mémoire du projet
├── .gitignore
├── requirements.txt
└── hello.py
```

## Conventions de code
- Python 3.10+
- Formatage : `black` (ligne max 100 chars)
- Linting : `flake8`
- Tests : `pytest`
- Branches : `feature/`, `fix/`, `claude/` — jamais de commit direct sur `main`

## Intégrations MCP disponibles
- **GitHub** : gestion des PR, issues, CI — utiliser `mcp__github__*`
- **Notion** : specs et documentation — utiliser `mcp__notion-*`
- **Google Drive** : documents de référence — utiliser `mcp__gdrive-*`
- **Gmail** : communication — utiliser `mcp__gmail-*`
- **Canva** : visuels et présentations — utiliser `mcp__canva-*`

## Décisions techniques
- Environnement distant éphémère : tout ce qui doit persister doit être commité et pushé
- Secrets via variables d'environnement uniquement, jamais dans le code
- PR obligatoire pour merger sur `main` — pas de push direct

## TODOs en cours
- [ ] Étoffer les tests unitaires
- [ ] Configurer CI/CD (GitHub Actions)
- [ ] Ajouter la documentation API
