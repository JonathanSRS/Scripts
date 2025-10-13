#!/bin/bash
function createDB(){
        echo "Creating $database in serverless tier"
        az sql db create \
            --resource-group $resourceGroup \
            --server $server \
            --name $database \
            --sample-name AdventureWorksLT \
            --edition GeneralPurpose \
            --compute-model Serverless \
            --family Gen5 \
            --capacity 1 \
            --backup-storage-redundancy Local \
            --yes \
            --free-limit true
}

function createServer() {
        echo "Creating $server in $location..."
        az sql server create \
            --name $server \
            --resource-group $resourceGroup \
            --admin-password $password \
            --admin-user $login \
            --enable-public-network Enabled \
            --location $location \
            --restrict-outbound-network-access Disabled
}

function createResource(){
    az group create --name $resourceGroup --location $location
}

function detalhesVariaveis(){
    echo -e "\n$location\n$resourceGroup\n$server\n$database\n$login\n$password"
}

function createStorageAccount(){
    echo "Digite o nome do storage";
    read storageAccountName;
    az storage account create \
        --resource-group $resourceGroup \
        --name $storageAccountName \
        --sku Standard_LRS \
        --location $location
}

function menu(){
    echo -e "1- Criar variavéis de ambiente\n2- Criar Server SQL\n3- Criar banco SQL\n4- Variavéis Padrão\n5- Criar grupo de recurso\n6- Criar Storage\n0- Sair"
    read resposta;

    case "$resposta" in
        1|"um")
            echo -e "Digite a Localização"
            read location;
            echo -e "Nome do grupo de recurso"
            read resourceGroup;
            echo -e "Nome do servidor"
            read server;
            echo -e "Nome do banco de dados"
            read database;
            echo -e "Usuário do server"
            read login;
            echo -e "Senha"
            read password;

            location=$location
            resourceGroup=$resourceGroup
            server=$server
            database=$database
            login=$login
            password=$password
            detalhesVariaveis;
            menu;

        ;;
        2|dois)
            echo -e "\n$location\n$resourceGroup\n$server\n$login\n$password"
            echo -e "\nEssas são configurações usadas deseja proseguir (S/N)"
            read resposta;
            if test $respostaBanco == S -o $respostaBanco == s; then
                createServer;
            else
                menu;
            fi;
        ;;
        3|tres)
            detalhesVariaveis;
            echo -e "\nEssas são configurações usadas deseja proseguir (S/N)"
            read resposta;
            if test $respostaBanco == S -o $respostaBanco == s; then
                createDB;
            else
                menu;
            fi;
        ;;
        4|quatro)
            echo "Variaveis padrão"
            location="brazilsouth"
            resourceGroup="" #Exemplo: name-emp-dev
            server="" #Exemplo: sqlserver-emp-banco
            database="" #Exemplo: db-silver
            login="" #Exemplo: admin
            password="" #Exemplo: rOot#710
            sku="Standard_LRS"

            echo -e "Criar o banco SQL (S/N)"
            read respostaBanco;
            if test $respostaBanco == S -o $respostaBanco == s; then
                echo "criar banco ..."
                createServer;
                createDB;
                menu;
            else
                menu;
            fi;
        ;;
        5|cinco)
            createResource;
        ;;
        0|zero)
            echo "Encerrar";
        ;;
        *)
            echo "Opção inválida"
        ;;
    esac
}
menu;