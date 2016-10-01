#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

# Set script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )

printf "\n$script_dir\n"

# Install Git

    source "${script_dir}/src/packages/git/install-git.sh"


# Secure SSH

    source "${script_dir}/src/tasks/ssh/secure-ssh.sh"


# Install VestaCP

    #source -i "${script_dir}/src/packages/vestacp/install-vestacp.sh"
    curl -LO https://vestacp.com/pub/vst-install-rhel.sh
    chmod 700 vst-install-rhel.sh
    source vst-install-rhel.sh
    source "${script_dir}/src/tasks/git/tracking-etc.sh" "Installed VestaCp."


# Install Basic Tools Set

    source "${script_dir}/src/centos7/install-basic-tools.sh"


exit 0
