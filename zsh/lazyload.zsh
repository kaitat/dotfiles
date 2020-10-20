pyenv() {
  unfunction "$0"
  source <(pyenv init -)
  $0 "$@"
}

anyenv() {
  unfunction "$0"
  source <(anyenv init -)
  $0 "$@"
}

virtualenv() {
  unfunction "$0"
  source <(pyenv virtualenv-init -)
  $0 "$@"
}
