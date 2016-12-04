;---------------
; Identify
;---------------
dialog nicklist {
  icon icons\identify.ico
  title "Nick List"
  size -1 -1 133 145
  option dbu
  list 10, 10 45 80 90 , sort
  box "", 24, 7 0 120 39
  box "My Nick List:", 11, 7 35 120 105
  button "Add" 1, 95 47 27 10
  button "Edit" 2, 95 59 27 10
  button "Delet" 3, 95 71 27 10
  button "Select" 4, 95 83 27 10
  button "OK" 5, 95 125 27 11,cancel
  button "Help" 6, 95 112 27 11
  check "Use Same Password For All Nicks:" 20,  10 10 90 8
  edit "" 21, 63 20 60 11, autohs, style pass
  Text "" 22, 10 23 50 10
  edit "" 23, 10 125 80 11 , center
}
on 1:dialog:nicklist:*:*:{
  if ($devent == init) {
    did -b $dname 23
    if (%nickpass == OFF) { did -b nicklist 21 }
    if (%nickpass == ON) { did -c nicklist 20 | did -ea nicklist 21 %nickpass.All }
    listnick
  }
  if ($devent == Edit) && ($did == 21) { set %nickpass.All $did(21) }
  if ($devent == sclick) && ($did == 6) { help nickname }
  if ($devent == sclick) && ($did == 5) {
    unset %listnick
    if (%nickpass == ON) && ($did(21) == $null) { set %nickpass OFF | set %errorinadd Password for all nicks is not ON, because no entered any pass! | errorinadd | halt } 
  }
  if ($devent == sclick) && ($did == 20) {
    if (%nickpass == ON) { set %nickpass OFF | did -rb nicklist 21 | did -r nicklist 22 | unset %nickpass.All }
    else { set %nickpass ON | did -e nicklist 21 | did -ra nicklist 22 Enter Your Pass => }
  }
  if ($devent == sclick) && ($did == 10) {
    did -e $dname 2
    did -e $dname 3
    did -e $dname 4
    set %listnick $gettok($did(10).seltext,1,42))
    if (%nickpass == ON) { did -ra nicklist 23 Oto identify: ON | halt }
    if (%otoidentify. [ $+ [ %listnick ] ] == ON) { did -ra nicklist 23 Oto identify: ON }
    else { did -ra nicklist 23 Oto identify: OFF }
  } 
  if ($devent == sclick) && ($did == 1) { nickset }
  if ($devent == sclick) && ($did == 2) { nicksett }
  if ($devent == sclick) && ($did == 3) { delnick }
  if ($devent == sclick) && ($did == 4) { selnick2 }
}
dialog nickset {
  title "Add Nick List"
  size -1 -1 200 135
  icon %set
  text "Enter Nick:" 7, 25 10 120 12
  edit "" 2, 15 27 170 20, autohs
  button "Add" 3, 25 100 70 20, ok
  button "Cancel" 6, 105 100 70 20, cancel
  check "Oto identify" 4, 17 55 75 15
  edit "" 5, 15 75 170 20, autohs
}
on 1:DIALOG:nickset:*:*: {
  if ($devent == init) {
    did -b nickset 3 
    did -b nickset 5
    did -b nickset 4
  }
  if ($devent == edit) {
    if ($did == 2) { set %selnick $did(2) }
    if ($did(2) == $null) { did -b nickset 3 | did -b nickset 4 }
    if ($did(2) != $null) { did -e nickset 3 | did -e nickset 4 }
    if ($did == 5) { set %selnickpass $did(5) }
  }
  if ($devent == sclick) {
    if ($did == 3) {
      if (* * iswm $did(2)) { set %errorinadd Don't Leave Empty Room Between The Words! | errorinadd | halt }
      set %selnick $did(2)
      if ($did(5) != $null) { set %otoidentify. [ $+ [ %selnick ] ] ON | set %selnickpass $did(5) }
      if ($did(5) == $null) { set %otoidentify. [ $+ [ %selnick ] ] OFF }
      nickset2 
    }
    if ($did == 6) { unset unset %otoidentify. [ $+ [ %selnick ] ] | unset %selnick | unset %selnickpass }
    if ($did == 4) {
      if (* * iswm $did(2)) { set %errorinadd Don't Leave Empty Room Between The Words! | errorinadd | did -u nickset 4 | did -rb nickset 5 | halt }
      if (%otoidentify. [ $+ [ %selnick ] ] == ON) { unset %otoidentify. [ $+ [ %selnick ] ] | did -rb nickset 5 | unset %selnickpass }
      else { set %otoidentify. [ $+ [ %selnick ] ] ON | did -e nickset 5 }
    }
  }
}
dialog nicksett {
  title "Edit Nick List"
  size -1 -1 200 135
  icon %set
  text "Nick:" 7, 25 10 120 12
  edit "" 2, 15 27 170 20, autohs
  button "OK" 3, 60 105 80 20, ok
  check "Oto identify" 4, 17 55 75 15
  edit "" 5, 15 75 170 20, autohs
}
on 1:DIALOG:nicksett:*:*: {
  if ($devent == init) {
    did -b nicksett 5
    did -a nicksett 2 %listnick
    if (%otoidentify. [ $+ [ %listnick ] ] == ON) { did -ea nicksett 5 %nickpass. [ $+ [ %listnick ] ] | did -c nicksett 4 }
  }
  if ($devent == edit) {
    if ($did == 2) { set %selnick $did(2) }
    if ($did(2) == $null) { did -b nicksett 3 | did -b nicksett 4 }
    if ($did(2) != $null) { did -e nicksett 3 | did -e nicksett 4 }
    if ($did == 5) { set %selnickpass $did(5) }
  }
  if ($devent == sclick) {
    if ($did == 3) {
      if (* * iswm $did(2)) { set %errorinadd Don't Leave Empty Room Between The Words! | errorinadd | halt }
      delnick
      set %selnick $did(2)
      if ($did(5) != $null) { set %otoidentify. [ $+ [ %selnick ] ] ON | set %selnickpass $did(5) }
      if ($did(5) == $null) { set %otoidentify. [ $+ [ %selnick ] ] OFF }
      nickset2 
    }
    if ($did == 4) {
      if (* * iswm $did(2)) { set %errorinadd Don't Leave Empty Room Between The Words! | errorinadd | halt }
      if (%otoidentify. [ $+ [ %listnick ] ] == ON) { unset %otoidentify. [ $+ [ %listnick ] ] | did -rb nicksett 5 | unset %nickpass. [ $+ [ %listnick ] ] }
      else { set %otoidentify. [ $+ [ %listnick ] ] ON | did -e nicksett 5 }
    }
  }
}
on *:Notice:*:?:{
  if ($nick == nickserv) &&  (*nickserv* iswm $1- && *identify* iswm $1-) {
    if (%ididentify != $null) { ns identify %ididentify | unset %ididentify | halt }
    elseif (%nickpass == ON) { .msg nickserv identify %nickpass.All | halt }
    elseif (%otoidentify. [ $+ [ $me ] ] == ON) { ns identify %nickpass. [ $+ [ $me ] ] | halt }
    else { identifyamor }
  }
  if (*incorrect* iswm $1- && $nick == nickserv) { incorrect }
  if (*Password sent to* iswm $1-) && (*@* iswm $1-) && ($nick == nickserv) { set -u10 %myemail $4- | idinfo }
}
dialog incorrect {
  title " incorrect  "
  size -1 -1 200 110
  icon %info
  icon 7, 20 10 30 30 , images\incorrect.ico
  text "Password incorrect !", 1, 65 24 100 20
  link "Don't Remeber Password?", 3, 40 50 145 15
  button "Try Again", 2, 20 75 70 20
  button "Cancel", 4, 105 75 70 20,ok
  box "", 5, 55 13 120 30
  box "", 6, 10 0 180 105
}
on 1:dialog:incorrect:sclick:*:{
  if ($did == 2) { identifyamor | dialog -c incorrect }
  if ($did == 3) { sendpass | dialog -c incorrect | halt }
}
dialog idinfo {
  size -1 -1 220 90
  title "Info"
  icon %info3
  icon 1, 5 5 35 45 
  box "" 2, 40 0 170 60
  text "Password Sent To:" 3, 68 15 150 15
  link "" 4, 55 35 150 15
  button "OK", 5, 80 65 70 20,cancel
}
dialog identify  {
  size -1 -1 200 95
  title "Nick Identify"
  icon icons\identify.ico
  box "" 1, 5 2 190 87
  text "Enter Your Password For Identify:" 2, 17 15 170 12
  edit "" 3, 15 35 170 20 , autohs , pass
  button "OK" 4, 55 62 85 20 , ok
}
on 1:dialog:identify:*:*:{
  if ($devent == init) { did -b $dname 4 }
  if ($devent == edit) && ($did == 3) {
    if ($did(3) == $null) did -b $dname 4
    if ($did(3) != $null) did -e $dname 4
  }
  if ($devent == sclick) && ($did == 4) {
    if ($server == $null) { set %errorinadd Not Connected To Server! | errorinadd }
    else { .msg nickserv identify $did(3) }
  }
}

;---------------
;Secure Query
;---------------

alias _vr {
  if ($exists(scripts/setting.ini) == $false) { write -c scripts/setting.ini }
  return $readini scripts/setting.ini $$1 $$2 
}
alias _vw {
  if ($exists(scripts/setting.ini) == $false) { write -c scripts/setting.ini }
  writeini scripts/setting.ini $$1 $$2 $$3-
}
alias _vrem {
  if ($exists(scripts/setting.ini) == $false) { write -c scripts/setting.ini }
  remini scripts/setting.ini $$1 $$2 
}
alias -l sqo { 
  if ($_vr(querycon,switch) == on) { return [x] }
  else { return  }
}
alias -l sqf { 
  if ($_vr(querycon,switch) == off) { return [x] }
  else { return }
}
alias secure.query {
  if ($version < 5.91) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) This addon will not work properly with mIRC $+ $version $+ , please upgrade to latest mIRC www.mirc.com | beep | halt }
  if ($dialog(querycon) == $null) { dialog -m querycon querycon } 
}
alias secure.query.nick {
  if ($version < 5.91) { echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) This addon will not work properly with mIRC $version $+ , please upgrade to latest mIRC www.mirc.com | beep | halt }
  dialog -m $_vr(querycon,query.nick) querycon1
  _vrem querycon lastmsg
}
dialog querycon1 {
  title "Secure Query"
  size -1 -1 161 81
  option dbu
  icon icons\secque.ico, 0
  box "", 33, 3 14 155 42
  button "Accept", 28, 6 63 26 12, disable default ok
  button "Ignore", 26, 34 63 26 12, disable
  button "Decline", 27, 62 63 26 12, disable
  edit "", 1, 32 21 119 10, read autohs
  edit "", 30, 32 31 119 10, read autohs
  edit "", 29, 32 41 119 10, read autohs
  check "Enable Secure Query", 31, 10 6 70 7
  button "Setup", 2, 96 63 22 12
  button "Add access", 3, 120 63 35 12, disable
  box "", 4, 3 57 88 22
  text "Nick :", 5, 7 22 15 8
  text "Address :", 6, 7 32 23 8
  text "Message :", 7, 7 42 25 8
  text "", 8, 130 5 27 8, right
  text "", 9, 76 5 53 8, right
  box "", 10, 93 57 65 22
}
dialog querycon {
  title "Secure Query [/secure.query]"
  size -1 -1 167 119
  option dbu
  icon icons\secque.ico, 0
  button "OK", 12, 67 104 34 11, default ok
  tab "Config", 2, 2 1 163 116
  edit "", 3, 4 43 159 10, tab 2 autohs
  text "Standby Message:", 13, 4 35 47 7, tab 2
  edit "", 4, 4 60 159 10, tab 2 autohs
  check "Enable", 15, 11 86 32 10, tab 2
  button "Select Sound", 16, 45 86 37 10, tab 2
  box "Audible alert on query request:", 17, 8 75 83 26, tab 2
  edit "", 208, 107 79 17 9, tab 2
  button "-", 206, 98 80 7 7, tab 2
  text "Secs", 210, 135 80 20 7, tab 2
  box "Auto-close dialog:", 209, 95 71 63 30, tab 2
  button "+", 207, 125 80 7 7, tab 2
  text "Decline message:", 14, 4 53 44 7, tab 2
  check "Enable Secure Query", 33, 11 20 66 10, tab 2
  check "Notify user has access", 49, 92 20 66 10, tab 2
  check "Enable auto-close", 50, 99 89 58 10, tab 2
  box "", 51, 7 15 154 18, tab 2
  tab "Log", 11
  list 34, 7 20 42 50, tab 11 sort size hsbar
  button "Remove", 35, 7 72 29 9, tab 11
  button "Copy", 39, 128 72 32 10, tab 11
  check "Log query requests", 43, 7 95 58 10, tab 11
  edit "", 52, 86 84 74 10, tab 11 autohs
  button "Add access", 53, 48 84 37 9, tab 11
  edit "", 64, 54 21 106 50, tab 11 read multi vsbar
  button "Remove all", 65, 7 83 29 9, tab 11
  tab "Protection", 32
  radio "Universal mask *!*@*", 211, 15 42 62 12, tab 32
  radio "Host mask ignore", 212, 15 56 62 9, tab 32
  box "Query flood ignore type:", 213, 11 34 70 34, tab 32
  edit "", 214, 87 54 10 10, tab 32
  check "Enable", 219, 89 42 40 10, tab 32
  box "Query flood protection:", 216, 85 34 70 34, tab 32
  edit "", 217, 125 54 15 10, tab 32
  text "Queries in:", 215, 99 56 26 7, tab 32
  text "Secs.", 218, 141 55 12 7, tab 32
  tab "Access", 40
  list 41, 11 42 146 50, tab 40 sort size hsbar
  button "Remove", 42, 12 95 37 9, disable tab 40
  text "User access", 44, 12 34 29 8, tab 40
  edit "", 45, 26 19 106 10, tab 40 autohs
  button "Add", 46, 134 19 29 9, disable tab 40
  text "Address:", 47, 5 20 21 8, tab 40
}
on *:dialog:*:init:*:{ 
  if ($dialog(querycon) == $dname) {
    if ($_vr(querycon,switch) == on) { did -c querycon 33 } 
    elseif ($_vr(querycon,switch) == $null) { _vw querycon switch on | did -c querycon 33 }
    if ($_vr(querycon,ignore.host) == $null) { _vw querycon ignore.host on | _vw querycon ignore.uni off }
    if ($_vr(querycon,decline) == $null) { _vw querycon decline Sorry, I have declined your query, please try a more convient time. }
    if ($_vr(querycon,ignore.uni) == on) && ($_vr(querycon,ignore.host) == off) { did -c querycon 211 1 }
    else  did -c querycon 212 1
    did -o querycon 3 1 $_vr(querycon,standby)
    did -o querycon 4 1 $_vr(querycon,decline)
    if ($_vr(querycon,soundswitch) == on) { did -c querycon 15 }
    if ($_vr(querycon,timer) == $null) { _vw querycon timer 240 }
    did -o querycon 208 1 $_vr(querycon,timer) 
    if ($_vr(querycon,max.query) == $null) { _vw querycon max.query 5 | did -o querycon 214 1 $_vr(querycon,max.query) }
    else  did -o querycon 214 1 $_vr(querycon,max.query) 
    if ($_vr(querycon,max.query.sec) == $null) {  _vw querycon max.query.sec 20 | did -o querycon 217 1 $_vr(querycon,max.query.sec) }
    else did -o querycon 217 1 $_vr(querycon,max.query.sec) 
    if ($_vr(querycon,netflood) == on) did -c querycon 219
    else did -b querycon 211,217,212,214
    if ($_vr(querycon,log) == on) { did -c querycon 43 }
    elseif ($_vr(querycon,log) == $null) { _vw querycon log on | did -c querycon 43 }
    if ($_vr(querycon,notifyaccess) == on) { did -c querycon 49 }
    elseif ($_vr(querycon,notifyaccess) == $null) { _vw querycon notifyaccess on | did -c querycon 49 }
    if ($_vr(querycon,auto-close) == on) { did -c querycon 50 }
    did -b querycon 46,42 
    nick.list 
    s.levels
    did -z querycon 34
  }
  if ($dialog($dname) == $_vr(querycon,query.nick)) { 
    if ($_vr(querycon,auto-close) == on) { %qs.nick = $_vr(querycon,query.nick) | .timer 1 $sq_t close.qw }
  }
}
on *:dialog:querycon:edit:*:{ 
  if ($did == 3) { 
    if ($did(querycon,3).text != $null) {    
      _vw querycon standby $did(querycon,3).text 
    }
  }
  if ($did == 4) { 
    if ($did(querycon,4).text != $null) {    
      _vw querycon decline $did(querycon,4).text 
    }
  }
  if ($did == 45) { 
    if ($did(querycon,45).text != $null) { did -e querycon 46 }
    elseif ($did(querycon,45).text == $null) { did -b querycon 46 }
  }
  if ($did == 208) { 
    if ($did(querycon,208).text != $null) {    
      _vw querycon timer $did(querycon,208).text 
    }
  }
  if ($did == 214) { 
    if ($did(querycon,214).text != $null) {  
      _vw querycon max.query $did(querycon,214).text 
    }  
  }
  if ($did == 217) { 
    if ($did(querycon,217).text != $null) {  
      _vw querycon max.query.sec $did(querycon,217).text 
    }
  }
}

on *:dialog:*:sclick:*:{ 
  if (Query request $dname == $dialog($dname).title) { 
    if ($did == 2) { secure.query }   
    if ($did == 3) {
      auser -a securequery $address($did(1,$did(1)),3) $did(1,$did(1)) | did -b $did(1,$did(1)) 3 
      if ($_vr(querycon,notifyaccess) == on) { if ($server != $null) { .msg $did(1,$did(1)) (Secure Query) Now you have free access to message me } }
    }   
    if ($did == 27) { .ignore -pu180 $did(30,$did(30)) | .msg $did(1,$did(1)) (Secure Query) $_vr(querycon,decline) |  dialog -x $did(1,$did(1)) }
    if ($did == 28) {  
      .ignore -r $address($did(1,$did(1)),2) | query $did(1,$did(1)) | .timer -m 1 1 echo $did(1,$did(1)) < $+ $did(1,$did(1)) $+ > $did(29,$did(29)) |  _vrem querycon lastmsg 
      if ($server != $null) { .msg $did(1,$did(1)) (Secure Query) Query request accepted }
      dialog -x $did(1,$did(1))
    }
    if ($did == 26) { .ignore -p $address($did(1,$did(1)),3) | dialog -x $did(1,$did(1)) }
    if ($did == 31) {
      if ($_vr(querycon,switch) != on) { _vw querycon switch on | set %sq.was on }
      else { _vw querycon switch off | set %sq.was off }
    }
  }
  if ($dialog(querycon) ==  $dname) { 
    if ($did == 15) { 
      if ($_vr(querycon,soundswitch) != on) {  _vw querycon soundswitch on | did -c querycon 15 }
      else { _vw querycon soundswitch off | did -u querycon 15 }
    }
    if ($did == 16) { setquerysound }
    if ($did == 206) { if (%timer > 0) { dec %timer 1 | did -o querycon 208 1 %timer | _vw querycon timer %timer } }
    if ($did == 207) { inc %timer 1 | did -o querycon 208 1 %timer | _vw querycon timer %timer }

    if ($did == 39) { clipboard < $+ $did(34,$did(34).sel) $+ > $sr($did(34,$did(34).sel),msg) }
    if ($did == 34) { did -r querycon 64 | did -a querycon 64 $chr(91) $+ $sr($did(34,$did(34).sel),date) $+ $chr(93) | did -a querycon 64 $crlf $sr($did(34,$did(34).sel),msg) | did -o querycon 52 1 $_vr(securequery,$did(34,$did(34).sel))) }
    if ($did == 33) {
      if ($_vr(querycon,switch) != on) { _vw querycon switch on | set %sq.was on }
      else { _vw querycon switch off | set %sq.was off }
    }
    if ($did == 35) { write -ds $+ $did(34,$did(34).sel) scripts/names.txt | _vrem securequery $did(34,$did(34).sel)) | .timer -m 1 1 nick.list }
    if ($did == 41) { did -e querycon 42,46 | did -o querycon 45 1 $did(41,$did(41).sel)) }
    if ($did == 42) { ruser $did(41,$did(41).sel) | s.levels }
    if ($did == 43) { 
      if ($_vr(querycon,log) != on) { _vw querycon log on | did -c querycon 43 }
      else { _vw querycon log off }
    }  
    if ($did == 50) { 
      if ($_vr(querycon,auto-close) != on) { _vw querycon auto-close on | did -c querycon 50 }
      else { _vw querycon auto-close off }
    }
    if ($did == 53) { 
      if ($did(querycon,52).text != $null) {    
        .auser -a  securequery $did(querycon,52).text | did -r querycon 52 
      }
    }
    if ($did == 49) { 
      if ($_vr(querycon,notifyaccess) != on) { _vw querycon notifyaccess on | did -c querycon 49 }
      else { _vw querycon notifyaccess off }
    }
    if ($did == 46) { 
      if ($did(querycon,45).text != $null) {    
        .auser -a  securequery $did(querycon,45).text | did -r querycon 45 | s.levels
      }
    }
    if ($did == 65) { .remove scripts/names.txt | .remove scripts/logs.ini | did -r querycon 64,34,52 }    
    if ($did == 211) {
      if ($_vr(querycon,ignore.uni) == off) { _vw querycon ignore.uni on | _vw querycon ignore.host off | did -c querycon 211 | did -u querycon 212 }
      else { _vw querycon ignore.uni off | _vw querycon ignore.host on | did -u querycon 211 | did -c querycon 212 }
    }
    if ($did == 212) {
      if ($_vr(querycon,ignore.host) == off) { _vw querycon ignore.host on | _vw querycon ignore.uni off | did -c querycon 212 | did -u querycon 211 }
      else { _vw querycon ignore.host off | _vw querycon ignore.uni on | did -u querycon 212 | did -c querycon 211 }
    }
    if ($did == 219) {
      if ($_vr(querycon,netflood) == off) { _vw querycon netflood on | did -c querycon 219 | did -e querycon 211,217,212,214 }
      else { _vw querycon netflood off | did -u querycon 219 | did -b querycon 211,217,212,214 }
    }
  }
}
alias -l sr {
  if ($exists(scripts/logs.ini) == $false) { write -c scripts/logs.ini }
  return $readini scripts/logs.ini $$1 $$2 
}
alias -l sw {
  if ($exists(scripts/logs.ini) == $false) { write -c scripts/logs.ini }
  writeini scripts/logs.ini $$1 $$2 $$3-
}
alias -l srem {
  if ($exists(scripts/logs.ini) == $false) { write -c  scripts/logs.ini }
  remini scripts/logs.ini $$1 $$2 
}
on ^*:open:?: {
  if ($_vr(querycon,switch) == $null) { _vw querycon switch on | set %sq.was on }
  if ($finddir(scripts,securequery*,1) == $null) { mkdir scripts/securequery }
  if ($_vr(querycon,netflood) != on) {
    inc %upflood15 1  
    if (%upflood15 > $_vr(querycon,max.query)) { 
      if ($_vr(querycon,ignore.uni) == on) { .ignore -pu $+ $_vr(querycon,max.query.sec) *!*@* }
      else { .ignore -pu $+ $_vr(querycon,max.query.sec) $wildsite }
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Query floods detected from $+ $cxs(1) $nick  $+ $cxs(2) $+ ( $+ $cxs(1) $+ $wildsite $+  $+ $cxs(2) $+ ) now ignored for $+ $cxs(1) $_vr(querycon,max.query.sec) secs.
    } 
    .timer 1 60 unset %upflood15     
  }
  if ($_vr(querycon,standby) == $null) { _vw querycon standby Please standby for acknowledgement. You will be notified if accepted, and until then your msgs will be ignored. }
  if ($level($address($nick,3)) == securequery) { goto end }
  if ($network = allnetwork) && ($nick == Global) { goto end } 
  if ($network = allnetwork) && ($nick == Nickserv) { goto end } 
  if ($network = allnetwork) && ($nick == Chanserv) { goto end } 
  if ($network = allnetwork) && ($nick == Memoserv) { goto end }
  if ($network = allnetwork) && ($nick == Operserv) { goto end }
  if ($network = allnetwork) && ($nick == Statserv) { goto end } 
  if ($_vr(querycon,switch) == on) {
    if ($_vr(querycon,soundswitch) == on) { if ($_vr(querycon,sound) != $null) { .splay $_vr(querycon,sound) } }
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Query with $+ $cxs(1) $nick $cxs(3) $+ ( $+ $cxs(1) $+ $address $+ $cxs(3) $+ ) $+ $cxs(2) on $+ $cxs(1) $network
    if ($_vr(querycon,log) == on) { 
      if ($read(scripts/names.txt, w, $nick) == $nick) { write -ds $+ $nick scripts/names.txt }
      sw $nick date $asctime(h:nn:sstt m/d) | sw $nick msg $strip($1-,burc) | write scripts/names.txt $nick | nick.list
    }
    .msg $nick (Secure Query) $_vr(querycon,standby)
    _vw  querycon query.nick $nick
    if ($dialog($nick) == $null) { secure.query.nick }
    dialog -t $_vr(querycon,query.nick) Query request $nick
    did -o $nick 1 1 $_vr(querycon,query.nick)
    .ignore -pu120 $wildsite    
    whosqial $nick  
    did -o $nick 9 1 ( $+ $network $+ )  
    did -o $nick 30 1 Updating... 
    did -o $nick 29 1 $strip($1-,burc)
    did -o $nick 8 1 $asctime(hh:nntt)

    if ($_vr(querycon,switch) == on) { did -c $nick 31 }
    haltdef
    :end 
  }  
}
#sqialud off
raw 352:*: {
  if ($dialog($6) != $null) { did -o $6 30 1 *!* $+ $3 $+ @ $+ $4  | did -e $6 26,28,3,27 | .timer 1 5 .disable #sqialud | haltdef }
  else { if ($dialog($6) != $null) { did -e $6 26,28,3,27 | .timer 1 5 .disable #sqialud | halt } }
  halt
}
raw 315:*: {
  halt
} 
#sqialud end
alias -l whosqial { .enable #sqialud | .who $$1 } 
alias -l secure.dir {
  mkdir  " $+ scripts $+ / $+ " 
  return scripts $+ /
}
alias -l sq_t { 
  return $_vr(querycon,timer) 
}

alias -l nick.list {
  if ($dialog(querycon) != $null) { 
    did -r querycon 64,34,52 
    var %fst = $lines(scripts/names.txt)   
    var %f = 1
    while (%f <= %fst) { did -a querycon 34 $read(scripts/names.txt,%f) | inc %f 1 }
  }
}
alias -l s.levels {
  did -r querycon 41
  var %s.l = $ulist(*,securequery,0)
  if (%s.l == 0) { did -b querycon 42 | return }
  else  did -e querycon 42
  var %s.w = 0
  :loop
  inc %s.w
  if (%s.w <= %s.l) { did -a querycon 41  $ulist(*,securequery,%s.w) | goto loop }
  else return
}
alias -l close.qw { if ($dialog(%qs.nick) != $null) dialog -x %qs.nick }
alias -l setquerysound {
  _vw querycon sound $$dir="Choose a wav:" $mircdir*.wav;*mp3;*.mid 
}
