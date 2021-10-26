#!/usr/bin/env bash

### Colors ##
ESC=$(printf '\033') RESET="${ESC}[0m" BLACK="${ESC}[30m" RED="${ESC}[31m"
GREEN="${ESC}[32m" YELLOW="${ESC}[33m" BLUE="${ESC}[34m" MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m" WHITE="${ESC}[37m" DEFAULT="${ESC}[39m"

### Spacing ##
BIGGAP="\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
CALLBIGGAP=echo -e $BIGGAP


### Color Functions ##

greenprint() { printf "${GREEN}%s${RESET}\n" "$1"; }
blueprint() { printf "${BLUE}%s${RESET}\n" "$1"; }
redprint() { printf "${RED}%s${RESET}\n" "$1"; }
yellowprint() { printf "${YELLOW}%s${RESET}\n" "$1"; }
magentaprint() { printf "${MAGENTA}%s${RESET}\n" "$1"; }
cyanprint() { printf "${CYAN}%s${RESET}\n" "$1"; }
fn_goodafternoon() { echo; echo "Good afternoon."; }
fn_goodmorning() { echo; echo "Good morning."; }
fn_bye() { echo "Bye bye."; exit 0; }
fn_fail() { echo "Wrong option." exit 1; }

portaineroptions() {
    echo -ne "
$(yellowprint 'Portainer Options')
$(greenprint '1)') Start Portainer
$(greenprint '2)') Stop Portainer
$(blueprint '3)') Go Back to Docker Containers Menu
$(magentaprint '4)') Go Back to MAIN MENU
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        $CALLBIGGAP && sudo docker container start portainer &1>/dev/null && echo "Portainer should now be available on localhost:9000"
        
        ;;
    2)
        $CALLBIGGAP && sudo docker container stop portainer &1>/dev/null && echo "Portainer has been shut down"
        
        ;;
    3)
        dockercontainerssubmenu
        ;;
    4)
        mainmenu
        ;;
    0)
        fn_bye
        ;;
    *)
        fn_fail
        ;;
    esac
}

mhaoptions() {
    echo -ne "
$(yellowprint 'MHA Options')
$(greenprint '1)') Start MHA
$(greenprint '2)') Stop MHA
$(blueprint '3)') Go Back to Docker Containers Menu
$(magentaprint '4)') Go Back to MAIN MENU
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        sudo docker container start mail-header-analyzer &1>/dev/null && $CALLBIGGAP && echo "Mail Header Analyzer should now be available on localhost:8080"
        mhaoptions
        ;;
    2)
        sudo docker container stop mail-header-analyzer &1>/dev/null && $CALLBIGGAP && echo "Mail Header Analyzer has been shut down"
        mhaoptions
        ;;
    3)
        dockercontainerssubmenu
        ;;
    4)
        mainmenu
        ;;
    0)
        fn_bye
        ;;
    *)
        fn_fail
        ;;
    esac
}

autosploitoptions() {
    echo -ne "
$(yellowprint 'AutoSploit Options')
$(greenprint '1)') Start AutoSploit
$(greenprint '2)') Stop AutoSploit
$(blueprint '3)') Go Back to Docker Containers Menu
$(magentaprint '4)') Go Back to MAIN MENU
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        sudo docker container start autosploit &1>/dev/null && $CALLBIGGAP && echo "AutoSploit should now be available on http://localhost:2000 and https://localhost:2001"
        autosploitoptions
        ;;
    2)
        sudo docker container stop autosploit &1>/dev/null && $CALLBIGGAP && echo "AutoSploit has been shut down"
        autosploitoptions
        ;;
    3)
        dockercontainerssubmenu
        ;;
    4)
        mainmenu
        ;;
    0)
        fn_bye
        ;;
    *)
        fn_fail
        ;;
    esac
}

nosqlmapoptions() {
    echo -ne "
$(yellowprint 'NoSQLMap Options')
$(greenprint '1)') Start NoSQLMap
$(blueprint '2)') Go Back to Docker Containers Menu
$(magentaprint '3)') Go Back to MAIN MENU
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        sudo docker-compose run ~/apps/exploit/NoSQLMap/nosqlmap
        nosqlmapoptions
        ;;
    2)
        dockercontainerssubmenu
        ;;
    3)
        mainmenu
        ;;
    0)
        fn_bye
        ;;
    *)
        fn_fail
        ;;
    esac
}

stegotoolkitoptions() {
    echo -ne "
$(yellowprint 'Stego-Toolkit Options')
$(greenprint '1)') Start Stego-Toolkit
$(blueprint '2)') Go Back to Docker Containers Menu
$(magentaprint '3)') Go Back to MAIN MENU
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)  
        $CALLBIGGAP 
        echo ""
            echo ""
            echo "To analyse file, place it in ~/apps/forensics/stego-toolkit/data"
            echo ""
            echo "Starting stego-toolkit"
            echo "Type exit to quit"
            sudo docker run -it --rm -v ~/apps/forensics/stego-toolkit/data:/data dominicbreuker/stego-toolkit /bin/bash
        stegotoolkitoptions
        ;;
    2)
        dockercontainerssubmenu
        ;;
    3)
        mainmenu
        ;;
    0)
        fn_bye
        ;;
    *)
        fn_fail
        ;;
    esac
}

