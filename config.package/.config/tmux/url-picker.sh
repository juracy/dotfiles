#!/usr/bin/env bash
# URL Picker for Tmux using fzf and native popup
set -euo pipefail

TARGET_PANE="${1:-}"
# Aceita TARGET_PANE apenas se for um identificador numérico ou com prefixo %
if [[ "$TARGET_PANE" =~ ^%[0-9]+$ || "$TARGET_PANE" =~ ^[0-9]+$ ]]; then
    PANE_ARG=(-t "$TARGET_PANE")
else
    PANE_ARG=()
fi

# Extrai texto do histórico do painel (captura até 5.000 linhas de histórico)
content=$(tmux capture-pane -J -p "${PANE_ARG[@]}" -S -5000 2>/dev/null || tmux capture-pane -J -p 2>/dev/null || true)

if [[ -z "$content" ]]; then
    tmux display-message "Nenhum conteúdo encontrado no painel."
    exit 0
fi

# Extrai e limpa URLs usando Python (suporta http, https, www, git@, ssh, file)
urls=$(python3 -c '
import sys, re

text = sys.stdin.read()
pattern = r"(?:https?://[a-zA-Z0-9_.-]+|www\.[a-zA-Z0-9_.-]+|git@[a-zA-Z0-9_.-]+:|ssh://[a-zA-Z0-9_.-]+|file:///[^\s<>\"'\''`]+)[^\s<>\"'\''`]*(?<![.,;:?!])"
urls = []
seen = set()

for m in re.finditer(pattern, text):
    u = m.group(0)
    # Remove parênteses, colchetes ou chaves finais desbalanceados
    while u.endswith(")") and u.count("(") < u.count(")"):
        u = u[:-1]
    while u.endswith("]") and u.count("[") < u.count("]"):
        u = u[:-1]
    while u.endswith("}") and u.count("{") < u.count("}"):
        u = u[:-1]
    u = re.sub(r"[.,;:?!]+$", "", u)
    if u:
        urls.append(u)

# Inverte para exibir URLs mais recentes no topo e deduplica
for u in reversed(urls):
    if u not in seen:
        seen.add(u)
        print(u)
' <<< "$content" 2>/dev/null || true)

if [[ -z "$urls" ]]; then
    tmux display-message "Nenhuma URL encontrada no painel."
    exit 0
fi

# Abre no fzf capturando teclas de ação
out=$(printf "%s\n" "$urls" | fzf \
    --layout=reverse \
    --no-sort \
    --prompt="🔗 URL: " \
    --header="[Enter] Copiar | [Ctrl-O] Abrir no Navegador | [Esc] Sair" \
    --expect=ctrl-o \
    || true)

if [[ -z "$out" ]]; then
    exit 0
fi

key=$(head -n 1 <<< "$out")
selected=$(sed 1d <<< "$out")

if [[ -z "$selected" ]]; then
    exit 0
fi

if [[ "$key" == "ctrl-o" ]]; then
    open_url="$selected"
    if [[ "$open_url" =~ ^www\. ]]; then
        open_url="https://$open_url"
    fi
    nohup xdg-open "$open_url" </dev/null >/dev/null 2>&1 &
    tmux display-message "↗ Abrindo URL no navegador: $open_url"
else
    # Copia para Wayland e X11 com descritores redirecionados para fechar a pty imediatamente
    if command -v wl-copy >/dev/null 2>&1; then
        printf "%s" "$selected" | wl-copy >/dev/null 2>&1 || true
    elif command -v xclip >/dev/null 2>&1; then
        printf "%s" "$selected" | xclip -selection clipboard >/dev/null 2>&1 || true
    fi

    # Registra no buffer interno do tmux
    tmux set-buffer "$selected"
    tmux display-message "✓ URL copiada: $selected"
fi

# Garante que o popup fecha e encerra o processo
tmux display-popup -C 2>/dev/null || true
exit 0
