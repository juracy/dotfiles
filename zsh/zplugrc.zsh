BULLETTRAIN_DIR_FG=black
BULLETTRAIN_PROMPT_ORDER=(status custom dir screen perl ruby virtualenv aws go elixir git hg cmd_exec_time)
BULLETTRAIN_PROMPT_ADD_NEWLINE=false
BULLETTRAIN_PROMPT_SEPARATE_LINE=false
BULLETTRAIN_PROMPT_CHAR=

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/enhancd"
zplug "mollifier/anyframe"

zplug "docker/cli", use: "contrib/completion/zsh"
zplug "docker/compose", use: "contrib/completion/zsh"


zplug "plugins/git",            from:oh-my-zsh
zplug "plugins/yarn",           from:oh-my-zsh

setopt prompt_subst # Make sure prompt is able to be generated properly.
zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 # defer until other plugins like oh-my-zsh is loaded

if ! zplug check; then
    zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^r' anyframe-widget-put-history

bindkey '^xb' anyframe-widget-cdr
bindkey '^xr' anyframe-widget-execute-history
bindkey '^xi' anyframe-widget-put-history
bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^xk' anyframe-widget-kill
bindkey '^xe' anyframe-widget-insert-git-branch

bindkey '^x^b' anyframe-widget-checkout-git-branch
bindkey '^x^r' anyframe-widget-execute-history
bindkey '^x^i' anyframe-widget-put-history
bindkey '^x^g' anyframe-widget-cd-ghq-repository
bindkey '^x^k' anyframe-widget-kill
bindkey '^x^e' anyframe-widget-insert-git-branch

zstyle ":anyframe:selector:peco:" command 'peco'
