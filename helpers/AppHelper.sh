#!/bin/bash
PS3='Choose your poison: '
apps=("Start Portainer" "Start MHA Docker" "Stop MHA Docker" "Start Autosploit Docker" "Stop Autosploit Docker" "Start NoSQLMap Docker" "Start stego-toolkit Docker" "Start Juiceshop Docker" "Stop Juiceshop Docker" "Start Spiderfoot Docker" "Stop Spiderfoot Docker" "Update All Apps" "Print List of Tools" "Quit")
select fav in "${apps[@]}"; do
    case $fav in
        "Start Portainer")
            echo "Start Portainer"
	    sudo docker container start portainer && echo "Portainer should now be available on localhost:9000"   
       break
            ;;
        "Stop Portainer")
            echo "Start Portainer"
	    sudo docker container stop portainer && echo "Portainer has been shut down"
       break
            ;;
        "Start MHA Docker")
            echo "Start the Mail Header Analyzer Server"
	    sudo docker container start mail-header-analyzer && echo "Mail Header Analyzer should now be available on localhost:8080"
       break
            ;;
        "Stop MHA Docker")
            echo "Stop the Mail Header Analyzer Server"
	   sudo docker container stop mail-header-analyzer && echo "Mail Header Analyzer has been shut down"
      break
            ;;
        "Start Autosploit Docker")
            echo "Start Autosploit"
	    sudo docker container start autosploit && echo "AutoSploit should now be available on http://localhost:2000 and https://localhost:2001"
	    break
            ;;
        "Stop Autosploit Docker")
            echo "Stop Autosploit"
	    sudo docker container stop autosploit && echo "AutoSploit has been shut down"
	    break
            ;;            
         "Start NoSQLMap Docker")
            echo "Start NoSQLMap"
	    sudo docker-compose run ~/apps/exploit/NoSQLMap/nosqlmap
	    break
            ;;
         "Start stego-toolkit Docker")
            echo ""
            echo ""
            echo "To analyse file, place it in ~/apps/forensics/stego-toolkit/data"
            echo ""
            echo "Starting stego-toolkit"
            echo "Type exit to quit"
            sudo docker run -it --rm -v ~/apps/forensics/stego-toolkit/data:/data dominicbreuker/stego-toolkit /bin/bash
            break
            ;;
         "Start Juiceshop Docker")
            echo ""
            echo ""
	    sudo docker container start juiceshop && echo "Juiceshop should now be available on localhost:3000"
	    break
            ;;
         "Stop Juiceshop Docker")
            echo ""
            echo ""
	     sudo docker container stop juiceshop && echo "Juiceshop has been shut down"
	    break
            ;;
         "Start Spiderfoot Docker")
            echo ""
            echo ""
	    sudo docker container start spiderfoot && echo "spiderfoot should now be available on localhost:5009"
	    break
            ;;        
         "Stop Spiderfoot Docker")
            echo ""
            echo ""
	    sudo docker container stop spiderfoot && echo "Spiderfoot has been shut down"
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
Blueteam
========
- E-Mail Header Analyzer (docker)                                                      [https://github.com/cyberdefenders/email-header-analyzer]



========
Crypto and Cracking
========
- bopscrk                                                                              [https://github.com/R3nt0n/bopscrk]
- cewl                                                                                 [https://github.com/digininja/CeWL]
- crunch                                                                               [https://sourceforge.net/projects/crunch-wordlist/]
- cupp                                                                                 [https://github.com/Mebus/cupp]
- duplicut                                                                             [https://github.com/nil0x42/duplicut]
- haiti                                                                                [https://github.com/Orange-Cyberdefense/haiti]
- hashcat                                                                              [https://github.com/hashcat/hashcat]
- hash-identifier                                                                      [https://github.com/blackploit/hash-identifier]
- hashpump                                                                             [https://github.com/bwall/HashPump]
- hate_crack                                                                           [https://github.com/trustedsec/hate_crack]
- hydra                                                                                [https://github.com/vanhauser-thc/thc-hydra]
- jwt-cracker                                                                          [https://github.com/lmammino/jwt-cracker]
- john                                                                                 [https://www.openwall.com/john/]
- pnwgen                                                                               [https://github.com/toxydose/pnwgen]
- rsactftool                                                                           [https://github.com/Ganapati/RsaCtfTool]
- rsatool                                                                              [https://github.com/ius/rsatool]
- search-that-hash                                                                     [https://github.com/HashPals/Search-That-Hash]
- ttpassgen                                                                            [https://github.com/tp7309/TTPassGen]
- twofi                                                                                [https://github.com/digininja/twofi]
- wordlistctl                                                                          [https://github.com/BlackArch/wordlistctl]
- x0r                                                                                  [https://github.com/X-Vector/X0R]
- xor-decrypt                                                                          [https://github.com/AlexFSmirnov/xor-decrypt]
- zydra                                                                                [https://github.com/hamedA2/Zydra]
=======
=======



=======
Exploit
=======
- AutoSploit (docker)                                                                  [https://github.com/NullArray/AutoSploit]                                                                         
- chimera                                                                              [https://github.com/tokyoneon/chimera]
- dkmc                                                                                 [https://github.com/Mr-Un1k0d3r/DKMC]     
- evil-winrm                                                                           [https://github.com/Hackplayers/evil-winrm]
- fireelf                                                                              [https://github.com/rek7/fireELF]
- pwncat                                                                               [https://github.com/cytopia/pwncat]
- routersploit                                                                         [https://github.com/threat9/routersploit]
- seth                                                                                 [https://github.com/SySS-Research/Seth]
- sqlmap                                                                               [https://github.com/sqlmapproject/sqlmap]
- veil                                                                                 [https://github.com/Veil-Framework/Veil]
- wildpwn                                                                              [https://github.com/localh0t/wildpwn]
- xeexe                                                                                [https://github.com/persianhydra/Xeexe-TopAntivirusEvasion]
- owt                                                                                  [https://github.com/clu3bot/OWT]
- xsstrike                                                                             [https://github.com/s0md3v/XSStrike]
=======
=======



=======
Post-Exploit - NOTE: Several of these are designed to be run on the target system
=======
- bloodhound
- girsh                                                                               [https://github.com/nodauf/Girsh]
- enum4linux                                                                          [https://github.com/cddmp/enum4linux-ng]
- linux-exploit-suggester-2                                                           [https://github.com/jondonas/linux-exploit-suggester-2]
- linenum                                                                             [https://github.com/rebootuser/LinEnum]
- linenumdir (jump to directory)                                                      [https://github.com/rebootuser/LinEnum]
- powerlessdir (jump to directory)                                                    [https://github.com/gladiatx0r/Powerless]
- powersploit (will output directory structure)                                       [https://github.com/PowerShellMafia/PowerSploit]
- privesccheckdir (jump to directory)                                                 [https://github.com/itm4n/PrivescCheck]
- linPEASdir (jump to directory)                                                      [https://github.com/carlospolop/PEASS-ng]
- winPEASdir (jump to directory)                                                      [https://github.com/carlospolop/PEASS-ng]
- peh                                                                                 [https://github.com/melnicek/peh]
=======
=======



=======
Forensics
=======
- audiostego                                                                          [https://github.com/danielcardeenas/AudioStego]
- autovolatility                                                                      [https://github.com/carlospolop/autoVolatility]
- binwalk                                                                             [https://github.com/ReFirmLabs/binwalk]
- depix                                                                               [https://github.com/beurtschipper/Depix]
- exiftool                                                                            [https://github.com/exiftool/exiftool]
- foremost                                                                            [http://foremost.sourceforge.net/]
- peepdf                                                                              [https://github.com/jesparza/peepdf]
- ssh_decoder                                                                         [https://github.com/jjyg/ssh_decoder]
- stegsolve                                                                           [https://github.com/eugenekolo/sec-tools/tree/master/stego/stegsolve/stegsolve]
=======
=======



=======
Mobile
=======
- apktool                                                                             [https://github.com/iBotPeaches/Apktool]
- apkleaks                                                                            [https://github.com/dwisiswant0/apkleaks]
=======
=======



=======
OSINT
=======
- gitgraberdir (jump to directory)                                                    [https://github.com/hisxo/gitGraber]
- sherlock                                                                            [https://github.com/sherlock-project/sherlock]
- cardpwn                                                                             [https://github.com/itsmehacker/CardPwn]
- h8mail                                                                              [https://github.com/khast3x/h8mail]
- gitjacker                                                                           [https://github.com/liamg/gitjacker]
- sif (Social Int Framework)                                                          [https://github.com/Pyshios/SocialintFramework]                                
- shodansploit                                                                        [https://github.com/shodansploit/shodansploit]
- scavenger                                                                           [https://github.com/rndinfosecguy/Scavenger]
- spiderfoot (docker)
=======
=======



=======
Reversing and Binary Exploit
=======
- fuzza                                                                               [https://github.com/cytopia/fuzza]
- jd-gui                                                                              [https://github.com/java-decompiler/jd-gui]
- overflowhelper                                                                      [https://github.com/rhuss623/OverflowHelper]
- peframe                                                                             [https://github.com/guelfoweb/peframe]
- ropstar                                                                             [https://github.com/xct/ropstar]
=======
=======



=======
Scanning and Recon
=======
- shodansploit                                                                       [https://github.com/shodansploit/shodansploit]
- sn1per                                                                             [https://github.com/1N3/Sn1per]
=======
=======



=======
Misc
=======
- Portainer (docker)                                                                  [https://www.portainer.io/]
- Juiceshop (docker)                                                                  [https://github.com/juice-shop/juice-shop]
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
