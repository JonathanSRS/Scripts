#!/bin/bash
# wsl -u root
useradd nome_usuario -m -s /bin/bash
passwd nome_usuario
sudo usermod -aG sudo nome_usuario

useradd guest1 -s /bin/bash -m -p $(openssl passwd -crypt SUA_SENHA)

useradd guest -c "Convidado" -m -e 01/01/2028
passwd guest -e
usermod guest -s /bin/bash

cat /etc/passwd

su guest
# exit
# userdel -r -f guest

