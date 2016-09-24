#!/bin/bash
# @author Exadra37 <exadra37@gmail.com>
# @since 2016/09/24
# @link exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Install

    if [ ! -e '/usr/bin/git' ]
        then
            yum -y install git

            git config --global user.email "exadra37@gmail.com"
            git config --global user.name "Exadra37"

            ./../tasks/start-tracking-etc.sh
    fi
