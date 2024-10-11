# Shared tools functions and configuration

function host_ansible_venv_path() {
    echo -n "${1}/.venvs/ansible"
}

function host_ansible_home_path() {
    echo -n "${1}/.ansible"
}

function host_ansible_inventory_path() {
    echo -n "$(host_ansible_home_path "${1}")/inventory"
}

function host_ansible_config_path() {
    echo -n "$(host_ansible_home_path "${1}")/ansible.cfg"
}

function remote_sxx() {
    local _sxx="${1:-}"
    local _id_rsa="${2:-}"
    declare -a _sxx_params=()

    if [[ "${_sxx}" != ssh && "${_sxx}" != scp ]]; then
        echo "$0: First argument must be either \`ssh\` or \`scp\`" >&2
        return 1
    fi
    if [[ -z "${_id_rsa}" || ! -s "${_id_rsa}" ]]; then
        echo "$0: Missing SSH private key file" >&2
        return 1
    fi

    shift 2

    _sxx_params+=( ${SXX_COMMON_ARGS:-} -o LogLevel=ERROR -i "${_id_rsa}" )
    if [[ "${_sxx}" == ssh ]]; then
        _sxx_params+=( -t )
    fi

    timeout ${SXX_TIMEOUT:-0} "${_sxx}" "${_sxx_params[@]}" "$@"
}

function remote_ssh() {
    remote_sxx ssh "$@"
}

function remote_sshq() {
    remote_ssh "$@" >/dev/null 2>&1
}

function remote_scp() {
    remote_sxx scp "$@"
}

function discover_python_interpreter() {
    local _python

    for _item in python3 python /usr/libexec/platform-python; do
        _python="$(${1:-} command -v "${_item}" 2>/dev/null)" || :
        if [[ -n "${_python}" ]]; then
            echo -n "${_python}"
            return
        fi
    done
    return 1
}
