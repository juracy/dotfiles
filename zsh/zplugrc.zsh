ENHANCD_FILTER=peco
SPACESHIP_EXIT_CODE_SHOW=true
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
zplug "erikced/zsh-pyenv-lazy-load", use:zsh-pyenv-lazy-load.zsh
zplug "juracy/spaceship-prompt", use:spaceship.zsh, from:github, at:feature/project-name, as:theme
zplug "zuxfoucault/colored-man-pages_mod", use:colored-man-pages_mod.plugin.zsh
zplug "Tarrasch/zsh-autoenv"

# Docker
zplug "docker/cli", use:contrib/completion/zsh
zplug "docker/compose", use:contrib/completion/zsh

# "Legacy" do oh-my-zsh
if [ "$DISTRO" = "arch" ]; then
    zplug "plugins/archlinux",  from:oh-my-zsh
fi

zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
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
