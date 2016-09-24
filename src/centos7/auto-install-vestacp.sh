#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   http://exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server


# download

    mkdir -p /tmp/centos &&
    curl -L https://gitlab.com/exadra37-bash/centos-server/repository/archive.tar.gz |
    tar -zx -C centos --strip-components=1
    && cd centos
    && ./src/centos7/install-vestacp.sh


# Cleanup

    cd ~ && rm -rvf /tmp/centos
