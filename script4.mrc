;-------------
; Slap Script
;-------------
alias F12 loadbuf -ro slaps 3 slaps.txt
alias slaps {
  if ($dialog(slaps)) { dialog -v slaps }
  else { dialog -dm slaps slaps }
}
alias getnlist {
  if ($devent == init) {
    var %nick 1
    var %chan $chan(0)
    while (%chan > 0) {
      did -a slaps 14 $chan(%chan)
      dec %chan
    }
    while ($nick($active,%nick)) {
      did -a slaps 9 $nick($active,%nick)
      inc %nick 1
    }
  }
  elseif ($devent == sclick) && ($did == 14) {
    var %nick 1
    did -r slaps 9
    while ($nick($did(14),%nick)) {
      did -a slaps 9 $nick($did(14),%nick)
      inc %nick 1
    }
    .halt
  }
  else {
    did -r slaps 9
    var %nick 1
    if ($did(slaps,14)) {
      while ($nick($did(slaps,14),%nick)) {
        did -a slaps 9 $nick($did(slaps,14),%nick)
        inc %nick 1
      }
    }
    elseif (!$did(slaps,14)) {
      while ($nick($active,%nick)) {
        did -a slaps 9 $nick($active,%nick)
        inc %nick 1
      }
    }
    did -r slaps 14
    var %chan $chan(0)
    while (%chan > 0) {
      did -a slaps 14 $chan(%chan)
      dec %chan
    }
  }
  if (%did(slaps,9) !ison $iif($did(slaps,14),$did(slaps,14),$chan)) { unset %did.9 | did -ra slaps 10 Nick Being Slapped: } 
}
dialog -l slaps {
  title "Slap Manager [/slaps] "
  size -1 -1 258 169
  option dbu
  icon C:\Windows\system32\shell32.dll, 43
  button Close, 1, 212 154 37 13, default cancel
  list 3, 1 9 169 142, size vsbar
  button Add Slap, 4, 2 154 37 13
  button "Delete Slap", 6, 44 154 37 13
  button Random Slap, 7, 128 154 37 13
  button Selected Slap, 8, 86 154 37 13
  button Mass Slap, 5, 170 154 37 13
  list 9, 172 22 84 118, size vsbar
  text "Slaps List", 2, 2 1 125 8
  combo 14, 172 9 84 12, sort drop
  edit "Nick Being Slapped:", 10, 172 141 84 10, read autohs
}
On *:Dialog:slaps:*:*:{
  if ($devent == init) {
    if ($did == 0) {
      if (!$isfile(slaps.txt)) { write slaps.txt with a large trout }
      getnlist
      loadbuf -ro slaps 3 slaps.txt
      did -ra slaps 2 Slap List - Total Slaps: $lines(slaps.txt)
      did -b slaps 7,8
    }
  }
  if ($devent == sclick) {
    if ($did == 3) {
      if (%did.9) { did -e slaps 8 }
    }
    if ($did == 4) {
      var %aslap $$?="Slap to add:"
      if ($read(slaps.txt,w,%aslap)) { echo -a 10Slap already exists. | .return }
      else {
        write slaps.txt %aslap
        loadbuf -ro slaps 3 slaps.txt
        did -ra slaps 2 Slap List - Total Slaps: $lines(slaps.txt)
      }
      dialog -v slaps
    }
    if ($did == 5) {
      if ($$?!="Mass slapping everyone in a channel can cause excess flood. Continue?" == $true) {
        var %nlist 1
        while ($nick($active,%nlist)) { 
          describe $active $nick($active,%nlist) $read(slaps.txt)
          inc %nlist
        }
      }
      dialog -v slaps
    }
    if ($did == 6) {
      write -ds $+ " $+ $did(3).seltext $+ " slaps.txt
      loadbuf -ro slaps 3 slaps.txt
      did -ra slaps 2 Slap List - Total Slaps: $lines(slaps.txt)
    }
    if ($did == 7) {
      describe $active slaps %did.9 $read(slaps.txt)
    }
    if ($did == 8) {
      if (!$did(3).seltext) { .return }
      describe $active slaps %did.9 $did(3).seltext
    }
    if ($did == 9) {
      set %did.9 $did(9).seltext
      if ($did(3).sel) { did -e slaps 8 }
      did -e slaps 7
      did -ra slaps 10 Nick Being Slapped: %did.9
    }
    if ($did == 14) {
      getnlist
    }  
  }
  if ($devent == close) {
    if ($did == 0) {
      unset %did.9
    }
  }
}
On *:Join:#: if ($dialog(slaps)) { getnlist }
On *:part: if ($dialog(slaps)) { getnlist }
On *:quit: if ($dialog(slaps)) { getnlist }
On *:kick: if ($dialog(slaps)) { getnlist }
On *:nick: if ($dialog(slaps)) { getnlist }
########
#Popups#
########
menu channel,nicklist {
  .Slapper Dialog:dialog -m slaps slaps
  -
}
;=========
;  mimic
;=========
on *:TEXT:*:#: {
  if ($left($1,1) == !) { halt }
  if (%mimic == 1) && ($nick == %mnick) {
    msg # $1-
  }
  elseif (%rmimic == 1) && ($nick == %mnick) {
    var %nintext $len($1-) + 1
    while (0 < %nintext) {
      var %msgreverse %msgreverse $+ $mid($1-, $+ %nintext $+ ,1)
      if ($mid($1-, $+ %nintext $+ ,1) == $chr(32)) { var %msgreverse %msgreverse $chr(32) }
      %nintext = %nintext - 1
    }
    msg # %msgreverse
  }
  elseif (%mimic == 1) && (# == %chnl) {
    msg # $1-
  }
  elseif (%rmimic == 1) && (# == %chnl) {
    var %nintext $len($1-) + 1
    while (0 < %nintext) {
      var %msgreverse %msgreverse $+ $mid($1-, $+ %nintext $+ ,1)
      if ($mid($1-, $+ %nintext $+ ,1) == $chr(32)) { var %msgreverse %msgreverse $chr(32) }
      %nintext = %nintext - 1
    }
    msg # %msgreverse
  }
}

menu nicklist {
  Mimicer:{
    dialog -am mimicerd mimicerd
  }
}

;, $did, xlocation ylocation length height
dialog mimicerd {
  title "MIMIC"
  size -1 -1 113 74
  option dbu
  text "Channel", 1, 5 26 35 8
  combo 2, 5 35 75 10, sort edit drop vsbar
  button "OK", 3, 85 34 20 12
  button "Copy on", 4, 5 48 50 12
  button "Reverse", 5, 60 48 50 12
  button "Copy off", 6, 5 61 50 12
  button "Rev off", 7, 60 61 50 12
  button "OK", 8, 85 11 20 12
  text "Nick", 9, 5 3 35 8
  combo 10, 5 12 75 10, sort edit drop vsbar
}

