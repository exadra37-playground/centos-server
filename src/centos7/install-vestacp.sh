#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   http://exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Check OS

    if [ ! -e "/etc/redhat-release" ]
        then
            printf "\nThis script must be used only in Centos\n"
    fi

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )

# Update

    yum -y update

# Install Git

    "${script_dir}/../software/git.sh"

# Install Vesta CP

    sh -c "$(curl -L http://vestacp.com/pub/vst-install-rhel.sh)"

# Install Zsh

    "${script_dir}/../software/zsh.sh"
