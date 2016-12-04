;==========
;  psybnc
;==========
on *:LOAD:{
  if (%bncnick == $null) %bncnick = -psyBNC
  if (%bncmsgname == $null) %bncmsgname = psybnc.msg
  if (%bncserverininame == $null) %bncserverininame = psybnc.s.ini
  if (%bncmsgpop == $null) %bncmsgpop = 1
  if (%bncaidle == $null) %bncaidle = 1 
  if (%bncajoin == $null) %bncajoin = 1
  if (%bncdcc == $null) %bncdcc = 0
  if (%bncdccauto == $null) %bncdccauto = 0
  echo -a loading psyBNC addon!
  write " $+ $scriptdir $+ [ %bncserverininame ] "
  .dialog -m psybnc.config psybnc.config
  echo -a loaded!
}
on *:UNLOAD:{ unset %bnc* }
on *:LOGON:*:{ 
  if (%bncnick == $null) %bncnick = -psyBNC
  if (%bncmsgname == $null) %bncmsgname = psybnc.msg
  if (%bncserverininame == $null) %bncserverininame = psybnc.s.ini
  if ($server_info($server,ac) == 1) { .quote pass $server_info($server,pass) }
  %ts = $server
}
on *:CONNECT:{
  if ($server_info(%ts,modes) != $null) {
    .mode $me $server_info(%ts,modes)
    ; this next line is only here so you can see the mode change reflected
    .mode $me
    aidle %bncaidle
    autorejoin %bncajoin
    autogetdcc %bncdccauto
    dccenable %bncdcc
    unset %ts
  }
}
on ^1:text:You have Messages. Type /QUOTE PLAYPRIVATELOG to read your messages.:?:{
  if ($nick == %bncnick) { 
    if (%bncmsgpop == 1) .timer 1 5 quote playprivatelog 
    haltdef 
  }
}
on ^1:text:Starting playing log:?:{
  if ($nick == %bncnick) {
    dialog -m psybnc.msg psybnc.msg
    if ($exists($scriptdir $+ %bncmsgname) == $true) .remove " $+ $scriptdir $+ [ %bncmsgname ] "
    %bncredirect = 1
    haltdef
  }
}
on ^1:text:Use ERASEPRIVATELOG to kill the log:?:{ if ($nick == %bncnick) { haltdef } }
on ^1:text:*sent a DCC File Send Request for File*Use /DCCGET*or /DCCGET S=*(SSL) to receive the file. (*).:?:{
  if (%dccauto == 1) halt
  haltdef
  .dialog -m psybnc.dcc psybnc.dcc
  %file = $left($10,$sub($pos($10,.,$pos($10,.,0)),1)))
  %nick = $1
  did -a psybnc.dcc 3 $1 $24
  did -a psybnc.dcc 5 %file
}
on ^1:text:Listing DCCs:?:{ if ($nick == %bncnick) { .dialog -m psybnc.pending psybnc.pending |  haltdef } }
on ^1:text:End of DCCs:?:{ if ($nick == %bncnick) { haltdef } }
on ^1:text:*Listing Pending DCCs:?:{ if ($nick == %bncnick) { if (%bncdcc == 1) { haltdef } } }
on ^1:text:*End of Pending DCCs:?:{ if ($nick == %bncnick) { if (%bncdcc == 1) { haltdef } } }
on ^1:text:*DCC Send From*:?:{ if ($nick == %bncnick) { haltdef | did -a psybnc.pending 1 PROGRESS: $5 $nopath($remove($6,$chr(40),$chr(41)))   } }
on ^1:text:*DCC Send Request*:?:{ if ($5 == to) { halt } | if ($nick == %bncnick) { did -a psybnc.pending 1 REQUEST: $6 $nopath($remove($7,$chr(40),$chr(41))) |  haltdef } }
on ^1:text:*File*received.:?:{ echo -a --psyBNC file completed. type /dccsendme $nopath($6) to receive }
on ^1:text:*:?:{
  if ($nick == %bncnick) {
    if (%bncredirect >= 1) {
      haltdef
      %received = $left($1-,$sub($pos($1-,:,3),2))
      %from_nick = $mid($1-,$add($pos($1-,:,3),2),$sub($pos($1-,!,1),$add($pos($1-,:,3),2)))
      %from_addy = $mid($1-,$add($pos($1-,!,1),1),$sub($pos($1-,$chr(41),1),$add($pos($1-,!,1),1)))
      %message = $mid($1-,$add($pos($1-,$chr(41),1),2),10000000)
      write_messages %from_nick %from_addy %received %message
      if (%from_nick !isin $didtok(psybnc.msg,2,46)) did -a psybnc.msg 2 %from_nick
      unset %received
      unset %from_nick
      unset %from_addy
      unset %message
      inc %bncredirect
    }
  }
}
alias get_next_msg_line { var %temp = $read($scriptdir $+ %bncmsgname, s, $1) | return $readn }
alias write_messages {
  %temp = $get_next_msg_line($1)
  if (%temp == 0) write " $+ $scriptdir $+ [ %bncmsgname ] " $1 $+ ! $+ $2 $+ ! $+ $3 $4 $5 $6 $+ ! $+ $7-
  else write -il $+ %temp " $+ $scriptdir $+ [ %bncmsgname ] " $1 $+ ! $+ $2 $+ ! $+ $3 $4 $5 %6 $+ ! $+ $7-
}
alias read_messages {
  did -r psybnc.msg 3
  %temp = $get_next_msg_line($1)
  while (%temp < %bncredirect) {
    %temp = %temp + 1
    %entry = $read($scriptdir $+ %bncmsgname,%temp)
    %temp_m = $mid(%entry,$add($pos(%entry,!,3),1))
    %temp_d = $remove($mid(%entry,$add($pos(%entry,!,2),1),$sub($pos(%entry,!,3),$pos(%entry,!,2))),!)
    %from_nick = $left(%entry, $sub($pos(%entry,!,1),1))
    if ($1 == %from_nick) did -i $dname 3 $did(3).lines Received: %temp_d $str($chr(160),12) %temp_m
  }
  unset %temp*
  unset %from_nick
  unset %entry
}

