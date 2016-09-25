#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   http://exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Get SSH User

    ssh_user="${1:-$(hostname)}"

    echo $ssh_user
