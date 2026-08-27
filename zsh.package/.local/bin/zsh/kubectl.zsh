zsh_log $0 'Configuring kubectl'

kcy() {
  local finder=sk
  local resource="$1"

  if [[ -z "${resource}" ]]; then
    local -r resources="$(kubectl api-resources --no-headers)"

    if [[ $? -ne 0 ]]; then
      echo "kcy: failed to list api-resources (check cluster connection/permissions)" >&2
      return 1
    fi

    resource="$(echo -n "${resources}" | choose 0 | ${finder})"

    if [[ -z "${resource}" ]]; then
      echo "kcy: no resource selected" >&2
      return 1
    fi
  fi

  local name="$2"

  if [[ -z "${name}" ]]; then
    local -r items="$(kubectl get ${resource} --no-headers)"

    if [[ $? -ne 0 ]]; then
      echo "kcy: failed to list resources of type '${resource}' (check cluster connection/permissions)" >&2
      return 1
    fi

    name="$(echo -n "${items}" | choose 0 | ${finder})"

    if [[ -z "${name}" ]]; then
      echo "kcy: no name selected" >&2
      return 1
    fi
  fi

  local -r output="$(kubectl get "${resource}" "${name}" -oyaml)"

  if [[ $? -ne 0 ]]; then
    echo "kcy: failed to get '${resource}/${name}'" >&2
    return 1
  fi

  if [[ -n "${output}" ]]; then
    echo -n "${output}" | moor -lang yaml --no-linenumbers --no-clear-on-exit --style=onedark --wrap
  fi
}

kcyn() {
  local finder=sk
  local -r namespaces="$(kubectl get namespaces --no-headers)"

  if [[ $? -ne 0 ]]; then
    echo "kcyn: failed to list namespaces (check cluster connection/permissions)" >&2
    return 1
  fi

  local -r namespace="$(echo -n "${namespaces}" | choose 0 | ${finder})"

  if [[ -z "${namespace}" ]]; then
    echo "kcyn: no namespace selected" >&2
    return 1
  fi

  if ! kubectl config set-context --current --namespace="${namespace}" >/dev/null; then
    echo "kcyn: failed to set namespace '${namespace}' in the current context" >&2
    return 1
  fi

  kcy
}
