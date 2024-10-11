# Shared tools functions and configuration

function container_ansible_venv_path() {
    echo -n "${1}/.venvs/ansible"
}

function container_ansible_home_path() {
    echo -n "${1}/.ansible"
}

function container_ansible_inventory_path() {
    echo -n "$(container_ansible_home_path "${1}")/inventory.ini"
}

function container_ansible_config_path() {
    echo -n "$(container_ansible_home_path "${1}")/ansible.cfg"
}

function discover_python_interpreter() {
    local _python

    for _item in python3 python; do
        _python="$(command -v "${_item}" 2>/dev/null)" || :
        if [[ -n "${_python}" ]]; then
            echo -n "${_python}"
            return
        fi
    done
    return 1
}
