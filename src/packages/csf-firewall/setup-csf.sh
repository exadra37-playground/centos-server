#!/bin/bash
# @author Exadra37 <exadra37@gmail.com>
# @since 2016/09/25
# @link exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


## Setup CSF Firewall - https://www.howtoforge.com/tutorial/csf-firewall

    # TESTING
    # Line 11 - set test mode to 0
    sed -i 's|TESTING = "1"|TESTING = "0"|g' /etc/csf/csf.conf

    # RESTRICT_SYSLOG
    # Line 50 - Syslog and Rsyslog handling
    sed -i 's|RESTRICT_SYSLOG = "0"|RESTRICT_SYSLOG = "3"|g' /etc/csf/csf.conf

    # RESTRICT_UI
    # Line 99 - Disable changes from CSF UI
    sed -i 's|RESTRICT_UI = "1"|RESTRICT_UI = "2"|g' /etc/csf/csf.conf

    # SYSLOG_CHECK
    # Line 265 - Enable syslog check
    # will check every 300 seconds if syslog is working properly
    sed -i 's|SYSLOG_CHECK = "0"|SYSLOG_CHECK = "300"|g' /etc/csf/csf.conf

    # DROP_LOGGING
    # Line 528 - Enable logging of dropped connections to blocked ports
    sed -i 's|DROP_LOGGING = "0"|DROP_LOGGING = "1"|g' /etc/csf/csf.conf

    # DROP_IP_LOGGING
    # Line 533 - Enable logging of dropped incomming connections from blocked ip addresses
    sed -i 's|DROP_IP_LOGGING = "0"|DROP_IP_LOGGING = "1"|g' /etc/csf/csf.conf

    # DROP_OUT_LOGGING
    # Line 541 - Enable logging of dropped outgoing connections
    sed -i 's|DROP_OUT_LOGGING = "0"|DROP_OUT_LOGGING = "1"|g' /etc/csf/csf.conf

    # LOGFLOOD_ALERT
    # Line 572 - Enable log file flooding alert
    sed -i 's|LOGFLOOD_ALERT = "0"|LOGFLOOD_ALERT = "1"|g' /etc/csf/csf.conf

    # ST_ENABLE
    # Line 2016 - Disable statistics gathering for UI
    sed -i 's|ST_ENABLE = "1"|ST_ENABLE = "0"|g' /etc/csf/csf.conf

    systemctl stop firewalld &&
    systemctl disable firewalld

    # reload and eanble CSF firewall on boot
    systemctl start csf && systemctl enable csf
    systemctl start lfd && systemctl enable lfd

    # list CSF rule
    csf -l

    # Tracking changes
    sh "${script_dir}/../../tasks/tracking-etc.sh" "Setup CSF Firewall."



## Dependencies

    # Install libwww-perl

        aptitude -y install libwww-perl

        git status &&
        git add --all &&
        git commit -m 'libwww-perl have been installed.'

    # Install unzip

        aptitude -y install unzip

        git status &&
        git add --all &&
        git commit -m 'Unzip have been installed.'

    # Install sendmail

        aptitude -y install sendmail

        git status &&
        git add --all &&
        git commit -m 'Sendmail have been installed.'
