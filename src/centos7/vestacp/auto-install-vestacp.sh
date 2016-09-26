#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   http://exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server


# Enable Firewall
# In case this is a fresh installation default Centos Firewall is disabled
# This Firewall will be later replaced by CSF Firewall

    systemctl start firewalld

# download

    mkdir -p /tmp/centos &&
    curl -L https://gitlab.com/exadra37-bash/centos-server/repository/archive.tar.gz |
    tar -zx -C /tmp/centos --strip-components=1 &&
    cd /tmp/centos &&
    sh src/centos7/vestacp/install-vestacp.sh

# Cleanup

    cd ~ && rm -rvf /tmp/centos