on *:dialog:mimicerd:init:*: {
  did -a $dname 2,10
  var %Allnicks $nick($active,0)
  while (%Allnicks > 0) {
    did -a $dname 10 $nick($active,%Allnicks)
    dec %Allnicks
  }
  var %Allchans $chan(0)
  while (%Allchans > 0) {
    did -a $dname 2 $chan(%Allchans)
    dec %Allchans
  }
}

on *:dialog:mimicerd:sclick:*: {
  if ($did == 3) { 
    if (!$did(2)) { unset %chnl }
    else {
      set %chnl $did(2)
    }
  }
  if ($did == 4) { set %mimic 1 }

  if ($did == 5) { set %rmimic 1 }

  if ($did == 6) { unset %mimic }

  if ($did == 7) { unset %rmimic }

  if ($did == 8) { 
    if (!$did(10)) { unset %mnick }
    else {
      set %mnick $did(10)
    }
  }
}
;=========
;  clock
;=========

; <----------------------- $Events ----------------------->

on *:load: {
  if ($version > 6.0) { 
    echo  Clock for mIRC succesfully loaded 
    wclock
    .timerchecks 0 1 check.s
  }
  else { 
    echo  Version 6.0 or higher required, get a newer version of mirc at  $+ http://www.mirc.com
    unload -rs $script
  }
} 

on *:unload: {
  if ($timer(wcl.upd)) .timerwcl.upd off
  if ($timer(checks)) .timerchecks off
  if ($window(@WClock)) window -c @WClock
  echo -s Clock for mIRC succesfully unloaded.
}

on *:start: {
  wclock
  .timerchecks 0 1 check.s
}

on *:APPACTIVE: {
  if ($appactive = $false) {
    if ($appstate == hidden) || ($appstate == minimized) || ($appstate == hidden) || ($appstate == tray) {
    }
    window -h @WClock
  }
  else window -o @WClock
}

; <----------------------- $Aliases ----------------------->

alias wclock {
  if (!$window(@WClock)) {
    if (!%wcl.x) {
      set %wcl.x 880
    }
    if (!%wcl.y) {
      set %wcl.y 20
    }
    window -poadhB +dL @WClock %wcl.x %wcl.y 80 30
    drawfill @WClock 1 1 1  1
  }
  wcl.upd
}

alias check.s {
  if ($time(ss) == 00) {
    .timerchecks off
    wcl.upd
    .timerwcl.upd 0 60 wcl.upd
  }
}

alias -l wcl.upd {
  drawrect -f @WClock 1 1 1 1 200 100
  drawrect -f @WClock 1 1 1 1 200 100
  drawpic @WClock 5 5 " $+ $scriptdirimg\ $+ $left($time(HH),1) $+ .bmp"
  drawpic @WClock 20 5 " $+ $scriptdirimg\ $+ $right($left($time(HH),2),1) $+ .bmp"
  drawpic @WClock 40 5 " $+ $scriptdirimg\ $+ sep.bmp"
  drawpic @WClock 45 5 " $+ $scriptdirimg\ $+ $left($time(nn),1) $+ .bmp"
  drawpic @WClock 60 5 " $+ $scriptdirimg\ $+ $right($left($time(nn),2),1) $+ .bmp"
}

alias -l wcl.kill {
  if ($timer(wcl.upd)) .timerwcl.upd off
  if ($timer(checks)) .timerchecks off
  if ($window(@WClock)) window -c @WClock
}

alias -l wcl.unload {
  if ($input(Are you sure that you want to unload Clock for mIRC Windows??,yw,About to Unload !) == $true) {
    echo -s Thank you for using my Clock for mIRC Windows
    .unload -rs $script
  }
}

