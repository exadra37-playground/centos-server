#!/bin/bash
# @author Exadra37 <exadra37@gmail.com>
# @since 2016/09/24
# @link exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )

# Install Epel Release

    if ! yum repolist | grep -qi epel/x86_64
        then
            yum install -y epel-release

            sh "${script_dir}/../../tasks/git/tracking-etc.sh" "Installed Epel Release."
    fi
