#!/bin/bash

# Atualizando os pacotes
echo "Atualizando os pacotes do sistema..."
sudo apt update -y && sudo apt upgrade -y

# Instalando o Apache2
echo "Instalando o Apache2..."
sudo apt install apache2 -y

# Verificando se o Apache2 foi instalado corretamente
if command -v apache2 > /dev/null; then
    echo "Apache2 instalado com sucesso!"
else
    echo "Falha na instalação do Apache2!"
    exit 1
fi

# Iniciando e habilitando o Apache para iniciar automaticamente com o sistema
echo "Iniciando o Apache2 e habilitando o serviço..."
sudo systemctl start apache2
sudo systemctl enable apache2

# Verificando o status do Apache
echo "Verificando o status do Apache2..."
sudo systemctl status apache2 | grep "Active"

# Configuração do firewall (se necessário, permite tráfego HTTP e HTTPS)
echo "Configurando o firewall para permitir tráfego HTTP/HTTPS..."
sudo ufw allow in "Apache Full"

# Testando se o Apache está funcionando
echo "Testando o servidor Apache..."
curl -I http://localhost

# Fim do script
echo "Provisionamento do servidor Apache concluído!"
