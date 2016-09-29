#!/bin/bash
# @author Exadra37 <exadra37@gmail.com>
# @since 2016/09/24
# @link exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )

# checkcd /etc && git status && git add --all && git commit -m "Track changes after install memsql, docker and tweaks to Apache." && cd -


    if [ ! -e '/etc/.git' ]
        then
            bash "${script_dir}/start-tracking-etc.sh"
    fi

# tracking etc folder

    message="${1:-tracking last changes.}"

    cd /etc && git status && git add --all && git commit -m "${message}" && cd -
