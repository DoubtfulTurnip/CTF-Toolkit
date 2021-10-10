#!/bin/bash
PS3='Choose your poison: '
apps=("Start MHA Docker" "Stop MHA Docker" "Start Autosploit Docker" "Stop Autosploit Docker" "Start NoSQLMap Docker" "Start stego-toolkit Docker" "Start Juiceshop Docker" "Stop Juiceshop Docker" "Start Spiderfoot Docker" "Stop Spiderfoot Docker" "Update All Apps" "Print List of Tools" "Quit")
select fav in "${apps[@]}"; do
    case $fav in
        "Start MHA Docker")
            echo "Start the Mail Header Analyzer Server"
	    /home/kali/apps/blueteam/email-header-analyzer/mhastart.sh
            ;;
        "Stop MHA Docker")
            echo "Stop the Mail Header Analyzer Server"
	    /home/kali/apps/blueteam/email-header-analyzer/mhastop.sh
            ;;
        "Start Autosploit Docker")
            echo "Start Autosploit"
	    /home/kali/apps/exploit/AutoSploit/Docker/startautosploit.sh
	    break
            ;;
        "Stop Autosploit Docker")
            echo "Stop Autosploit"
	    /home/kali/apps/exploit/AutoSploit/Docker/stopautosploit.sh
	    break
            ;;            
         "Start NoSQLMap Docker")
            echo "Start NoSQLMap"
	    /home/kali/apps/exploit/NoSQLMap/startnosqlmap.sh
	    break
            ;;
         "Start stego-toolkit Docker")
            echo ""
            echo ""
            echo "To analyse file, place it in ~/apps/forensics/stego-toolkit/data"
            echo ""
            echo "Starting stego-toolkit"
            echo "Type exit to quit"
            sudo docker run -it --rm -v $pwd/data/:/data dominicbreuker/stego-toolkit /bin/bash
            break
            ;;
         "Start Juiceshop Docker")
            echo ""
            echo ""
	    /home/kali/Juiceshop/start-juiceshop
	    break
            ;;
         "Stop Juiceshop Docker")
            echo ""
            echo ""
	    /home/kali/Juiceshop/stop-juiceshop
	    break
            ;;
         "Start Spiderfoot Docker")
            echo ""
            echo ""
	    /home/kali/apps/osint/spiderfoot/startspiderfoot
	    break
            ;;        
         "Stop Spiderfoot Docker")
            echo ""
            echo ""
	    /home/kali/apps/osint/spiderfoot/stopspiderfoot
	    break
            ;;
	 "Update All Apps")
	    echo ""
            echo ""
            ~/apps/./AppUpdater.zsh
 	    break
	    ;;
         "Print List of Tools")
            echo ""
            echo ""
            echo "These apps can be run from the terminal as they are shown below and can be run from any location"
            echo "
