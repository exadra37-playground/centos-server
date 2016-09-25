#!/bin/bash
# @author Exadra37 <exadra37@gmail.com>
# @since 2016/09/25
# @link exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Install Dependencies

    sh "${script_dir}/../perl/install-perl.sh"
    sh "${script_dir}/../perl/install-perl-libwww.sh"
    sh "${script_dir}/../perl/install-perl-time-hi-res.sh"


# Install CSF Firewall
# https://www.howtoforge.com/tutorial/install-and-configure-csf-config-server-firewall-on-centos-7/

    cd ~ &&
    curl -O https://download.configserver.com/csf.tgz &&
    tar -xzf csf.tgz &&
    cd csf &&
    sh install.sh &&
    perl /usr/local/csf/bin/csftest.pl && # test if CSF is ready to work
    sh /usr/local/csf/bin/remove_apf_bfd.sh && # remove other installed firewalls
    cd .. &&
    rm -rfv csf &&
    rm -rfv csf.tgz &&
    sh "${script_dir}/../../tasks/git/tracking-etc.sh" "Installed CSF Firewall."

# Setup CSF

    sh "${script_dir}/setup-csf.sh"
