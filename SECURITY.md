# Politique de sécurité

## Signaler une vulnérabilité

Si tu découvres une vulnérabilité de sécurité, ne crée **pas** d'issue publique.

Envoie un email à : hugovannier987@gmail.com

Inclure :
- Description du problème
- Étapes pour reproduire
- Impact potentiel

Je répondrai sous 48h et fournirai un correctif dans les meilleurs délais.

## Bonnes pratiques appliquées dans ce dépôt

- Aucun secret dans le code — variables d'environnement uniquement
- Hook pre-commit bloquant les credentials avant chaque commit
- Branch protection sur `main` (PR obligatoire)
- Secret scanning GitHub activé
- Dependabot pour les mises à jour de dépendances
