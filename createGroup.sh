#!/bin/bash
cat /etc/group
groupadd GRP_ADM
usermod -G GRP_ADM nome_usuario
# useradd nome_usuario -s /bin/bash -m -p $(openssl passwd -crypt SUA_SENHA) -G GRP_ADM

gpasswd -d nome_usuario sudo