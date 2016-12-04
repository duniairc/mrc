;========
; whois
;========
on *:dialog:whois:init:*:{
  dialog -t Whois Who Is
  did $iif($countcs($usermode,o,O,C,A,a,N),-ev,-bh) $dname 13,14,27,36,37,38
}
dialog -l Whois {
  size -1 -1 295 130
  option dbu
  text "Nick", 1, 5 6 25 8
  combo 2, 30 5 100 10, drop
  text "Address", 3, 5 16 25 8
  edit "", 4, 30 15 150 10
  text "Name", 5, 5 26 25 8
  edit "", 6, 30 25 150 10
  text "Modes", 7, 5 36 25 8
  edit "", 8, 30 35 100 10
  text "IP", 9, 5 46 25 8
  edit "", 10, 30 45 50 10
  text "Away", 15, 5 106 25 8
  edit "", 16, 30 105 150 21, multi
  edit "", 17, 132 75 50 10, center
  text "Registered", 11, 5 86 30 8, center
  text "Server", 12, 5 76 25 8
  edit "", 18, 30 75 100 10
  text "", 19, 5 95 90 8
  text "Help", 20, 35 86 30 8, center
  text "Secure", 21, 65 86 30 8, center
  text "Sign In", 22, 5 66 25 8
  text "Sign Out", 29, 5 66 25 8
  edit "", 23, 30 65 80 10
  text "Idle", 24, 132 67 50 8, center
  button "Exit", 25, 135 2 37 12, default ok
  text "Not found in /whois or /whowas listings", 26, 30 15 150 10, center
  edit "", 28, 132 85 50 10, center
  list 30, 190 79 100 50, size check
  text "0 Common out of 0 Channels", 31, 190 71 100 8, center
  text "0 Clones detected", 32, 190 5 100 8, center
  list 33, 190 13 100 55, size
  text "DNS", 34, 5 56 25 8
  edit "", 35, 30 55 100 10
  radio "Kill", 13, 135 35 22 8, group
  radio "K-Line", 14, 160 35 25 8
  radio "Z-Line", 27, 160 43 25 8
  radio "G-Line", 36, 135 51 25 8
  radio "Shun", 37, 135 43 22 8
  radio "GZ-Line", 38, 160 51 28 8
}
#whois off
raw *:*:{
  var %raw = $numeric
  if $istok(402 311 401 379 378 307 319 312 301 313 310 671 317,$event,32) {    haltdef  }
  if %raw == 402 {
    ctcp $name time
    .whois $name
  }
  if %raw == 311 {
    did -v Whois 3,5
    did -rva Whois 4 $+($3,@,$4)
    did -rva Whois 6 $6-
  }
  elseif %raw == 401 {
    .enable #whowas
    .whowas $iif($did(Whois,2).seltext,$v1,$did(Whois,2))
  }
  elseif %raw == 379 {
    did -v Whois 7
    did -rva Whois 8 $6-
  }
  elseif %raw == 378 {
    if $gettok($iif(!$7,$6,$7),1,46) isnum && $gettok($iif(!$7,$6,$7),2,46) isnum && $gettok($iif(!$7,$6,$7),3,46) isnum && $gettok($iif(!$7,$6,$7),4,46) isnum {
      did -v Whois 9
      did -rva Whois 10 $iif(!$7,$6,$7)
      dns $iif(!$7,$6,$7)
    }
  }
  elseif %raw == 307 {    did -v Whois 11   }
  elseif %raw == 319 {
    did -rv Whois 30
    didtok Whois 30 32 $3-
    var %a = 1, %b = $comchan($did(whois,2).seltext,0)
    while %a <= %b {
      did -s Whois 30 $didwm(Whois,30,$+(*,$comchan($did(whois,2).seltext,%a)))
      inc %a
    }
    did -rva Whois 31 $did(whois,30,0).csel Common out of $did(whois,30).lines Channels
  }
  elseif %raw == 312 {
    did -v Whois 12
    did -rva Whois 18 $3
  }
  elseif %raw == 301 {
    did -v Whois 15
    did -rva Whois 16 $3-
  }
  elseif %raw == 313 {    did -rva Whois 19 $strip($5-)   }
  elseif %raw == 310 {    did -v whois 20   }
  elseif %raw == 671 {    did -v whois 21   }
  elseif %raw == 317 {
    did -h Whois 29
    did -v Whois 22
    did -rva whois 23 $asctime($4,ddd mmm d yyyy @ HH:nn:ss)
    if $3 > 0 {
      did -v Whois 24
      did -rva whois 17 $idle($3)
    }
  }
  elseif (%raw == 318) {
    did -e Whois 25
    .disable #whois
    haltdef
  }
}
#whois end
on *:dns:{
  if $dialog(whois) {
    did -ra Whois 35 $iif($dns(0).addr,$v1,Unable to Resolve)
  }
}
#whowas off
raw *:*:{
  dialog -t Whois Who Was
  var %raw = $numeric
  if $istok(301 312 314 406,$event,32) {    haltdef  }
  if %raw == 314 {
    did -v Whois 3,5
    did -rva Whois 4 $+($3,@,$4)
    did -rva Whois 6 $6-
  }
  elseif %raw == 312 {
    did -h Whois 22
    did -v Whois 12,29
    did -rva Whois 18 $3
    did -rva whois 23 $asctime($ctime($4-),ddd mmm d yyyy @ HH:nn:ss)
  }
  elseif %raw == 406 {    did -v Whois 26  }
  elseif %raw == 369 {
    did -e Whois 25
    .disable #whowas
    haltdef
  }
}
#whowas end
on *:dialog:whois:sclick:2:{
  did -b whois 25
  did -r whois 4,6,8,10,30,16,17,18,28
  did -h whois 3,4,5,6,7,8,9,10,11,12,13,30,15,16,17,18,19,20,21,22,23,24,26,28,29
  if %chan {    clones %chan  }
  .enable #whois
  .whois $name $name
  if $name == $me {
    did -v $dname 7
    did -rva $dname 8 $usermode
  }
}
alias -l clones {
  var %mask = 0
  while %mask <= 9 {
    var %a = 1, %b = $nick($1,0)
    while %a <= %b {
      if ($address($name,%mask) iswm $address($nick($1,%a),5)) && ($nick($1,%a) != $name)  && !$didwm(Whois,33,$nick($1,%a)) {
        did -a Whois 33 $nick($1,%a)
      }
      inc %a
    }
    inc %mask
  }
  if $did(Whois,33).lines == 1 {
    did -ra Whois 32 1 Clone detected
  }
  else did -ra Whois 32 $did(Whois,33).lines Clones detected
}
on *:dialog:whois:*:30:{
  var %chan = $+($chr(35),$gettok($did($dname,$did).seltext,-1,35))
  if $devent == dclick {
    .join %chan
  }
  elseif $devent == sclick {
    did -rva $dname 28 $iif($me !ison %chan,N/A,$idle($nick(%chan,$name).idle))
  }
}
on *:dialog:whois:sclick:13,14,27,36,37,38:{
  if $did == 13 {
    kill $name $$?="Reason for Kill (Required)"
  }
  elseif $istok(27 38,$did,32) {
    $iif($did == 27,zline,gzline) $+(+,*@,$did(10)) $?="Time to ban" $?="Reason"
  }
  elseif $istok(14 36,$did,32) {
    $iif($did == 14,kline,gline) + $+ $name $?="Time to ban" $?="Reason"
  }
  elseif $did == 37 {
    shun + $+ $name $?="Time to shun" $?="Reason"
  }
  dialog -e $dname
}

