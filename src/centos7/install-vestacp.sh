#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   http://exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# download

    mkdir -p /tmp/centos && curl -L https://gitlab.com/exadra37-bash/centos-server/repository/archive.tar.gz | tar -zx -C centos --strip-components=1 && cd centos

# Install Git

    ./software/git.sh

# Install Vesta CP

    curl -L http://vestacp.com/pub/vst-install.sh | bash -

# Install Zsh

    ./software/zsh.sh

# Cleanup

    cd ~ && rm -rvf /tmp/centos
