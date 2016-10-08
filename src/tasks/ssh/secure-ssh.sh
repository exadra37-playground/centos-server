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

# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Get SSH User

    ssh_user="${1:-$(hostname)}"
    ssh_port="${2:-2020}"
    ssh_config=/etc/ssh/sshd_config
    ssh_authorized_keys=/root/.ssh/authorized_keys

    # from https://github.com/serghey-rodin/vesta/blob/master/install/vst-install-rhel.sh#L1227
    ip=$(ip addr | grep 'inet ' | grep global | head -n1 | awk '{print $2}' | cut -f1 -d/)


## Checks

    if [ ! -f "${ssh_authorized_keys}" ] || [ ! -s "${ssh_authorized_keys}" ]
        then
            printf "${ssh_authorized_keys} must exist and contain at least one public key."

            printf "\nHow to Copy SSH public key: ssh-copy-id -p ${ssh_port} -i ~/.ssh/id_rsa.pub ${ssh_user}@${ip}"

            return 1
    fi


# We must have already a Git Repository... If not we will Init a new one

    source "${script_dir}/src/tasks/git/start-tracking-etc.sh"


## Setup

    # changing here the default port for SSH, implies also to open it in the firewall
    sed -i "s|#Port 22|Port ${ssh_port} # by exadra37|g" "${ssh_config}"

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

    #semanage port -a -t ssh_port_t -p tcp ${ssh_port}
    firewall-cmd --permanent --add-port=${ssh_port}/tcp
    firewall-cmd --reload


## Create User

    # IF YOU MISS THE OUTPUT FOR THE GENERATE PASSWORDS FOR ROOT AND NEW SSH USER
    #
    # If we have not provided an ssh user the server hostname will be used.
    #
    #   In your Server Terminal type:
    #       $ hostname
    #       server-hostname-will-appear-here
    #
    #   So lets imagine that our server hostname is: server1
    #
    #   In your Desktop Terminal type:
    #       $ echo server1 | sha512sum | head -c 12
    #       626b5e9b1c55 # this password will match $one_time_password
    #
    # Lets imagine that you have passed to this script "john-doe" as the ssh user to be created
    #
    #   In your Desktop Terminal type:
    #       $ echo john-doe | sha512sum | head -c 12
    #       b064bb942bd6 # this password will match $one_time_password
    #
    one_time_password=$($ssh_user | sha512sum | head -c 12)

    # Once root user have now direct login disabled, we need another user to ssh into the server
    adduser ${ssh_user} &&
    mv /root/.ssh /home/${ssh_user} && # root user have login disabled, using is public key
    chown -R ${ssh_user}:${ssh_user} /home/${ssh_user}/.ssh

    # set passwords
    echo $one_time_password | passwd root --stdin
    echo $one_time_password | passwd $ssh_user --stdin

    # upon next login passwords must be changed
    passwd -e root
    passwd -e $ssh_user

    # Add new ssh user to sudoers
    #gpasswd -a ${ssh_user} wheel


# Tracking changes

    source "${script_dir}/src/tasks/git/tracking-etc.sh" "Secure SSH by disabling root user and create another user without root privileges."


    # Output One Time Password

    printf "\n********* LOGIN FOR ROOT USER IS NOW DISABLED **********\n"

    printf "\nNew Login: ssh -p ${ssh_port} ${ssh_user}@${ip}"
    printf "\nSwitch to root user: su -"
    printf "\nUse this Password: ${one_time_password}\n\n"
