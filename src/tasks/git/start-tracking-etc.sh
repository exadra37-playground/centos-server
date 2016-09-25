#!/bin/bash
# @author Exadra37 <exadra37@gmail.com>
# @since 2016/03/31
# @link exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )

# We need git to be able to track etc folder

    if [ ! -e '/usr/bin/git' ]
        then
            sh "${script_dir}/../../packages/git/install-git.sh"
    fi

## Start tracking etc folder

    cd /etc && git init && git add --all && git commit -m 'Big Bang :)' && cd -
