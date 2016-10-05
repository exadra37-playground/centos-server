#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/29
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

#set -e

# Set script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Install Git

    source "${script_dir}/src/packages/git/install-git.sh"


# Secure SSH

    source "${script_dir}/src/tasks/ssh/secure-ssh.sh"


# Install CSF Firewall

    source "${script_dir}/src/packages/csf-firewall/setup-csf.sh"
