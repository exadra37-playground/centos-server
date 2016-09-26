#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   http://exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Set script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )

# Install Git

    sh "${script_dir}/../packages/git/install-git.sh"

# Secure SSH

    sh "${script_dir}/../tasks/ssh/secure-ssh.sh"

# Install Epel Release

    sh "${script_dir}/../packages/epel-release/install-epel-release.sh"

# Install Remi Repository

    sh "${script_dir}/../packages/remi/install-remi.sh"

# Install Htop

    sh "${script_dir}/../packages/htop/install-htop.sh"

# Install Vim

    sh "${script_dir}/../packages/vim/install-vim.sh"

# Install Zsh

    sh "${script_dir}/../packages/zsh/install-zsh.sh"
