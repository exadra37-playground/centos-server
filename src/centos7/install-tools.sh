#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   http://exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e


# Set script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )

# Secure SSH

    sh "${script_dir}/../tasks/secure-ssh.sh"

# Install Zsh

    sh "${script_dir}/../software/zsh.sh"

