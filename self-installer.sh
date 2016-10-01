#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/29
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

# Enable Firewall
# In case this is a fresh installation default Centos Firewall is disabled
# This Firewall will be later replaced by CSF Firewall

    systemctl start firewalld


# Self Execute Bash Scripts

    function Self_Execute()
    {
        local script_dir=$( cd "$( dirname "$0" )" && pwd )

        for script_to_execute in "$@"
            do
                source "${script_dir}/src/${script_to_execute}"
        done
    }


# Self Download and Optionally execute the bash script provided as argument

    vendor="/home/root/vendor/exadra37-bash/centos-server"

    mkdir -p "${vendor}" &&
    curl -L https://gitlab.com/exadra37-bash/centos-server/repository/archive.tar.gz |
    tar -zx -C "${vendor}" --strip-components=1 &&
    cd "${vendor}"

    Self_Execute "$@"


exit 0
