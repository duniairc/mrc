Dialog DaL {
  size -1 -1 280 380
  Title " InFo Ctcp Dcc "
  icon icons\info3.ico
  edit "", 1, 101 5 165 23
  Text "", 107, 20 10 60 15
  box "", 110, 10 0 80 30
  Box "info:", 100, 10 35 80 174
  Box "Ctcp:", 101, 100 35 80 294
  Box "ignore:", 102, 190 35 80 84
  Box "Notify:", 103, 190 125 80 84
  Box "Chat:", 104, 10 215 80 114
  Box "DCC:", 111, 190 215 80 114
  Button "&Whois", 2, 15 55 70 25
  Button "&Who Was", 3, 15 85 70 25
  Button "&UCentral", 4, 15 115 70 25
  Button "&Nick info", 5, 15 145 70 25
  Button "&ip Number", 6, 15 175 70 25
  Button "&PinG", 7, 105 55 70 25
  Button "&Finger", 8, 105 85 70 25
  Button "&Version", 9, 105 115 70 25
  Button "&Userinfo", 10, 105 145 70 25
  Button "&Clientinfo", 11, 105 175 70 25
  Button "&Echo", 12, 105 205 70 25
  Button "&Page", 13, 105 235 70 25
  Button "&Generic", 14, 105 265 70 25
  Button "&Chat", 15, 105 295 70 25
  Button "&Add", 16, 195 55 70 25
  Button "&Delet", 17, 195 85 70 25
  Button "&Add", 18, 195 145 70 25
  Button "&Delet", 19, 195 175 70 25
  Button "&Send", 121, 195 235 70 25
  Button "&Dccallow +", 123, 195 265 70 25
  Button "&Dccallow -", 124, 195 295 70 25
  Button "&Send Msg", 20, 15 235 70 25
  Button "&Notice", 21, 15 265 70 25
  Button "&Query", 22, 15 295 70 25,ok
  box "" 112, 100 330 80 44
  Button "&Close", 125, 105 342 70 25,cancel
  icon 126, 35 335 70 70 , icons\about.ico
  icon 127, 210 335 70 70 , icons\about.ico
}
On *:DIALOG:DaL:*:* {
  if ($devent == init) { 
    did -a $dname 1 %DaL
    if $did(1) == $null { did -a $dname 107 Enter Nick: }
    else { did -a $dname 107 Nick is: }
  }
  if ($devent == edit) && ($did == 1) { did -a $dname 107 Nick is: | if ($did(1) == $null) { did -a $dname 107 Enter Nick: }
  }
  if ($devent == sclick) && ($did == 126) { /help ctcp events }
  if ($devent == sclick) && ($did == 127) { /help dcc }
  if ($devent == sclick) { 
    if ($did == 2 ) { set %DaL $did(1) | /whois %DaL }
    if ($did == 3 ) { set %DaL $did(1) | /whowas %DaL }
    if ($did == 4 ) { set %DaL $did(1) | /uwho %DaL }
    if ($did == 5 ) { set %DaL $did(1) | /ns info %DaL }
    if ($did == 6 ) { set %DaL $did(1) | /dns %DaL }
    if ($did == 7 ) { set %DaL $did(1) | /ctcp %DaL PinG }
    if ($did == 8 ) { set %DaL $did(1) | /ctcp %DaL finger }
    if ($did == 9 ) { set %DaL $did(1) | /ctcp %DaL version }
    if ($did == 10 ) { set %DaL $did(1) | /ctcp %DaL userinfo }
    if ($did == 11 ) { set %DaL $did(1) | /ctcp %DaL clientinfo }
    if ($did == 12 ) { set %DaL $did(1) | /ctcp %DaL echo $?="What to echo?" }
    if ($did == 13 ) { set %DaL $did(1) | /ctcp %DaL page $$?="What To Page" }
    if ($did == 14 ) { set %DaL $did(1) | /ctcp %DaL $? }
    if ($did == 15 ) { set %DaL $did(1) | /dcc chat %DaL }
    if ($did == 16 ) { set %DaL $did(1) | /ignore %DaL }
    if ($did == 17 ) { set %DaL $did(1) | /ignore -r %DaL }
    if ($did == 18 ) { set %DaL $did(1) | /notify %DaL }
    if ($did == 19 ) { set %DaL $did(1) | /notify -r %DaL }
    if ($did == 20 ) { set %DaL $did(1) | /msg %DaL $? }
    if ($did == 21 ) { set %DaL $did(1) | /notice %DaL $? }
    if ($did == 22 ) { set %DaL $did(1) | /query %DaL }
    if ($did == 121 ) { set %DaL $did(1) | /dcc send %DaL $$file="DCC Send to %DaL "$mircdir }
    if ($did == 123 ) { set %DaL $did(1) | /dccallow + $+ %DaL }
    if ($did == 124 ) { set %DaL $did(1) | /dccallow - $+ %DaL }
    if ($did == 125 ) { unset %DaL }
  }
}
