#!/bin/bash
# @author Exadra37 <exadra37@gmail.com>
# @since 2016/09/24
# @link exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

## tracking etc folder

    message="${1:-tracking last changes.}"

    cd /etc && git init && git add --all && git commit -m "${message}" && cd -
