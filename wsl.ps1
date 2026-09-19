# Instalar wsl
wsl --install
# Desinstalar versões 
wsl --shutdown
wsl --unregister
wsl.exe --list --online

# Baixar distribuição
Invoke-WebRequest `
  -Uri "https://cloud-images.ubuntu.com/wsl/releases/24.04/current/ubuntu-noble-wsl-amd64-wsl.rootfs.tar.gz" `
  -OutFile "$env:USERPROFILE\Downloads\ubuntu-24.04-rootfs.tar.gz"

mkdir [PATH_FOLDER]
wsl --import Ubuntu "[PATH_FOLDER]" "$env:USERPROFILE\Downloads\ubuntu-24.04-rootfs.tar.gz" --version 2

wsl -d Ubuntu
# Criar usuário
adduser jonathan
usermod -aG sudo jonathan
id jonathan
exit

wsl -d Ubuntu -u [USER_NAME]
sudo whoami
exit
wsl -d Ubuntu -u jonathan -- whoami
wsl -d Ubuntu -u jonathan -- pwd
wsl -d Ubuntu

sudo nano /etc/wsl.conf
    # [user]
    # default=[USER_NAME]

    # [automount]
    # enabled=true

wsl -d Ubuntu -u [USER_NAME] -- bash -lc "cd ~ && pwd"

wsl -d Ubuntu -u [USER_NAME] -- bash -lc "echo -e '[user]\ndefault=[USER_NAME]' | sudo tee /etc/wsl.conf > /dev/null"

echo 'cd ~' >> ~/.bashrc

# Configuração de DNS
getent hosts google.com
cat <(echo) | timeout 3 bash -c 'echo > /dev/udp/8.8.8.8/53'
getent hosts google.com
sudo nano /etc/wsl.conf
    # [network]
    # generateResolvConf=false

sudo rm -f /etc/resolv.conf
sudo bash -c 'printf "nameserver 8.8.8.8\nnameserver 1.1.1.1\n" > /etc/resolv.conf'
cat /etc/resolv.conf

# Atualizar sistema
sudo apt update
sudo apt update && sudo apt upgrade -y