#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   http://exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Set script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )

# Install Git

    bash "${script_dir}/../packages/git/install-git.sh"

# Secure SSH

    bash "${script_dir}/../tasks/ssh/secure-ssh.sh"

# Install Epel Release

    bash "${script_dir}/../packages/epel-release/install-epel-release.sh"

# Install Remi Repository

    bash "${script_dir}/../packages/remi/install-remi.sh"

# Install Htop

    bash "${script_dir}/../packages/htop/install-htop.sh"

# Install Vim

    bash "${script_dir}/../packages/vim/install-vim.sh"
