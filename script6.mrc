;===========
; IRCopHelp
;===========
alias IRCop { dialog -mo IRCoper IRCoper }
alias serverhasher { dialog -mo serverhash serverhash }
alias serverconnecter { dialog -mo serverconnect serverconnect }
alias serverakiller { dialog -mo serverakill serverakill }
alias serversquiter { dialog -mo serversquit serversquit }


dialog IRCoper {
  title "IRCop Helper"
  option dbu
  size -1 -1 172 174

  box "User Action",1,1 3 54 111
  button "Kill User", 2,3 11 50 8
  button "KLine User", 3,3 21 50 8
  button "UnKLine User", 4,3 31 50 8
  button "ZLine User", 5,3 41 50 8
  button "Change Users Host", 6,3 51 50 8
  button "Change Users Ident", 7,3 61 50 8
  button "Global Message", 8,3 71 50 8
  button "Kick User ( OS )", 9,3 81 50 8
  button "Ban User ( OS )", 10,3 91 50 8
  button "Akill User (Mask)", 11,3 101 50 8

  box "Message IRCop",12,1 115 54 49
  button "WallOps", 13,3 123 50 8
  button "LocOps", 14,3 133 50 8
  button "GlobOps", 15,3 143 50 8
  button "ChatOps", 16,3 153 50 8

  box "Server Admin", 17,115 3 54 111
  button "Rehash", 18,117 11 50 8
  button "Connect", 19,117 21 50 8
  button "Squit", 20,117 31 50 8
  button "Restart", 21,117 41 50 8
  button "SA Join", 22,117 51 50 8
  button "SA Part", 23,117 61 50 8
  button "SA Mode", 24,117 71 50 8
  button "Add O Line", 25,117 81 50 8
  button "Add U Line", 26,117 91 50 8
  button "Add Q Line", 27,117 101 50 8

  box "Statserv", 28,58 115 112 49
  button "Daily Stats", 29,60 123 50 8
  button "Network Stats", 30,60 133 50 8
  button "Network Map", 31,60 143 50 8
  button "View Logs", 32,60 153 50 8
  button "Shutdown Statserv", 33,117 123 50 8
  button "Reload Statserv", 34,117 133 50 8
  button "MoraleServ Help", 35,117 143 50 8
  button "LoveServ Help", 36,117 153 50 8

  box "Operserv", 37,58 3 54 111
  button "Add Admin", 38,60 11 50 8
  button "Add Oper", 39,60 21 50 8
  button "Chg Channel Mode", 40,60 31 50 8
  button "OS Stats", 41,60 41 50 8
  button "OS Clear Modes",42,60 51 50 8
  button "Kill Clones", 43,60 61 50 8
  button "Reload Services", 44,60 71 50 8
  button "Services Shutdown", 45,60 81 50 8
  button "Kill Clones", 46,60 91 50 8
  button "List All Channels", 47,60 101 50 8
  button "Close",48,3 166 166 8,cancel
}

