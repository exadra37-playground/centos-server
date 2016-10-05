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


# Secure Server

    source "${script_dir}/src/centos7/secure-server.sh"


# Install Epel Release

    source "${script_dir}/src/packages/epel-release/install-epel-release.sh"


# Install Remi Repository

    source "${script_dir}/src/packages/remi/install-remi.sh"


# Install Basic Tools Set

    source "${script_dir}/src/centos7/install-basic-tools.sh"