juiceshopoptions() {
    echo -ne "
$(yellowprint 'Juiceshop Options')
$(greenprint '1)') Start Juiceshop
$(greenprint '2)') Stop Juiceshop
$(blueprint '3)') Go Back to Docker Containers Menu
$(magentaprint '4)') Go Back to MAIN MENU
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        sudo docker container start juiceshop &1>/dev/null && $CALLBIGGAP && echo "Juiceshop should now be available on localhost:3000"
        juiceshopoptions
        ;;
    2)
        sudo docker container stop juiceshop &1>/dev/null && $CALLBIGGAP && echo "Juiceshop has been shut down"
        juiceshopoptions
        ;;
    3)
        dockercontainerssubmenu
        ;;
    4)
        mainmenu
        ;;
    0)
        fn_bye
        ;;
    *)
        fn_fail
        ;;
    esac
}


spiderfootoptions() {
    echo -ne "
$(yellowprint 'Spiderfoot Options')
$(greenprint '1)') Start Spiderfoot
$(greenprint '2)') Stop Spiderfoot
$(blueprint '3)') Go Back to Docker Containers Menu
$(magentaprint '4)') Go Back to MAIN MENU
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        sudo docker container start spiderfoot &1>/dev/null && $CALLBIGGAP && echo "spiderfoot should now be available on localhost:5009"
        spiderfootoptions
        ;;
    2)
        sudo docker container stop spiderfoot &1>/dev/null && $CALLBIGGAP && echo "Spiderfoot has been shut down"
        spiderfootoptions
        ;;
    3)
        dockercontainerssubmenu
        ;;
    4)
        mainmenu
        ;;
    0)
        fn_bye
        ;;
    *)
        fn_fail
        ;;
    esac
}

dockercontainerssubmenu() {
    echo -ne "
$(blueprint 'Docker Containers')
$(greenprint '1)') Portainer
$(greenprint '2)') Mail Header Analyzer
$(greenprint '3)') AutoSploit
$(greenprint '4)') NoSQLMap
$(greenprint '5)') Stego Toolkit
$(greenprint '6)') JuiceShop
$(greenprint '7)') Spiderfoot
$(magentaprint '2)') Go Back to Main Menu
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        
        portaineroptions
        ;;
    2)
        
        mhaoptions
        ;;
    2)
        
        autosploitoptions
        ;;
    2)
        
        nosqlmapoptions
        ;;
    2)
        
        stegotoolkitoptions
        ;;
    2)
        
        juiceshopoptions
        ;;
    2)
        
        spiderfootoptions
        ;;

    0)
        fn_bye
        ;;
    *)
        fn_fail
        ;;
    esac
}

toolsubmenu() {
    echo -ne "
$(blueprint 'Docker Containers')
$(greenprint '1)') Show Blueteam tools
$(greenprint '2)') Show Crypto and Cracking tools
$(greenprint '3)') Show Exploit tools
$(greenprint '4)') Show Post-Exploit tools
$(greenprint '5)') Show Forensics tools
$(greenprint '6)') Show Mobile tools
$(greenprint '7)') Show OSint tools
$(greenprint '8)') Show Reversing and Binary Exploit tools
$(greenprint '9)') Show Scannin and Recon tools
$(magentaprint '10)') Go Back to Main Menu
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        clear
        echo "These apps can be run from the terminal as they are shown below and can be run from any location"
        echo "

========
Blueteam
========
- E-Mail Header Analyzer (docker)                                                      [https://github.com/cyberdefenders/email-header-analyzer]
"
        toolsubmenu
        ;;
    2)
       clear
        echo "These apps can be run from the terminal as they are shown below and can be run from any location"
        echo "
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
"
        toolsubmenu
        ;;
    3)
       clear
        echo "These apps can be run from the terminal as they are shown below and can be run from any location"
        echo "
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
"
        toolsubmenu
        ;;
    4)
        clear
        echo "These apps can be run from the terminal as they are shown below and can be run from any location"
        echo "
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
"
        toolsubmenu
        ;;
    5)
        clear
        echo "These apps can be run from the terminal as they are shown below and can be run from any location"
        echo "
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
"
        toolsubmenu
        ;;
    6)
        clear
        echo "These apps can be run from the terminal as they are shown below and can be run from any location"
        echo "
=======
Mobile
=======
- apktool                                                                             [https://github.com/iBotPeaches/Apktool]
- apkleaks                                                                            [https://github.com/dwisiswant0/apkleaks]
=======
=======
"
        toolsubmenu
        ;;
    7)
        clear
        echo "These apps can be run from the terminal as they are shown below and can be run from any location"
        echo "
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
"
        toolsubmenu
        ;;
    8)
        clear
        echo "These apps can be run from the terminal as they are shown below and can be run from any location"
        echo "
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
"
        toolsubmenu
        ;;
    9)
        clear
        echo "These apps can be run from the terminal as they are shown below and can be run from any location"
        echo "
=======
Scanning and Recon
=======
- shodansploit                                                                       [https://github.com/shodansploit/shodansploit]
- sn1per                                                                             [https://github.com/1N3/Sn1per]
=======
=======
"
        toolsubmenu
        ;;
    10)
        mainmenu
        ;;
    0)
        fn_bye
        ;;
    *)
        fn_fail
        ;;
    esac
}

mainmenu() {
    echo -ne "
$(magentaprint 'MAIN MENU')
$(greenprint '1)') Print List of Tools
$(greenprint '2)') Docker Containers
$(greenprint '3)') Update All CTFtoolkit Apps
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        toolsubmenu
        mainmenu
        ;;
    2)
        dockercontainerssubmenu
        mainmenu
        ;; 
    3)
        echo "Not Yet Implemented"
        mainmenu
        ;;   
    0)
        fn_bye
        ;;
    *)
        fn_fail
        ;;
    esac
}

mainmenu
