#!/bin/bash

#Install Script For CTF


echo "Making Folders" | tee -a ./install.log
echo ""
mkdir ~/apps 1>/dev/null 2>> ./install.log
mkdir ~/apps/cryptoandcracking 1>/dev/null 2>> ./install.log
mkdir ~/apps/exploit 1>/dev/null 2>> ./install.log
mkdir ~/apps/post-exploit 1>/dev/null 2>> ./install.log
mkdir ~/apps/forensics 1>/dev/null 2>> ./install.log
mkdir ~/apps/osint 1>/dev/null 2>> ./install.log
mkdir ~/apps/reversingandbinaryexploit 1>/dev/null 2>> ./install.log
mkdir ~/apps/scanningandrecon 1>/dev/null 2>> ./install.log


#helpers
echo "Copying Helpers" | tee -a ./install.log
echo ""
cp helpers/* ~/apps 1>/dev/null 2>> ./install.log

# Script Variables
crypto=~/apps/cryptoandcracking
exploit=~/apps/exploit
postexploit=~/apps/post-exploit
forensics=~/apps/forensics
osint=~/apps/osint
revbin=~/apps/reversingandbinaryexploit
scanrec=~/apps/scanningandrecon


# From Apt
echo "Updating OS and Installing Tools From apt" | tee -a ./install.log
echo ""
sudo apt-get update 1>/dev/null 2>> ./install.log && sudo apt-get upgrade -y 1>/dev/null 2>> ./install.log && sudo apt-get update 1>/dev/null 2>> ./install.log && sudo apt-get install amass sherlock forensics-extra veil bloodhound libboost-all-dev cmake pwncat routersploit sqlmap armitage npm nodejs g++ libssl-dev cewl libgmp3-dev libmpc-dev qpdf unrar sed xxd libc-bin curl jq perl gawk grep coreutils git golang seclists enum4linux feroxbuster nbtscan nikto nmap onesixtyone oscanner smbclient smbmap smtp-user-enum sslscan tnscmd10g whatweb fcrackzip hashcat hash-identifier python3-pip twofi hercules jd-gui -y 1>/dev/null 2>> ./install.log
sudo apt-get install rubygems build-essentials -y 1>/dev/null 2>> ./install.log


# Docker Stuff
echo "Installing Docker" | tee -a ./install.log
echo ""
sudo systemctl enable docker --now 1>/dev/null 2>> ./install.log

printf "%s\n" "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-ce-archive-keyring.gpg] https://download.docker.com/linux/debian buster stable" \
  | sudo tee /etc/apt/sources.list.d/docker-ce.list 1>/dev/null 2>> ./install.log
  
curl -fsSL https://download.docker.com/linux/debian/gpg \
  | gpg --dearmor \
  | sudo tee /usr/share/keyrings/docker-ce-archive-keyring.gpg 1>/dev/null 2>> ./install.log

sudo apt-get update 1>/dev/null 2>> ./install.log

sudo apt-get install -y docker-ce docker-ce-cli containerd.io 1>/dev/null 2>> ./install.log




# Path variables
echo "Configuring Paths" | tee -a ./install.log
echo ""
export GOROOT=/usr/lib/go 
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/.local/bin:$PATH

# From npm
echo "Installing npm" | tee -a ./install.log
echo ""
sudo npm install --global jwt-cracker 1>/dev/null 2>> ./install.log

# From Gem
echo "Installing Tools With gem" | tee -a ./install.log
echo ""
sudo gem install haiti-hash -q 1>/dev/null 2>> ./install.log
sudo gem install evil-winrm -q 1>/dev/null 2>> ./install.log

#Python Required Modules/Apps
pip3 install selenium -U -q --log pipinstall.log
pip3 install requests -U -q --log pipinstall.log
pip3 install py-term -U -q --log pipinstall.log
pip3 install pyasn1 -U -q --log pipinstall.log
pip3 install gmpy2 -U -q --log pipinstall.log
pip3 install rarfile -U -q --log pipinstall.log
pip3 install pylibemu -U -q --log pipinstall.log
pip3 install pwntools -U -q --log pipinstall.log
pip3 install bs4 -U -q --log pipinstall.log
pip3 install search-that-hash -U -q --log pipinstall.log
pip3 install ttpassgen -U -q --log pipinstall.log
pip3 install pefile -U -q --log pipinstall.log
pip3 install apkleaks -U -q --log pipinstall.log
pip3 install h8mail -U -q --log pipinstall.log
pip3 install fuzza -U -q --log pipinstall.log
pip3 install libssl-dev -U -q --log pipinstall.log
pip3 install swig -U -q --log pipinstall.log
pip3 install s3scanner -U -q --log pipinstall.log

# From Git

#cryptoandcracking
echo "Installing duplicut" | tee -a ./install.log
echo ""
git clone https://github.com/nil0x42/duplicut.git $crypto/duplicut/ 1>/dev/null 2>> ./install.log
cd $crypto/duplicut/ && make 1>/dev/null 2>> ./install.log

echo "Installing bopscrk" | tee -a ./install.log
echo ""
git clone https://github.com/r3nt0n/bopscrk.git $crypto/bopscrk/ 1>/dev/null 2>> ./install.log
pip install -r $crypto/bopscrk/requirements.txt 1>/dev/null 2>> ./install.log

echo "Installing HashPump" | tee -a ./install.log
echo ""
git clone https://github.com/bwall/HashPump.git $crypto/hashpump/ 1>/dev/null 2>> ./install.log
cd $crypto/hashpump 1>/dev/null 2>> ./install.log
sudo make 1>/dev/null 2>> ./install.log
sudo make install 1>/dev/null 2>> ./install.log

echo "Installing hate_crack" | tee -a ./install.log
echo ""
git clone https://github.com/trustedsec/hate_crack.git $crypto/hate_crack/ 1>/dev/null 2>> ./install.log

echo "Installing pwngen" | tee -a ./install.log
echo ""
git clone https://github.com/toxydose/pnwgen.git $crypto/pnwgen/ 1>/dev/null 2>> ./install.log

echo "Installing RsaCtfTool" | tee -a ./install.log
echo ""
git clone https://github.com/Ganapati/RsaCtfTool.git $crypto/RsaCtfTool/ 1>/dev/null 2>> ./install.log
pip3 install -r $crypto/RsaCtfTool/requirements.txt 1>/dev/null 2>> ./install.log

echo "Installing Mentalist" | tee -a ./install.log
echo ""
git clone https://github.com/sc0tfree/mentalist.git $crypto/mentalist/ 1>/dev/null 2>> ./install.log
cd $crypto/mentalist/
sudo python3 setup.py install


echo "Installing wordlistctl" | tee -a ./install.log
echo ""
git clone https://github.com/BlackArch/wordlistctl $crypto/wordlistctl/ 1>/dev/null 2>> ./install.log

echo "Installing Zydra" | tee -a ./install.log
echo ""
git clone https://github.com/hamedA2/Zydra.git $crypto/Zydra/ 1>/dev/null 2>> ./install.log
sudo wget http://www.figlet.org/fonts/epic.flf -O /usr/share/figlet/epic.flf 1>/dev/null 2>> ./install.log

#echo "Installing NoMoreXOR" | tee -a ./install.log
#echo ""
#git clone https://github.com/hiddenillusion/NoMoreXOR.git $crypto/NoMoreXOR/ 1>/dev/null 2>> ./install.log

echo "Installing rsatool" | tee -a ./install.log
echo ""
git clone https://github.com/ius/rsatool.git $crypto/rsatool/ 1>/dev/null 2>> ./install.log

echo "Installing X0R" | tee -a ./install.log
echo ""
git clone https://github.com/X-Vector/X0R.git $crypto/X0R/ 1>/dev/null 2>> ./install.log
pip install -r $crypto/X0R/requirement.txt 1>/dev/null 2>> ./install.log

echo "Installing xor-decrypt" | tee -a ./install.log
echo ""
git clone https://github.com/AlexFSmirnov/xor-decrypt.git $crypto/xor-decrypt/ 1>/dev/null 2>> ./install.log

#XORMULTILINEFILE SCRIPT INSTALL!






#exploit



#echo "Installing chimera" | tee -a ./install.log
#echo ""
#git clone https://github.com/tokyoneon/chimera.git $exploit/chimera/ 1>/dev/null 2>> ./install.log
#chown $USER:$USER -R $exploit/chimera 1>/dev/null 2>> ./install.log
#chmod +x $exploit/chimera/chimera.sh 1>/dev/null 2>> ./install.log

echo "Installing wildpwn" | tee -a ./install.log
echo ""
git clone https://github.com/localh0t/wildpwn.git $exploit/wildpwn/ 1>/dev/null 2>> ./install.log

#echo "Installing Xeexe" | tee -a ./install.log
#echo ""
#git clone https://github.com/persianhydra/Xeexe-TopAntivirusEvasion.git $exploit/Xeexe-TopAntivirusEvasion/ 1>/dev/null 2>> ./install.log
#cd $exploit/Xeexe-TopAntivirusEvasion 1>/dev/null 2>> ./install.log
#chmod +x install.sh && ./install.sh 1>/dev/null 2>> ./install.log
#chmod +x $exploit/Xeexe-TopAntivirusEvasion/Xeexe.py 1>/dev/null 2>> ./install.log

echo "Installing DKMC" | tee -a ./install.log
echo ""
git clone https://github.com/Mr-Un1k0d3r/DKMC.git $exploit/DKMC/ 1>/dev/null 2>> ./install.log
cd $exploit/DKMC 1>/dev/null 2>> ./install.log
mkdir output 1>/dev/null 2>> ./install.log

echo "Installing fireELF" | tee -a ./install.log
echo ""
git clone https://github.com/rek7/fireELF.git $exploit/fireELF/ 1>/dev/null 2>> ./install.log
pip3 install -r $exploit/firreELF/dep.txt 1>/dev/null 2>> ./install.log

#echo "Installing OWT" | tee -a ./install.log
#echo ""
#git clone https://github.com/clu3bot/OWT.git $exploit/OWT/ 1>/dev/null 2>> ./install.log

echo "Installing Seth" | tee -a ./install.log
echo ""
git clone https://github.com/SySS-Research/Seth.git $exploit/Seth/ 1>/dev/null 2>> ./install.log

#echo "Installing XSStrike" | tee -a ./install.log
#echo ""
#git clone https://github.com/s0md3v/XSStrike.git $exploit/XSStirke/ 1>/dev/null 2>> ./install.log
#cd $exploit/XSStrike 1>/dev/null 2>> ./install.log
#pip3 install -r requirements.txt 1>/dev/null 2>> ./install.log







#post-exploit
echo "Installing Girsh" | tee -a ./install.log
echo ""
git clone https://github.com/nodauf/Girsh.git $postexploit/Girsh/ 1>/dev/null 2>> ./install.log

echo "Installing enum4linux" | tee -a ./install.log
echo ""
git clone https://github.com/cddmp/enum4linux-ng $postexploit/enum4linux-ng/ 1>/dev/null 2>> ./install.log
cd $postexploit/enum4linux-ng/ 1>/dev/null 2>> ./install.log
pip3 install -r requirements.txt 1>/dev/null 2>> ./install.log

echo "Installing linux-exploit-suggester-2" | tee -a ./install.log
echo ""
git clone https://github.com/jondonas/linux-exploit-suggester-2.git $postexploit/linux-exploit-suggester-2/ 1>/dev/null 2>> ./install.log

echo "Installing LinEnum" | tee -a ./install.log
echo ""
git clone https://github.com/rebootuser/LinEnum.git $postexploit/LinEnum/ 1>/dev/null 2>> ./install.log

#echo "Installing PEASS-ng" | tee -a ./install.log
#echo ""
#git clone https://github.com/carlospolop/PEASS-ng.git $postexploit/PEASS-ng/ 1>/dev/null 2>> ./install.log

echo "Installing Powerless" | tee -a ./install.log
echo ""
git clone https://github.com/gladiatx0r/Powerless.git $postexploit/Powerless/ 1>/dev/null 2>> ./install.log

echo "Installing PrivescCheck" | tee -a ./install.log
echo ""
git clone https://github.com/itm4n/PrivescCheck.git $postexploit/PrivescCheck/ 1>/dev/null 2>> ./install.log

echo "Installing peh" | tee -a ./install.log
echo ""
git clone https://github.com/melnicek/peh.git $postexploit/peh/ 1>/dev/null 2>> ./install.log






#forensic
#echo "Installing AudioStego" | tee -a ./install.log
#echo ""
#git clone https://github.com/danielcardeenas/AudioStego.git $forensics/AudioStego/ 1>/dev/null 2>> ./install.log
#cd $forensics/AudioStego 1>/dev/null 2>> ./install.log
#mkdir build 1>/dev/null 2>> ./install.log
#cd build 1>/dev/null 2>> ./install.log
#cmake .. 1>/dev/null 2>> ./install.log
#make 1>/dev/null 2>> ./install.log
#ln -s $forensics/AudioStego/hideme ~/bin/audiostego 1>/dev/null 2>> ./install.log

echo "Installing autoVolatility" | tee -a ./install.log
echo ""
git clone https://github.com/carlospolop/autoVolatility.git $forensics/autoVolatility/ 1>/dev/null 2>> ./install.log

echo "Installing Depix" | tee -a ./install.log
echo ""
git clone https://github.com/beurtschipper/Depix.git $forensics/Depix/ 1>/dev/null 2>> ./install.log
cd $forensics/Depix/ 1>/dev/null 2>> ./install.log
pip3 install -r requirements.txt 1>/dev/null 2>> ./install.log

echo "Installing peepdf" | tee -a ./install.log
echo ""
git clone https://github.com/jesparza/peepdf.git $forensics/peepdf/ 1>/dev/null 2>> ./install.log

echo "Installing ssh_decoder" | tee -a ./install.log
echo ""
git clone https://github.com/jjyg/ssh_decoder.git $forensics/ssh_decoder/ 1>/dev/null 2>> ./install.log

echo "Installing stegsolve" | tee -a ./install.log
echo ""
mkdir $forensics/stegsolve 1>/dev/null 2>> ./install.log
wget http://www.caesum.com/handbook/Stegsolve.jar -O $forensics/stegsolve/stegsolve.jar 1>/dev/null 2>> ./install.log
chmod +x $forensics/stegsolve/stegsolve.jar 1>/dev/null 2>> ./install.log

echo "Installing Exiftool" | tee -a ./install.log
echo ""
mkdir $forensics/Exiftool 1>/dev/null 2>> ./install.log
wget https://exiftool.org/Image-ExifTool-12.30.tar.gz -O $forensics/Exiftool/ 1>/dev/null 2>> ./install.log
cd $forensics/Exiftool 1>/dev/null 2>> ./install.log
tar zxvf Image-ExifTool-12.tar.gz 1>/dev/null 2>> ./install.log
ln -s $forensics/Exiftool/Image-ExifTool-12.30/exiftool ~/bin/exiftool 1>/dev/null 2>> ./install.log
rm $forensics/Exiftool/Image-ExifTool-12.30.tar.gz 1>/dev/null 2>> ./install.log

#echo "Installing volatility3" | tee -a ./install.log
#echo ""
#git clone https://github.com/volatilityfoundation/volatility3.git $forensics/volatility3/ 1>/dev/null 2>> ./install.log






#mobile







#osint
#echo "Installing Ghunt" | tee -a ./install.log
#echo ""
#git clone https://github.com/mxrch/Ghunt.git $osint/Ghunt/ 1>/dev/null 2>> ./install.log

echo "Installing gitGraber" | tee -a ./install.log
echo ""
git clone https://github.com/hisxo/gitGraber.git $osint/gitGraber/ 1>/dev/null 2>> ./install.log
cd $osint/gitGraber/ 1>/dev/null 2>> ./install.log
pip3 install -r requirements.txt 1>/dev/null 2>> ./install.log

echo "Installing CardPwn" | tee -a ./install.log
echo ""
git clone https://github.com/itsmehacker/CardPwn.git $osint/CardPwn/ 1>/dev/null 2>> ./install.log
cd $osint/CardPwn/ 1>/dev/null 2>> ./install.log
pip3 install -r requirements.txt 1>/dev/null 2>> ./install.log

echo "Installing SocialintFramework" | tee -a ./install.log
echo ""
git clone https://github.com/Pyshios/SocialintFramework.git $osint/SocialintFramework 1>/dev/null 2>> ./install.log
cd $osint/SocialintFramework/ 1>/dev/null 2>> ./install.log
pip3 install -r requeriments.txt 1>/dev/null 2>> ./install.log

echo "Installing Scavenger" | tee -a ./install.log
echo ""
git clone https://github.com/rndinfosecguy/Scavenger.git $osint/Scavenger/ 1>/dev/null 2>> ./install.log

echo "Installing spiderfoot" | tee -a ./install.log
echo ""
mkdir $osint/spiderfoot 1>/dev/null 2>> ./install.log
wget https://github.com/smicallef/spiderfoot/archive/v3.4.tar.gz $osin/spiderfoot 1>/dev/null 2>> ./install.log
$osint/spiderfoot/tar zxvf v3.4.tar.gz 1>/dev/null 2>> ./install.log
cd $osint/spiderfoot/ 1>/dev/null 2>> ./install.log
pip3 install -r requeriments.txt 1>/dev/null 2>> ./install.log

#echo "Installing gitjacker" | tee -a ./install.log
#echo ""
#mkdir $osint/gitjacker/ 1>/dev/null 2>> ./install.log
#cd $osint/gitjacker/ 1>/dev/null 2>> ./install.log
#curl -s "https://raw.githubusercontent.com/liamg/gitjacker/master/scripts/install.sh" | bash 1>/dev/null 2>> ./install.log

echo "Installing yar" | tee -a ./install.log
echo ""
mkdir $osint/yar/ 1>/dev/null 2>> ./install.log
cd $osint/yar 1>/dev/null 2>> ./install.log
go get github.com/nielsing/yar 1>/dev/null 2>> ./install.log






#reversing and binary exploitation
echo "Installing Overflow-Helper" | tee -a ./install.log
echo ""
git clone https://github.com/LegendBegins/Overflow-Helper.git $revbin/Overflow-Helper/ 1>/dev/null 2>> ./install.log

echo "Installing ropstar" | tee -a ./install.log
echo ""
git clone https://github.com/xct/ropstar.git $revbin/ropstar/ 1>/dev/null 2>> ./install.log

echo "Installing peframe" | tee -a ./install.log
echo ""
git clone https://github.com/guelfoweb/peframe.git $revbin/peframe/ 1>/dev/null 2>> ./install.log
cd $revbin/peframe 1>/dev/null 2>> ./install.log
sudo bash install.sh
python3 setup.py install





#scanning and recon
#echo "Installing AutoRecon" | tee -a ./install.log
#echo ""
#git clone https://github.com/Tib3rius/AutoRecon.git $scanrec/AutoRecon/ 1>/dev/null 2>> ./install.log
#cd $scanrec/AutoRecon 1>/dev/null 2>> ./install.log
#pip3 install -r requirements.txt 1>/dev/null 2>> ./install.log











# Custom Aliases
echo "Installing custom aliases" | tee -a ./install.log
echo ""
zshrc_file=~/.zshrc
for zshrc_file in ~/.zshrc; do
    if ! grep -qF 'source ~/apps/customzshrc' $zshrc_file; then
        echo "source ~/apps/customzshrc" >> $zshrc_file
    fi
done
