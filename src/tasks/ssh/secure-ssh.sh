#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-server

set -e

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
                        printf "${comment}" >> "${ssh_config}"
                fi

                printf "${setting}" >> "${ssh_config}"
        fi
    }


# Get SSH User

    ssh_user="${1:-$(hostname)}"
    ssh_config=/etc/ssh/sshd_config


# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


## Setup

    # changing here the default port for SSH, implies also to open it in the firewall
    sed -i 's|#Port 22|Port 8095 # by exadra37|g' "${ssh_config}"

    sed -i 's|#PermitRootLogin yes|PermitRootLogin no # by exadra37|g' "${ssh_config}"

    sed -i 's|#PasswordAuthentication yes|PasswordAuthentication no # by exadra37|g' "${ssh_config}"

    sed -i 's|X11Forwarding yes|X11Forwarding no # by exadra37|g' "${ssh_config}"

    # Disable TCP fowarding
    Write_To_Ssh_Config "AllowTcpForwarding no # By Exadra37" "${ssh_config}" "\n\n#http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html"

    # Enable Verification of Reverse Mapping
    Write_To_Ssh_Config "VerifyReverseMapping yes # By Exadra37" "${ssh_config}"

    # Only allow users explicit declared
    Write_To_Ssh_Config "AllowUsers ${ssh_user} # By Exadra37" "${ssh_config}"

    # listen only in IPV4
    Write_To_Ssh_Config "AddressFamily inet # By Exadra37" "${ssh_config}"

    service sshd restart


## Create User

    # Once root user have now direct login disabled, we need another user to ssh into the server

    adduser ${ssh_user} &&
    mv /root/.ssh /home/${ssh_user} && # root user have login disabled, using is public key
    chown -R ${ssh_user}:${ssh_user} /home/${ssh_user}/.ssh


# Tracking changes

    bash "${script_dir}/../git/tracking-etc.sh" "Secure SSH by disabling root user and create another user without root privileges."
