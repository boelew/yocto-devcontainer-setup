check_umask() {
    if [ "$(umask)" != "0022" ]; then
        echo "umask not set correctly. Make sure umask is set to '022' in .bashrc or .profile"
        exit;
    fi
}

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

