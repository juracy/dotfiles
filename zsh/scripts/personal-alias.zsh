zsh_log $0 'Configuring aliases'

alias go=xdg-open
alias cdroot='if [ -n "`git rev-parse --show-cdup`" ]; then cd `git rev-parse --show-cdup`; fi'
alias ls='ls --color=yes --hyperlink=auto'
alias please='sudo $(fc -ln -1)'

# remove linuxbrew from path before run
function deactive_brew() {
    echo $PATH | tr ":" "\n" | grep -v "brew" | tr "\n" ":"
}

#alias imgp='PATH=`deactive_brew` imgp'
#alias yaourt='PATH=`deactive_brew` yaourt'
