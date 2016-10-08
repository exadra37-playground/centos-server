# Centos Server

Bash Scripts to perform tasks after OS installation.

## Install Control Panel Vesta CP

Using CURL in command line:

```bash
curl -L https://gitlab.com/exadra37-bash/centos-server/raw/prototype/self-installer.sh | bash -s "centos7/after-install-with-vestacp.sh"

curl -LO https://gitlab.com/exadra37-bash/centos-server/raw/prototype/self-installer.sh && source self-installer.sh && source src/centos7/after-install-with-vestacp.sh

curl -LO https://gitlab.com/exadra37-bash/centos-server/raw/prototype/self-installer.sh && bash self-installer.sh  "centos7/after-install-with-vestacp.sh"

curl -LO https://gitlab.com/exadra37-bash/centos-server/raw/prototype/self-installer.sh && bash self-installer.sh  "tasks/ssh/secure-ssh.sh" && cd vendor/exadra37-bash/centos-server && source src/packages/vestacp/install-vestacp.sh
```