menu nicklist {
  Who2 : {
    set %chan $iif($chan,$v1,$null)
    .who2 $iif($snick(%chan,0),$snicks,$iif($nick,$nick))
    ;    .who2 $iif(!%chan && $nick,$v2,$snicks)    
  }
}
;ALIASES SECTION
alias -l idle {
  var %idle = $duration($1)
  return $iif($numtok(%idle,32) < 4,$duration($1,3),$+($gettok(%idle,1--3,32),$chr(32),$duration($duration($gettok(%idle,-3-,32)),3)))
}
alias -l name {
  return $iif($did(Whois,2).seltext,$v1,$did(Whois,2))
}
alias who2 {
  var %nicks = $iif($1,$1-,$$?="Enter nick(s) comma or space separated")
  var %nicks = $replace(%nicks,$chr(44),$chr(32))
  dialog $iif(!$dialog(Whois),-md,-eno) Whois Whois
  did -b whois 25
  did -r whois 2,4,6,8,10,30,16,17,18,28
  did -h whois 3,4,5,6,7,8,9,10,11,12,30,15,16,17,18,19,20,21,22,23,24,26,28,29
  didtok Whois 2 32 %nicks
  did -kc Whois 2 1
  if %chan {    clones %chan  }
  .enable #whois
  .whois $name $name
  if $name == $me {
    did -v whois 7
    did -rva whois 8 $usermode
  }
} 
on *:start:{
  if $version < 6.17 {
    echo 4 -a Sorry, but this script requires mIRC 6.17 or better
    echo -a Auto-unload will now start
    .unload -rs $script
  }
}
