#!/bin/bash
# @author Exadra37 <exadra37@gmail.com>
# @since 2016/09/24
# @link exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

#set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Installing Perl

    if [ ! -e '/usr/bin/perl' ]
        then
            yum -y install perl

            source "${script_dir}/src/tasks/git/tracking-etc.sh" "Installed Perl."
    fi