alias server_info { if ($2 == $null) return $ini($scriptdir $+ %bncserverininame,$1) | var %temp = $readini($scriptdir $+ %bncserverininame, n, $1, $2) | if (%temp != $null) return %temp | else return $null }
alias server_total { return $ini($scriptdir $+ %bncserverininame,0) }
alias sub { var %math = $1 - $2 | return %math }
alias add { var %math = $1 + $2 | return %math }
menu status {
  psyBNC
  .config:.dialog -m psybnc.config psybnc.config
  .dccs:.quote listdcc
  .messages:.quote playprivatelog
  .del messages:quote ERASEPRIVATELOG
}
dialog psybnc.msg {
  title "You have new messages!"
  size -1 -1 330 300

  box "From:", 1,  5 5 320 290
  combo 2, 13 26 100 65, drop
  edit "", 3, 120 25 200 220, multi vsbar
  button "Save all messages", 4, 170 250 100 20
  button "Delete all messages", 5, 170 270 100 20
}
on 1:dialog:psybnc.msg:sclick:2:{ read_messages $did($did) }
on 1:dialog:psybnc.msg:close:*:{ unset %bncredirect }
on 1:dialog:psybnc.msg:sclick:5:{ unset %bncredirect | .quote eraseprivatelog | dialog -t psybnc.msg Messages removed. | did -r $dname 2,3 }
dialog psybnc.config {
  title "psybnc config"
  size -1 -1 500 200

  box "servers", 1, 5 10 160 180
  combo 4, 13 25 100 65, drop
  button "add", 9, 120 25 30 20
  button "rem", 10, 120 50 30 20
  button "con", 11, 120 75 30 20
  text "password:" 6, 12 50 80 20
  edit "", 5, 12 65 80 20, limit 20 
  text "port:" 12, 12 90 80 20
  edit "", 13, 12 105 80 20, limit 5
  text "modes:" 7, 12 130 80 20
  edit "", 15, 12 145 80 20
  check "send pass on login", 8, 13 167 140 20
  text "", 14, 45 70 80 80, center wrap

  box "options",  20, 170 10 160 180
  check "pop-up msgs on login", 21, 178 25 140 20
  text "msg filename:", 22, 178 50 80 20
  edit "", 23, 178 65 80 20
  button "save", 24, 280 65 30 20
  button "rev.", 25, 280 90 30 20
  check "anti-idle", 26, 178 90 80 15
  check "auto-rejoin", 27, 178 105 80 15
  check "dcc-enable", 28, 178 120 80 15
  check "autoget", 29, 260 120 60 15
  text "psyBNC nick:", 30, 178 145 80 20
  edit "", 31, 178 160 80 20
}

