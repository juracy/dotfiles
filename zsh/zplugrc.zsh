BULLETTRAIN_DIR_FG=black
BULLETTRAIN_PROMPT_ORDER=(status custom dir screen perl ruby virtualenv aws go elixir git hg cmd_exec_time)
BULLETTRAIN_PROMPT_ADD_NEWLINE=false
BULLETTRAIN_PROMPT_SEPARATE_LINE=false
BULLETTRAIN_PROMPT_CHAR=
ENHANCD_FILTER=peco

setopt prompt_subst

source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "b4b4r07/enhancd", use:init.sh            # EnhanCD
zplug "mollifier/anyframe"                      # widgets
zplug "zsh-users/zsh-history-substring-search"  # History search
zplug "zsh-users/zsh-completions"               # Vários auto-completes
zplug "zsh-users/zsh-autosuggestions"           # Auto suggestions (fish like)
zplug "zsh-users/zsh-syntax-highlighting", defer:2  # Syntax Highlight (fish like)
zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 # prompt

# Docker
zplug "docker/cli", use:contrib/completion/zsh
zplug "docker/compose", use:contrib/completion/zsh

# "Legacy" do oh-my-zsh
zplug "plugins/archlinux",      from:oh-my-zsh
zplug "plugins/django",         from:oh-my-zsh
zplug "plugins/git-extras",     from:oh-my-zsh
zplug "plugins/heroku",         from:oh-my-zsh
zplug "plugins/pip",            from:oh-my-zsh
zplug "plugins/python",         from:oh-my-zsh
zplug "plugins/urltools",       from:oh-my-zsh
zplug "plugins/yarn",           from:oh-my-zsh

zplug "~/.local/bin/zsh", from:local, use:"*.{sh,zsh}"

# History keybinds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

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

# Auto install plugins
if ! zplug check; then
    zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load
