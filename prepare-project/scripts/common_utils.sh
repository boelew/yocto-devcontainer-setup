git_root() {
    repo=${1:?repo path cannot be empty}
    pushd "${repo}" ?> /dev/null || return
    if git rev-parse --is-inside-work-tree &> /dev/null; then
        readlink -nf "$(git rev-parse --show-toplevel)"
    else
        echo "${repo}"
    fi
    popd &> /dev/null || return
}

