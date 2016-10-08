#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

# https://www.linode.com/docs/security/securing-your-server
#https://highon.coffee/blog/security-harden-centos-7/
#https://wiki.centos.org/HowTos/Network/SecuringSSH

#set -e

# function

    function Write_To_Ssh_Config()
    {
        local setting="${1}"
        local ssh_config="${2}"
        local comment="${3}"

        if ! grep -iq "${setting}" "${ssh_config}"
            then
                if [ ! -z "${comment}" ]
                    then
                        printf "\n${comment}" >> "${ssh_config}"
                fi

                printf "\n${setting}\n" >> "${ssh_config}"
        fi
    }

# We must have already a Git Repository... If not we will Init a new one

    source "${script_dir}/src/tasks/git/start-tracking-etc.sh"


# Get SSH User

    ssh_user="${1:-$(hostname)}"
    ssh_config=/etc/ssh/sshd_config


# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


## Setup

    # changing here the default port for SSH, implies also to open it in the firewall
    sed -i 's|#Port 22|Port 8095 # by exadra37|g' "${ssh_config}"

    # listen only in IPV6
    sed -i 's|#AddressFamily any|AddressFamily inet # by exadra37|g' "${ssh_config}"

    sed -i 's|#PermitRootLogin yes|PermitRootLogin no # by exadra37|g' "${ssh_config}"

    sed -i 's|PasswordAuthentication yes|PasswordAuthentication no # by exadra37|g' "${ssh_config}"

    sed -i 's|X11Forwarding yes|X11Forwarding no # by exadra37|g' "${ssh_config}"

    # Disable TCP fowarding
    sed -i 's|AllowTcpForwarding yes|AllowTcpForwarding no # by exadra37|g' "${ssh_config}"

    # Enable Verification of Reverse Mapping
    Write_To_Ssh_Config "VerifyReverseMapping yes # By Exadra37" "${ssh_config}" "#http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html"

    # Only allow users explicit declared
    Write_To_Ssh_Config "AllowUsers ${ssh_user} # By Exadra37" "${ssh_config}"

    service sshd restart

    #semanage port -a -t ssh_port_t -p tcp 8095
    firewall-cmd --permanent --add-port=8095/tcp
    firewall-cmd --reload


## Create User

    # Once root user have now direct login disabled, we need another user to ssh into the server

    adduser ${ssh_user} &&
    mv /root/.ssh /home/${ssh_user} && # root user have login disabled, using is public key
    chown -R ${ssh_user}:${ssh_user} /home/${ssh_user}/.ssh #&&
    #gpasswd -a ${ssh_user} wheel # add to sudoers users


# Tracking changes

    source "${script_dir}/src/tasks/git/tracking-etc.sh" "Secure SSH by disabling root user and create another user without root privileges."
