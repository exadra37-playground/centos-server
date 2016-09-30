#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/25
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Install CSF Firewall

    bash "${script_dir}/install-csf.sh"


# Configure CSF Firewall

    bash "${script_dir}/config-csf.sh"
