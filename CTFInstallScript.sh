#!/bin/bash

#Install Script For CTF

echolog= 1>./installlog.log
errorlog= 1>/dev/null 2>> ./installlog.log

echo "Making Folders" $echolog
echo ""
mkdir ~/apps $errorlog
mkdir ~/apps/cryptoandcracking $errorlog
mkdir ~/apps/exploit $errorlog
mkdir ~/apps/post-exploit $errorlog
mkdir ~/apps/forensics $errorlog
mkdir ~/apps/osint $errorlog
mkdir ~/apps/reversingandbinaryexploit $errorlog
mkdir ~/apps/scanningandrecon $errorlog


#helpers
echo "Copying Helpers" $echolog
echo ""
cp helpers/* ~/apps $errorlog

# Script Variables
crypto=~/apps/cryptoandcracking $errorlog
exploit=~/apps/exploit $errorlog
postexploit=~/apps/post-exploit $errorlog
forensics=~/apps/forensics $errorlog
osint=~/apps/osint $errorlog
revbin=~/apps/reversingandbinaryexploit $errorlog
scanrec=~/apps/scanningandrecon $errorlog


# From Apt
echo "Updating OS and Installing Tools From apt" $echolog
echo ""
sudo apt-get update $errorlog && sudo apt-get upgrade -y $errorlog && sudo apt-get update $errorlog && sudo apt-get install amass sherlock forensics-extra veil bloodhound libboost-all-dev cmake pwncat routersploit sqlmap armitage npm nodejs g++ libssl-dev cewl libgmp3-dev libmpc-dev qpdf unrar sed xxd libc-bin curl jq perl gawk grep coreutils git golang seclists enum4linux feroxbuster nbtscan nikto nmap onesixtyone oscanner smbclient smbmap smtp-user-enum sslscan tnscmd10g whatweb fcrackzip hashcat hash-identifier python3-pip -y $errorlog
sudo apt-get install rubygems build-essentials -y $errorlog


# Docker Stuff
echo "Installing Docker" $echolog
echo ""
sudo systemctl enable docker --now $errorlog

printf "%s\n" "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-ce-archive-keyring.gpg] https://download.docker.com/linux/debian buster stable" \
  | sudo tee /etc/apt/sources.list.d/docker-ce.list $errorlog
  
curl -fsSL https://download.docker.com/linux/debian/gpg \
  | gpg --dearmor \
  | sudo tee /usr/share/keyrings/docker-ce-archive-keyring.gpg $errorlog

sudo apt update $errorlog

sudo apt install -y docker-ce docker-ce-cli containerd.io $errorlog




# Path variables
echo "Configuring Paths" $echolog
echo ""
export GOROOT=/usr/lib/go 
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/.local/bin:$PATH

# From npm
echo "Installing npm" $echolog
echo ""
sudo npm install --global jwt-cracker $errorlog

# From Gem
echo "Installing Tools With gem" $echolog
echo ""
sudo gem install haiti-hash -q $errorlog
sudo gem install evil-winrm -q $errorlog

#Python Required Modules/Apps
pip3 install selenium -U -q --log installerror.log
pip3 install requests -U -q --log installerror.log
pip3 install py-term -U -q --log installerror.log
pip3 install pyasn1 -U -q --log installerror.log
pip3 install gmpy2 -U -q --log installerror.log
#pip3 install pyv8
pip3 install pylibemu -U -q --log installerror.log
pip3 install pwntools -U -q --log installerror.log
pip3 install bs4 -U -q --log installerror.log
pip3 install search-that-hash -U -q --log installerror.log
pip3 install ttpassgen -U -q --log installerror.log
pip3 install pefile -U -q --log installerror.log
pip3 install apkleaks -U -q --log installerror.log
pip3 install h8mail -U -q --log installerror.log
pip3 install fuzza -U -q --log installerror.log
pip3 install libssl-dev -U -q --log installerror.log
pip3 install swig -U -q --log installerror.log
pip3 install s3scanner -U -q --log installerror.log

# From Git

#cryptoandcracking
echo "Installing duplicut" $echolog
echo ""
git clone https://github.com/nil0x42/duplicut.git $crypto/duplicut/ $errorlog
cd $crypto/duplicut/ && make $errorlog
echo "Installing bopscrk" $echolog
echo ""
git clone https://github.com/r3nt0n/bopscrk.git $crypto/bopscrk/ $errorlog
pip install -r $crypto/bopscrk/requirements.txt $errorlog
echo "Installing HashPump" $echolog
echo ""
git clone https://github.com/bwall/HashPump.git $crypto/hashpump/ $errorlog
cd $crypto/HashPump $errorlog
sudo make $errorlog
sudo make install $errorlog
echo "Installing Hatch" $echolog
echo ""
git clone https://github.com/zshell/Hatch.git $crypto/Hatch/ $errorlog
sudo wget https://chromedriver.storage.googleapis.com/93.0.4577.15/chromedriver_linux64.zip -O /usr/bin && sudo unzip /usr/bin/chromedriver_linux64.zip && sudo rm  /usr/bin/chromedriver_linux64.zip $errorlog
echo "Installing hate_crack" $echolog
echo ""
git clone https://github.com/trustedsec/hate_crack.git $crypto/hate_crack/ $errorlog
echo "Installing pwngen" $echolog
echo ""
git clone https://github.com/toxydose/pnwgen.git $crypto/pnwgen/ $errorlog
echo "Installing RsaCtfTool" $echolog
echo ""
git clone https://github.com/Ganapati/RsaCtfTool.git $crypto/RsaCtfTool/ $errorlog
pip3 install -r $crypto/RsaCtfTool/requirements.txt $errorlog
echo "Installing Mentalist" $echolog
echo ""
wget https://github.com/sc0tfree/mentalist/releases/download/v1.0/Mentalist-v1.0-Linux-x86_64.zip -O  ~/bin/ $errorlog
cd ~/bin/ $errorlog
unzip Mentalist-v1.0-Linux-x86_64.zip && rm Mentalist-v1.0-Linux-x86_64.zip $errorlog

echo "Installing wordlistctl" $echolog
echo ""
git clone https://github.com/BlackArch/wordlistctl $crypto/wordlistctl/ $errorlog
echo "Installing Zydra" $echolog
echo ""
git clone https://github.com/hamedA2/Zydra.git $crypto/Zydra/ $errorlog
sudo wget http://www.figlet.org/fonts/epic.flf -O /usr/share/figlet/epic.flf $errorlog
echo "Installing NoMoreXOR" $echolog
echo ""
git clone https://github.com/hiddenillusion/NoMoreXOR.git $crypto/NoMoreXOR/ $errorlog
echo "Installing rsatool" $echolog
echo ""
git clone https://github.com/ius/rsatool.git $crypto/rsatool/ $errorlog
echo "Installing X0R" $echolog
echo ""
git clone https://github.com/X-Vector/X0R.git $crypto/X0R/ $errorlog
pip install -r $crypto/X0R/requirement.txt $errorlog
echo "Installing xor-decrypt" $echolog
echo ""
git clone https://github.com/AlexFSmirnov/xor-decrypt.git $crypto/xor-decrypt/ $errorlog
echo "Installing twofi" $echolog
echo ""
git clone https://github.com/digininja/twofi.git $crypto/twofi/ $errorlog
#Test and add to alias

#XORMULTILINEFILE SCRIPT INSTALL!






#exploit
echo "Installing HERCULES" $echolog
echo ""
git clone https://github.com/EgeBalci/HERCULES.git $exploit/HERCULES/ $errorlog
cd $exploit/HERCULES $errorlog
go get github.com/fatih/color $errorlog
go run Setup.go $errorlog


echo "Installing chimera" $echolog
echo ""
git clone https://github.com/tokyoneon/chimera.git $exploit/chimera/ $errorlog
chown $USER:$USER -R $exploit/chimera $errorlog
chmod +x $exploit/chimera/chimera.sh $errorlog
echo "Installing wildpwn" $echolog
echo ""
git clone https://github.com/localh0t/wildpwn.git $exploit/wildpwn/ $errorlog
echo "Installing Xeexe" $echolog
echo ""
git clone https://github.com/persianhydra/Xeexe-TopAntivirusEvasion.git $exploit/Xeexe-TopAntivirusEvasion/ $errorlog
cd $exploit/Xeexe-TopAntivirusEvasion $errorlog
chmod +x install.sh && ./install.sh $errorlog
chmod +x $exploit/Xeexe-TopAntivirusEvasion/Xeexe.py $errorlog
echo "Installing DKMC" $echolog
echo ""
git clone https://github.com/Mr-Un1k0d3r/DKMC.git $exploit/DKMC/ $errorlog
cd $exploit/DKMC $errorlog
mkdir output $errorlog
echo "Installing fireELF" $echolog
echo ""
git clone https://github.com/rek7/fireELF.git $exploit/fireELF/ $errorlog
pip3 install -r $exploit/firreELF/dep.txt $errorlog
echo "Installing OWT" $echolog
echo ""
git clone https://github.com/clu3bot/OWT.git $exploit/OWT/ $errorlog
echo "Installing Seth" $echolog
echo ""
git clone https://github.com/SySS-Research/Seth.git $exploit/Seth/ $errorlog
echo "Installing XSStrike" $echolog
echo ""
git clone https://github.com/s0md3v/XSStrike.git $exploit/XSStirke/ $errorlog
cd $exploit/XSStrike $errorlog
pip3 install -r requirements.txt $errorlog







#post-exploit
echo "Installing Girsh" $echolog
echo ""
git clone https://github.com/nodauf/Girsh.git $postexploit/Girsh/ $errorlog
echo "Installing enum4linux" $echolog
echo ""
git clone https://github.com/cddmp/enum4linux-ng $postexploit/enum4linux-ng/ $errorlog
cd $postexploit/enum4linux-ng/ $errorlog
pip3 install -r requirements.txt $errorlog
echo "Installing linux-exploit-suggester-2" $echolog
echo ""
git clone https://github.com/jondonas/linux-exploit-suggester-2.git $postexploit/linux-exploit-suggester-2/ $errorlog
echo "Installing LinEnum" $echolog
echo ""
git clone https://github.com/rebootuser/LinEnum.git $postexploit/LinEnum/ $errorlog
echo "Installing PEASS-ng" $echolog
echo ""
git clone https://github.com/carlospolop/PEASS-ng.git $postexploit/PEASS-ng/ $errorlog
echo "Installing Powerless" $echolog
echo ""
git clone https://github.com/gladiatx0r/Powerless.git $postexploit/Powerless/ $errorlog
echo "Installing PrivescCheck" $echolog
echo ""
git clone https://github.com/itm4n/PrivescCheck.git $postexploit/PrivescCheck/ $errorlog
echo "Installing peh" $echolog
echo ""
git clone https://github.com/melnicek/peh.git $postexploit/peh/ $errorlog






#forensic
echo "Installing AudioStego" $echolog
echo ""
git clone https://github.com/danielcardeenas/AudioStego.git $forensics/AudioStego/ $errorlog
cd $forensics/AudioStego $errorlog
mkdir build $errorlog
cd build $errorlog
cmake .. $errorlog
make $errorlog
ln -s $forensics/AudioStego/hideme ~/bin/audiostego $errorlog
echo "Installing autoVolatility" $echolog
echo ""
git clone https://github.com/carlospolop/autoVolatility.git $forensics/autoVolatility/ $errorlog
echo "Installing Depix" $echolog
echo ""
git clone https://github.com/beurtschipper/Depix.git $forensics/Depix/ $errorlog
cd $forensics/Depix/ $errorlog
pip3 install -r requirements.txt $errorlog
echo "Installing peepdf" $echolog
echo ""
git clone https://github.com/jesparza/peepdf.git $forensics/peepdf/ $errorlog
echo "Installing ssh_decoder" $echolog
echo ""
git clone https://github.com/jjyg/ssh_decoder.git $forensics/ssh_decoder/ $errorlog
echo "Installing stegsolve" $echolog
echo ""
mkdir $forensics/stegsolve $errorlog
wget http://www.caesum.com/handbook/Stegsolve.jar -O $forensics/stegsolve/stegsolve.jar $errorlog
chmod +x $forensics/stegsolve/stegsolve.jar $errorlog
echo "Installing Exiftool" $echolog
echo ""
mkdir $forensics/Exiftool $errorlog
wget https://exiftool.org/Image-ExifTool-12.30.tar.gz -O $forensics/Exiftool/ $errorlog
cd $forensics/Exiftool $errorlog
tar zxvf Image-ExifTool-12.tar.gz $errorlog
ln -s $forensics/Exiftool/Image-ExifTool-12.30/exiftool ~/bin/exiftool $errorlog
rm $forensics/Exiftool/Image-ExifTool-12.30.tar.gz $errorlog
echo "Installing volatility3" $echolog
echo ""
git clone https://github.com/volatilityfoundation/volatility3.git $forensics/volatility3/ $errorlog






#mobile







#osint
echo "Installing Ghunt" $echolog
echo ""
git clone https://github.com/mxrch/Ghunt.git $osint/Ghunt/ $errorlog
echo "Installing gitGraber" $echolog
echo ""
git clone https://github.com/hisxo/gitGraber.git $osint/gitGraber/ $errorlog
cd $osint/gitGraber/ $errorlog
pip3 install -r requirements.txt $errorlog
echo "Installing CardPwn" $echolog
echo ""
git clone https://github.com/itsmehacker/CardPwn.git $osint/CardPwn/ $errorlog
cd $osint/CardPwn/ $errorlog
pip3 install -r requirements.txt $errorlog
echo "Installing SocialintFramework" $echolog
echo ""
git clone https://github.com/Pyshios/SocialintFramework.git $osint/SocialintFramework $errorlog
cd $osint/SocialintFramework/ $errorlog
pip3 install -r requeriments.txt $errorlog
echo "Installing Scavenger" $echolog
echo ""
git clone https://github.com/rndinfosecguy/Scavenger.git $osint/Scavenger/ $errorlog
echo "Installing spiderfoot" $echolog
echo ""
mkdir $osint/spiderfoot $errorlog
wget https://github.com/smicallef/spiderfoot/archive/v3.4.tar.gz $osin/spiderfoot $errorlog
$osint/spiderfoot/tar zxvf v3.4.tar.gz $errorlog
cd $osint/spiderfoot/ $errorlog
pip3 install -r requeriments.txt $errorlog
echo "Installing gitjacker" $echolog
echo ""
mkdir $osint/gitjacker/ $errorlog
cd $osint/gitjacker/ $errorlog
curl -s "https://raw.githubusercontent.com/liamg/gitjacker/master/scripts/install.sh" | bash $errorlog
echo "Installing yar" $echolog
echo ""
mkdir $osint/yar/ $errorlog
cd $osint/yar $errorlog
go get github.com/nielsing/yar $errorlog






#reversing and binary exploitation
echo "Installing Overflow-Helper" $echolog
echo ""
git clone https://github.com/LegendBegins/Overflow-Helper.git $revbin/Overflow-Helper/ $errorlog
echo "Installing ropstar" $echolog
echo ""
git clone https://github.com/xct/ropstar.git $revbin/ropstar/ $errorlog
echo "Installing jd-gui" $echolog
echo ""
git clone https://github.com/java-decompiler/jd-gui.git $revbin/jd-gui/ $errorlog
cd $revbin/jd-gui $errorlog
./gradlew build $errorlog
ln -s $revbin/jd-gui ~/bin/jd-gui $errorlog
echo "Installing peframe" $echolog
echo ""
git clone https://github.com/guelfoweb/peframe.git $revbin/peframe/ $errorlog
cd $revbin/peframe $errorlog
sudo bash install.sh $errorlog
python3 setup.py install $errorlog





#scanning and recon
echo "Installing AutoRecon" $echolog
echo ""
git clone https://github.com/Tib3rius/AutoRecon.git $scanrec/AutoRecon/ $errorlog
cd $scanrec/AutoRecon $errorlog
pip3 install -r requirements.txt $errorlog











# Custom Aliases
echo "Installing custom aliases" $echolog
echo ""
zshrc_file=~/.zshrc
for zshrc_file in ~/.zshrc; do
    if ! grep -qF 'source ~/apps/customzshrc' $zshrc_file; then
        echo "source ~/apps/customzshrc" >> $zshrc_file
    fi
done
