zsh_log $0 'Configuring vars'

if which yarn > /dev/null; then
    YARNBIN=$(yarn global bin)
    PATH=$YARNBIN:$PATH
fi

MINICONDAPATH=$HOME/miniconda3/bin
if [ -d $MINICONDAPATH ]; then
    PATH=$MINICONDAPATH:$PATH
fi
