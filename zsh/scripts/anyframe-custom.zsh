# Anyframe keybinds
bindkey '^r' anyframe-widget-put-history

bindkey '^xb' anyframe-widget-cdr
bindkey '^xr' anyframe-widget-execute-history
bindkey '^xi' anyframe-widget-put-history
bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^xk' anyframe-widget-kill
bindkey '^xe' anyframe-widget-insert-git-branch

# Anyframe alternative keybinds
bindkey '^x^b' anyframe-widget-checkout-git-branch
bindkey '^x^r' anyframe-widget-execute-history
bindkey '^x^i' anyframe-widget-put-history
bindkey '^x^g' anyframe-widget-cd-ghq-repository
bindkey '^x^k' anyframe-widget-kill
bindkey '^x^e' anyframe-widget-insert-git-branch

zstyle ":anyframe:selector:" use peco
