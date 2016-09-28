#!/bin/bash
# @author Exadra37 <exadra37@gmail.com>
# @since 2016/09/24
# @link exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )

# We need git to install Oh-My-Zsh

    sh "${script_dir}/../git/install-git.sh"

# Install Zsh

    if [ ! -e '/usr/bin/zsh' ]
        then
            yum -y install zsh

            bash "${script_dir}/../../tasks/git/tracking-etc.sh" "Installed ZSH."

            # Enhance Zsh with Oh-my-Zsh
            curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash -

            bash "${script_dir}/../../tasks/git/tracking-etc.sh" "Installed oh-my-zsh to Enhance ZSH."
    fi

