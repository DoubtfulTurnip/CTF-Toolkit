#!/bin/bash


# Script Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color
BOLD=$(tput bold)
NORM=$(tput sgr0)

#Install Script For CTF

echo -e ""
echo -e ""
echo -e "${GREEN}Creating Folders${NC}" 
echo -e ""
mkdir ~/apps 
mkdir ~/apps/blueteam
mkdir ~/apps/cryptoandcracking 
mkdir ~/apps/exploit 
mkdir ~/apps/post-exploit 
mkdir ~/apps/forensics 
mkdir ~/apps/osint 
mkdir ~/apps/reversingandbinaryexploit 
mkdir ~/apps/scanningandrecon 
mkdir ~/apps/logs
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
# Log variables
install=~/apps/logs/install.log
npminstall=~/apps/logs/npminstall.log
geminstall==~/apps/logs/geminstall.log
dockerinstall=~/apps/logs/dockerinstall.log
pipinstall=~/apps/logs/pipinstall.log
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
#helpers
echo -e "${GREEN}Copying Helpers${NC}" | tee -a $install
echo -e ""
cp helpers/* ~/apps 1>/dev/null 2>> $install
echo -e ""
echo -e ""
# Script Variables
crypto=~/apps/cryptoandcracking
exploit=~/apps/exploit
postexploit=~/apps/post-exploit
forensics=~/apps/forensics
osint=~/apps/osint
revbin=~/apps/reversingandbinaryexploit
scanrec=~/apps/scanningandrecon
blueteam=~/apps/blueteam
echo -e ""
echo -e ""
# From Apt
echo -e "${GREEN}Updating OS and Installing Tools From apt${NC}" | tee -a $install
echo -e ""
sudo apt-get update 1>/dev/null 2>> $install && sudo apt-get upgrade -y 1>/dev/null 2>> $install && sudo apt-get update 1>/dev/null 2>> $install && sudo apt-get install wkhtmltopdf redis-tools amass sherlock forensics-extra veil bloodhound libboost-all-dev cmake pwncat routersploit sqlmap armitage npm nodejs g++ libssl-dev cewl libgmp3-dev libmpc-dev qpdf unrar sed xxd libc-bin curl jq perl gawk grep coreutils git golang seclists enum4linux feroxbuster nbtscan nikto nmap onesixtyone oscanner smbclient smbmap smtp-user-enum sslscan tnscmd10g whatweb fcrackzip hashcat hash-identifier python3-pip twofi hercules jd-gui -y 1>/dev/null 2>> $install
sudo apt-get install rubygems build-essential -y 1>/dev/null 2>> $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
# Docker Stuff
echo -e "${GREEN}Installing Docker${NC}" | tee -a $install
echo -e ""
sudo systemctl enable docker --now 1>/dev/null 2>> $install

printf "%s\n" "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-ce-archive-keyring.gpg] https://download.docker.com/linux/debian buster stable" \
  | sudo tee /etc/apt/sources.list.d/docker-ce.list 1>/dev/null 2>> $install
  
curl -fsSL https://download.docker.com/linux/debian/gpg \
  | gpg --dearmor \
  | sudo tee /usr/share/keyrings/docker-ce-archive-keyring.gpg 1>/dev/null 2>> $install

sudo apt-get update 1>/dev/null 2>> $install

sudo apt-get install -y docker-ce docker-ce-cli containerd.io 1>/dev/null 2>> $install

echo -e ""
echo -e ""
echo -e ""
echo -e ""
# Path variables
echo -e "${GREEN}Configuring Paths${NC}" | tee -a $install
echo -e ""
export GOROOT=/usr/lib/go 
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/.local/bin:$PATH


# From npm
echo -e "${GREEN}Installing npm${NC}" | tee -a $npminstall
echo -e ""
sudo npm install --global jwt-cracker 1>/dev/null 2>> $npminstall

# From Gem
echo -e "${GREEN}Installing Tools With gem${NC}" | tee -a $geminstall
echo -e ""
sudo gem install haiti-hash -q 1>/dev/null 2>> $geminstall
sudo gem install evil-winrm -q 1>/dev/null 2>> $geminstall


#Python Required Modules/Apps
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e "${GREEN}Installing Python Modules${NC}" | tee -a $pipinstall
echo -e ""
echo -e ""
echo -e ""
echo -e ""
pip3 install selenium -U -q --log $pipinstall
pip3 install requests -U -q --log $pipinstall
pip3 install py-term -U -q --log $pipinstall
pip3 install pyasn1 -U -q --log $pipinstall
pip3 install gmpy2 -U -q --log $pipinstall
pip3 install rarfile -U -q --log $pipinstall
pip3 install pylibemu -U -q --log $pipinstall
pip3 install pwntools -U -q --log $pipinstall
pip3 install bs4 -U -q --log $pipinstall
pip3 install search-that-hash -U -q --log $pipinstall
pip3 install ttpassgen -U -q --log $pipinstall
pip3 install pefile -U -q --log $pipinstall
pip3 install apkleaks -U -q --log $pipinstall
pip3 install h8mail -U -q --log $pipinstall
pip3 install fuzza -U -q --log $pipinstall
pip3 install libssl-dev -U -q --log $pipinstall
pip3 install swig -U -q --log $pipinstall
pip3 install s3scanner -U -q --log $pipinstall
pip3 install tld -U -q --log $pipinstall
pip3 install fuzzywuzzy -U -q --log $pipinstall
echo -e ""
echo -e ""
echo -e ""
echo -e ""
# From Git
echo -e "${PURPLE}Installing tools from Github${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
#cryptoandcracking

echo -e "${PURPLE}Installing bopscrk${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/r3nt0n/bopscrk.git $crypto/bopscrk/ 1>/dev/null 2>> $install
pip install -r $crypto/bopscrk/requirements.txt 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing duplicut${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/nil0x42/duplicut.git $crypto/duplicut/ 1>/dev/null 2>> $install
cd $crypto/duplicut/ && make 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing HashPump${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/bwall/HashPump.git $crypto/hashpump/ 1>/dev/null 2>> $install
cd $crypto/hashpump 1>/dev/null 2>> $install
make 1>/dev/null 2>> $install
sudo make install 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing hate_crack${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/trustedsec/hate_crack.git $crypto/hate_crack/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing pwngen${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/toxydose/pnwgen.git $crypto/pnwgen/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing RsaCtfTool${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/Ganapati/RsaCtfTool.git $crypto/RsaCtfTool/ 1>/dev/null 2>> $install
pip3 install -r $crypto/RsaCtfTool/requirements.txt 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing Mentalist${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/sc0tfree/mentalist.git $crypto/mentalist/ 1>/dev/null 2>> $install
cd $crypto/mentalist/
sudo python3 setup.py install 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing wordlistctl${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/BlackArch/wordlistctl $crypto/wordlistctl/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing Zydra${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/hamedA2/Zydra.git $crypto/Zydra/ 1>/dev/null 2>> $install
sudo wget http://www.figlet.org/fonts/epic.flf -O /usr/share/figlet/epic.flf 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing rsatool${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/ius/rsatool.git $crypto/rsatool/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing X0R${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/X-Vector/X0R.git $crypto/X0R/ 1>/dev/null 2>> $install
pip install -r $crypto/X0R/requirement.txt 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing xor-decrypt${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/AlexFSmirnov/xor-decrypt.git $crypto/xor-decrypt/ 1>/dev/null 2>> $install



#exploit

echo -e "${PURPLE}Installing chimera${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/tokyoneon/chimera.git $exploit/chimera/ 1>/dev/null 2>> $install
chown $USER:$USER -R $exploit/chimera 1>/dev/null 2>> $install
chmod +x $exploit/chimera/chimera.sh 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing wildpwn${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/localh0t/wildpwn.git $exploit/wildpwn/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing Xeexe${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/persianhydra/Xeexe-TopAntivirusEvasion.git $exploit/Xeexe-TopAntivirusEvasion/ 1>/dev/null 2>> $install
cd $exploit/Xeexe-TopAntivirusEvasion 1>/dev/null 2>> $install
chmod +x install.sh && ./install.sh 1>/dev/null 2>> $install
chmod +x $exploit/Xeexe-TopAntivirusEvasion/Xeexe.py 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing DKMC${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/Mr-Un1k0d3r/DKMC.git $exploit/DKMC/ 1>/dev/null 2>> $install
cd $exploit/DKMC 1>/dev/null 2>> $install
mkdir output 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing fireELF${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/rek7/fireELF.git $exploit/fireELF/ 1>/dev/null 2>> $install
pip3 install -r $exploit/firreELF/dep.txt 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing OWT${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/clu3bot/OWT.git $exploit/OWT/ 1>/dev/null 2>> $install
cd $exploit/OWT/
chmod +x owt.sh

echo -e "${PURPLE}Installing Seth${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/SySS-Research/Seth.git $exploit/Seth/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing XSStrike${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/s0md3v/XSStrike.git $exploit/XSStrike/ 1>/dev/null 2>> $install



#post-exploit

echo -e "${PURPLE}Installing Girsh${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/nodauf/Girsh.git $postexploit/Girsh/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing enum4linux${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/cddmp/enum4linux-ng $postexploit/enum4linux-ng/ 1>/dev/null 2>> $install
cd $postexploit/enum4linux-ng/ 1>/dev/null 2>> $install
pip3 install -r requirements.txt 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing linux-exploit-suggester-2${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/jondonas/linux-exploit-suggester-2.git $postexploit/linux-exploit-suggester-2/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing LinEnum${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/rebootuser/LinEnum.git $postexploit/LinEnum/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing PEASS-ng${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/carlospolop/PEASS-ng.git $postexploit/PEASS-ng/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing Powerless${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/gladiatx0r/Powerless.git $postexploit/Powerless/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing PrivescCheck${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/itm4n/PrivescCheck.git $postexploit/PrivescCheck/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing peh${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/melnicek/peh.git $postexploit/peh/ 1>/dev/null 2>> $install



#forensic

echo -e "${PURPLE}Installing AudioStego${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/danielcardeenas/AudioStego.git $forensics/AudioStego/ 1>/dev/null 2>> $install
cd $forensics/AudioStego 1>/dev/null 2>> $install
mkdir build 1>/dev/null 2>> $install
cd build 1>/dev/null 2>> $install
cmake .. 1>/dev/null 2>> $install
make 1>/dev/null 2>> $install
ln -s $forensics/AudioStego/build/hideme ~/bin/audiostego 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing autoVolatility${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/carlospolop/autoVolatility.git $forensics/autoVolatility/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing Depix${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/beurtschipper/Depix.git $forensics/Depix/ 1>/dev/null 2>> $install
cd $forensics/Depix/ 1>/dev/null 2>> $install
pip3 install -r requirements.txt 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing peepdf${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/jesparza/peepdf.git $forensics/peepdf/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing ssh_decoder${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/jjyg/ssh_decoder.git $forensics/ssh_decoder/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing stegsolve${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
mkdir $forensics/stegsolve 1>/dev/null 2>> $install
wget http://www.caesum.com/handbook/Stegsolve.jar -O $forensics/stegsolve/stegsolve.jar 1>/dev/null 2>> $install
chmod +x $forensics/stegsolve/stegsolve.jar 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing Exiftool${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
mkdir $forensics/Exiftool 1>/dev/null 2>> $install
wget https://exiftool.org/Image-ExifTool-12.30.tar.gz -O $forensics/Exiftool/ 1>/dev/null 2>> $install
cd $forensics/Exiftool 1>/dev/null 2>> $install
tar zxvf Image-ExifTool-12.tar.gz 1>/dev/null 2>> $install
ln -s $forensics/Exiftool/Image-ExifTool-12.30/exiftool ~/bin/exiftool 1>/dev/null 2>> $install
rm $forensics/Exiftool/Image-ExifTool-12.30.tar.gz 1>/dev/null 2>> $install



#mobile



#osint

echo -e "${PURPLE}Installing Ghunt${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/mxrch/Ghunt.git $osint/Ghunt/ 1>/dev/null 2>> $install
cd $osint/Ghunt/
pip3 install -r requirements.txt 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing gitGraber${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/hisxo/gitGraber.git $osint/gitGraber/ 1>/dev/null 2>> $install
cd $osint/gitGraber/ 1>/dev/null 2>> $install
pip3 install -r requirements.txt 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing CardPwn${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/itsmehacker/CardPwn.git $osint/CardPwn/ 1>/dev/null 2>> $install
cd $osint/CardPwn/ 1>/dev/null 2>> $install
pip3 install -r requirements.txt 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing SocialintFramework${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/Pyshios/SocialintFramework.git $osint/SocialintFramework 1>/dev/null 2>> $install
cd $osint/SocialintFramework/ 1>/dev/null 2>> $install
pip3 install -r requeriments.txt 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing Scavenger${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/rndinfosecguy/Scavenger.git $osint/Scavenger/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing gitjacker${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
mkdir $osint/gitjacker/ 1>/dev/null 2>> $install
cd $osint/gitjacker/ 1>/dev/null 2>> $install
curl -s "https://raw.githubusercontent.com/liamg/gitjacker/master/scripts/install.sh" | bash 1>/dev/null 2>> $install



#reversing and binary exploitation

echo -e "${PURPLE}Installing Overflow-Helper${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/LegendBegins/Overflow-Helper.git $revbin/Overflow-Helper/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing ropstar${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/xct/ropstar.git $revbin/ropstar/ 1>/dev/null 2>> $install

echo -e "${PURPLE}Installing peframe${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
git clone https://github.com/guelfoweb/peframe.git $revbin/peframe/ 1>/dev/null 2>> $install
cd $revbin/peframe 1>/dev/null 2>> $install
sudo bash install.sh
sudo python3 setup.py install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""


#scanning and recon

echo -e "${PURPLE}Installing AutoRecon${NC}" | tee -a $install
echo -e ""
echo -e ""
echo -e ""
echo -e ""
sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git 1>/dev/null 2>> $install





# Custom Aliases
echo -e "${PURPLE}Installing custom aliases${NC}" | tee -a $install
echo -e ""
zshrc_file=~/.zshrc
for zshrc_file in ~/.zshrc; do
    if ! grep -qF 'source ~/apps/customzshrc' $zshrc_file; then
        echo -e "source ~/apps/customzshrc" >> $zshrc_file
    fi
done







# Docker Containers
echo -e "${BLUE}Installing docker containers${NC}" | tee -a $dockerinstall
echo -e ""
echo -e "${BLUE}Creating Portainer${NC}" | tee -a $dockerinstall
sudo docker volume create portainer_data &1>/dev/null
sudo docker create -p 8000:8000 -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest 1>/dev/null 2>> $dockerinstall
echo -e "${RED}To start Portainer use the${NC} ${BOLD}apphelp${NORM} ${RED}command${NC}" | tee -a $dockerinstall
echo -e "${RED}${BOLD}Once started you will need to ensure that you have created an admin account on first use!${NORM}${NC}" | tee -a $dockerinstall
echo -e ""


echo -e "${BLUE}Creating Spiderfoot${NC}" | tee -a $dockerinstall
git clone https://github.com/smicallef/spiderfoot $osint/spiderfoot/ 1>/dev/null 2>> $dockerinstall
cd $osint/spiderfoot
sudo docker build -t spiderfoot . 1>/dev/null 2>> $dockerinstall
sudo docker create --name spiderfoot -p 5009:5001 -d spiderfoot 1>/dev/null 2>> $dockerinstall
echo -e "${RED}To start Spiderfoot use the${NC} ${BOLD}apphelp${NORM} ${RED}command${NC}" | tee -a $dockerinstall
echo -e ""


echo -e "${BLUE}Creating email header analyzer${NC}" | tee -a $dockerinstall
git clone https://github.com/cyberdefenders/email-header-analyzer $blueteam/email-header-analyzer/ 1>/dev/null 2>> $dockerinstall
cd $blueteam/email-header-analyzer/
sudo docker build -t mha:latest . 1>/dev/null 2>> $dockerinstall
sudo docker create --name mail-header-analyzer -p 8080:8080 mha:latest 1>/dev/null 2>> $dockerinstall
echo -e "${RED}To start Email-Header-Analyzer use the${NC} ${BOLD}apphelp${NORM} ${RED}command${NC}" | tee -a $dockerinstall
echo -e ""


echo -e "${BLUE}Creating AutoSploit${NC}" | tee -a $dockerinstall
git clone https://github.com/NullArray/AutoSploit.git $exploit/AutoSploit/ 1>/dev/null 2>> $dockerinstall
cd $exploit/AutoSploit/
sudo docker network create -d bridge haknet 1>/dev/null 2>> $dockerinstall
sudo docker create --network haknet --name msfdb -e POSTGRES_PASSWORD=s3cr3t -d postgres 1>/dev/null 2>> $dockerinstall
sudo docker build -t autosploit . 1>/dev/null 2>> $dockerinstall
sudo docker create --name autosploit --network haknet -p 2000:80 -p 2001:443 -p 4444:4444 autosploit 1>/dev/null 2>> $dockerinstall
echo -e "${RED}To start AutoSploit use the${NC} ${BOLD}apphelp${NORM} ${RED}command${NC}" | tee -a $dockerinstall
echo -e ""


echo -e "${BLUE}Creating NoSQLMap${NC}" | tee -a $dockerinstall
git clone https://github.com/codingo/NoSQLMap $exploit/NoSQLMap/ 1>/dev/null 2>> $dockerinstall
cd $exploit/NoSQLMap/ 
sudo docker-compose build 1>/dev/null 2>> $dockerinstall
echo -e "${RED}To start NoSQLMap use the ${BOLD}apphelp${NORM} command${NC}" | tee -a $dockerinstall
echo -e ""

echo -e "${BLUE}Creating Juicshop${NC}" | tee -a $dockerinstall
sudo docker create --name juiceshop -p 3000:3000 bkimminich/juice-shop 1>/dev/null 2>> $dockerinstall
echo -e "${RED}To start Juiceshop use the${NC} ${BOLD}apphelp${NORM} ${RED}command${NC}" | tee -a $dockerinstall
echo -e ""



echo -e ""
echo -e ""
echo -e ""
echo -e "${RED}Installation Complete${NC}" | tee -a $install
echo -e "${RED}${BOLD}Restart your terminal for changes to take effect${NORM}${NC}"
echo -e "${RED}Once you have done this run${NC} ${BOLD}apphelp${NORM} ${RED}to start using the newly installed tools${NC}"
echo -e ""
echo -e ""
echo -e ""