#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# We need git to install Oh-My-Zsh

    source "${script_dir}/src/packages/git/install-git.sh"


# Install Zsh

    if [ ! -e '/usr/bin/zsh' ]
        then
            yum -y install zsh

            source "${script_dir}/src/tasks/git/tracking-etc.sh" "Installed ZSH."

            # Enhance Zsh with Oh-my-Zsh
            curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash -

            source "${script_dir}/src/tasks/git/tracking-etc.sh" "Installed oh-my-zsh to Enhance ZSH."
    fi


return 0
