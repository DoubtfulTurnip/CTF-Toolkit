#!/bin/zsh
echo ""
echo ""
echo "This may take a while"
sleep 5
echo ""
echo ""
echo "============================="
echo "Updating Git Repos..."
echo "============================="
find ~/apps/ -maxdepth 4 -name .git -type d | rev | cut -c 6- | rev | xargs -I {}  git -C {} pull {} --no-rebase
echo ""
echo ""
echo ""
echo "Git Updates Complete"
echo ""
echo ""
echo ""
echo ""
echo "============================="
echo "Updating Docker Apps..."
echo "============================="
echo ""
echo ""
echo ""
echo "Updating Mail Header Analyzer..."
sudo docker container stop mha 
sudo docker container rm mha 
sudo docker image rm mha 
cd /home/kali/apps/blueteam/email-header-analyzer/
sudo docker-compose build
echo ""
echo ""
echo ""
echo "Updating Autosploit..."
sudo docker image rm docker_autosploit  
cd /home/kali/apps/exploit/AutoSploit/Docker/
sudo docker-compose build
echo ""
echo ""
echo ""
echo "Updating NoSQLmap..."
sudo docker image rm nosqlmap  
cd /home/kali/apps/exploit/NoSQLMap/docker/
sudo docker-compose build
echo ""
echo ""
echo ""
echo "Updating Stego-Toolkit..."
sudo docker image rm dominicbreuker/stego-toolkit && sudo docker image pull dominicbreuker/stego-toolkit  
echo ""
echo ""
echo ""
echo "Updating Juice-Shop..."
sudo docker container stop juiceshop  
sudo docker container rm juiceshop  
sudo docker image rm bkimminich/juice-shop && sudo docker pull bkimminich/juice-shop  
echo ""
echo ""
echo ""
echo "Updating Spiderfoot..."
sudo docker container stop spiderfoot  
sudo docker container rm spiderfoot  
sudo docker image rm spiderfoot  
cd /home/kali/apps/osint/spiderfoot
sudo docker-compose build
echo ""
echo ""
echo ""
echo ""
echo "Docker Updates Complete"
echo ""
echo ""
echo "============================="
echo "Updating OS..."
echo "============================="
sudo apt update   && sudo apt upgrade -y   && sudo apt autoremove -y 
echo ""
echo ""
echo ""
echo ""
echo "All Updates Complete"