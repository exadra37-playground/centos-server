#!/bin/bash
# @author Exadra37 <exadra37@gmail.com>
# @since 2016/09/24
# @link exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# dependencies

    if [ ! -e '/usr/bin/git' ]
        then
            ./git.sh
    fi

# Install

    if [ ! -e '/usr/bin/zsh' ]
        then
            yum -y install zsh

            ./../tasks/tracking-etc.sh "Installed ZSH."

            # Enhance Zsh with Oh-my-Zsh
            curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash -

            ./../tasks/tracking-etc.sh "Installed oh-my-zsh to Enhance ZSH."

            # reload shell
            . ~/.zshrc
    fi

