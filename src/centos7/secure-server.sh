#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/29
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

# Set script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Secure SSH

    bash "${script_dir}/../tasks/ssh/secure-ssh.sh"


# Install CSF Firewall

    bash "${script_dir}/../packages/csf-firewall/setup-csf.sh"


exit 0
