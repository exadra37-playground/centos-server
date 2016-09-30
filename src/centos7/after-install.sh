#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

# Install Git

    bash "${script_dir}/../packages/git/install-git.sh"


# Secure Server

    bash "${script_dir}/secure-server.sh"


# Install Epel Release

    bash "${script_dir}/../packages/epel-release/install-epel-release.sh"


# Install Remi Repository

    bash "${script_dir}/../packages/remi/install-remi.sh"


# Install Basic Tools Set

    bash "${script_dir}/install-basic-tools.sh"
