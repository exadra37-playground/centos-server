#!/bin/bash
# @author Exadra37 <exadra37@gmail.com>
# @since 2016/03/31
# @link exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

## Start tracking etc folder

    cd /etc && git init && git add --all && git commit -m 'Big Bang :)' && cd -
