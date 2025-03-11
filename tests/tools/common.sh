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