on 1:dialog:psybnc.config:init:*:{
  ;read all the servers
  ; then put them in combo box
  var %i = 0
  while (%i < $server_total) {
    %i = %i + 1
    did -a $dname 4 $server_info(%i)
  }
  did -a $dname 23 %bncmsgname
  did -a $dname 31 %bncnick
  did -h $dname 5,6,7,8,10,11,12,13,14,15,24,25,29
  if (%bncmsgpop == 1) did -c $dname 21
  if (%bncaidle == 1) did -c $dname 26
  if (%bncajoin == 1) did -c $dname 27
  if (%bncdcc == 1) { 
    did -v $dname 29
    did -c $dname 28
    if (%bncdccauto == 1) did -c $dname 29
  }
}
on 1:dialog:psybnc.config:sclick:26:{ %bncaidle = $did(26).state | aidle %bncaidle }
on 1:dialog:psybnc.config:sclick:27:{ %bncajoin = $did(27).state | autorejoin %bncajoin }
on 1:dialog:psybnc.config:sclick:28:{ %bncdcc = $did(28).state | dccenable %bncdcc | if (%bncdcc == 1) did -v $dname 29 | else did -h $dname 29 }
on 1:dialog:psybnc.config:sclick:29:{ %bncdccauto = $did(29).state | autogetdcc %bncdccauto }
on 1:dialog:psybnc.config:sclick:21:{ %bncmsgpop = $did(21).state }
on 1:dialog:psybnc.config:edit:5:{ writeini " $+ $scriptdir $+ [ %bncserverininame ] "  $did(4) pass $did(5) }
on 1:dialog:psybnc.config:edit:13:{ writeini " $+ $scriptdir $+ [ %bncserverininame ] " $did(4) port $did(13) }
on 1:dialog:psybnc.config:edit:23:did -v $dname 24,25
on 1:dialog:psybnc.config:edit:31:%bncnick = $did(31)
on 1:dialog:psybnc.config:edit:15:{ writeini " $+ $scriptdir $+ [ %bncserverininame ] " $did(4) modes $did(15) }
on 1:dialog:psybnc.config:sclick:4:{
  did -v $dname 5,6,7,8,9,10,11,12,13,15
  did -h $dname 14
  did -ra $dname 13 $server_info($did(4),port)
  did -ra $dname 5 $server_info($did(4),pass)
  did -ra $dname 15 $server_info($did(4),modes)
  if ($server_info($did(4),ac) == 1) did -c $dname 8
  else did -u $dname 8
}
on 1:dialog:psybnc.config:sclick:8:{ writeini " $+ $scriptdir $+ [ %bncserverininame ] " $did(4) ac $did(8).state }
on 1:dialog:psybnc.config:sclick:9:{
  var %temp_server = $?="Address? ex: psybnc.nothing.org:2731"
  if (%temp_server == $null) { unset %temp_server | halt }
  var %temp_port = $mid(%temp_server,$add($pos(%temp_server,:,1),1))
  var %temp_server = $left(%temp_server,$sub($pos(%temp_server,:,1),1))
  if ($remove(%temp_server,.) !isalnum) { did -h $dname 5,6,7,8,9,10,11,12,13 | did -va $dname 14 That is not a valid server (contains !@#$ chars)! | unset %temp* | halt }
  if ($ini($scriptdir $+ %bncserverininame,%temp_server) != 0 || $ini($scriptdir $+ %bncserverininame,%temp_server) == $null) { did -h $dname 5,6,7,8,9,10,11,12,13 | did -va $dname 14 That server already exists! | unset %temp* | halt }
  %temp_pass = $?="Password?"
  if (%temp_port !isnum) { echo That is not a valid port! | halt }
  writeini " $+ $scriptdir $+ [ %bncserverininame ] " %temp_server pass %temp_pass
  writeini " $+ $scriptdir $+ [ %bncserverininame ] " %temp_server port %temp_port
  writeini " $+ $scriptdir $+ [ %bncserverininame ] " %temp_server ac 1
  writeini " $+ $scriptdir $+ [ %bncserverininame ] " %temp_server modes +i
  dialog -x psybnc.config
  dialog -m psybnc.config psybnc.config
}
on 1:dialog:psybnc.config:sclick:10:{ if ($?!="Are you sure?" == $true) { remini " $+ $scriptdir $+ [ %bncserverininame ] " $did(4) | dialog -x psybnc.config | dialog -m psybnc.config psybnc.config } }
on 1:dialog:psybnc.config:sclick:11:{ if ($?!="Connect?" == $true) { server $did(4) $server_info($did(4),port) } }
on 1:dialog:psybnc.config:sclick:24:{ if ($?!="Change the filename?" == $true) { %bncmsgname = $did(23) } }  
on 1:dialog:psybnc.config:sclick:25:{ did -ra $dname 23 %bncmsgname | did -h $dname 24,25 }
dialog psybnc.dcc {
  title "psybnc dcc send"
  size -1 -1 320 120

  text "The user below is attempting to send you a file:", 1, 15 15 300 20
  text "Nick: ", 2, 15 40 40 20
  text "", 3, 50 40 180 20
  text "File:", 4, 15 60 40 20
  text "", 5, 50 60 180 20

  button "Accept", 20, 250 20 60 25
  button "Accept SSL", 22, 250 50 60 25
  button "Reject", 21, 250 80 60 25
}
on 1:dialog:psybnc.dcc:sclick:20:{ dccget %nick : $+ %file | dialog -x psybnc.dcc | unset %nick | unset %file }
on 1:dialog:psybnc.dcc:sclick:21:{ unset %nick | unset %file | dialog -x psybnc.dcc }
on 1:dialog:psybnc.dcc:sclick:22:{ dccget S= $+ %nick : $+ %file | dialog -x psybnc.dcc | unset %nick | unset %file }
dialog psybnc.pending {
  title "pending dccs through the bnc"
  size -1 -1 234 102
  option dbu
  list 1, 2 3 230 85, size
  button "[ remove ] ", 2, 101 89 31 12, hide
  button "[ get ]", 3, 81 89 31 12, hide
  button "[ get/ssl ] ", 4, 114 89 31 12, hide 
}
on 1:dialog:psybnc.pending:sclick:1:{ if (progress: isin $did(1).seltext) { did -v $dname 2 | did -h $dname 3,4 } | if (request: isin $did(1).seltext) { did -v $dname 3,4 | did -h $dname 2 } }
on 1:dialog:psybnc.pending:sclick:2:{ var %nickname = $gettok($did(1).seltext,2,32) | var %filename = $gettok($did(1).seltext,3,32) | .quote dcccancel %nickname : $+ %filename }
on 1:dialog:psybnc.pending:sclick:3:{ var %id = $remove($gettok($did(1).seltext,5,32),$chr(41)) | var %nickname = $gettok($did(1).seltext,2,32) | var %filename = $gettok($did(1).seltext,3,32) | .quote dccget %nickname : $+ %filename }
on 1:dialog:psybnc.pending:sclick:4:{ var %nickname = $gettok($did(1).seltext,2,32) | var %filename = $gettok($did(1).seltext,3,32) | .quote dccget S= $+ %nickname : $+ %filename }
}
