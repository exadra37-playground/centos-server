#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Install Git

    if [ ! -e '/usr/bin/git' ]
        then
            yum -y install git

            git config --global user.email "${USER}@gmail.com"
            git config --global user.name "${USER}"

            source "${script_dir}/src/tasks/git/start-tracking-etc.sh"
    fi


return 0
