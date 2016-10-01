#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/26
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Installing Perl Lib WWW

    # Install Perl if not installed yet
    bash "${script_dir}/install-perl.sh"

    yum install -y perl-libwww-perl

    bash "${script_dir}/../../tasks/git/tracking-etc.sh" "Installed Perl Lib WWW."

    exit 0
