#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   http://exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

vendor="/home/root/vendor/exadra37-bash/centos-server"

# Enable Firewall
# In case this is a fresh installation default Centos Firewall is disabled
# This Firewall will be later replaced by CSF Firewall

    systemctl start firewalld

# Functions

    function selfExecute()
    {
        local script_to_execute="${1}"
        local script_dir=$( cd "$( dirname "$0" )" && pwd )

        bash "${script_dir}/src/centos7/${script_to_execute}.sh"
    }

# Self Download

    mkdir -p "${vendor}" &&
    curl -L https://gitlab.com/exadra37-bash/centos-server/repository/archive.tar.gz |
    tar -zx -C "${vendor}" --strip-components=1 &&
    cd "${vendor}" &&
    selfExecute() "${1}"
