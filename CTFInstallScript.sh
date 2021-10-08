#!/bin/bash

#Install Script For CTF


mkdir ~/apps
mkdir ~/apps/cryptoandcracking
mkdir ~/apps/exploit
mkdir ~/apps/post-exploit
mkdir ~/apps/forensics
mkdir ~/apps/osint
mkdir ~/apps/reversingandbinaryexploit
mkdir ~/apps/scanningandrecon


crypto=~/apps/cryptoandcracking
exploit=~/apps/exploit
postexploit=~/apps/post-exploit
forensics=~/apps/forensics
osint=~/apps/osint
revbin=~/apps/reversingandbinaryexploit
scanrec=~/apps/scanningandrecon

# From Apt
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get update && sudo apt-get install amass sherlock forensics-extra veil bloodhound libboost-all-dev cmake pwncat routersploit sqlmap armitage npm nodejs g++ libssl-dev cewl libgmp3-dev libmpc-dev qpdf unrar sed xxd libc-bin curl jq perl gawk grep coreutils git golang seclists enum4linux feroxbuster nbtscan nikto nmap onesixtyone oscanner smbclient smbmap smtp-user-enum sslscan tnscmd10g whatweb fcrackzip hashcat hash-identifier python3-pip -y
sudo apt-get install rubygems build-essential docker.io -y


# Docker Stuff

sudo systemctl enable docker --now

printf "%s\n" "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-ce-archive-keyring.gpg] https://download.docker.com/linux/debian buster stable" \
  | sudo tee /etc/apt/sources.list.d/docker-ce.list
  
curl -fsSL https://download.docker.com/linux/debian/gpg \
  | gpg --dearmor \
  | sudo tee /usr/share/keyrings/docker-ce-archive-keyring.gpg

sudo apt update

sudo apt install -y docker-ce docker-ce-cli containerd.io




# Path variables
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/.local/bin:$PATH

# From npm

sudo npm install --global jwt-cracker

# From Gem
sudo gem install haiti-hash -q
sudo gem install evil-winrm -q

#Python Required Modules/Apps
pip3 install selenium
pip3 install requests
pip3 install py-term
pip3 install pyasn1
pip3 install gmpy2
pip3 install pyv8
pip3 install pylibemu
pip3 install pwntools
pip3 install bs4
pip3 install search-that-hash
pip3 install ttpassgen
pip3 install pefile
pip3 install apkleaks
pip3 install h8mail
pip3 install fuzza
pip3 install libssl-dev
pip3 install swig
pip3 install s3scanner

# From Git

#cryptoandcracking

git clone https://github.com/nil0x42/duplicut.git $crypto/duplicut/
cd $crypto/duplicut/ && make

git clone https://github.com/r3nt0n/bopscrk.git $crypto/bopscrk/
pip install -r $crypto/bopscrk/requirements.txt

git clone https://github.com/bwall/HashPump.git $crypto/hashpump/
cd $crypto/HashPump
sudo make
sudo make install

git clone https://github.com/zshell/Hatch.git $crypto/Hatch/
sudo wget https://chromedriver.storage.googleapis.com/93.0.4577.15/chromedriver_linux64.zip -O /usr/bin && sudo unzip /usr/bin/chromedriver_linux64.zip && sudo rm  /usr/bin/chromedriver_linux64.zip

git clone https://github.com/trustedsec/hate_crack.git $crypto/hate_crack/

git clone https://github.com/toxydose/pnwgen.git $crypto/pnwgen/

git clone https://github.com/Ganapati/RsaCtfTool.git $crypto/RsaCtfTool/
pip3 install -r $crypto/RsaCtfTool/requirements.txt

wget https://github.com/sc0tfree/mentalist/releases/download/v1.0/Mentalist-v1.0-Linux-x86_64.zip -O  ~/bin/
cd ~/bin/
unzip Mentalist-v1.0-Linux-x86_64.zip && rm Mentalist-v1.0-Linux-x86_64.zip


git clone https://github.com/BlackArch/wordlistctl $crypto/wordlistctl/

git clone https://github.com/hamedA2/Zydra.git $crypto/Zydra/
sudo wget http://www.figlet.org/fonts/epic.flf -O /usr/share/figlet/epic.flf

git clone https://github.com/hiddenillusion/NoMoreXOR.git $crypto/NoMoreXOR/

git clone https://github.com/ius/rsatool.git $crypto/rsatool/

git clone https://github.com/X-Vector/X0R.git $crypto/X0R/
pip install -r $crypto/X0R/requirements.txt

git clone https://github.com/AlexFSmirnov/xor-decrypt.git $crypto/xor-decrypt/

git clone https://github.com/digininja/twofi.git $crypto/twofi/
#Test and add to alias

#XORMULTILINEFILE SCRIPT INSTALL!






#exploit

git clone https://github.com/EgeBalci/HERCULES.git $exploit/HERCULES/
cd $exploit/HERCULES
go get github.com/fatih/color
go run Setup.go



git clone https://github.com/tokyoneon/chimera.git $exploit/chimera/
chown $USER:$USER -R $exploit/chimera
chmod +x $exploit/chimera/chimera.sh

git clone https://github.com/localh0t/wildpwn.git $exploit/wildpwn/

