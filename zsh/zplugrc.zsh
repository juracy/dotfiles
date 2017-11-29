BULLETTRAIN_DIR_FG=black
BULLETTRAIN_PROMPT_ORDER=(status custom dir screen perl ruby virtualenv aws go elixir git hg cmd_exec_time)
BULLETTRAIN_PROMPT_ADD_NEWLINE=false
BULLETTRAIN_PROMPT_SEPARATE_LINE=false
BULLETTRAIN_PROMPT_CHAR=
ENHANCD_FILTER=peco
DISTRO=`cat /etc/os-release | grep '^ID=' | cut -d= -f2`

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
if [ "$DISTRO" = "archlinux" ]; then
    zplug "plugins/archlinux",  from:oh-my-zsh
fi

zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/django",         from:oh-my-zsh
zplug "plugins/git-extras",     from:oh-my-zsh
zplug "plugins/heroku",         from:oh-my-zsh
zplug "plugins/pip",            from:oh-my-zsh
zplug "plugins/python",         from:oh-my-zsh
zplug "plugins/urltools",       from:oh-my-zsh
zplug "plugins/yarn",           from:oh-my-zsh

zplug "$HOME/.local/bin/zsh", from:local, use:"*.{sh,zsh}", defer:1

# Auto install plugins
if ! zplug check; then
    zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load
