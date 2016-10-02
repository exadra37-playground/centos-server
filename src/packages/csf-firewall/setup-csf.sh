#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/25
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Install CSF Firewall

    source "${script_dir}/src/packages/csf-firewall/install-csf.sh"


# Configure CSF Firewall

    source "${script_dir}/src/packages/csf-firewall/config-csf.sh"


return 0
