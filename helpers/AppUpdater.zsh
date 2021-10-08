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
sudo docker container stop mha &>/dev/null
sudo docker container rm mha &>/dev/null
sudo docker image rm mha &>/dev/null
cd /home/kali/apps/blueteam/email-header-analyzer/
sudo docker-compose build -q
echo ""
echo ""
echo ""
echo "Updating Autosploit..."
sudo docker image rm docker_autosploit &>/dev/null
cd /home/kali/apps/exploit/AutoSploit/Docker/
sudo docker-compose build -q
echo ""
echo ""
echo ""
echo "Updating NoSQLmap..."
sudo docker image rm nosqlmap &>/dev/null
cd /home/kali/apps/exploit/NoSQLMap/docker/
sudo docker-compose build -q
echo ""
echo ""
echo ""
echo "Updating Stego-Toolkit..."
sudo docker image rm dominicbreuker/stego-toolkit &>/dev/null && sudo docker image pull dominicbreuker/stego-toolkit &>/dev/null
echo ""
echo ""
echo ""
echo "Updating Juice-Shop..."
sudo docker container stop juiceshop &>/dev/null
sudo docker container rm juiceshop &>/dev/null
sudo docker image rm bkimminich/juice-shop &>/dev/null && sudo docker pull bkimminich/juice-shop &>/dev/null
echo ""
echo ""
echo ""
echo "Updating Spiderfoot..."
sudo docker container stop spiderfoot &>/dev/null
sudo docker container rm spiderfoot &>/dev/null
sudo docker image rm spiderfoot &>/dev/null
cd /home/kali/apps/osint/spiderfoot
sudo docker-compose build -q
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
sudo apt update &>/dev/null && sudo apt upgrade -y &>/dev/null && sudo apt autoremove -y &>/dev/null
echo ""
echo ""
echo ""
echo ""
echo "All Updates Complete"
echo ""
echo ""
echo ""
echo ""
echo "If you think that there is an issue with the update script then try running the update debug script from the ~/apps/ directory" 