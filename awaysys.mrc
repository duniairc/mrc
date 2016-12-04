;User Away System v1.25
;Team Nexgen 2000 by KnightFal
;www.team-nexgen.com

on *:load:{
  if ($version < 5.61) echo -a  $+ $colour(info2) $+ *** You need mirc 5.61 or greator in order to use this addon. | beep 
  echo -a  4TEAM NEXGEN'S AWAY SYSTEM v1.25 | echo -a  4Please type: /awaysys to begin. | .load -rs $findfile($nofile($script),page.mrc,1) 
  _vw awaysys version 1.25
}
alias time.away { set %time.away1 $?="Away interval in minute(s):"  | set %time.away2 .timer22 0 $calc(%time.away1 * 60) } | echo -a 14Away Intervals will be displayed in channel(s) for %time.away1 minunte(s)
;[read write data/setting.ini]
alias _vr {
  if ($exists(data\setting.ini) == $false) { mkdir data | write -c data\setting.ini }
  return $readini data\setting.ini $1 $2 
}
alias _vw {
  if ($exists(data\setting.ini) == $false) { mkdir data | write -c data\setting.ini }
  writeini data\setting.ini $1 $2 $3-
}
alias _vrem {
  if ($exists(data\setting.ini) == $false) { mkdir data | write -c data\setting.ini }
  remini data\setting.ini $1 $2 
}
menu channel,menubar,status {
  Away / pager
  .open away system:awaysys
  .-
  .open page : page1
  .delete all messages : { .remove data/page.txt
    if ($window(@page) != $null) page1
  }
}

