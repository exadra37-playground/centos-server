#!/bin/bash
# @author Exadra37 <exadra37@gmail.com>
# @since 2016/09/29
# @link exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Secure SSH

    bash "${script_dir}/../tasks/ssh/secure-ssh.sh"

# Install CSF Firewall

    bash "${script_dir}/../packages/csf-firewall/setup-csf.sh"

