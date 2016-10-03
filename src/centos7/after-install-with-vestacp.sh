#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

#set -e

# Set script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Install Git

    source "${script_dir}/src/packages/git/install-git.sh"


# Secure SSH

    source "${script_dir}/src/tasks/ssh/secure-ssh.sh"


# Install VestaCP

    source "${script_dir}/src/packages/vestacp/install-vestacp.sh"

    read -p "Please take note of your VestaCP credentials and URL. Press any key to continue Installer."


# Install CSF Firewall

    source "${script_dir}/src/packages/csf-firewall/setup-csf.sh"


# Install Basic Tools Set

    source "${script_dir}/src/centos7/install-basic-tools.sh"
