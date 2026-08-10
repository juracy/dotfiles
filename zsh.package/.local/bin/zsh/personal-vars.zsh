zsh_log $0 'Configuring vars'

if which yarn > /dev/null; then
    YARNBIN=$(yarn global bin)
    PATH=$YARNBIN:$PATH
fi

PAGER="moor --no-clear-on-exit"
MANPAGER=$PAGER
GIT_PAGER=$PAGER
MOOR_OPTIONS="--no-clear-on-exit"

MANROFFOPT="-c"

PATH=$PATH:$HOME/.cargo/bin
