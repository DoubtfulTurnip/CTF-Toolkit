![Logo](https://github.com/DoubtfulTurnip/DTTermTheme/blob/main/Screenshots/DTLogo.png?raw=true)

# CTFtoolkit

=== Stil very much in testing phase but it kind of works ===

There is nothing particularly special about this script. It just installs several tools that I have found useful for CTF challenges. It is in a very alpha release state at the moment but I am looking to make it a lot more streamline as I improve it and add more tools. 

I have written this script with the intention of it being used on a clean install of [Kali Linux](https://www.kali.org/) for the purpose of using it for CTF challenges. The OS can then be removed/deleted once the CTF challenges are finished with and the script can be reused at a future time. I would not recommend using this on your production installation of Kali Linux.

I made this script for me, to try and make my life a bit easier when preparing for CTF competitions 

In addition to installing some tools from Github this will also update the OS and apt packages and also install [Docker](https://www.docker.com/)


## Install ##

- Clone to a clean Kali OS installation

```
git clone https://github.com/DoubtfulTurnip/ctftoolkit
```

- Make the script executable

```
cd ctftoolkit
chmod +x CTFInstallScript.sh
```

- Run the install script (requires sudo)

```
sudo ./CTFInstallScript.sh
```

The script does require some interaction when it is running but it should be safe to just accept any defaults 


## Usage ##

Once the installation is complete, close/restart the terminal to allow the aliases to update. Running the following command provides some options for assisting you with the tools that have been installed.

```
apphelp
```
Note: The docker containers have not yet been implemented (next on the to do list) but option 12 lists all the available tools and the commands to start them


## Tools included ##


### Crypto and Cracking

- [bopscrk](https://github.com/R3nt0n/bopscrk)
- [CeWL](https://github.com/digininja/CeWL)
- [crunch](https://sourceforge.net/projects/crunch-wordlist/)
- [cupp](https://github.com/Mebus/cupp)
- [duplicut](https://github.com/nil0x42/duplicut)
- [haiti](https://github.com/Orange-Cyberdefense/haiti)
- [hashcat](https://github.com/hashcat/hashcat)
- [hash-identifier](https://github.com/blackploit/hash-identifier)
- [hashpump](https://github.com/bwall/HashPump)
- [hate_crack](https://github.com/trustedsec/hate_crack)
- [hydra](https://github.com/vanhauser-thc/thc-hydra)
- [jwt-cracker](https://github.com/lmammino/jwt-cracker)
- [john](https://www.openwall.com/john/)
- [NoMoreXOR](https://github.com/hiddenillusion/NoMoreXOR)
- [pnwgen](https://github.com/toxydose/pnwgen)
- [RsaCtfTool](https://github.com/Ganapati/RsaCtfTool)
- [rsatool](https://github.com/ius/rsatool)
- [Search-That-Hash](https://github.com/HashPals/Search-That-Hash)
- [TTPassGen](https://github.com/tp7309/TTPassGen)
- [twofi](https://github.com/digininja/twofi)
- [wordlistctl](https://github.com/BlackArch/wordlistctl)
- [X0R](https://github.com/X-Vector/X0R)
- [xor-decrypt](https://github.com/AlexFSmirnov/xor-decrypt)
- [Zydra](https://github.com/hamedA2/Zydra)



### Exploit

- [chimera](https://github.com/tokyoneon/chimera)
- [DKMC](https://github.com/Mr-Un1k0d3r/DKMC)
- [evil-winrm](https://github.com/Hackplayers/evil-winrm)
- [fireELF](https://github.com/rek7/fireELF)
- [pwncat](https://github.com/cytopia/pwncat)
- [routersploit](https://github.com/threat9/routersploit)
- [Seth](https://github.com/SySS-Research/Seth)
- [sqlmap](https://github.com/sqlmapproject/sqlmap)
- [Veil](https://github.com/Veil-Framework/Veil)
- [wildpwn](https://github.com/localh0t/wildpwn)
- [Xexee-TopAntivirusEvasion](https://github.com/persianhydra/Xeexe-TopAntivirusEvasion)
- [OWT](https://github.com/clu3bot/OWT)
- [XSStrike](https://github.com/s0md3v/XSStrike)



### Post-Exploit

- [BloodHound](https://github.com/BloodHoundAD/BloodHound)
- [Girsh](https://github.com/nodauf/Girsh)
- [enum4linux-ng](https://github.com/cddmp/enum4linux-ng)
- [linux-exploit-suggester-2](https://github.com/jondonas/linux-exploit-suggester-2)
- [LinEnum](https://github.com/rebootuser/LinEnum)
- [Powerless](https://github.com/gladiatx0r/Powerless)
- [Powersploit](https://github.com/PowerShellMafia/PowerSploit)
- [Privesccheck](https://github.com/itm4n/PrivescCheck)
- [PEASS-ng](https://github.com/carlospolop/PEASS-ng)
- [peh](https://github.com/melnicek/peh)



### Forensics

- [AudioStego](https://github.com/danielcardeenas/AudioStego)
- [autoVolatility](https://github.com/carlospolop/autoVolatility)
- [binwalk](https://github.com/ReFirmLabs/binwalk)
- [depix](https://github.com/beurtschipper/Depix)
- [exiftool](https://github.com/exiftool/exiftool)
- [foremost](http://foremost.sourceforge.net/)
- [peepdf](https://github.com/jesparza/peepdf)
- [ssh_decoder](https://github.com/jjyg/ssh_decoder)
- [stegsolve](https://github.com/eugenekolo/sec-tools/tree/master/stego/stegsolve/stegsolve)



### Mobile

- [Apktool](https://github.com/iBotPeaches/Apktool)
- [apkleaks](https://github.com/dwisiswant0/apkleaks)



### OSINT

- [gitgraber](https://github.com/hisxo/gitGraber)
- [sherlock](https://github.com/sherlock-project/sherlock)
- [cardpwn](https://github.com/itsmehacker/CardPwn)
- [h8mail](https://github.com/khast3x/h8mail)
- [gitjacker](https://github.com/liamg/gitjacker)
- [SocialintFramework](https://github.com/Pyshios/SocialintFramework)
- [shodansploit](https://github.com/shodansploit/shodansploit)
- [scavenger](https://github.com/rndinfosecguy/Scavenger)



### Reversing and Binary Exploit

- [fuzza](https://github.com/cytopia/fuzza)
- [jd-gui](https://github.com/java-decompiler/jd-gui)
- [OverflowHelper](https://github.com/rhuss623/OverflowHelper)
- [peframe](https://github.com/guelfoweb/peframe)
- [ropstar](https://github.com/xct/ropstar)



### Scanning and Recon

- [AutoRecon](https://github.com/Tib3rius/AutoRecon)
- [sn1per](https://github.com/1N3/Sn1per)