on *:dialog:IRCoper:sclick:*:{
  if ($did == 2) {  /kill $$?="Enter User" $$?="Enter Reason" }
  if ($did == 3) {  /addkline }
  if ($did == 4) {  /unkline - $$?="Enter user@host" }
  if ($did == 5) {  /zline $$?="Enter Nick/IP" $$?="Enter Reason" }
  if ($did == 6) {  /chghost $$?="Enter user" $$?="Enter Host (tlegrats.org)" }
  if ($did == 7) {  /chgident $$?="Enter user" $$?="Enter Ident (ident@)" }
  if ($did == 8) {  /operserv global $$?="Enter Message" }
  if ($did == 9) {  /operserv kick $$?="Enter Channel" $$?="Enter User" $$?="Enter Reason" }
  if ($did == 10) {  /operserv mode $$?="Enter Channel" +b $$?="Enter User" | /operserv kick $1 $$2 $me }
  if ($did == 11) { /serverakiller }
  if ($did == 13) {  /wallops $$?="Enter Message" }
  if ($did == 14) {  /locops $$?="Enter Message" }
  if ($did == 15) {  /globops $$?="Enter Message" }
  if ($did == 16) { /chatops $$?="Enter Message" }
  if ($did == 18) { /serverhasher }
  if ($did == 19) { /serverconnecter }
  if ($did == 20) { /serversquiter }
  if ($did == 21) { /restart $?="Enter Password" }
  if ($did == 22) { /sajoin $$?="Enter User" $$?="Enter Channel"  }
  if ($did == 23) { /sapart $$?="Enter User" $$?="Enter Channel"  }
  if ($did == 24) { /samode $$?="Enter Channel" $$?="Enter Mode"  }
  if ($did == 25) { /addoline }
  if ($did == 26) { /adduline }
  if ($did == 27) { /addqline }
  if ($did == 29) { /msg statserv daily }
  if ($did == 30) { /msg statserv netstats }
  if ($did == 31) { /msg statserv map }
  if ($did == 32) { /msg neostats logs }
  if ($did == 33) { /msg neostats shutdown $$?=#Enter Reason" }
  if ($did == 34) { /msg neostats reload $$?=#Enter Reason" }
  if ($did == 35) { /msg moraleserv help }
  if ($did == 36) { /msg loveserv help }
  if ($did == 38) { /operserv admin add $$?="Enter Nick" }
  if ($did == 39) { /operserv oper add $$?="Enter Nick" }
  if ($did == 40) { /operserv mode $$?="Channel" $$?="Mode" }
  if ($did == 41) { /operserv stats }
  if ($did == 42) { /operserv clearmodes $$?="Channel" $$?="Modes or All" }
  if ($did == 43) { /operserv killclones $$?="Enter Nick" }
  if ($did == 44) { /operserv reload }
  if ($did == 45) { /operserv shutdown }
  if ($did == 46) { /operserv userlist }
  if ($did == 47) { /operserv chanlist }
  if ($did == 48) { /dialog -x IRCoper }
}


dialog serverhash {
  title "Rehasher"
  option dbu
  size -1 -1 58 70

  box "Server Rehasher",1,1 3 56 66
  button "Rehash IRCD", 2,4 11 51 8,default
  button "DNS", 3,4 19 51 8
  button "Temp KLines", 4,4 27 51 8
  button "Del Excess Memory", 5,4 35 51 8
  button "MOTD", 6,4 43 51 8
  button "Clears Throttles", 7,4 51 51 8
  button "- BACK -", 8,4 59 51 8,cancel
}

on *:dialog:serverhash:sclick:*:{
  if ($did == 2) { /rehash | /echo 5[2 $server is rehashing 5]2: Re-reading ircd.conf file }
  if ($did == 3) { /rehash DNS | /echo 5[2 $server is rehashing 5]2: Re-reading /etc/resolv.conf file }
  if ($did == 4) { /rehash TKLINES | /echo 5[2 $server is rehashing 5]2: Clearing Temp Klines }
  if ($did == 5) { /rehash GC | /echo 5[2 $server is rehashing 5]2: Collecting Excessive Memory }
  if ($did == 6) { /rehash MOTD | /echo 5[2 $server is rehashing 5]2: Re-reading MOTD file }
  if ($did == 7) { /rehash THROTTLES | /echo 5[2 $server is rehashing 5]2: Clearing Connection Throttles }
  if ($did == 8) { /dialog -x serverhash }
}

; Connect Menu System
dialog serverconnect {
  title "IRCop SubMenu"
  option dbu
  size -1 -1 100 105

  box "Connect Split Servers",1,5 3 90 59
  text "Server [A]:",2,7 11 51 10
  edit $server,3,7 19 51 10,autohs
  text "Server [B]:",4,7 30 51 10
  edit $network,5,7 38 51 10,autohs
  text "Port:                    (Default)",6,25 50 81 10
  edit "6667",7,38 50 20 9
  button "Connect",8,62 19 30 10,default
  button "BACK", 9,62 38 30 10,cancel

  box "Description:",10,5 63 90 40
  text "Server [A] is the server that tries to connect to Server [B]",11,6 69 99 20
  text "Server [B] is the server you wanna connect to.",12,6 84 99 20
} 

on *:dialog:serverconnect:sclick:*:{
  if ($did == 8) { /echo 5[2INFO5]2: Trying to connect $did(serverconnect,5) with $did(serverconnect,3) using port: $did(serverconnect,7) | /connect $did(serverconnect,5) $did(serverconnect,7) $did(serverconnect,3) }
  if ($did == 9) { /dialog -x serverconnect }
}

; AKILL Menu System
dialog serverakill {
  title "IRCop SubMenu"
  option dbu
  size -1 -1 100 165

  box "AKill Menu",1,5 3 92 65
  text "AKill Mask:",2,9 11 51 10
  edit "",3,7 19 51 10,autohs
  text "Time (Expiry):",4,9 30 51 10
  edit "+30m",5,7 37 51 10,autohs
  text "Reason:",6,9 48 51 10
  edit $me Says So,7,7 54 51 10,autohs

  button "Add",8,62 19 30 10
  button "Delete",9,62 37 30 10
  button "BACK",10,62 54 30 10

  box "Other Commands",11,5 68 92 43
  text "AKill Mask:",12,9 76 51 10
  edit "",13,7 84 51 10,autohs
  button "List",14,62 79 30 10
  button "View",15,62 89 30 10
  button "Count",16,62 99 30 10
  text "Does not use Mask <--",17,6 99 55 10

  box "Hints: (Expiry)",18,5 115 92 45
  text "+d [days] e.g +2d = 2 days",19,6 122 99 20
  text "+h [hours] e.g +12h = 12 hours",20,6 129 99 20
  text "+m [minutes] e.g +30m = 30 minutes",21,6 136 99 20
  text "Note: Combinations do not work!",22,6 143 99 20
  text "(e.g +1h30m)",23,21 150 99 20
} 

on *:dialog:serverakill:sclick:*:{
  if ($did == 8) { /echo 5[2INFO5]2: Adding akill for $did(serverakill,3) with time limit: $did(serverakill,5) with Reason: $did(serverakill,7) | /.msg operserv akill add $did(serverakill,5) $did(serverakill,3) $did(serverakill,7) }
  if ($did == 9) { /echo 5[2INFO5]2: Removing akill for $did(serverakill,3) | /.msg operserv akill del $did(serverakill,3) }
  if ($did == 10) { /dialog -x serverakill }
  if ($did == 14) { /echo 5[2INFO5]2: Akill List | /.msg operserv akill list $did(serverakill,13) }
  if ($did == 15) { /echo 5[2INFO5]2: Akill View | /.msg operserv akill view $did(serverakill,13) }
  if ($did == 16) { /echo 5[2INFO5]2: Akill Count | /.msg operserv akill count }
}

; Squit Menu System
dialog serversquit {
  title "¤IRCop SubMenu"
  option dbu
  size -1 -1 100 80

  box "Squit Server(s)",1,5 3 90 49
  text "Server:",2,7 11 51 10
  edit $network,3,7 19 51 10,autohs
  text "Reason:",4,7 30 51 10
  edit "Reconfiguration",5,7 38 51 10,autohs
  button "Squit",8,62 19 30 10,default
  button "BACK", 9,62 38 30 10,cancel

  box "Description:",10,5 53 90 22
  text "Splits <server> away from your side",11,6 59 99 20
  text "of the net with a <reason>",12,6 65 99 20
} 

on *:dialog:serversquit:sclick:*:{
  if ($did == 8) { /echo 5[2INFO5]2: Squit server: $did(serversquit,3) with Reason: $did(serversquit,5) | /squit $did(serversquit,3) $did(serversquit,5) }
  if ($did == 9) { /dialog -x serversquit }
}

;=========
; scanner
;=========
dialog scanners {
  size -1 -1 400 425
  title "Scanners"
  button "Done",1,5 405 390 18, ok
  box "",2,5 5 390 395
  edit "",3,10 20 380 18, read center
  list 4, 10 40 100 200
  list 5, 110 40 280 200
  text "scan;",6,10 232 40 15
  edit "*!*@*",7,40 230 280 18
  button "start scan",8,325 230 65 18
  box "options",9, 10 250 380 145
  box "scanner",10,15 265 100 125
  radio "Clone Scan",11, 20 280 90 15, group
  radio "Ircop Scan",12, 20 295 90 15
  radio "Ban Scan",13, 20 310 90 15
  radio "Ip Scan",14, 20 325 90 15
  radio "Home Scan",15, 20 340 90 15
  radio "AOL Scan",16, 20 355 90 15
  radio "Away Scan",17, 20 370 90 15
  box "",22,120 265 265 125
  list 23, 125 275 150 120
  check "Private",25,285 305 90 20, push
  check "Public",26,285 340 90 20, push
  ;p0rgy from dalnet/inisderz made this addon

}
on *:dialog:scanners:*:*:{
  if ($devent == sclick) {
    if ($did == 8) { s.scan }
    if ($did == 15) { did -ra scanners 7 *!*@*home* }
    if ($did == 16) { did -ra scanners 7 *!*@*aol.com }
    if ($did > 10) && ($did < 18) { %s.scan = $right($did,1) | if ($did != 14) { did -b $dname 7 } | else { did -e $dname 7 } }
    if ($did == 25) { did -u $dname 26 | %scan.ems = echo }
    if ($did == 26) { did -u $dname 25 | %scan.ems = msg }
  }
  if ($devent == init) {
    if (%scan.ems != msg) { did -c $dname 25 }
    if (%scan.ems == msg) { did -c $dname 26 }
    if (%s.scan) { did -c $dname 1 [ $+ [ %s.scan ] ] }
    if (%s.scan != 4) { did -b $dname 7 }
    s.lchan
  }
}
alias s.lchan { 
  var %.tmp = 1
  while ($chan(%.tmp)) {
    did -a scanners 23 $chan(%.tmp)
    inc %.tmp
  }
}
alias s.scan {
  ;did -t scanners Scanning... Channel; $iif($did(scanners,23,$did(scanners,23).sel).text,$ifmatch,$active)
  if (%s.scan == 1) { c!scan $iif($did(scanners,23,$did(scanners,23).sel).text,$ifmatch,$active) msg ~d }
  if (%s.scan == 2) { ircscan msg $iif($did(scanners,23,$did(scanners,23).sel).text,$ifmatch,$active) ~d }
  if (%s.scan == 3) { bscan msg $iif($did(scanners,23,$did(scanners,23).sel).text,$ifmatch,$active) ~d }
  if (%s.scan == 4) { if (%scan.ems == msg) { scan.s $iif($did(scanners,23,$did(scanners,23).sel).text,$ifmatch,$active) $gettok($did(scanners,7).text,1,32) msg  } | scan.s $iif($did(scanners,23,$did(scanners,23).sel).text,$ifmatch,$active) $gettok($did(scanners,7).text,1,32) dialog }
  if (%s.scan == 5) { did -ra scanners 7 *!*@*home* | if (%scan.ems == msg) { scan.s $iif($did(scanners,23,$did(scanners,23).sel).text,$ifmatch,$active) $gettok($did(scanners,7).text,1,32) msg  } | scan.s $iif($did(scanners,23,$did(scanners,23).sel).text,$ifmatch,$active) $gettok($did(scanners,7).text,1,32) dialog }
  if (%s.scan == 6) { did -ra scanners 7 *!*@*aol.com | if (%scan.ems == msg) { scan.s $iif($did(scanners,23,$did(scanners,23).sel).text,$ifmatch,$active) $gettok($did(scanners,7).text,1,32) msg  } | scan.s $iif($did(scanners,23,$did(scanners,23).sel).text,$ifmatch,$active) $gettok($did(scanners,7).text,1,32) dialog }
  if (%s.scan == 7) { awyscan msg $iif($did(scanners,23,$did(scanners,23).sel).text,$ifmatch,$active) ~d }
}
alias c!scan { %tmp = $iif($2,echo,$2) | if ($3 == ~d) { %tmp = ~d } | if ($chan($1).ial == $false) { .ial On | .enable #swho | who $1 } | else { c!scanner $1 $2 } }
alias c!scanner {
  if (%tmp == ~d) {
    did -r scanners 3,4,5
    did -a scanners 4 nick; | did -a scanners 5 clones; , address;
  }
  if (%tmp == ~d) { did -ra scanners 3 Scanning %.xy $+ ... for; clones }
  if (%tmp != ~d) || (%scan.ems == msg) { $2 $1 scanning $1 $+ ... for; clones }
  var %i = 1, %x = 0, %d = $ticks
  while ($nick($1,%i)) {
    if ($ialchan($address($nick($1,%i),2),$1,2) != $null) && ($address($nick($1,%i),2) !isin %var~aclone) {
      var %var~clone = $ialchan($address($nick($1,%i),2),$1,1).nick
      var %ii = 2
      while ($ialchan($address($nick($1,%i),2),$1,%ii).nick != $null) {
        var %var~clone = $addtok(%var~clone,$ialchan($address($nick($1,%i),2),$1,%ii).nick,59)
        inc %ii
      }
      inc  %x
      var %var~aclone = $addtok(%var~aclone,$address($nick($1,%i),2),32)
      if (%tmp == ~d) { did -a scanners 4 $gettok(%var~clone,1,59) | did -a scanners 5 $gettok(%var~clone,2-,59) $+ , $address($nick($1,%i),2) }
      if (%tmp != ~d) || (%scan.ems == msg) { $2 $1 %x - %var~clone - $address($nick($1,%i),2) }
    }
    inc %i
  }
  if (%x == 0) {
    if (%tmp == ~d) { did -a scanners 3 invalid clones - none found | did -a scanners 3 done scanning clones. - chan; $1 - duration; $calc($ticks - %d)) $+ ms }
    if (%tmp != ~d) || (%scan.ems == msg) { $2 $1 invalid clones - none found | $2 $1 done scanning clones. - chan; $1 - duration; $calc($ticks - %d)) $+ ms }
    halt 
  }
  if (%tmp != ~d) || (%scan.ems == msg) { $2 $1 scanning complete... - chan; $1 - duration; $calc($ticks - %d)) $+ ms }
  if (%tmp == ~d) { did -a scanners 3 scanning complete... - chan; $1 - duration; $calc($ticks - %d)) $+ ms }

}
#swho off
raw 315:*:{ c!scanner $2 %tmp | .disable #swho }
#swho end

alias scan.s {
  if ($1 == $null) || ($2 == $null) { echo -a Syntax: /scan.s <#chan> <string/mask> | halt }
  var %.xy = $1, %.yx = $2, %xx = $gettok($1-,$numtok($1-,32),32)
  if (%xx == dialog) {
    did -r scanners 3,4,5
    did -ra scanners 3 Scanning %.xy $+ ... for; %.yx
    var %i = 1
    if (!$ialchan(%.yx,%.xy,1).nick) { did -ra scanners 3 invalid scan; none found... | halt }
    did -a scanners 4 nick; | did -a scanners 5 address;
    while ($ialchan(%.yx,%.xy,%i).nick) {
      did -a scanners 4 $chr(160) $ialchan(%.yx,%.xy,%i).nick | did -a scanners 5 $chr(160) $+ $ialchan(%.yx,%.xy,%i).addr
      inc %i 1
    }
    did -ra scanners 3 scanning complete... for; %.yx
    halt
  }
  $iif($gettok($1-,$numtok($1-,32),32) == msg,msg,echo) $active Scanning %.xy $+ ... for; %.yx
  var %i = 1
  if (!$ialchan(%.yx,%.xy,1).nick) { echo -a invalid scan; none found... | halt }
  $iif($gettok($1-,$numtok($1-,32),32) == msg,msg,echo) $active nick; $str($chr(160),24) address;
  while ($ialchan(%.yx,%.xy,%i).nick) {
    $iif($gettok($1-,$numtok($1-,32),32) == msg,msg,echo) $active $ialchan(%.yx,%.xy,%i).nick $str($chr(160),14) $ialchan(%.yx,%.xy,%i).addr
    inc %i 1
  }
  $iif($gettok($1-,$numtok($1-,32),32) == msg,msg,echo) $active scanning complete... for; %.yx
}

#awayscan off
raw 352:*:{ 
  ;DONT RIP THIS SCRIPT, p0rgy from insiderz/Dalnet Made it!
  if (G isin $7) { 
    inc %scan 1
    if (%tmp != ~d) || (%scan.ems == msg) { 
      if (%scan == 1) { %temp.chan nick; $str($chr(160),24) address; }
      %temp.chan $6 $str($chr(160),14) $3 $+ @ $+ $4
    }
    if (%tmp == ~d) {
      did -a scanners 4 $6
      did -a scanners 5 $3 $+ @ $+ $4
    }

  }
}
raw 315:*:{
  if (%tmp != ~d) || (%scan.ems == msg) { %temp.chan scanning complete... for; away users ~ found; %scan }
  if (%tmp == ~d) { did -ra scanners 3 scanning complete... for; away users ~ found; %scan }
  .disable #awayscan
  halt 
}
#awayscan end
alias awyscan {
  set %temp.chan $1 $iif($2,$ifmatch,$active)
  set %tmp $3
  if (%tmp == ~d) {
    did -r scanners 3,4,5
    did -a scanners 4 nick; | did -a scanners 5 address;
  }
  set %scan 0 
  .enable #awayscan 
  if (%tmp != ~d) || (%scan.ems == msg) { %temp.chan Scanning $iif($2,$ifmatch,$active) $+ ... for; away users }
  if (%tmp == ~d) { did -ra scanners 3 Scanning $iif($2,$ifmatch,$active) $+ ... for; away users }
  who $2
}


#ircopscan off
raw 352:*:{ 
  if (* isin $7) { 
    inc %scan 1
    if (%tmp != ~d) || (%scan.ems == msg) { 
      if (%scan == 1) { %temp.chan nick; $str($chr(160),24) address; }
      %temp.chan $6 $str($chr(160),14) $3 $+ @ $+ $4
    }
    if (%tmp == ~d) {
      did -a scanners 4 $6
      did -a scanners 5 $3 $+ @ $+ $4
    }

  }
}
raw 315:*:{
  if (%tmp != ~d) || (%scan.ems == msg) { %temp.chan scanning complete... for; ircops ~ found; %scan }
  if (%tmp == ~d) { did -ra scanners 3 scanning complete... for; ircops ~ found; %scan }
  .disable #ircopscan 
  halt 
}
#ircopscan end
alias ircscan { 
  set %temp.chan $1 $iif($2,$ifmatch,$active)
  set %tmp $3
  if (%tmp == ~d) {
    did -r scanners 3,4,5
    did -a scanners 4 nick; | did -a scanners 5 address;
  }
  set %scan 0 
  .enable #ircopscan 
  if (%tmp != ~d) || (%scan.ems == msg) { %temp.chan Scanning $iif($2,$ifmatch,$active) $+ ... for; ircops }
  if (%tmp == ~d) { did -ra scanners 3 Scanning $iif($2,$ifmatch,$active) $+ ... for; ircops }
  who $2
}

#bans off
raw 367:*:{ 
  inc %scan 1
  if (%tmp != ~d) || (%scan.ems == msg) {
    if (%scan == 1) { %temp.chan banned; $str($chr(160),24) by; $str($chr(160),24) time; }
    %temp.chan $3 $str($chr(160),14) $remove($4,!) $str($chr(160),14) $asctime($5,ddd mmm) $ord($asctime($5,d)) $asctime($5,h:nn yyyy) 
  }
  if (%tmp == ~d) {
    if (%scan == 1) { did -a scanners 4 banned; | did -a scanners 5 by; $str($chr(160),12) time; }
    did -a scanners 4 $3 | did -a scanners 5 $remove($4,!) $str($chr(160),10) $asctime($5,ddd mmm) $ord($asctime($5,d)) $asctime($5,h:nn yyyy) 
  }
}
raw 368:*:{ 
  if (%tmp != ~d) || (%scan.ems == msg) { %temp.chan scanning complete... for; bans ~ found; %scan }
  if (%tmp == ~d) { did -ra scanners 3 scanning complete... for; bans ~ found; %scan }
  .disable #bans
}
#bans end
alias bscan {
  set %scan 0
  set %temp.chan $1 $iif($2,$ifmatch,$active)
  set %tmp $3
  mode $iif($2,$ifmatch,$active) +b 
  .enable #bans
  if (%tmp != ~d) || (%scan.ems == msg) { %temp.chan Scanning $iif($2,$ifmatch,$active) $+ ... for; bans }
  if (%tmp == ~d) { did -r scanners 3,4,5 | did -ra scanners 3 Scanning $iif($2,$ifmatch,$active) $+ ... for; bans }
}
alias idlechk {
  if (- == $left($1,1)) {
    if (($remove($1,-) == a) || ($remove($1,-) == o) || ($remove($1,-) == r) || ($remove($1,-) == v)) { set %iparm $right($1,1) } | else { set %iparm a }
    if ($2) { set %ichan $2 } | else { set %ichan # | set %idle 300 } | if ($3) { set %idle $3 } | else { set %idle 300 }
  }
  else {
    if ($1) { set %ichan $1 } | else { set %ichan # | set %idle 300 } | if ($2) { set %idle $2 } | else { set %idle 300 }
    set %iparm a
  }
  .cnick -m2l $+ $int($calc(%idle / 60)) * 06 | dialog -m idlechk idlechk
  set %tmp1 1 | set %tmp2 $calc($nick(%ichan,0,%iparm) + 1)
  while (%tmp1 < %tmp2) { if ($nick(%ichan,%tmp1,%iparm).idle > %idle) { did -a idlechk 1 $nick(%ichan,%tmp1,%iparm) | inc %tmp.cnt 1 } | inc %tmp1 }
  dialog -t idlechk %ichan  :IdleUsers: %tmp.cnt :Idle Time: > %idle $iif(%iparm == a,[ALL USERS]) $+ $iif(%iparm == o,[OPS ONLY]) $+ $iif(%iparm == r,[REGS ONLY]) $+ $iif(%iparm == v,[VOICE ONLY])
  unset %tmp* %idle
}

dialog idlechk {
  title ""
  size -1 -1 164 86
  option dbu
  list 1, 2 10 160 64, sort size vsbar
  text "Nickname:", 2, 2 2 25 8
  button "Button", 3, 64 126 37 12, hide ok
  text "", 4, 4 76 99 8
  check "Dbl Click Kicks User", 5, 104 76 56 10
}
on *:DIALOG:idlechk:init:0:{ if (%idlechk.dcku == 1) { did -c $dname 5 } }
on *:DIALOG:idlechk:sclick:*:{
  if ($did == 1) {
    did -ra $dname 4 Idle Time: $replace($duration($nick(%ichan,$did($dname,1).seltext).idle),days,d,day,d,hours,h,hour,h,mins,m,min,m,secs,s,secs,s)
  }
  if ($did == 5) { set %idlechk.dcku $did($dname,5).state }
}
on *:DIALOG:idlechk:dclick:*:{
  if ($did == 1) {
    if (%idlechk.dcku == 1) {
      if ($me isop %ichan) { raw -q KICK %ichan $did($dname,1).seltext : $+ ::IdleChk Kick:: | did -d $dname 1 $did($dname,1).sel } 
      else { var %tmp $input(You are not OPPED on %ichan,o,Not Opped) }
    }
  }
}

on *:DIALOG:idlechk:close:*:{ .cnick -r * 06 | unset %ichan %iparm }
}
