#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

#set -e

# Set script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Install Git

    source "${script_dir}/src/packages/git/install-git.sh"


# Install Vim

    source "${script_dir}/src/packages/vim/install-vim.sh"


# Install Zsh

    source "${script_dir}/src/packages/zsh/install-zsh.sh"


# Install Htop

    source "${script_dir}/src/packages/htop/install-htop.sh"
