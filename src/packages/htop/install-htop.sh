#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Install Vim

    if [ ! -e '/usr/bin/htop' ]
        then
            yum -y install htop

            bash "${script_dir}/../../tasks/git/tracking-etc.sh" "Installed Htop."
    fi
