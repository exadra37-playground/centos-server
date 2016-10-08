#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

#set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# We must have already a Git Repository... If not we will Init a new one

    source "${script_dir}/src/tasks/git/start-tracking-etc.sh"


# tracking etc folder

    message="${1:-tracking last changes.}"

    cd /etc && git status && git add --all && git commit -m "${message}" && cd "${script_dir}"

return 0