git clone https://github.com/persianhydra/Xeexe-TopAntivirusEvasion.git $exploit/Xeexe-TopAntivirusEvasion/
cd $exploit/Xeexe-TopAntivirusEvasion
chmod +x install.sh && ./install.sh
chmod +x $exploit/Xeexe-TopAntivirusEvasion/Xeexe.py

git clone https://github.com/Mr-Un1k0d3r/DKMC.git $exploit/DKMC/
cd $exploit/DKMC
mkdir output

git clone https://github.com/rek7/fireELF.git $exploit/fireELF/
pip3 -U -r $exploit/firreELF/dep.txt

git clone https://github.com/clu3bot/OWT.git $exploit/OWT/

git clone https://github.com/SySS-Research/Seth.git $exploit/Seth/

git clone https://github.com/s0md3v/XSStrike.git $exploit/XSStirke/
cd $exploit/XSStrike
pip3 -r requirements.txt







#post-exploit
git clone https://github.com/nodauf/Girsh.git $postexploit/Girsh/

git clone https://github.com/cddmp/enum4linux-ng $postexploit/enum4linux-ng/
cd $postexploit/enum4linux-ng/
pip3 -r requirements.txt

git clone https://github.com/jondonas/linux-exploit-suggester-2.git $postexploit/linux-exploit-suggester-2/

git clone https://github.com/rebootuser/LinEnum.git $postexploit/LinEnum/

git clone https://github.com/carlospolop/PEASS-ng.git $postexploit/PEASS-ng/

git clone https://github.com/gladiatx0r/Powerless.git $postexploit/Powerless/

git clone https://github.com/itm4n/PrivescCheck.git $postexploit/PrivescCheck/

git clone git clone https://github.com/melnicek/peh.git $postexploit/peh/






#forensic
git clone https://github.com/danielcardeenas/AudioStego.git $forensics/AudioStego/
cd $forensics/AudioStego
mkdir build
cd build
cmake ..
make
ln -s $forensics/AudioStego/hideme ~/bin/audiostego

git clone https://github.com/carlospolop/autoVolatility.git $forensics/autoVolatility/

git clone https://github.com/beurtschipper/Depix.git $forensics/Depix/
cd $forensics/Depix/
pip3 install -r requirements.txt

git clone https://github.com/jesparza/peepdf.git $forensics/peepdf/

git clone https://github.com/jjyg/ssh_decoder.git $forensics/ssh_decoder/

mkdir $forensics/stegsolve
wget http://www.caesum.com/handbook/Stegsolve.jar -O $forensics/stegsolve/stegsolve.jar
chmod +x $forensics/stegsolve/stegsolve.jar

mkdir $forensics/Exiftool
wget https://exiftool.org/Image-ExifTool-12.30.tar.gz -O $forensics/Exiftool/
cd $forensics/Exiftool
tar zxvf Image-ExifTool-12.tar.gz
ln -s $forensics/Exiftool/Image-ExifTool-12.30/exiftool ~/bin/exiftool
rm $forensics/Exiftool/Image-ExifTool-12.30.tar.gz

git clone https://github.com/volatilityfoundation/volatility3.git $forensics/volatility3/






#mobile







#osint
git clone https://github.com/mxrch/Ghunt.git $osint/Ghunt/

git clone https://github.com/hisxo/gitGraber.git $osint/gitGraber/
cd $osint/gitGraber/
pip3 install -r requirements.txt

git clone https://github.com/itsmehacker/CardPwn.git $osint/CardPwn/
cd $osint/CardPwn/
pip3 install -r requirements.txt

git clone https://github.com/Pyshios/SocialintFramework.git $osint/SocialintFramework
cd $osint/SocialintFramework/
pip3 install -r requirements.txt

git clone https://github.com/rndinfosecguy/Scavenger.git $osint/Scavenger/
mkdir $osint/spiderfoot
wget https://github.com/smicallef/spiderfoot/archive/v3.4.tar.gz $osin/spiderfoot
$osint/spiderfoot/tar zxvf v3.4.tar.gz
cd $osint/spiderfoot/
pip3 install -r requirements.txt

mkdir $osint/gitjacker/
cd $osint/gitjacker/
curl -s "https://raw.githubusercontent.com/liamg/gitjacker/master/scripts/install.sh" | bash

mkdir $osint/yar/
cd $osint/yar
go get github.com/nielsing/yar






#reversing and binary exploitation
git clone https://github.com/LegendBegins/Overflow-Helper.git $revbin/Overflow-Helper/

git clone https://github.com/xct/ropstar.git $revbin/ropstar/

git clone https://github.com/java-decompiler/jd-gui.git $revbin/jd-gui/
cd $revbin/jd-gui
./gradlew build
ln -s $revbin/jd-gui ~/bin/jd-gui

git clone https://github.com/guelfoweb/peframe.git $revbin/peframe/
cd $revbin/peframe
sudo bash install.sh
python3 setup.py install





#scanning and recon
git clone https://github.com/Tib3rius/AutoRecon.git $scanrec/AutoRecon/
cd $scanrec/AutoRecon
pip3 install -r requirements.txt






# Helpers

cp ./helpers/* ~/apps

grep -qxF '[ -r ~/apps/customzshrc ] && source ~/apps/.customzshrc' ~/.zshrc || echo '[ -r ~/apps/customzshrc ] && source ~/app/.customzshrc' >> ~/.zshrc
