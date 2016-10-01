#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/25
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Install Dependencies

    bash "${script_dir}/../perl/install-perl.sh"
    bash "${script_dir}/../perl/install-perl-libwww.sh"
    bash "${script_dir}/../perl/install-perl-time-hi-res.sh"


# Install CSF Firewall
# https://www.howtoforge.com/tutorial/install-and-configure-csf-config-server-firewall-on-centos-7/

    curl -o /tmp/csf.tgz https://download.configserver.com/csf.tgz &&
    tar -xzf /tmp/csf.tgz -C /tmp &&
    cd /tmp/csf &&
    bash install.sh &&
    perl /usr/local/csf/bin/csftest.pl && # test if CSF is ready to work
    bash /usr/local/csf/bin/remove_apf_bfd.sh && # remove other installed firewalls
    cd - &&
    rm -rfv /tmp/csf &&
    rm -rfv /tmp/csf.tgz &&
    bash "${script_dir}/../../tasks/git/tracking-etc.sh" "Installed CSF Firewall."
