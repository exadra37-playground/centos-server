#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

# Set script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Install Git

    bash "${script_dir}/../packages/git/install-git.sh"


# Secure SSH

    bash "${script_dir}/../tasks/ssh/secure-ssh.sh"


# Install VestaCP

    ".${script_dir}/../packages/vestacp/install-vestacp.sh"


# Install Basic Tools Set

    bash "${script_dir}/install-basic-tools.sh"


exit 0
