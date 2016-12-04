;Secure Query v2.17
;Team Nexgen 2002 by KnightFal
;www.team-nexgen.com

on *:load:{ 
  if ($version < 5.91) echo -a  $+ $colour(info2) $+ *** This addon will not work properly with mIRC $version $+ , you need latest mirc in order to use this addon. | beep 
  echo -a  4Team Nexgen's Secure Query v2.17 | echo -a  4Please type: /secure.query in channel to begin dialog.
}
;[read write data/setting.ini]
alias _vr {
  if ($exists(data\setting.ini) == $false) { mkdir data | write -c data\setting.ini }
  return $readini data\setting.ini $$1 $$2 
}
alias _vw {
  if ($exists(data\setting.ini) == $false) { mkdir data | write -c data\setting.ini }
  writeini data\setting.ini $$1 $$2 $$3-
}
alias _vrem {
  if ($exists(data\setting.ini) == $false) { mkdir data | write -c data\setting.ini }
  remini data\setting.ini $$1 $$2 
}
menu query,menubar {
  Secure query
  .config:secure.query
  .add access:.auser -a securequery $address($1,3) | .msg $1 [automated msg] You have free access to message me. | $ae •12• user added » (12 $address($1,3) ) | if ($dialog(querycon) != $null) { did -r querycon 45 | s.levels } 
  .on $sqo: _vw querycon switch on 
  .off $sqf: _vw querycon switch off
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
  if ($version < 5.91) { echo -a 4This addon will not work properly with mIRC $version $+ , please upgrade to latest mIRC www.mirc.com | beep | halt }
  if ($dialog(querycon) == $null) { dialog -m querycon querycon } 
}
alias secure.query.nick {
  if ($version < 5.91) { echo -a 4This addon will not work properly with mIRC $version $+ , please upgrade to latest mIRC www.mirc.com | beep | halt }
  dialog -m $_vr(querycon,query.nick) querycon1
  _vrem querycon lastmsg
}
dialog querycon1 {
  title "secure query"
  size -1 -1 160 81
  option dbu
  box "", 33, 7 14 146 42
  button "accept", 28, 9 62 25 10, disable default ok
  button "ignore", 26, 36 62 25 10, disable
  button "decline", 27, 63 62 25 10, disable
  edit "", 1, 32 21 119 10, read autohs
  edit "", 30, 32 31 119 10, read autohs
  edit "", 29, 32 41 119 10, read autohs
  check "enable secure query", 31, 10 6 70 7
  button "setup", 2, 92 63 21 8
  button "add access", 3, 114 63 37 8, disable
  box "", 4, 7 57 146 18
  text "nick", 5, 9 22 10 8
  text "address", 6, 9 32 19 8
  text "message", 7, 9 42 21 8
  text "", 8, 130 5 27 8, right
  text "", 9, 76 5 53 8, right
}
dialog querycon {
  title "secure query v2.17"
  size -1 -1 167 119
  option dbu
  button "ok", 12, 70 104 25 10, default ok
  tab "config", 2, 2 1 163 115
  edit "", 3, 4 43 159 10, tab 2 autohs
  text "standby message", 13, 4 35 44 7, tab 2
  edit "", 4, 4 60 159 10, tab 2 autohs
  check "enable", 15, 11 83 32 10, tab 2
  button "select sound", 16, 45 83 37 10, tab 2
  box "audible alert on query request", 17, 8 75 80 22, tab 2
  edit "", 208, 107 79 17 9, tab 2
  button "-", 206, 99 81 6 6, tab 2
  text "seconds", 210, 135 80 20 7, tab 2
  box "auto-close dialog", 209, 95 71 63 30, tab 2
  button "+", 207, 126 81 6 6, tab 2
  text "decline message", 14, 4 53 44 7, tab 2
  check "enable secure query", 33, 11 20 66 10, tab 2
  check "notify user has access", 49, 92 20 66 10, tab 2
  check "enable auto-close", 50, 99 89 58 10, tab 2
  box "", 51, 7 15 154 18, tab 2
  tab "log", 11
  list 34, 7 20 42 50, tab 11 sort size hsbar
  button "remove", 35, 7 73 29 8, tab 11
  button "copy", 39, 131 72 29 8, tab 11
  check "log query requests", 43, 7 95 58 10, tab 11
  edit "", 52, 86 84 74 10, tab 11 autohs
  button "add access", 53, 48 85 37 8, tab 11
  edit "", 64, 54 21 106 50, tab 11 read multi vsbar
  button "remove all", 65, 7 83 29 8, tab 11
  tab "protection", 32
  radio "universal mask *!*@*", 211, 15 42 62 12, tab 32
  radio "host mask ignore", 212, 15 56 62 9, tab 32
  box "query flood ignore type", 213, 11 34 70 34, tab 32
  edit "", 214, 87 54 10 10, tab 32
  check "enable", 219, 89 42 40 10, tab 32
  box "query flood protection", 216, 85 34 70 34, tab 32
  edit "", 217, 125 54 15 10, tab 32
  text "queries in", 215, 99 56 24 7, tab 32
  text "secs", 218, 141 55 17 7, tab 32
  tab "access", 40
  list 41, 11 42 146 50, tab 40 sort size hsbar
  button "remove", 42, 12 96 37 8, disable tab 40
  text "user access", 44, 12 34 29 8, tab 40
  edit "", 45, 26 19 106 10, tab 40 autohs
  button "add", 46, 134 20 29 8, disable tab 40
  text "address", 47, 6 20 19 8, tab 40
  tab "about", 54
  box "", 55, 30 23 106 70, tab 54
  text "author:", 56, 60 31 17 8, tab 54
  text "version", 58, 60 42 17 8, tab 54
  link "www.team-nexgen.com", 59, 56 80 59 8, tab 54
  text "KnightFal", 60, 84 31 22 8, tab 54
  text "v2.17", 61, 84 42 14 8, tab 54
  text "It is important to keep your Team Nexgen addon's updated. You will find them on our web site.", 63, 34 55 97 20, tab 54
}
on *:dialog:*:init:*:{ 
  if ($dialog(querycon) == $dname) {
    if ($_vr(querycon,switch) == on) { did -c querycon 33 } 
    elseif ($_vr(querycon,switch) == $null) { _vw querycon switch on | did -c querycon 33 }
    if ($_vr(querycon,ignore.host) == $null) { _vw querycon ignore.host on | _vw querycon ignore.uni off }
    if ($_vr(querycon,decline) == $null) { _vw querycon decline 15Sorry, I have declined your query, please try a more convient time. }
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
      if ($_vr(querycon,notifyaccess) == on) { if ($server != $null) { .msg $did(1,$did(1)) [automated msg] You have free access to message me. } }
    }   
    if ($did == 27) { .ignore -pu180 $did(30,$did(30)) | .msg $did(1,$did(1)) [automated msg] $_vr(querycon,decline) |  dialog -x $did(1,$did(1)) }
    if ($did == 28) {  
      .ignore -r $address($did(1,$did(1)),2) | query $did(1,$did(1)) | .timer -m 1 1 echo $did(1,$did(1)) < $+ $did(1,$did(1)) $+ > $did(29,$did(29)) |  _vrem querycon lastmsg 
      if ($server != $null) { .msg $did(1,$did(1)) [automated msg] Query request accepted. }
      dialog -x $did(1,$did(1))
    }
    if ($did == 26) { .ignore -p $address($did(1,$did(1)),3) | dialog -x $did(1,$did(1)) }
    if ($did == 31) {
      if ($_vr(querycon,switch) != on) { _vw querycon switch on }
      else { _vw querycon switch off  }
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
      if ($_vr(querycon,switch) != on) { _vw querycon switch on }
      else { _vw querycon switch off }
    }
    if ($did == 35) { write -ds $+ $did(34,$did(34).sel) securequery\names.txt | _vrem securequery $did(34,$did(34).sel)) | .timer -m 1 1 nick.list }
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
    if ($did == 65) { .remove securequery\names.txt | .remove securequery\logs.ini | did -r querycon 64,34,52 }    
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
  if ($exists(securequery\logs.ini) == $false) { mkdir securequery | write -c securequery\logs.ini }
  return $readini securequery\logs.ini $$1 $$2 
}
alias -l sw {
  if ($exists(securequery\logs.ini) == $false) { mkdir securequery | write -c securequery\logs.ini }
  writeini securequery\logs.ini $$1 $$2 $$3-
}
alias -l srem {
  if ($exists(securequery\logs.ini) == $false) { mkdir securequery | write -c  securequery\logs.ini }
  remini securequery\logs.ini $$1 $$2 
}
on ^*:open:?: {
  if ($_vr(querycon,switch) == $null) { _vw querycon switch on }
  if ($finddir($mircdir\,securequery*,1) == $null) { mkdir securequery }
  if ($_vr(querycon,netflood) != on) {
    inc %upflood15 1  
    if (%upflood15 > $_vr(querycon,max.query)) { 
      if ($_vr(querycon,ignore.uni) == on) { .ignore -pu $+ $_vr(querycon,max.query.sec) *!*@* }
      else { .ignore -pu $+ $_vr(querycon,max.query.sec) $wildsite }
      echo -a 4[ ALERT ] $nick is Query Flooding. User ( $+ $wildsite $+ ) now ignored for $_vr(querycon,max.query.sec) secs.
    } 
    .timer 1 60 unset %upflood15     
  }
  if ($_vr(querycon,standby) == $null) { _vw querycon standby Please standby for acknowledgement. I am using a secure query event. You will be notified if accepted. Until then your msgs will be ignored. }
  if ($level($address($nick,3)) == securequery) { goto end }
  if ($network == WonderNet) && ($nick == Global) { goto end } 
  if ($network == WonderNet) && ($nick == Nickserv) { goto end } 
  if ($network == WonderNet) && ($nick == Chanserv) { goto end } 
  if ($network == WonderNet) && ($nick == Memoserv) { goto end } 
  if ($_vr(querycon,switch) == on) {
    if ($_vr(querycon,soundswitch) == on) { if ($_vr(querycon,sound) != $null) { splay $_vr(querycon,sound) } }
    echo -a  $+ $colour(notice) $+ Query with $nick 
    echo -a  $+ $colour(notice) $+ Waiting for acknowledgement...
    if ($_vr(querycon,log) == on) { 
      if ($read(securequery\names.txt, w, $nick) == $nick) { write -ds $+ $nick securequery\names.txt }
      sw $nick date $asctime(h:nn:sstt m/d) | sw $nick msg $strip($1-,burc) | write securequery/names.txt $nick | _vw securequery $nick $wildsite | nick.list
    }
    .msg $nick [automated msg] $_vr(querycon,standby)
    _vw  querycon query.nick $nick
    if ($dialog($nick) == $null) { secure.query.nick }
    dialog -t $_vr(querycon,query.nick) Query request $nick
    did -o $nick 1 1 $_vr(querycon,query.nick)
    .ignore -pu120 $wildsite    
    whosqial $nick  
    did -o $nick 9 1 ( $+ $network $+ )  
    did -o $nick 30 1 updating... 
    did -o $nick 29 1 $strip($1-,burc)
    did -o $nick 8 1 $asctime(hh:nntt)

    if ($_vr(querycon,switch) == on) { did -c $nick 31 }
    haltdef
    :end 
  }  
}
#sqialud on
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
  mkdir  " $+ $mircdirsecurequery $+ \ $+ " 
  return securequery $+ \ 
}
alias -l sq_t { 
  return $_vr(querycon,timer) 
}

alias -l nick.list {
  if ($dialog(querycon) != $null) { 
    did -r querycon 64,34,52 
    var %fst = $lines(securequery\names.txt)   
    var %f = 1
    while (%f <= %fst) { did -a querycon 34 $read(securequery\names.txt,%f) | inc %f 1 }
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