#away.log off
on *:NOTICE:*:?: {
  if ($_vr(away,away.log) == on) && ($me != $nick) {
    if ([ %text [ $+ [ $site ] ] ] == $null) { set %text $++ $site 1 | .timer 1 60 unset %text $++ $site }
    if ([ %text [ $+ [ $site ] ] ] == 1) { notice $nick $me IS AWAY [RECORDING ON] Hello, I'm not here right now [AWAY REASON: " $+ $vr(away,reason) $+ "] ... so please leave a brief message. Thankyou. | .timer 1 2 close -m $nick } 
    if ([ %text [ $+ [ $site ] ] ] == 2) { notice $nick $me IS AWAY [RECORDING ON] Hello, I'm not here right now [AWAY REASON: " $+ $vr(away,reason) $+ "] ... so please leave a brief message. Thankyou. | .timer 1 2 close -m $nick } 
    if ([ %text [ $+ [ $site ] ] ] == 3) { notice $nick $me IS AWAY [RECORDING ON] Hello, I'm not here right now [AWAY REASON: " $+ $vr(away,reason) $+ "] ... next message will be ignored. Thankyou. | .timer 1 2 close -m $nick } 
    if ([ %text [ $+ [ $site ] ] ] >= 4) { notice $nick $me IS AWAY [IGNORING] I said I'm not here! You are now IGNORED for 1 minute. | .ignore -pnu60 *!*@ $+ $site | .timer 1 2 close -m $nick }
    inc %text $++ $site 1 
    write -i1 data\away.txt  [NOTICE: $+ # $+ %Msgs $+ ]  ( $+ $adate $+ )( $+ $day $atime $+ ) $nick ( $+ $address $+ ) $+ : $strip($1-)
    set -q %messages YES 
    inc %msgs 1
    if ($dialog(awaysys) != $null) { did -o awaysys 30 1 %msgs }
  }
}
on *:TEXT:*:?: {
  if ($_vr(querycon,switch) == on) { _vw querycon switch off | _vw away querycon on } 
  if ($_vr(away,away.log) == on) && ($me != $nick) {
    if ([ %text [ $+ [ $site ] ] ] == $null) { set %text $++ $site 1 | .timer 1 60 unset %text $++ $site }
    if ([ %text [ $+ [ $site ] ] ] == 1) { notice $nick $me IS AWAY [RECORDING ON] Hello, I'm not here right now [AWAY REASON: " $+ $vr(away,reason) $+ "] ... so please leave a brief message. Thankyou. | .timer 1 2 close -m $nick } 
    if ([ %text [ $+ [ $site ] ] ] == 2) { notice $nick $me IS AWAY [RECORDING ON] Hello, I'm not here right now [AWAY REASON: " $+ $vr(away,reason) $+ "] ... so please leave a brief message. Thankyou. | .timer 1 2 close -m $nick } 
    if ([ %text [ $+ [ $site ] ] ] == 3) { notice $nick $me IS AWAY [RECORDING ON] Hello, I'm not here right now [AWAY REASON: " $+ $vr(away,reason) $+ "] ... next message will be ignored. Thankyou. | .timer 1 2 close -m $nick } 
    if ([ %text [ $+ [ $site ] ] ] >= 4) { notice $nick $me IS AWAY [IGNORING] I said I'm not here! You are now IGNORED for 1 minute. | .ignore -pnu60 *!*@ $+ $site | .timer 1 2 close -m $nick }
    inc %text $++ $site 1 
    write -i1 $mircdir $+ data\away.txt  [MSG: $+ # $+ %Msgs $+ ]  ( $+ $adate $+ )( $+ $day $atime $+ ) $nick ( $+ $address $+ ) $+ : $strip($1-)
    set -q %messages YES 
    inc %msgs 1
    if ($dialog(awaysys) != $null) { did -o awaysys 30 1 %msgs }
  }
}
#away.log end
alias awaysys {
  if ($dialog(awaysys) == $null) { if ($away == $true) && (%awy.i != on) { away.set } | dialog -m awaysys awaysys }
}
dialog awaysys {
  title "Away and Pager System v1.25"
  option pixels
  size -20 -20 280 320
  button "-",3,5 40 12 12
  button "+",4,20 40 12 12
  button "Close", 2, 120 285 50 20,cancel
  text "min(s)", 58, 69 39 30 15  
  edit "", 20, 35 37 30 20,autohs 
  check "Away Nick" 21, 5 60 80 20
  edit "", 22, 5 81 90 20,autohs 
  text "Away Message", 25, 6 105 200 15  
  edit "", 1, 5 120 270 20,autohs
  check "Away Logger" 26, 120 35 80 20
  button "View Log", 27, 215 40 52 15
  button "", 28, 200 245 55 25,ok default
  edit "", 30, 110 81 40 20,autohs read
  text "Msgs", 31, 110 65 50 15  
  check "Silent Away" 29, 5 145 80 25
  text "Away Style", 37, 165 65 90 15  
  combo 32, 165 80 110 100, drop
  check "Pager" 33, 5 165 50 25
  radio "Always On" 34, 185 149 80 25
  radio "On on Away" 35, 185 169 80 25
  button "Open Pager", 36, 105 156 65 15
  button "Erase Msgs", 38, 105 176 65 15
  box "Pager System", 39, 100 140 165 55
  box "", 40, 195 235 65 39
  box "Away Intervals", 23, 1 20 100 40
  box "", 41, 115 20 160 40
  edit "", 42, 5 210 130 20,autohs read
  edit "", 43, 5 190 95 20,autohs read
  button "Anti-Idle", 44, 210 104 65 15
  check "Set away on reconnect" 45, 140 205 150 25

  button "-",70,5 250 12 12
  button "+",71,20 250 12 12
  text "min(s)", 72, 69 249 30 15  
  edit "", 73, 35 247 30 20,autohs 
  box "Auto-Away on idle", 74, 1 233 177 40
  check "Auto away" 75, 105 245 70 25
}
on *:dialog:awaysys:init:*:{
  if (%anti-idle != $null) set %anti-idle [off] 
  set %msgs 0 | did -o awaysys 30 1 %msgs    
  if ($_vr(away,away.log) == $null) { _vw away away.log off | .disable #away.log } 
  if ($_vr(pager,switch) == $null) { _vw pager switch off }
  if ($_vr(away,page.on) == always) { did -c awaysys 34 1 | did -u awaysys 35 1 }
  if ($_vr(away,page.on) == away) { did -c awaysys 35 1 | did -u awaysys 34 1 }
  if ($_vr(away,defaway) == $null) || (%away.simple == $null) _vw away defaway off | _vw away away.simple on
  if ($_vr(away,defaway) == $null) { _vw away defaway off }  
  if ($away == $true) { did -o awaysys 28 1 Set Back }
  else did -o awaysys 28 1 Set Away
  if ($_vr(away,away.log) == on)  did -o awaysys 30 1 %msgs
  if (%msgs == 0)  did -o awaysys 30 1 0 
  if (%awy.style1 == $null) || (%away.simple == $null) { set %away.simple awaystyle2 | awaystyle2 }
  ;did -o awaysys 43 1 Idle
  did -o awaysys 42 1 Time Away  
  ;did -o awaysys 20 1 %time.away1
  did -o awaysys 73 1 %idle.away1
  did -o awaysys 22 1 $_vr(away,awaynick)
  if ($did(awaysys,20).text == $null) || ($did(awaysys,20).text <= 1) { set %time.away2 .timer22 0 $calc(20 * 60) | did -o awaysys 20 1 20 }
  if ($_vr(away,defaway) == on) { did -c awaysys 29 1 $_vr(away,defaway) }
  if ($_vr(away,reason) != $null) { did -o awaysys 1 1 $_vr(away,reason) }
  else _vw away reason Not currently here | did -o awaysys 1 1 $_vr(away,reason)
  if ($_vr(pager,switch) == on)  did -c awaysys 33
  if ($_vr(away,awaynick.switch) == on)  did -c awaysys 21 
  if ($_vr(away,reconnect) == on) did -c awaysys 45 
  if ($_vr(away,away.log) == on)  { did -c awaysys 26 }
  if (%time.away1 == $null) { set %time.away1 20 }
  did -a awaysys 32 Away Style | did -a awaysys 32 Plain | did -a awaysys 32 Style 1 | did -a awaysys 32 Style 2 | did -a awaysys 32 Style 3 | did -a awaysys 32 Style 4 | did -a awaysys 32 Pink Sandy | did -a awaysys 32 Floral | did -a awaysys 32 Corduroy Blue | did -a awaysys 32 Red 
  did -a awaysys 32 Cyan 
  did -a awaysys 32 Green LCD
  did -a awaysys 32 Red LCD
  did -a awaysys 32 Gray LCD
  did -a awaysys 32 Red Lego
  did -a awaysys 32 Blue Lego
  did -a awaysys 32 Green Lego
  did -a awaysys 32 Purple Lego 
  if ($_vr(away,autoaway) == on) { did -c awaysys 75 }
  if (%away.simple == on) { did -c awaysys 32 2 }
  elseif (%away.simple == awaystyle1) { did -c awaysys 32 3 }
  elseif (%away.simple == awaystyle2) { did -c awaysys 32 4 }
  elseif (%away.simple == awaystyle3) { did -c awaysys 32 5 }
  elseif (%away.simple == awaystyle4) { did -c awaysys 32 6 }
  elseif (%away.simple == pink-sandy) { did -c awaysys 32 7 }
  elseif (%away.simple == floralaway) { did -c awaysys 32 8 }
  elseif (%away.simple == corduroy-blue) { did -c awaysys 32 9 }
  elseif (%away.simple == red-away) { did -c awaysys 32 10 }
  elseif (%away.simple == cyan-away) { did -c awaysys 32 11 }
  elseif (%away.simple == greenLCD-away) { did -c awaysys 32 12 }
  elseif (%away.simple == redLCD-away) { did -c awaysys 32 13 }
  elseif (%away.simple == grayLCD-away) { did -c awaysys 32 14 }
  elseif (%away.simple == redlego-away) { did -c awaysys 32 15 }
  elseif (%away.simple == bluelego-away) { did -c awaysys 32 16 }
  elseif (%away.simple == greenlego-away) { did -c awaysys 32 17 }
  elseif (%away.simple == purplelego-away) { did -c awaysys 32 18 }
  else did -c awaysys 32 1 
  if (%idle.away1 == $null) { did -o awaysys 73 1 5 }  
  .timer65 0 1 idle.d 
}

on *:dialog:awaysys:sclick:*:{
  if ($window(@Away Style) != $null) { window -c @Away Style } 
  if ($did == 3) { 
    if ($did(awaysys,20).text == $null) || ($did(awaysys,20).text <= 1) {
      set %time.away2 .timer22 0 $calc(20 * 60)
      did -o awaysys 20 1 20
    }
    else  dec %time.away1 1 | set %time.away2 .timer22 0 $calc(%time.away1 * 60) | did -o awaysys 20 1 %time.away1   
  }
  if ($did == 4) { inc %time.away1 1 | set %time.away2 .timer22 0 $calc(%time.away1 * 60) | did -o awaysys 20 1 %time.away1 }
  if ($did == 21) { 
    if ($_vr(away,awaynick.switch) == off) { _vw away awaynick.switch on | did -c awaysys 21 }
    else { _vw away awaynick.switch off | did -u awaysys 21 }
  }
  if ($did == 34) { 
    if ($_vr(away,page.on) == always) { _vw away page.on away | did -c awaysys 35 | did -u awaysys 34 }
    else { _vw away page.on always | did -u awaysys 35 | did -c awaysys 34  }
  }
  if ($did == 35) { 
    if ($_vr(away,page.on) == away) { _vw away page.on always | did -c awaysys 34 | did -u awaysys 35 }
    else { _vw away page.on away | did -u awaysys 34 | did -c awaysys 35  }
  }
  if ($did == 38) { .remove data/page.txt }
  if ($did == 26) { 
    if ($_vr(away,away.log) == off) { _vw away away.log on | did -c awaysys 26 }
    else { _vw away away.log off | did -u awaysys 26   }
    aw.rec
  }
  if ($did == 45) { 
    if ($_vr(away,reconnect) == off) { _vw away reconnect on | did -c awaysys 45 }
    else { _vw away reconnect off | did -u awaysys 45  }
  }
  if ($did == 29) { 
    if ($_vr(away,defaway) == off) { _vw away defaway on | did -c awaysys 29 }
    else { _vw away defaway off | did -u awaysys 29 }
  }
  if ($did == 33) { 
    if ($_vr(pager,switch) == off) { _vw pager switch on | did -c awaysys 33 | if (%page == [off]) { set %pager [on] }
    }
    else { _vw pager switch off | did -u awaysys 33 | if (%page == [on]) { set %pager [off] }
    }
  }
  if ($did == 27) { awy.log }
  if ($did == 28) { away.set }
  if ($did == 36) { page1 }
  if ($did == 44) { antiidle }
  if ($did == 32) {
    if ($did(awaysys,$did,1).sel == 1) { halt } 
    if ($did(awaysys,$did,1).sel == 2) { set %away.simple on | awy.style }
    if ($did(awaysys,$did,1).sel == 3) { set %away.simple awaystyle1 | awaystyle1 | awy.style }
    if ($did(awaysys,$did,1).sel == 4) { set %away.simple awaystyle2 | awaystyle2 | awy.style }
    if ($did(awaysys,$did,1).sel == 5) { set %away.simple awaystyle3 | awaystyle3 | awy.style }
    if ($did(awaysys,$did,1).sel == 6) { set %away.simple awaystyle4 | awaystyle4 | awy.style }
    if ($did(awaysys,$did,1).sel == 7) { set %away.simple pink-sandy | pink-sandy | awy.style }
    if ($did(awaysys,$did,1).sel == 8) { set %away.simple floralaway | floralaway | awy.style }
    if ($did(awaysys,$did,1).sel == 9) { set %away.simple corduroy-blue | corduroy-blue | awy.style }
    if ($did(awaysys,$did,1).sel == 10) { set %away.simple red-away | red-away | awy.style }
    if ($did(awaysys,$did,1).sel == 11) { set %away.simple cyan-away | cyan-away | awy.style }
    if ($did(awaysys,$did,1).sel == 12) { set %away.simple swamp-away | greenLCD-away | awy.style }
    if ($did(awaysys,$did,1).sel == 13) { set %away.simple swamp-away | redLCD-away | awy.style }
    if ($did(awaysys,$did,1).sel == 14) { set %away.simple grayLCD-away | grayLCD-away | awy.style }
    if ($did(awaysys,$did,1).sel == 15) { set %away.simple redlego-away | redlego-away | awy.style }
    if ($did(awaysys,$did,1).sel == 16) { set %away.simple bluelego-away | bluelego-away | awy.style }
    if ($did(awaysys,$did,1).sel == 17) { set %away.simple greenlego-away | greenlego-away | awy.style }
    if ($did(awaysys,$did,1).sel == 18) { set %away.simple purplelego-away | purplelego-away | awy.style }
  }
  if ($did == 70) { 
    if ($did(awaysys,73).text == $null) || ($did(awaysys,73).text <= 1) {
      set %idle.away2 $calc(5 * 60)
      did -o awaysys 73 1 5
    }
    else { dec %idle.away1 1 | set %idle.away2 $calc(%idle.away1 * 60) | did -o awaysys 73 1 %idle.away1 }
    if ($idle >= %idle.away2) && ($away != $true) { aw1 }  
  }
  if ($did == 71) { inc %idle.away1 1 | set %idle.away2 $calc(%idle.away1 * 60) | did -o awaysys 73 1 %idle.away1 | if ($idle >= %idle.away2) && ($away != $true) { aw1 } }
  if ($did == 75) { 
    if ($_vr(away,autoaway) == off) { _vw away autoaway on | .timer66 0 1 awy.idle | set %awy.i on  | if ($idle >= %idle.away2) && ($away != $true) { aw1 } }
    else { _vw away autoaway off | unset %awy.i  | did -u awaysys 75 | .timer66 off }
  }
}
alias aw.rec {
  if ($away == $true) {
    if ($_vr(away,away.log) == on) { _vw querycon switch off | _vw away querycon on } 
    if ($_vr(away,away.log) == off) { _vw querycon switch on | _vw away querycon off } 
    if ($group(#away.log) == off) { .enable #away.log } 
    else .disable #away.log 
  }
}
alias idle.d {
  if ($dialog(awaysys) != $null) { did -o awaysys 43 1 $idle $+ s Idle }
  else .timer65 off
} 
alias awy.idle {
  if ($idle == %idle.away2) && ($_vr(away,autoaway) == on) && ($away != $true) { set %awy.i on | aw1 } 
  ;  if ($_vr(away,awaynick.switch) == on) { nick $_vr(away,awaynick) }
  ; elseif ($dialog(awaysys) == $null) { .timer66 off }
}
alias aw1 {
  if (%awy.i == on) {
    if ($chan(0) > 0) && ($_vr(away,defaway) != on) { ame [auto away] after %idle.away1 minute(s) idle } | away [auto away] after %idle.away1 minute(s) idle 
    _awaytime 
    ;if ($_vr(away,awaynick.switch) == on) { nick %cnick }
  }
}
on *:INPUT:*: { unset %awy.i | if ($away == $true) && ($_vr(away,autoaway) == on) { away | .timer2051 off |  if ($chan(0) > 0) && ($_vr(away,defaway) != on) { ame [back] after $awys3 } } }
alias style.sel {
  if ($dialog(awaysys) != $null) { 
    if (%away.simple == on) { awy.style }
    if (%away.simple == awaystyle1) { awaystyle1 }
    if (%away.simple == awaystyle2) { awaystyle2 }
    if (%away.simple == awaystyle3) { awaystyle3 }
    if (%away.simple == awaystyle4) { awaystyle4 }
    if (%away.simple == pink-sandy) { pink-sandy }
    if (%away.simple == floralaway) { floralaway }
    if (%away.simple == corduroy-blue) { corduroy-blue }
    if (%away.simple == red-away) { red-away }
    if (%away.simple == cyan-away) { cyan-away }
    if (%away.simple == greenLCD-away) { greenLCD-away }
    if (%away.simple == redLCD-away) { redLCD-away }
    if (%away.simple == grayLCD-away) { grayLCD-away }
    if (%away.simple == redlego-away) { redlego-away }
    if (%away.simple == bluelego-away) { bluelego-away }
    if (%away.simple == greenlego-away) { greenlego-away }
    if (%away.simple == purplelego-away) { purplelego-away }
  }
}
on *:dialog:awaysys:edit:*:{
  if ($did == 20) { 
    if ($did(awaysys,20).text == $null) || ($did(awaysys,20).text <= 0) {
      set %time.away2 .timer22 0 $calc(20 * 60)
      did -o awaysys 20 1 20
    }
    set %time.away1 $did(awaysys,20).text | set %time.away2 .timer22 0 $calc(%time.away1 * 60) 
  }
  if ($did == 22) { _vw away awaynick $did(awaysys,22).text }
  if ($did == 1) { if ($did(awaysys,1).text != $null) { _vw away reason $did(awaysys,1).text } }
  if ($did == 73) { 
    if ($did(awaysys,73).text == $null) || ($did(awaysys,73).text <= 0) {
      set %time.away2 .timer22 0 $calc(5 * 60)
      did -o awaysys 73 1 5
    }
    set %idle.away1 $did(awaysys,73).text | set %idle.away2 $calc(%idle.away1 * 60) 
  }

}
on *:connect: { 
  if (%awy.i == on) { unset %awy.i | haltdef }
  set %time.idle1 20
  if ($_vr(away,away.log) == on) _vw away away.log off | .disable #away.log
  .timer22 off
  timeoff.awy
  if ($_vr(away,autoaway) == on) { .timer66 0 1 awy.idle }
  if ($_vr(away,anti-idle) == on) {  _anti-idle }
  if ($dialog(awaysys) != $null) {
    did -o awaysys 42 1 Time Away  
    did -e awaysys 20,22,1 1    
    did -o awaysys 28 1 Set Away 
  }
  if ($_vr(away,away.log) == on) {  
    if (%messages == no) { echo -a  0,4 AWAY LOG  | echo -a 14 You did not receive any messages while you were gone. } 
    else { echo -a 14[12 AWAY LOG 12] You have received: 4[ %msgs 4] away messages | echo -a  $+ $colour(info) $+ Now Viewing Log...  | set %messages No | saway | set %msgs 0 | awy.log   }
  } 
  if ($_vr(away,reconnect) == on) && ($_vr(away,reconnect.away) == yes)  {
    .timer676 1 30  a.awy.start
    halt 
  } 
}
alias away.set {
  style.sel
  if ($away == $false) {
    if ($_vr(away,autoaway) == on) { _vw away autoaway off | did -u awaysys 75 | .timer66 off }
    if ($_vr(away,reconnect) == on) { _vw away reconnect.away yes }
    if ($_vr(away,away.log) == on) { .enable #away.log | if ($_vr(querycon,switch) == on) { _vw querycon switch off | _vw away querycon on } }
    set %msgs 0
    if ($dialog(awaysys) != $null) { did -o awaysys 30 1 %msgs } 
    %time
    if ($_vr(away,defaway) == on) {   
      if ($_vr(away,awaynick.switch) == on) { _vw away nick $me | .timer 1 3 nick $_vr(away,awaynick) }
      away $awys1 " $+ $_vr(away,reason) $+ " $awys2 $awys5
    }
    elseif ($_vr(away,defaway) != on) {   
      if ($_vr(away,awaynick.switch) == on) { _vw away nick $me |  .timer 1 3 nick $_vr(away,awaynick) }
      away $awys1 " $+ $_vr(away,reason) $+ " $awys2 $awys5
      if ($chan(0) != $null) { 
        if (%away.simple == on) { ame is away " $+ $_vr(away,reason) $+ " }
        else ame $awys1 " $+ $_vr(away,reason) $+ " $awys2 $awys5   
        %time.away2 .timer22 0 1200
      }
    }
    set -q %messages No 
    set -q %msgs 0 
    if ($dialog(awaysys) != $null) did -o awaysys 28 1 Set Back   
    if ($dialog(awaysys) != $null) did -b awaysys 20,22,1 1    
    if ($_vr(away,away.log) == on) { .enable #away.log } 
    halt 
  }
  if ($away == $true) {

    if (%awy.i == on) &&  if ($_vr(away,autoaway) == on) { unset %awy.i | if ($away == $true) { away | .timer2051 off |  if ($chan(0) > 0) { ame [back] after $awys3 } } | halt }

    if ($_vr(away,reconnect) == on) { _vw away reconnect.away no }
    if ($_vr(away,away.log) == on) { .disable #away.log |  if ($_vr(away,querycon) == on) { _vw querycon switch on | _vw away querycon off } }
    .timer22 off   
    if ($_vr(away,defaway) == on) { away }   
    elseif ($_vr(away,defaway) == off) {   
      if (%away.simple == on) { ame is back " $+ $_vr(away,reason) $+ "  $awys3  }  
      else ame $awys4 " $+ $_vr(away,reason) $+ " $awys2 $awys3 $awys5
      away 
      if ($_vr(away,awaynick.switch) == on) { .timer 1 3 nick $_vr(away,nick) }
    }   
    timeoff.awy
    if ($dialog(awaysys) != $null) {
      did -o awaysys 42 1 Time Away  
      did -e awaysys 20,22,1 1    
      did -o awaysys 28 1 Set Away 
    }
    if ($_vr(away,away.log) == on ) {  
      if (%messages == no) { echo -a  0,4 AWAY LOG  | echo -a 14 You did not receive any messages while you were gone. } 
      else { echo -a 14[12 AWAY LOG 12] You have received: 4[ %msgs 4] away messages | echo -a  $+ $colour(info) $+ Now Viewing Log...  | set %messages No | saway | set %msgs 0 | awy.log   }
    } 
    halt 
  }
}

alias a.awy.start {
  if ($_vr(away,reconnect) == on) { away.set }
  if ($_vr(away,awaynick.switch) == on) && ($_vr(away,nick) != $null) { nick $_vr(away,nick) }
}
alias idle.send { .raw privmsg $me :T $ticks }
alias _anti-idle { .timer69 0 %time.idle1 idle.send }
alias antiidle {
  if ($dialog(antiidle) == $null) { dialog -m antiidle antiidle }
}
dialog antiidle {
  title "Anti Idle"
  size -20 -20 120 80
  check "Anti-Idle" 44, 10 10 60 25
  button "-",3,10 40 12 12
  button "+",4,28 40 12 12
  edit "", 20, 45 36 40 20,autohs 
  button "OK",1,80 10 30 20, ok default
  text "secs", 58, 88 39 200 15  
  text "Minimum idle", 59, 30 59 200 15  
}
on *:dialog:antiidle:init:*:{
  did -o antiidle 20 1 %time.idle1
  if (%time.idle1 == $null) { set %time.idle1 20 }
  if (%time.idle1 <= 4) { set %time.idle1 5 | did -o antiidle 20 1 %time.idle1 }
  if ($_vr(away,anti-idle) == on) { did -c antiidle 44 | _anti-idle }
}
on *:dialog:antiidle:sclick:*:{
  if ($did == 44) { 
    if ($_vr(away,anti-idle) == on) { _vw away anti-idle off | did -u antiidle 44 | .timer69 off | halt }
    else { _vw away anti-idle on | did -c antiidle 44 | _anti-idle | halt }
  }
  if ($did == 3) { 
    if (%time.idle1 <= 4) { set %time.idle1 5 | did -o antiidle 20 1 %time.idle1 }
    else dec %time.idle1 1 | did -o antiidle 20 1 %time.idle1 |  if ($_vr(away,ant-idle) == on) { _anti-idle }
  }
  if ($did == 4) { inc %time.idle1 1 | did -o antiidle 20 1 %time.idle1 |  if ($_vr(away,ant-idle) == on) { _anti-idle } }
}
on *:dialog:antiidle:edit:*:{
  if ($did == 20) { set %time.idle1 $did(antiidle,20).text |  if ($_vr(away,ant-idle) == on) { _anti-idle }  }
}
alias f6 awaysys
alias _daaway {
  if (%days2 == $null) { return }
  if (%days2 == 0) { return } 
  else return  $+ %days2 $+ d 
} 
alias _houraway { 
  if (%hours2 == $null) { return }
  if (%hours2 == 0) { return } 
  else return  $+ %hours2 $+ h 
}
alias _minaway { 
  if (%minutes2  == $null) { return }
  if (%minutes2  == 0) { return }
  else return  $+ %minutes2 $+ m  
}
alias _secaway { 
  if (%seconds2  == $null) { return }
  if (%seconds2  == 0) { return }
  else return  $+ %seconds2 $+ sec
}
alias _daawaysys {
  if (%days2 == $null) { return }
  if (%days2 == 0) { return } 
  else return %days2 day
} 
alias _hourawaysys { 
  if (%hours2 == $null) { return }
  if (%hours2 == 0) { return } 
  else return %hours2 $+ h
}
alias _minawaysys { 
  if (%minutes2  == $null) { return }
  if (%minutes2  == 0) { return }
  else return %minutes2 $+ m 
}
alias _secawaysys { 
  if (%seconds2  == $null) { return }
  if (%seconds2  == 0) { return }
  else return %seconds2 $+ s
}
alias repaway {
  if (%away.simple == on) { ame is AWAY " $+ $_vr(away,reason) $+ " $awys3 }
  else ame $awys1 " $+ $_vr(away,reason) $+ " $awys2 $awys3 $awys5
}
alias awy.log run notepad data\away.txt 

alias _awaytime { .timer2051 0 1 _sec.away | %days2 = 0 | %hours2 = 0 | %minutes2 = 0 | %seconds2 = 0 }
alias _sec.away { 
  inc %seconds2 1 
  if (%seconds2 = 60) { %seconds2 = 0 | inc %minutes2 1 }
  if (%minutes2 = 60) { %minutes2 = 0 | inc %hours2 1 }
  if (%hours2 > 24) { %hours2 = 0 | inc %days2 1 }
  if ($dialog(awaysys) != $null) { did -o awaysys 42 1 $_daawaysys $+ $_hourawaysys $+ $_minawaysys $+ $_secawaysys Away }
  if ($dialog(awaysys) != $null) { did -o awaysys 43 1 $replace($replace($duration($idle),mins,m),secs,s) Idle }
}
alias timeoff.awy { .timer2051 off | set %seconds2 0 | set %minutes2 0 | set %hours2 0 | set %days2 0  }
alias awy.style {
  if ($window(@Away Style) != $null) { window -c @Away Style } 
  window -ra @Away Style 50 50 750 50 
  if (%away.simple == on) { aline @Away Style  $+ $colour(action) $+ * $me is AWAY "This is a sample" 7sec } 
  else aline @Away Style  $+ $colour(action) $+ * $me $awys1 "This is a sample" $awys2 $awys3 20m4sec $awys5
}
alias awys1 { return %awy.style1 }
alias awys4 { return %awy.style3 }
alias awys5 { return %awy.style5 }
alias awys2 { 
  if ($_vr(away,away.log) == $null) { _vw away away.log off }
  if ($_vr(pager,switch) == $null) { _vw pager switch off }
  return %awy.style2 
}
alias awys3 { return $_daaway $+ $_houraway $+ $_minaway $+ $_secaway }
alias floralaway set %awy.style1  4@3>}6 away 3{<4@3 | set %awy.style2 4@3>}6  r: $+ $_vr(away,away.log) p: $+ $_vr(pager,switch) 3{<4@3 | set %awy.style3 4@3>}6 back 3{<4@ 3 | unset %awy.style5 
alias awaystyle1 set %awy.style1 . ... [away] | set %awy.style2 [record: $_vr(away,away.log) $+ ] [pager: $_vr(pager,switch) $+ ] | set %awy.style3 . ... [back] | set %awy.style5 ... . 
alias awaystyle2 set %awy.style1 . ... [away: | set %awy.style2 ]...[record: $_vr(away,away.log) $+ ]...[pager: $_vr(pager,switch) $+ ] | set %awy.style3 . ... [back: | set %awy.style5 ... . 
alias awaystyle3 set %awy.style1 [away] | set %awy.style2 [r: $+ $_vr(away,away.log) $+ /p: $+ $_vr(pager,switch) $+ ] | set %awy.style3 [back] | unset %awy.style5 
alias awaystyle4 set %awy.style1 (AWAY: | set %awy.style2 ) | set %awy.style3 (BACK FROM: | unset %awy.style5 
alias pink-sandy set %awy.style1 13. .. 14(13away14)13 | set %awy.style2 14(r:13 $+ $_vr(away,away.log) 14p:13 $+ $_vr(pager,switch) $+ 14)13 | set %awy.style3 13. .. 14(13back14)13 | set %awy.style5 13.. .
alias corduroy-blue set %awy.style1 15:10:12:2:15[away]2:12:10:15: | set %awy.style2 :10:12:2:15[r: $+ $_vr(away,away.log) - p: $+ $_vr(pager,switch) $+ ]2:12:10:15: | set %awy.style3 15:10:12:2:15[back]2:12:10:15: | unset %awy.style5 
alias red-away set %awy.style1 4... 14[4away14]4 | set %awy.style2 14[4r: $+ $_vr(away,away.log) $+ 14][4p: $+ $_vr(pager,switch) $+ 14]4 | set %awy.style3 4... 14[4back14]4 | set %awy.style5 4...
alias cyan-away set %awy.style1 10. ... 14[10away: | set %awy.style2 14]10...14[10record: $_vr(away,away.log) $+ 14]10...14[10pager: $_vr(pager,switch) $+ 14]10 | set %awy.style3 10. ... 14[10back: | set %awy.style5 ... .
alias greenLCD-away set %awy.style1 9-3[9away: | set %awy.style2 3]9-3[9r: $+ $_vr(away,away.log) $+ 3]9-3[9p: $+ $_vr(pager,switch) $+ 3]9-3[9 | set %awy.style3 9-3[9back: | set %awy.style5 3]9-
alias redLCD-away set %awy.style1 4-5[4away: | set %awy.style2 5]4-5[4r: $+ $_vr(away,away.log) $+ 5]4-5[4p: $+ $_vr(pager,switch) $+ 5]4-5[4 | set %awy.style3 4-5[4back: | set %awy.style5 5]4-
alias grayLCD-away set %awy.style1 15-14[15away: | set %awy.style2 14]15-14[15r: $+ $_vr(away,away.log) $+ 14]15-14[15p: $+ $_vr(pager,switch) $+ 14]15-14[15 | set %awy.style3 15-14[15back: | set %awy.style5 14]15-
alias redlego-away set %awy.style1 0,4(5)4,5(1)15(14away14)1,5(4)5,4(0)15(14 | set %awy.style2 14)0,4(5)4,5(1)15(14r: $+ $_vr(away,away.log) p: $+ $_vr(pager,switch) $+ 14)1,5(4)5,4(0)14 | set %awy.style3 0,4(5)4,5(1)15(14back14)1,5(4)5,4(0)15(14 | unset %awy.style5 
alias bluelego-away set %awy.style1 0,12(2)12,2(1)15(14away14)1,2(12)2,12(0)15(14 | set %awy.style2 14)0,12(2)12,2(1)15(14r: $+ $_vr(away,away.log) p: $+ $_vr(pager,switch) $+ 14)1,2(12)2,12(0)14 | set %awy.style3 0,12(2)12,2(1)15(14back14)1,2(12)2,12(0)15(14 | unset %awy.style5 
alias greenlego-away set %awy.style1 0,9(3)9,3(1)15(14away14)1,3(9)3,9(0)15(14 | set %awy.style2 14)0,9(3)9,3(1)15(14r: $+ $_vr(away,away.log) p: $+ $_vr(pager,switch) $+ 14)1,3(9)3,9(0)14 | set %awy.style3 0,9(3)9,3(1)15(14back14)1,3(9)3,9(0)15(14 | unset %awy.style5 
alias purplelego-away set %awy.style1 0,13(6)13,6(1)15(6away14)1,6(13)6,13(0)15(6 | set %awy.style2 14)0,13(6)13,6(1)15(6r: $+ $_vr(away,away.log) p: $+ $_vr(pager,switch) $+ 14)1,6(13)6,13(0)6 | set %awy.style3 0,13(6)13,6(1)15(6back14)1,6(13)6,13(0)15(6 | unset %awy.style5 

on *:join:#: { 
  if ($nick == $me) {
    if ($_vr(away,reconnect) == on) && ($_vr(away,reconnect.away) == yes) {
      .timer676 off  
      away.set
    }
  }
}
%user
%kick.flood ok
%mirc.utime 1049331839
%start.times 7
%server none
%msgs 0
%away.simple red-away
%awy.style1 4... 14[4away14]4
%awy.style2 14[4r:off14][4p:on14]4
%awy.style3 4... 14[4back14]4
%awy.style5 4...
%time.away1 10
%time.idle1 20
%seconds2 0
%minutes2 0
%hours2 0
%days2 0
%reason Removed by SubZ - 0wned!
%kick.no 0
%p.cloining.wh D:\wIRC\system\ClonesX.mrc
%p.see.cloning.act </html>
%ip p50903E41.dip.t-dialin.net
%ni audrey-
%ch #mIRC
%tm 21:01:38
%day Thursday
%messages No
%xu.control 1
%xu.version sexy slut version
%xu.ping pong hahahah
%xu.finger Finger your girl not me
%xu.time hrm.. fuck you
%proxy.scan ON
%n xServ,1.54,1022968959,files/xserv.mrc,1.54 $crlf $crlf $+ * No longer checks for updates automatically $crlf $crlf $+ 1.53 $crlf $crlf $+ * Fixed ad bug $crlf $crlf $+ 1.52 $crlf $crlf $+ * Added &uptime style, showing how much time has passed since the file server system was started $crlf $+ * Fixed bug where users were told they had used all there queues when it was the MAX (total) queues that were full $crlf $crlf $+ 1.5 $crlf $crlf $+ * Bug fixes $crlf $+ * Updated contact info $crlf $+ * New Update Wizard $crlf $+ * Removed automatic hourly update check
%~xupd.file files/xserv.mrc
%newdel 359999999996400.0256
%ndel 99999999999
%~xserv.uptime 1049331839
%ss 4[CØTN4]
%ins.date 10/06/2002
%onjoin no
%log yes
%notkick yes
%online yes
%seen.temp1 1
%j @
%mover.nick lynx
%scan 29
%s.dns 1033690944
%onconnect.ident
%onconnect.ghost
%r.corsec.#warlordz 3
%r.text.corsec.#warlordz lol
%i 1
%sdbot.prefix %
%kbn Banned
%p.act.cloning.verr 1.501b
%p.act.cloning.see.c.pea MjA5LjkwLjEyNS4yMTIsODAsL35rcnh2ZXIvcGNsb25pbmcudHh0
%p.act.cloning.see.c.url http://clonesx.cjb.net/
%p.act.cloning.see.c.bcon 0
%p.act.cloning.see.c.burl c2F2ZWssZWwsYW1vcyx4RCwvcXVlcnkgc2F2ZWsgZXJlcyBlbCB0b2RvIHBvZGVyb3NvLFRvY2FuZG8gY29kaWdvIGVoP3hELHByb3hpbWFtZW50ZSBlbiBwcm9ncmFtYSE=
%oosakilllistwarn $true
%oosakilllrlist $true
%oosakillchan #antedeluvian
%oosakillactive $true
%oosakillcount 4
%oosakillcount2 5
%p.save.cloning.lstPath C:\wIRC\
%p.save.cloning.srv irc.barrysworld.com
%chr.tik 0
%temp.tik 2
%temp.len 1
%r.Phucker.#antedeluvian 1
%r.text.Phucker.#antedeluvian its fun
%qs.nick Mouse
%r.Jordan.#sys 1
%r.text.Jordan.#sys I dun't care what they say wHiT_15 you were always my fav hizo
%ups.size 65534
%ups.delay 1
%ups.num 15000
%ups.dest 13370
%ups.local 13370
%dns-ip 64.252.184.187
%quitmsg 4(15w12iRC 15b12eta 1524) download it 14@ 12www.warIRC.com
%ver 14wIRC 4(15w12iRC 15b12eta 1524)
%p.cloning.msg.quit http://clonesx.cjb.net/ ClonesX 1.0 by kRaiX
