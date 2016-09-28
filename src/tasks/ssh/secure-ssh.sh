#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   http://exadra37.com
# @link https://gitlab.com/exadra37-bash/centos-server

set -e

# Get SSH User

    ssh_user="${1:-$(hostname)}"


# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )

## Setup

    # changing here the default port for SSH, implies also to open it in the firewall
    sed -i 's|#Port 22|Port 8095 # by exadra37|g' /etc/ssh/sshd_config

    sed -i 's|#PermitRootLogin yes|PermitRootLogin no # by exadra37|g' /etc/ssh/sshd_config

    sed -i 's|#PasswordAuthentication yes|PasswordAuthentication no # by exadra37|g' /etc/ssh/sshd_config

    sed -i 's|X11Forwarding yes|X11Forwarding no # by exadra37|g' /etc/ssh/sshd_config

    # http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html

        printf "\n\n#http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html" >> /etc/ssh/sshd_config

        # Disable TCP fowarding
        echo 'AllowTcpForwarding no # By Exadra37' >> /etc/ssh/sshd_config

        # Turn on  reverse name checking
        echo 'VerifyReverseMapping yes # By Exadra37' >> /etc/ssh/sshd_config

        # Turn on  reverse name checking
        echo 'AllowUsers ${ssh_user} # By Exadra37' >> /etc/ssh/sshd_config

    # listen only in IPV4
    echo 'AddressFamily inet # By Exadra37' >> /etc/ssh/sshd_config

    service sshd restart


## Create User

    # Once root user have now direct login disabled, we need another user
    #  to ssh into the server

    adduser ${ssh_user} &&
    mv /root/.ssh /home/${ssh_user} && # root user have login disabled, using is public key
    chown -R ${ssh_user}:${ssh_user} /home/${ssh_user}/.ssh


# Tracking changes

    bash "${script_dir}/../git/tracking-etc.sh" "Secure SSH by disabling root user and create another user without root privileges."
