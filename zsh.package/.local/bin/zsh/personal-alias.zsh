zsh_log $0 'Configuring aliases'

alias go=xdg-open
alias cdroot='if [ -n "`git rev-parse --show-cdup`" ]; then cd `git rev-parse --show-cdup`; fi'
alias ls='eza --hyperlink always'
alias please='sudo $(fc -ln -1)'
alias fd='/usr/bin/fd --color=always'
alias less='moor'
alias vim='nvim'
alias vi='nvim'

function mdview() {
  if [[ -z "$1" ]]; then
    echo "uso: mdview <arquivo.md|arquivo.adoc>" >&2
    return 1
  fi

  case "$1" in
    *.adoc) downdoc -o - "$1" | mdfried - ;;
    *) mdfried "$1" ;;
  esac
}
