#!/bin/bash
# @author Exadra37 <exadra37@gmail.com>
# @since 2016/09/24
# @link exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )

# Install Vim

    if ! yum repolist | grep -qi remi
        then

            curl -LO http://rpms.famillecollet.com/enterprise/remi-release-7.rpm &&
            rpm -Uvh remi-release-7*.rpm &&
            sed -i "s/enabled=0/enabled=1/g" /etc/yum.repos.d/remi.repo

            sh "${script_dir}/../../tasks/git/tracking-etc.sh" "Installed Remi Repository."
    fi