alias -l wcl.move {
  if ($group(#wcl.move).status == off) { return } 
  if ($mouse.key & 1) {
    set %wcl.x $calc($mouse.dx - 40)
    set %wcl.y $calc($mouse.dy - 15)
    window @WClock %wcl.x %wcl.y 80 30
  }
}

; <----------------------- $Menu ----------------------->

menu @WClock { 
  mouse:wcl.move
  Close:wcl.kill
}

;===========
; textcolor
;===========
on 1:INPUT:*: {
  set %decfcol /
  if (%decsty == ON) { 
    if (%decfcol isin $left($1,1)) { goto THEEND } 
    if (%decmul == 0) { 
      say  $+ %deccol  $+ $1-
      { halt }
    }
    if (%decmul == 1) { 
      %clrlist = 2*3*14*4*13*5*12*6*2*7*10*2*4
      %altclrlist = 16*16*16*16*16*16*16*16*16*16*16*16*16
      %fnl = ""
      %txt = $replace($1-,$chr(32),$chr(1))
      %clr = 1
      %i = 1
      :start
      if ($mid(%txt,%i,1) != $null) {
        if ($gettok(%clrlist,%clr,42) == $null) { %clr = 1 }
        %fnl = %fnl $+ $chr(3) $+ $gettok(%clrlist,%clr,42) $+ , $+ $gettok(%altclrlist,%clr,42) $+ $mid(%txt,%i,1)
        inc %clr 1
        inc %i 1
        goto start
      }
      say $replace(%fnl,$chr(1),$chr(32))  
      { halt }
    }
    if (%decmul == 2) { 
      unset %textfinal
      set %rainbow $1-
      set %text.change 0
      :beginning
      inc %text.change
      if %text.change > $len(%rainbow) goto end
      :randomize
      set %rand1 $r(1,15)
      set %rand2 $r(1,15)
      if %rand1 == %rand2 goto randomize
      set %text2add  $+ %rand1 $+ , $+ %rand2 $+ $mid(%rainbow,%text.change,1) $+ 
      if (%text.change == 1) { set %textfinal %text2add }
      else set %textfinal %textfinal $+ %text2add
      goto beginning
      :end
      say %textfinal
      { halt }
    }
    if (%decmul == 3) { 
      %c = $1-
      set %c $replace(%c,a,4a)
      set %c $replace(%c,b,3B)
      set %c $replace(%c,c,6C) 
      set %c $replace(%c,d,7D) 
      set %c $replace(%c,e,4e) 
      set %c $replace(%c,f,12F) 
      set %c $replace(%c,g,13G) 
      set %c $replace(%c,h,6H) 
      set %c $replace(%c,i,4i) 
      set %c $replace(%c,j,J) 
      set %c $replace(%c,k,3K) 
      set %c $replace(%c,l,L) 
      set %c $replace(%c,m,4M) 
      set %c $replace(%c,n,6N)
      set %c $replace(%c,o,4o) 
      set %c $replace(%c,p,12P) 
      set %c $replace(%c,q,Q) 
      set %c $replace(%c,r,13R) 
      set %c $replace(%c,s,7S) 
      set %c $replace(%c,t,T) 
      set %c $replace(%c,u,4u) 
      set %c $replace(%c,v,V) 
      set %c $replace(%c,w,12W) 
      set %c $replace(%c,x,7X) 
      set %c $replace(%c,y,Y) 
      set %c $replace(%c,z,6z) 
      set %c $replace(%c,?,12¿15?) 
      say %c
      unset %c  
      { halt }
    }
    if (%decmul == 4) { 
      unset %final
      unset %endreverse
      set %sections $gettok($1-,0,32)
      :revstart
      if (%sections == 0) goto revend  
      set %reverseme $gettok($1-,%sections,32)
      set %length $len(%reverseme)
      set %backtext $mid(%reverseme,%length,1)  
      dec %length 1  
      :backstart
      if (%length == 0) goto backend
      set %tempback $mid(%reverseme,%length,1)
      set %backtext %backtext $+ %tempback 
      dec %length 1
      goto backstart
      :backend
      set %reversed_text %backtext
      set %temp %reversed_text
      set %final %final %temp
      dec %sections 1
      goto revstart  
      :revend
      set %endreverse %final
      say %final
      { halt }
    }
    if (%decmul == 5) { 
      set %ftalk $1-
      %ftalk = $replace(%ftalk,a,2å)
      %ftalk = $replace(%ftalk,b,3þ)
      %ftalk = $replace(%ftalk,c,4Ç)
      %ftalk = $replace(%ftalk,d,5Ð)
      %ftalk = $replace(%ftalk,e,6ë)
      %ftalk = $replace(%ftalk,f,7F)
      %ftalk = $replace(%ftalk,g,8G)
      %ftalk = $replace(%ftalk,h,9H)
      %ftalk = $replace(%ftalk,i,10î)
      %ftalk = $replace(%ftalk,j,11J)
      %ftalk = $replace(%ftalk,k,12K)
      %ftalk = $replace(%ftalk,l,13£)
      %ftalk = $replace(%ftalk,m,14M)
      %ftalk = $replace(%ftalk,n,15ñ)
      %ftalk = $replace(%ftalk,o,2ø)
      %ftalk = $replace(%ftalk,p,3¶)
      %ftalk = $replace(%ftalk,q,4Q)
      %ftalk = $replace(%ftalk,r,5®)
      %ftalk = $replace(%ftalk,s,6§)
      %ftalk = $replace(%ftalk,t,7T)
      %ftalk = $replace(%ftalk,u,8µ)
      %ftalk = $replace(%ftalk,v,9V)
      %ftalk = $replace(%ftalk,w,10W)
      %ftalk = $replace(%ftalk,x,11×)
      %ftalk = $replace(%ftalk,y,12¥)
      %ftalk = $replace(%ftalk,z,12Z)
      %ftalk = $replace(%ftalk,!,4!)
      %ftalk = $replace(%ftalk,?,4?)
      %ftalk = $replace(%ftalk,*,5*)
      %ftalk = $replace(%ftalk,^,6^)
      %ftalk = $replace(%ftalk,$,7$)
      %ftalk = $replace(%ftalk,@,9@)
      %ftalk = $replace(%ftalk,&,10&)
      %ftalk = $replace(%ftalk,",11")
      %ftalk = $replace(%ftalk,<,12<)
      %ftalk = $replace(%ftalk,>,13>!)
      SAY %ftalk
      { halt }
    }
    if (%decmul == 6) {
      set %i $replace($1-,$chr(32), ) | set %i $left(%i,200) | set %o $chr(3) $+ 4,1 | set %p 1 | set %c 1
      :loop
      set %o %o $+ $chr(3) $+ $gettok(4&7&8&9&11&13,%c,38) $+ $mid(%i,%p,1) 
      inc %p
      if ( $mid(%i,%p,1) !=  ) { inc %c }
      if ( %c > 6 ) { set %c 1 }
      if ( $mid(%i,%p,1) != $null ) { goto loop }
      say %o
      unset %o %i %p %c
      { halt }      
    }
    if (%decmul == 7) { 
      set %ftalker $1-
      %ftalker = $replace(%ftalker,a,å)
      %ftalker = $replace(%ftalker,b,þ)
      %ftalker = $replace(%ftalker,c,Ç)
      %ftalker = $replace(%ftalker,d,Ð)
      %ftalker = $replace(%ftalker,e,ë)
      %ftalker = $replace(%ftalker,f,F)
      %ftalker = $replace(%ftalker,g,G)
      %ftalker = $replace(%ftalker,h,H)
      %ftalker = $replace(%ftalker,i,î)
      %ftalker = $replace(%ftalker,j,J)
      %ftalker = $replace(%ftalker,k,K)
      %ftalker = $replace(%ftalker,l,£)
      %ftalker = $replace(%ftalker,m,M)
      %ftalker = $replace(%ftalker,n,ñ)
      %ftalker = $replace(%ftalker,o,ø)
      %ftalker = $replace(%ftalker,p,¶)
      %ftalker = $replace(%ftalker,q,Q)
      %ftalker = $replace(%ftalker,r,®)
      %ftalker = $replace(%ftalker,s,§)
      %ftalker = $replace(%ftalker,t,T)
      %ftalker = $replace(%ftalker,u,µ)
      %ftalker = $replace(%ftalker,v,V)
      %ftalker = $replace(%ftalker,w,W)
      %ftalker = $replace(%ftalker,x,×)
      %ftalker = $replace(%ftalker,y,¥)
      %ftalker = $replace(%ftalker,z,Z)
      %ftalker = $replace(%ftalker,!,!)
      %ftalker = $replace(%ftalker,?,?)
      %ftalker = $replace(%ftalker,*,*)
      %ftalker = $replace(%ftalker,^,^)
      %ftalker = $replace(%ftalker,$,$)
      %ftalker = $replace(%ftalker,@,@)
      %ftalker = $replace(%ftalker,&,&)
      %ftalker = $replace(%ftalker,",")
      %ftalker = $replace(%ftalker,<,<)
      %ftalker = $replace(%ftalker,>,>!)
      SAY %ftalker
      { halt }
    }
    else { goto THEEND }
  }
  :THEEND
}

alias comp79 if $dialog(comp79) == $null { dialog -ma comp79 comp79 }

alias comp79 if $dialog(comp79) == $null { dialog -ma comp79 comp79 }

dialog comp79 {
  title "Colour Texter [/colour]"
  size -1 -1 134 88
  option dbu
  icon icons\e-color.ico, 0
  button "Enable", 1, 4 7 60 10
  button "Disable", 2, 70 7 60 10
  button "Text One", 3, 4 20 40 10
  button "Test", 12, 48 20 15 10
  button "Text Two", 4, 70 20 40 10
  button "Test", 13, 114 20 15 10
  button "Text Three", 5, 4 33 40 10
  button "Test", 14, 48 33 15 10
  button "Text Four", 6, 70 33 40 10
  button "Test", 15, 114 33 15 10
  button "Text Five", 7, 4 46 40 10
  button "Test", 16, 48 46 15 10
  button "Text Six", 8, 70 46 40 10
  button "Test", 17, 114 46 15 10
  button "Text Seven", 9, 4 59 40 10
  button "Test", 18, 48 59 15 10
  button "Text Eight", 10, 70 59 40 10
  button "Test", 19, 114 59 15 10
  button "Close", 11, 94 75 38 11, ok
  box "", 20, 1 0 132 73
}

on 1:dialog:comp79:sclick:*: {
  if $did == 1 { .set %decsty on | .echo -a 14 *** ( 10Colour Texter Enabled  }
  if $did == 2 { .set %decsty Off | .echo -a 14 *** ( 10Colour Texter Disabled  }
  if $did == 3 { .echo 14 -a  *** Available colours are 01 12 23 34 45 56 67 78 89 910 1011 1112 1213 1314 1415 15 | .set %deccol $?="Enter a number <1-15>" | set %decmul 0 }
  if $did == 4 { .set %decmul 1 | echo 14 -a 14 *** ( 10Text Two Enabled  }
  if $did == 5 { .set %decmul 2 | echo 14 -a 14 *** ( 10Text Three Enabled  }
  if $did == 6 { .set %decmul 3 | echo 14 -a 14 *** ( 10Text Four Enabled  }
  if $did == 7 { .set %decmul 4 | echo 14 -a 14 *** ( 10Text Five Enabled  }
  if $did == 8 { .set %decmul 5 | echo 14 -a 14 *** ( 10Text Six Enabled  }
  if $did == 9 { .set %decmul 6 | echo 14 -a 14 *** ( 10Text Seven Enabled  }
  if $did == 10 { .set %decmul 7 | echo 14 -a 14 *** ( 10Text Eight Enabled  }
  if $did == 12 { .echo -a 14 *** ( 10Text One Available colours are 01 12 23 34 45 56 67 78 89 910 1011 1112 1213 1314 1415 15 12( Test reply for Text One )   }
  if $did == 13 { .echo -a 14 *** ( 10Text Two: 2,0(3,16 14,16T4,16e13,16s5,16t12,16 6,16r2,16e7,16p10,16l2,16y4,16 2,16f3,16o14,16r4,16 13,16T5,16e12,16x6,16t2,16 7,16T10,16w2,16o4,16 2,16) }
  if $did == 14 { .echo -a 14 *** ( 10Text Three: 10,2(12,7 4,5T6,9e5,7s9,7t13,14 5,4r4,15e10,5p1,12l11,4y7,2 14,5f6,2o2,5r8,15 7,5T7,13e14,5x4,11t2,14 3,7T9,4h11,4r4,13e13,6e15,6 11,3) }
  if $did == 15 {  .echo -a 14 *** ( 10Text Four: T4e7ST 13R4e12PLY 12F4o13R T4e7XT 12F4o4u13R ) }
  if $did == 16 { .echo -a 14 *** ( 10Text Reverse Five:1 ) eviF txeT rof ylper tseT ( %oz.lite.slogo }
  if $did == 17 { .echo -a 14 *** ( 10Text Six: ( 7T6ë6§7T 5®6ë3¶13£12¥ 7F2ø5® 7T6ë11×7T 6§10î11× ) }
  if $did == 18 {  .echo -a 14 *** ( 10Text Seven: 4,14(4 7T8e9s11t11 13r4e7p8l9y9 11f13o4r4 7T8e9x11t11 13S4e7v8e9n9 11)    }
  if $did == 19 { .echo -a 14 *** ( 10Text Eight: ( Të§T ®ë¶£¥ Fø® Të×T ëîGHT )  }
}

;==========
; password
;==========
on 1:load: {
  :start1
  set %yes.or.no $?="Do you want %name2 to be password protected (y/n)"
  if (%yes.or.no == y) goto set1
  elseif (%yes.or.no == n) {
    set %on.off OFF
    halt
  }
  elseif (%yes.or.no == $null) goto start1
  :set1 
  set %on.off ON
  set %pass $?*="What do you want the password to be?"
  if (%pass == $null) goto set1
  elseif (%pass != $null) {
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Password has been succesfully set as $+ $cxs(1) %pass 
    halt  
  }
}
on 1:start: {
  :start
  if (%yes.or.no == y) goto check
  if (%yes.or.no == n) halt
  elseif (%yes.or.no == $null) {
    set %yes.or.no $?="Do you want %name2 to be password protected (y/n)"
    if (%yes.or.no == y) goto set
    elseif (%yes.or.no == n) {
      set %on.off OFF
      halt
    }
    else goto start
  }
  :set 
  set %on.off ON
  set %pass $?*="What do you want the password to be?"
  if (%pass == $null) goto set
  elseif (%pass != $null) {
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Password has been succesfully set to $+ $cxs(1) %pass 
    halt  
  }
  :check 
  .splay %passprot
  set %check.pass $?*="Enter %name2 password :"
  if (%check.pass === %pass) {
    clear
    gcorrect
    halt  
  }
  elseif (%check.pass === $null) goto check
  elseif (%check.pass !=== %pass)  {
    echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Incorrect password
    set %check.pass $?*="Password incorrect. This is the last change, pls try again :" 
    if (%check.pass === %pass) {
      clear
      gcorrect
      halt  
    }
    else echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Incorrect password | /.splay %incorrect | .timer 1 2 /exit
  }  
}
alias passchange { .timer -m 1 1 timer_now }
alias timer_now { change.pass }
alias change.pass {
  if (%on.off == ON) {
    set %check.pass $?="Enter the old password :"
    if (%check.pass === %pass) {
      :set1
      set %pass $?*="Enter the new password :"
      if (%pass == $null) goto set1
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Password has been succesfully changed to $+ $cxs(1) %pass 
      halt
    }
    elseif (%check.pass != %pass) {
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Incorrect password 
      halt
    }
  }
  elseif (%on.off == OFF) {
    :start
    set %pass $$?*="Enter the new password :"
    if (%pass == $null) goto start
    else {
      echo -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Password has been succesfully set to $+ $cxs(1) %pass 
      set %on.off ON
      set %yes.or.no y
      halt
    }
  }
}
alias passprot { if ($dialog(apass)) dialog -v apass | else dialog -m apass apass }
dialog apass {
  title "Pass Protection [/passprot]"
  size -1 -1 295 204
  option pixels
  icon icons\key.ico, 0
  button "OK", 1, 148 174 68 23, ok
  button "Cancel", 2, 220 174 69 23
  box "", 3, 5 5 285 160
  text "Password Protection", 4, 20 22 120 20
  radio "On", 5, 150 20 35 20, group
  radio "Off", 6, 200 20 35 20
  box "Settings", 7, 10 50 275 100
  text "Password:", 8, 20 72 65 20
  edit "", 9, 90 70 80 20, pass autohs
  button "Change", 10, 190 70 60 20
  button "Password Generator", 11, 5 174 113 23
}
on *:dialog:apass:edit:*: {
  if ($did == 9) { set %pass $did(9) }
}
on *:dialog:apass:sclick:*: {
  if ($did == 5)  { .timer 1 0 set %yes.or.no y | did -e $dname 8,9,10 }
  if ($did == 6) { .timer 1 0 set %yes.or.no n | did -b $dname 8,9,10 }
  if ($did == 10) { passchange }
  if ($did == 11) { /dialog -m passgen passgen | /window @Passwords }
  if ($did == 2) { dialog -x $dname }
}
on *:dialog:apass:init:0: {
  if (%passs >= 1) { goto start }
  set %passs 0
  inc %passs 1
  if (%passs == 1) { startpass }
  :start
  did -o apass 9 1 %pass $did(9)
  did -b $dname 10 
  if (%yes.or.no == y) { did -c apass 5 1 %yes.or.no $did(5) | did -e $dname 8,9,10 }
  if (%yes.or.no == n) { did -c apass 6 1 %yes.or.no $did(6) | did -b $dname 8,9,10 } 
}
alias startpass { .timer -m 1 1 startpass_now }
alias startpass_now { set %yes.or.no $?="Do you want %name2 to be password protected? (y/n)" | if (%yes.or.no == y) { set %pass $?*="What do you want the password to be?" } | if (%yes.or.no == n) { did -b $dialog(apass) 8,9,10 | did -c $dialog(apass) 6 1 } 
}

dialog passgen {
  title "PassWord Generator"
  size -1 -1 100 58
  option dbu
  icon icons/key.ico, 0
  tab "Letters", 1, 4 1 90 40
  button "Generate password", 11, 18 21 60 14, tab 1
  tab "Numbers", 2
  button "Generate password", 12, 18 21 60 14, tab 2
  button "OK", 3, 31 44 38 12, ok
}
on *:DIALOG:passgen:sclick:11:{
  set %password $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) 
  echo @passwords Password Generator Generated The Password: %password 
}
on *:DIALOG:passgen:sclick:12:{
  set %password $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) 
  echo @passwords Password Generator Generated The Password: %password 
}
menu @passwords {
  Close:/window -c @passwords
}

;=============
; colorpicker
;=============
alias MakeColorIcons {
  var %c 0
  if (!$isdir($+($mircdir,Color))) { mkdir Color }
  while (%c <= 15) {
    if (!$window(@MakeColorIcons)) { window  -hBpf +d @MakeColorIcons -1 -1 68 68 }
    drawfill @MakeColorIcons %c %c 0 0 68 68
    if (!$isfile($+(Color\,ColorIcon,%c,.bmp))) { drawsave @MakeColorIcons $qt($+($mircdir,Color\,ColorIcon,%c,.bmp)) }
    inc %c
  }
  window -c @MakeColorIcons
}
alias ColorPicker {
  if (!$dialog(ColorPicker)) { dialog -m ColorPicker ColorPicker }
  else { dialog -v ColorPicker ColorPicker }
}
dialog ColorPicker {
  title "Color Picker"
  size -1 -1 90 88
  option dbu
  icon 1, 2 2 8 8
  icon 2, 13 2 8 8
  icon 3, 24 2 8 8
  icon 4, 35 2 8 8
  icon 5, 46 2 8 8
  icon 6, 57 2 8 8
  icon 7, 68 2 8 8
  icon 8, 79 2 8 8
  icon 9, 2 15 8 8
  icon 10, 13 15 8 8
  icon 11, 24 15 8 8
  icon 12, 35 15 8 8
  icon 13, 46 15 8 8
  icon 14, 57 15 8 8
  icon 15, 68 15 8 8
  icon 16, 79 15 8 8
  button "", 17, 4 4 4 4
  button "", 18, 15 4 4 4
  button "", 19, 26 4 4 4
  button "", 20, 37 4 4 4
  button "", 21, 48 4 4 4
  button "", 22, 59 4 4 4
  button "", 23, 70 4 4 4
  button "", 24, 81 4 4 4
  button "", 25, 4 17 4 4
  button "", 26, 15 17 4 4
  button "", 27, 26 17 4 4
  button "", 28, 37 17 4 4
  button "", 29, 48 17 4 4
  button "", 30, 59 17 4 4
  button "", 31, 70 17 4 4
  button "", 32, 81 17 4 4
  icon 33, 6 36 34 34
  icon 34, 50 36 34 34
  radio "Foreground", 35, 6 24 37 10
  radio "Background", 36, 48 24 37 10
  button "Close", 37, 56 74 29 12, cancel
  button "Accept", 38, 5 74 29 12
}
On *:Dialog:ColorPicker:Close:*: {
  unset %ColorPicker*
}
On *:Dialog:ColorPicker:Sclick:*: {
  if ($did >= 17) && ($did <= 32) {
    if ($did(ColorPicker,35).state == 1) { 
      did -g ColorPicker 33 $+(Color\,ColorIcon,$calc($did - 17),.bmp)
      set %ColorPickerFG $calc($did - 17)
    }
    if ($did(ColorPicker,36).state == 1) { 
      did -g ColorPicker 34 $+(Color\,ColorIcon,$calc($did - 17),.bmp)
      set %ColorPickerBG $calc($did - 17)
    }
  }
  if ($did == 38) {
    color normal text %ColorPickerFG
    color background %ColorPickerBG
  }
}
On *:Dialog:ColorPicker:init:*: {
  MakeColorIcons
  var %c = 0
  while %c <= 15 {
    did -g ColorPicker $calc(%c + 1) $+(Color\,ColorIcon,%c,.bmp)
    inc %c
  }
  did -c ColorPicker 35
  set %ColorPickerFG $color(normal text)
  set %ColorPickerBG $color(background)
  did -g ColorPicker 33 $+(Color\ColorIcon,$color(normal text),.bmp)
  did -g ColorPicker 34 $+(Color\ColorIcon,$color(background),.bmp)
}

;==========
; chanspy
;==========
alias chspy {
  dialog -dm spy spy
}
dialog spy {
  title "Channel Spy [/cspy]"
  size -1 -1 121 129
  option dbu
  icon icons\spy.ico, 0
  tab "Spy", 1, 5 5 110 103
  box "Channel to Spy", 20, 10 23 100 70, tab 1
  edit "", 6, 15 35 90 11, tab 1
  edit "", 22, 15 60 90 11, tab 1 read
  button "Add", 8, 16 78 30 11, tab 1
  button "Remove", 9, 74 78 30 11, tab 1
  tab "Receiver", 2
  box "Channel to report Spy", 10, 10 23 100 70, tab 2
  edit "", 11, 15 35 90 11, tab 2
  edit "", 13, 15 60 90 11, tab 2 read
  button "Add", 23, 16 78 30 11, tab 2
  button "Remove", 24, 74 78 30 11, tab 2
  tab "Setup", 26
  check "Texts", 31, 10 25 35 10, tab 26
  check "Actions", 27, 10 35 35 10, tab 26
  check "Joins", 28, 10 45 35 10, tab 26
  check "Parts", 29, 10 55 35 10, tab 26
  check "Quits", 30, 10 65 35 10, tab 26
  check "Nicks", 32, 10 75 35 10, tab 26
  check "Kicks", 33, 10 85 35 9, tab 26
  check "Ops", 34, 75 26 35 10, tab 26
  check "Deops", 35, 75 36 35 10, tab 26
  check "Voices", 36, 75 46 35 10, tab 26
  check "Devoices", 37, 75 56 35 10, tab 26
  check "Bans", 38, 75 66 35 10, tab 26
  check "Unbans", 39, 75 76 35 10, tab 26
  check "Topics", 40, 75 86 35 10, tab 26
  check "Modes", 41, 10 95 35 9, tab 26
  text "Setup Events to Spy", 48, 50 97 60 7, tab 26
  button "OK", 4, 6 113 39 12, ok
  button "Cancel", 5, 76 113 39 12
}
on 1:DIALOG:spy:init:*: {
  did -a spy 22 %spy1
  did -a spy 13 %spy2
  did -a spy 6 %spy1
  did -a spy 11 %spy2
  if (%chtext == ON) { did -c spy 31 }
  if (%chjoin == ON) { did -c spy 28 }
  if (%chaction == ON) { did -c spy 27 }
  if (%chpart == ON) { did -c spy 29 }
  if (%chquit == ON) { did -c spy 30 }
  if (%chnick == ON) { did -c spy 32 }
  if (%chkick == ON) { did -c spy 33 }
  if (%chops == ON) { did -c spy 34 }
  if (%chdeops == ON) { did -c spy 35 }
  if (%chvoice == ON) { did -c spy 36 }
  if (%chdevoice == ON) { did -c spy 37 }
  if (%chban == ON) { did -c spy 38 }
  if (%chunban == ON) { did -c spy 39 }
  if (%chtopic == ON) { did -c spy 40 }
  if (%chmode == ON) { did -c spy 41 }
}
on 1:DIALOG:spy:sclick:8: {
  set %spy1 $did(6)
  did -a spy 22 %spy1
  enable #chspy
}
on 1:DIALOG:spy:sclick:9: {
  did -r spy 22
  did -r spy 6
  unset %spy1
  disable #chspy
}
on 1:DIALOG:spy:sclick:23: {
  set %spy2 $did(11)
  did -a spy 13 %spy2
  enable #chspy
}
on 1:DIALOG:spy:sclick:24: {
  did -r spy 13
  did -r spy 11
  unset %spy2
  disable #chspy
}
on 1:DIALOG:spy:sclick:5: {
  dialog -x $dname
}
on 1:DIALOG:spy:sclick:*: {
  if ($did(31).state == 1) { set %chtext ON }
  else { unset %chtext }
  if ($did(28).state == 1) { set %chjoin ON }
  else { unset %chjoin }
  if ($did(27).state == 1) { set %chaction ON }
  else { unset %chaction }
  if ($did(29).state == 1) { set %chpart ON }
  else { unset %chpart }
  if ($did(30).state == 1) { set %chquit ON }
  else { unset %chquit }
  if ($did(32).state == 1) { set %chnick ON }
  else { unset %chnick }
  if ($did(33).state == 1) { set %chkick ON }
  else { unset %chkick }
  if ($did(34).state == 1) { set %chops ON }
  else { unset %chops }
  if ($did(35).state == 1) { set %chdeops ON }
  else { unset %chdeops }
  if ($did(36).state == 1) { set %chvoice ON }
  else { unset %chvoice }
  if ($did(37).state == 1) { set %chdevoice ON }
  else { unset %chdevoice }
  if ($did(38).state == 1) { set %chban ON }
  else { unset %chban }
  if ($did(39).state == 1) { set %chunban ON }
  else { unset %chunban }
  if ($did(40).state == 1) { set %chtopic ON }
  else { unset %chtopic }
  if ($did(41).state == 1) { set %chmode ON }
  else { unset %chmode }
}
#chspy off
on *:TEXT:*:%spy1: { 
  if (%chtext == ON) {  msg %spy2  14(3 $+ %spy1 $+ 14) 3×4 $$+ $nick $$+ 3×14 $1- }
  else { halt }
}
on *:ACTION:*:%spy1: {
  if (%chaction == ON) { msg %spy2  14(3 $+ %spy1 $+ 14) 6×4 $nick 14 $1- }
  else { halt }
}
on *:JOIN:%spy1: {
  if (%chjoin == ON) { msg %spy2 3*** $nick ( $+ $mask($address,3) $+ ) has joined %spy1 }
  else { halt }
}
on *:PART:%spy1: {
  if (%chpart == ON) { msg %spy2 3*** $nick ( $+ $mask($address,3) $+ ) has left %spy1 }
  else { halt }
}
on *:QUIT: { 
  if (%chquit == ON) { 
    if ( $nick ison %spy1 ) {  msg %spy2  14(3 $+ %spy1 $+ 14) 4*** $nick has quit IRC 3( $+ $1- $+ ) }
    else { halt }
  }
}
on *:NICK: { 
  if (%chnick == ON) { 
    if ($comchan($newnick,1) == %spy1) {  msg %spy2 3*** $nick is known as $newnick }
    else { halt }
  }
}
on *:KICK:%spy1: { 
  if (%chkick == ON) { msg %spy2 14(3 $+ %spy1 $+ 14) 3*** $knick was kicked by $nick ( $+ $2- $+ ) }
  else { halt }
}
on *:OP:%spy1: { 
  if (%chops == ON) { msg %spy2  14(3 $+ %spy1 $+ 14) 3*** $nick sets +o $opnick }
  else { halt }
}
on *:DEOP:%spy1: {
  if (%chdeops == ON) { msg %spy2  14(3 $+ %spy1 $+ 14) 3*** $nick sets -o $opnick }
  else { halt }
}
on *:VOICE:%spy1: {
  if (%chvoice == ON) { msg %spy2  14(3 $+ %spy1 $+ 14) 3*** $nick sets +v $vnick }
  else { halt }
}
on *:DEVOICE:%spy1: { 
  if (%chdevoice == ON) { msg %spy2 14(3 $+ %spy1 $+ 14) 3*** $nick sets -v $vnick }
  else { halt }
}
on *:BAN:%spy1: {
  if (%chban == ON) { msg %spy2  14(3 $+ %spy1 $+ 14) 3*** $nick sets +b $bnick }
  else { halt }
}
on *:UNBAN:%spy1: {
  if (%chunban == ON) { msg %spy2 14(3 $+ %spy1 $+ 14) 3*** $nick sets -b $1- }
  else { halt }
}
on *:TOPIC:%spy1: {
  if (%chtopic == ON) { msg %spy2 14(3 $+ %spy1 $+ 14) 3*** $nick changes topic to ' $+ $chan(%spy1).topic ' }
  else { halt }
}
on *:MODE:%spy1: { 
  if (%chmode == ON) { msg %spy2  14(3 $+ %spy1 $+ 14) 3*** $nick set mode $1- }
  else { halt }
}
#chspy end

;========
;  Love
;========
on 1:LOAD:/echo 0,13Love Meter Is Currently 8LOADED!4
alias loveMeter {
  set %loveMeter1 $$?="Ketik Nama Kamu"
  set %loveMeter2 $$?="Ketik Nama Pasangan Kamu"
  set %percintaan $rand(1,99) 
  if ((%percintaan >= 0) && (%percintaan < 10)) set %cinta-ork Sepertinya Anda Tidak Jodoh :-(
  if ((%percintaan >= 10) && (%percintaan < 20)) set %cinta-ork Hasil yg mengecewakan :-(
  if ((%percintaan >= 20) && (%percintaan < 30)) set %cinta-ork BeppPppPPPPpPppP - Bad Match - :-(
  if ((%percintaan >= 30) && (%percintaan < 40)) set %cinta-ork Coba cari yg lain :-(
  if ((%percintaan >= 40) && (%percintaan < 50)) set %cinta-ork Bisa Jadi anda Jodoh :-)
  if ((%percintaan >= 50) && (%percintaan < 60)) set %cinta-ork Lumayan baik :-)
  if ((%percintaan >= 60) && (%percintaan < 70)) set %cinta-ork Jodoh anda semakin Stabil, Lakukan Pendekatan :-)
  if ((%percintaan >= 70) && (%percintaan < 80)) set %cinta-ork Hasil yg cukup bagus :-)
  if ((%percintaan >= 80) && (%percintaan < 90)) set %cinta-ork Semoga bisa menjadi cinta sejatimu  :-)
  if ((%percintaan >= 90) && (%percintaan <= 99)) set %cinta-ork 4,0â™¥ Lanjutkan Kepelaminan 4,0â™¥ 
  echo 6,0H13ubungan 6A13ntara : 3 $+ %loveMeter1 4,0â™¥10 %loveMeter2
  echo 6,0K13ecocokannya 6a13dalah : 4 %percintaan $+ %  6 %cinta-ork
  unset %percintaan
  unset %loveMeter1
  unset %loveMeter2
  unset %cinta-ork
}

;==========
; pretext
;==========
alias pretext {
  if ($1) set %pretext $1-
  if (%pretext) && ($dialog(pretext)) {
    did -ra pretext 4 %pretext
    pretext.preview
    unset %pretext
  }
  dialog -m pretext pretext
}
dialog pretext {
  title "Preview Text [/pretext]"
  icon $icons(script.ico), 0
  size -1 -1 166 122
  option dbu
  edit "", 4, 27 5 137 10, autohs limit 720
  button "Copy", 8, 82 107 40 12, disable
  button "Close", 50, 124 107 40 12, cancel
  button "", 30, 0 0 0 0
  button "", 9, 0 0 0 0, hide ok
  button "", 5, 27 17 137 82
  text "Text:", 2, 3 5 23 8
  text "Preview:", 3, 3 17 23 8
  text You may use control codes: $crlf $+ CTRL+B/K/U etc.., 7, 3 105 76 15
  edit "", 1, 2 2 162 1
  edit "", 6, 2 101 162 1
}
on *:dialog:pretext:*:*:{
  if ($devent == init) {
    dll $mdx SetMircVersion $version
    dll $mdx MarkDialog $dname
    dll $mdx SetBorderStyle $dname 1,6 staticedge
    dll $mdx SetBorderStyle $dname 4 staticedge
    dll $mdx SetControlMDX $dname 5 window > $dialogs
    window -hpif @textpre
    did -a $dname 5 grab $window(@textpre).hwnd @textpre
    did -f $dname 4
    if (%pretext) {
      did -ra $dname 4 $v1
      did -e $dname 8
      pretext.preview
      unset %pretext
    }
  }
  elseif ($devent == edit) && ($did == 4) {
    pretext.preview
    if ($did($did)) did -e $dname 8
    else did -b $dname 8
  }
  elseif ($devent == sclick) {
    if ($did == 8) && ($did($dname,4)) clipboard $v1
  }
}
alias pretext.preview {
  var %i = 0, %w = @textpre,%y = 1,%t = $did(pretext,4), %f = Tahoma,%s = 10,%h = $calc($height(%t,%f,%s) +1)
  drawrect -nf %w $color(back) 1 0 0 $window(%w).w $window(%w).h
  if (%t != $null) {
    while (%y < $window(%w).h) {
      drawtext -npb %w $color(normal) $color(back) $qt(%f) %s $calc(2-(%i *($window(%w).w -6))) %y %t
      inc %y %h
      inc %i
    }
    drawrect -n %w $color(back) 2 0 0 $calc($window(%w).w -2) $calc($window(%w).h -2)
  }
  drawdot %w
}

;-----------
; Msg Block
;-----------

dialog msgblock_ {
  title "Message Blocker [/msgblock]"
  icon icons\error.ico
  size -1 -1 176 176
  option dbu
  box "Block", 1, 4 4 82 105
  check "Block all queries", 2, 8 14 50 10
  check "Block if msg contains:", 3, 8 26 65 10
  list 4, 8 38 74 50, sort size vsbar hsbar
  button "&Add", 5, 8 92 30 10
  button "&Remove", 6, 51 92 30 10
  box "Exempt", 7, 85 4 82 105
  check "Users in notify list", 8, 89 14 55 10
  check "Friends:", 9, 89 26 31 10
  list 10, 89 38 74 50, sort size vsbar hsbar
  button "&Add", 11, 90 92 30 10
  button "&Remove", 12, 133 92 30 10
  box "Options", 13, 4 105 163 47
  check "Send reject notice:", 14, 8 114 55 10
  edit "", 15, 63 114 100 10, autohs
  check "Echo rejected queries to active window", 16, 8 126 106 10
  check "Ignore queries for:", 19, 8 138 52 10
  edit "", 20, 63 138 26 10
  text "seconds", 21, 91 140 20 8
  button "&OK", 17, 101 158 30 12, ok
  button "&Cancel", 18, 137 158 30 12, cancel
}
on *:dialog:msgblock_:*:*:{
  if ($devent == init) {
    if ($readini($mb,block,all)) { did -c $dname 2 }
    if ($readini($mb,block,isin)) { did -c $dname 3 }
    .udlist_ 4 block words
    if ($readini($mb,exempt,notify)) { did -c $dname 8 }
    if ($readini($mb,exempt,list)) { did -c $dname 9 }
    .udlist_ 10 exempt friends
    if ($readini($mb,options,reject)) { did -c $dname 14 }
    if ($readini($mb,options,echo)) { did -c $dname 16 }
    did -a $dname 15 $readini($mb,options,notice)
    if ($readini($mb,options,ignore)) { did -c $dname 19 }
    did -a $dname 20 $readini($mb,options,secs)
    did -f $dname 17
  }
  if ($devent == sclick) {
    if ($did == 2) && ($did(2).state == 1) { did -u $dname 3 }
    if ($did == 3) && ($did(3).state == 1) { did -u $dname 2 }
    if ($did == 5) {
      var %t = $$?="Enter text (wildcards allowed) $crlf Separate multiple entries with a comma:"
      if ($numtok(%t,32) > 1) { %t = $replace(%t,$chr(32),$chr(160)) }
      .writeini $mb block words $iif($readini($mb,block,words),$+($ifmatch,$chr(44),%t),%t)
      udlist_ 4 block words
    }
    if ($did == 6) {
      var %tmp = $did(4).seltext
      if (%tmp) {
        if ($remtok($readini($mb,block,words),%tmp,44)) { 
          .writeini $mb block words $ifmatch 
        }
        else .remini $mb block words
        .udlist_ 4 block words
      }
    }
    if ($did == 11) {
      var %t = $$?="Enter nick/mask (wildcards allowed) $crlf Separate multiple entries with a comma:"
      if ($chr(32) !isin %t) {
        .writeini $mb exempt friends $iif($readini($mb,exempt,friends),$+($ifmatch,$chr(44),%t),%t)
        udlist_ 10 exempt friends
      }
    }
    if ($did == 12) {
      var %tmp = $did(10).seltext
      if (%tmp) {
        if ($remtok($readini($mb,exempt,friends),%tmp,44)) { 
          .writeini $mb exempt friends $ifmatch 
        }
        else .remini $mb exempt friends
        .udlist_ 10 exempt friends
      }
    }
    if ($did == 17) {
      ; OK button
      .writeini $mb block all $iif($did(2).state == 1,$true,$false)
      .writeini $mb block isin $iif($did(3).state == 1,$true,$false)
      .writeini $mb exempt notify $iif($did(8).state == 1,$true,$false)
      .writeini $mb exempt list $iif($did(9).state == 1,$true,$false)
      .writeini $mb options reject $iif($did(14).state == 1,$true,$false)
      .writeini $mb options notice $iif($did(15),$ifmatch,$readini($mb,options,notice))
      .writeini $mb options echo $iif($did(16).state == 1,$true,$false)
      .writeini $mb options ignore $iif($did(19).state == 1,$true,$false)
      .writeini $mb options secs $iif($did(20) isnum 1-,$ifmatch,$readini($mb,options,secs))
    }
  }
}
alias -l udlist_ {
  var %a = 1
  did -r $dname $1
  while ($gettok($readini($mb,$2,$3),%a,44)) {
    did -az $dname $1 $ifmatch
    inc %a
  }
}
alias -l match_text {
  ; find the god-like variable
  ; hint - it rhymes with 'spoonman'
  var %i = $numtok($readini($mb,block,words),44),%moonman
  while (%i > 0) {
    %moonman = $+(*,$replace($gettok($readini($mb,block,words),%i,44),$chr(160),$chr(32)),*) 
    if ($wildtok($1-,%moonman,1,44)) {
      return $true
    }
    dec %i
  }
}
alias -l isfriend {
  var %i = $numtok($readini($mb,exempt,friends),44),%j
  while (%i > 0) {
    %j = $gettok($readini($mb,exempt,friends),%i,44)
    if (%j iswm $address($1,5)) || ($1 == %j) { return $true }
    dec %i
  }
  return $false
}
alias -l block {
  var %i,%j
  if ($isfriend($1)) && ($readini($mb,exempt,list)) { %i = $true }
  if ($1 isnotify) && ($readini($mb,exempt,notify)) { %j = $true }
  if (%i) || (%j) { return $false }
  else { return $true }
}
alias msgblock dialog $iif($dialog(msgblock_),-v,-m) msgblock_ msgblock_
on ^*:open:?:{
  if ($readini($mb,block,all)) {
    if ($block($nick)) {
      if ($readini($mb,options,reject)) { .notice $nick $readini($mb,options,notice) }
      if ($readini($mb,options,echo)) { echo -at $pre Rejected query from  $+ $nick $+ : $1- }
      if ($readini($mb,options,ignore)) { .ignore $+(-pu,$readini($mb,options,secs)) $nick 2 }
      haltdef
    }
  }
  elseif ($readini($mb,block,isin)) && ($match_text($1-)) {
    if ($block($nick)) {
      if ($readini($mb,options,reject)) { .notice $nick $readini($mb,options,notice) }
      if ($readini($mb,options,echo)) { echo -at $pre Rejected query from  $+ $nick $+ : $1- }
      if ($readini($mb,options,ignore)) { .ignore $+(-pu,$readini($mb,options,secs)) $nick 2 }
      haltdef
    }
  }
}
alias -l mb return $+(",$scriptdirmsgblock.ini,")
}
