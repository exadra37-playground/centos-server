#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-serverr

set -e

# Check OS

    if [ ! -e "/etc/redhat-release" ]
        then
            printf "\nThis script must be used only in Centos\n"

            return 1
    fi


# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Install Vesta CP

    curl -LO https://vestacp.com/pub/vst-install-rhel.sh

    source vst-install-rhel.sh

    source "${script_dir}/src/tasks/git/tracking-etc.sh" "Installed VestaCp."


return 0
