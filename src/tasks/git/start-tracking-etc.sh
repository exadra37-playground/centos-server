#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

#set -e

# Install Git

    source "${script_dir}/src/packages/git/install-git.sh"


## Start tracking etc folder, but only if is not already being tracked

    if [ ! -e '/etc/.git' ]
        then
            cd /etc && git init && git add --all && git commit -m 'Big Bang :)' && cd -
    fi
