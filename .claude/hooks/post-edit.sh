#!/bin/bash
# Hook PostToolUse — s'exécute après chaque Edit ou Write sur un fichier Python

# Ne s'applique qu'aux fichiers Python
if [[ "$CLAUDE_TOOL_INPUT" == *".py"* ]]; then
  # Vérification syntaxe rapide
  FILE=$(echo "$CLAUDE_TOOL_INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('file_path',''))" 2>/dev/null)
  if [ -n "$FILE" ] && [ -f "$FILE" ]; then
    python -m py_compile "$FILE" 2>&1 && echo "[post-edit] Syntaxe OK : $FILE" || echo "[post-edit] ERREUR syntaxe : $FILE"
  fi
fi