========
Crypto and Cracking
========
- bopscrk               [https://github.com/R3nt0n/bopscrk]
- cewl                  [https://github.com/digininja/CeWL]
- crunch                [https://sourceforge.net/projects/crunch-wordlist/]
- cupp                  [https://github.com/Mebus/cupp]
- duplicut              [https://github.com/nil0x42/duplicut]
- haiti                 [https://github.com/Orange-Cyberdefense/haiti]
- hashcat               [https://github.com/hashcat/hashcat]
- hash-identifier       [https://github.com/blackploit/hash-identifier]
- hashpump              [https://github.com/bwall/HashPump]
- hate_crack            [https://github.com/trustedsec/hate_crack]
- hydra                 [https://github.com/vanhauser-thc/thc-hydra]
- jwt-cracker           [https://github.com/lmammino/jwt-cracker]
- john                  [https://www.openwall.com/john/]
- nomorexor             [https://github.com/hiddenillusion/NoMoreXOR]
- pnwgen                [https://github.com/toxydose/pnwgen]
- rsactftool            [https://github.com/Ganapati/RsaCtfTool]
- rsatool               [https://github.com/ius/rsatool]
- search-that-hash      [https://github.com/HashPals/Search-That-Hash]
- ttpassgen             [https://github.com/tp7309/TTPassGen]
- twofi                 [https://github.com/digininja/twofi]
- wordlistctl           [https://github.com/BlackArch/wordlistctl]
- x0r                   [https://github.com/X-Vector/X0R]
- xor-decrypt           [https://github.com/AlexFSmirnov/xor-decrypt]
- zydra                 [https://github.com/hamedA2/Zydra]
=======
=======



=======
Exploit
=======
- chimera               [https://github.com/tokyoneon/chimera]
- dkmc                  [https://github.com/Mr-Un1k0d3r/DKMC]     
- evil-winrm            [https://github.com/Hackplayers/evil-winrm]
- fireelf               [https://github.com/rek7/fireELF]
- pwncat                [https://github.com/cytopia/pwncat]
- routersploit          [https://github.com/threat9/routersploit]
- seth                  [https://github.com/SySS-Research/Seth]
- sqlmap                [https://github.com/sqlmapproject/sqlmap]
- veil                  [https://github.com/Veil-Framework/Veil]
- wildpwn               [https://github.com/localh0t/wildpwn]
- xexee                 [https://github.com/persianhydra/Xeexe-TopAntivirusEvasion]
- owt                   [https://github.com/clu3bot/OWT]
- xsstrike              [https://github.com/s0md3v/XSStrike]
=======
=======



=======
Post-Exploit - NOTE: Several of these are designed to be run on the target system
=======
- bloodhound
- girsh                                               [https://github.com/nodauf/Girsh]
- enum4linux                                          [https://github.com/cddmp/enum4linux-ng]
- linux-exploit-suggester-2                           [https://github.com/jondonas/linux-exploit-suggester-2]
- linenum                                             [https://github.com/rebootuser/LinEnum]
- linenumdir (jump to directory)                      [https://github.com/rebootuser/LinEnum]
- powerlessdir (jump to directory)                    [https://github.com/gladiatx0r/Powerless]
- powersploit (will output directory structure)       [https://github.com/PowerShellMafia/PowerSploit]
- privesccheckdir (jump to directory)                 [https://github.com/itm4n/PrivescCheck]
- linPEASdir (jump to directory)                      [https://github.com/carlospolop/PEASS-ng]
- winPEASdir (jump to directory)                      [https://github.com/carlospolop/PEASS-ng]
- peh                                                 [https://github.com/melnicek/peh]
=======
=======



=======
Forensics
=======
- audiostego               [https://github.com/danielcardeenas/AudioStego]
- autovolatility           [https://github.com/carlospolop/autoVolatility]
- binwalk                  [https://github.com/ReFirmLabs/binwalk]
- depix                    [https://github.com/beurtschipper/Depix]
- exiftool                 [https://github.com/exiftool/exiftool]
- foremost                 [http://foremost.sourceforge.net/]
- peepdf                   [https://github.com/jesparza/peepdf]
- ssh_decoder              [https://github.com/jjyg/ssh_decoder]
- stegsolve                [https://github.com/eugenekolo/sec-tools/tree/master/stego/stegsolve/stegsolve]
=======
=======



=======
Mobile
=======
- apktool               [https://github.com/iBotPeaches/Apktool]
- apkleaks              [https://github.com/dwisiswant0/apkleaks]
=======
=======



=======
OSINT
=======
- gitgraberdir (jump to directory)              [https://github.com/hisxo/gitGraber]
- sherlock                                      [https://github.com/sherlock-project/sherlock]
- cardpwn                                       [https://github.com/itsmehacker/CardPwn]
- h8mail                                        [https://github.com/khast3x/h8mail]
- gitjacker                                     [https://github.com/liamg/gitjacker]
- sif (Social Int Framework)                    [https://github.com/Pyshios/SocialintFramework]                                
- shodansploit                                  [https://github.com/shodansploit/shodansploit]
- scavenger                                     [https://github.com/rndinfosecguy/Scavenger]
=======
=======



=======
Reversing and Binary Exploit
=======
- fuzza                 [https://github.com/cytopia/fuzza]
- jd-gui                [https://github.com/java-decompiler/jd-gui]
- overflowhelper        [https://github.com/rhuss623/OverflowHelper]
- peframe               [https://github.com/guelfoweb/peframe]
- ropstar               [https://github.com/xct/ropstar]
=======
=======



=======
Scanning and Recon
=======
- shodansploit       [https://github.com/shodansploit/shodansploit]
- sn1per             [https://github.com/1N3/Sn1per]
=======
=======



"	
    	    break
            ;;   
         "Quit")
	    echo "User requested exit"
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done
