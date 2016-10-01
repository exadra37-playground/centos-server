#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

# Set script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Install Git

    bash "${script_dir}/../packages/git/install-git.sh"


# Install Vim

    bash "${script_dir}/../packages/vim/install-vim.sh"


# Install Zsh

    bash "${script_dir}/../packages/zsh/install-zsh.sh"


# Install Htop

    bash "${script_dir}/../packages/htop/install-htop.sh"


exit 0
