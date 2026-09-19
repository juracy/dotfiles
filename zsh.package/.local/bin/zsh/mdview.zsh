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
