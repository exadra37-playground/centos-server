#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/09/24
# @link   https://exadra37.com
# @link   https://gitlab.com/exadra37-bash/centos-serverr

#set -e

# Check OS

    if [ ! -e "/etc/redhat-release" ]
        then
            printf "\nThis script must be used only in Centos\n"

            return 1
    fi


# Set the script dir

    script_dir=$( cd "$( dirname "$0" )" && pwd )


# Install Vesta CP

    curl -LO https://vestacp.com/pub/vst-install-rhel.sh

    source vst-install-rhel.sh

    source "${script_dir}/src/tasks/git/tracking-etc.sh" "Installed VestaCp."


# Change Admin Password

    # from https://github.com/serghey-rodin/vesta/blob/master/install/vst-install-rhel.sh#L1227
    local ip=$(ip addr | grep 'inet ' | grep global | head -n1 | awk '{print $2}' | cut -f1 -d/)

    local url="https://{$ip}:8083"

    # vesta is not handling passwords in a secure way, once it sends them in clear text and is generating weak passwords
    local password="$(cat /dev/urandom | tr -cd "[[:alnum:]]" | tr -d "[[:space:]]" | head -c ${1:-32})"

    bash v-change-user-password admin $password

    source "${script_dir}/src/tasks/git/tracking-etc.sh" "Updated Admin password for VestaCp."

    printf "\nRevoking VestaCP Admin Password sent by email.\n"

    printf "\nLogin Valid Credentials\n"
    printf "\nURL: {$url}"
    printf "\nUser: admin"
    printf "\nNew Password: {$password}"

    printf "\nOld Admin Password sent by Vesta Installation, over email in clear text is a clear violation of Best Security practices, therefore the above one must be used to login.\n"
