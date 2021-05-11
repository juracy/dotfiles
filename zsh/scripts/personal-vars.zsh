VISUAL=vim
EDITOR=$VISUAL
APPDATA=$HOME/.config
XDG_CURRENT_DESKTOP=GNOME

LOCALBIN=$HOME/.local/bin
PATH=$LOCALBIN:$PATH:$HOME/.krew/bin

if which yarn > /dev/null; then
    YARNBIN=$(yarn global bin)
    PATH=$YARNBIN:$PATH
fi

MINICONDAPATH=$HOME/miniconda3/bin
if [ -d $MINICONDAPATH ]; then
    PATH=$MINICONDAPATH:$PATH
fi
