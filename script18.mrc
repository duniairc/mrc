;============
; notifylist
;============
alias notifylist {
  if ($dialog(notalist) == $null) { dialog -m notalist notalist }
}
dialog notalist {
  title "Notify List [/notifylist]"
  size -1 -1 318 202
  icon icons/notify.ico
  option pixels
  tab "Online", 7, 4 1 170 199
  list 1, 14 34 150 123, tab 7 sort size vsbar
  tab "Offline", 8
  list 2, 14 34 150 123, tab 8 sort size vsbar
  button "Button", 12, 69 385 75 25, ok
  check "Load On Connect", 10, 199 120 100 20
  button "Add", 6, 244 87 69 24, disable
  edit "", 5, 196 25 118 20
  check "Perform /whois", 13, 199 142 98 20
  text "Nickname:", 15, 197 9 50 16
  edit "", 16, 196 63 119 21
  text "Note:", 17, 197 47 28 16
  button "Remove", 18, 17 163 67 25, disable
  button "Expand", 9, 92 163 68 25
  button "OK", 3, 238 173 75 24, ok
}
on *:dialog:notalist:init:*:{ 
  if ($_vr(notalist,connect) == $null) { _vr notalist connect on } 
  n.olist
  if ($_vr(notalist,size) != small) { dialog -s notalist -1 -1 324 200 | _vw notalist size big | did -o notalist 9 1 Mini }
  if ($_vr(notalist,connect) == on) { did -c notalist 10 }
  if ($_vr(notalist,whois) == on) { did -c notalist 13 }
}
on *:active:*: {
  n.olist
}
alias -l n.olist {
  if ($dialog(notalist) != $null) { 
    did -r notalist 1,2 
    did -b notalist 18 
    var %n = $notify(0).ison
    var %n1 = 1
    while (%n1 <= %n) { $ishere(%n1) | inc %n1 1 } 
  }
}
alias -l ishere {
  if ($notify($1).ison == $true) { return did -a notalist 1 $notify($1) }
  elseif ($notify($1).ison == $false) { return did -a notalist 2 $notify($1) }
}
on *:dialog:notalist:dclick:*:{
  if ($did == 1) { query $did(notalist,1).seltext }
}
on *:dialog:notalist:edit:*:{
  if ($did == 5) && ($did(notalist,5).text != $null) { did -e notalist 6 }
  elseif ($did == 5) && ($did(notalist,5).text == $null) { did -b notalist 6 }
}
on *:dialog:notalist:sclick:*:{
  if ($did == 1) { did -e notalist 18 }
  if ($did == 2) { did -e notalist 18 }  
  if ($did == 7) { n.olist }  
  if ($did == 8) { n.olist }  
  if ($did == 6) { notify $did(notalist,5).text $did(notalist,16).text | did -r notalist 5,16 }
  if ($did == 9) { 
    if ($_vr(notalist,size) != big) { dialog -s notalist -1 -1 324 200 | _vw notalist size big | did -o notalist 9 1 Mini }
    elseif ($_vr(notalist,size) == big) { dialog -s notalist -1 -1 180 200 | _vw notalist size small | did -o notalist 9 1 Expand }
  }
  if ($did == 10) { 
    if ($_vr(notalist,connect) != on) { _vw notalist connect on }
    elseif ($_vr(notalist,connect) == on) { _vw notalist connect off }
  } 
  if ($did == 13) { 
    if ($_vr(notalist,whois) != on) { _vw notalist whois on }
    elseif ($_vr(notalist,whois) == on) { _vw notalist whois off }
  } 
  if ($did == 18) { 
    if ($did(notalist,1).seltext != $null) { notify -r $did(notalist,1).seltext }
    elseif ($did(notalist,2).seltext != $null) { notify -r $did(notalist,2).seltext }
    n.olist  
  }
}
on *:notify:{
  if ($dialog(notalist) != $null) {
    if ($_vr(notalist,whois) == on) { whois $nick }  
    n.olist 
  }
}
on *:connect:{
  if ($_vr(notalist,connect) == $null) { _vr notalist connect on }
  if ($_vr(notalist,connect) == on) { notalist }
}
alias -l n.x {
  if ($_vr(notalist,x) != $null) { return $_vr(notalist,x) }
  else { return -1 }
}
alias -l n.y {
  if ($_vr(notalist,y) != $null) { return $_vr(notalist,y) }
  else { return -1 }
}
on *:dialog:notalist:mouse:*: {
  _vw notalist x $dialog(notalist).x
  _vw notalist y $dialog(notalist).y
}
alias add_notify {
  if ($dialog(add_notify) == $null) { dialog -m add_notify add_notify }
}
dialog add_notify {
  title "add notify"
  size -1 -1 205 108
  option pixels
  edit "", 1, 2 20 106 21
  edit "", 2, 3 58 199 21, autohs
  text "nickname", 3, 4 4 50 16
  text "note", 4, 4 42 29 16
  button "add", 5, 139 83 61 20, ok
  button "notify list", 6, 4 84 61 20
}
on *:dialog:add_notify:init:*:{
  did -o add_notify 1 1 %v.nick
  if ($dialog(notalist) != $null) { did -b add_notify 6 }
}
on *:dialog:add_notify:sclick:*:{
  if ($did == 5) { notify $did(add_notify,1).text $did(add_notify,2).text | did -r add_notify 1,2 | unset %v.nick }
  if ($did == 6) { notalist }
}

alias _vr {
  if ($exists(scripts\set.ini) == $false) { mkdir scripts | write -c scripts\set.ini }
  return $readini scripts\set.ini $$1 $$2 
}
alias _vw {
  if ($exists(scripts\set.ini) == $false) { mkdir scripts | write -c scripts\set.ini }
  writeini scripts\set.ini $$1 $$2 $$3-
}

alias quotemgr { var %x = $dialog($+(quotemgr,%t),quotemgr) }
alias quotemgr1 { dialog -m quotemgr quotemgr }
menu channel {
  -
  Quote Manager { quotemgr }
  -
}

dialog quotemgr1 {
  title "Quote Manager"
  size -1 -1 220 175
  option dbu
  edit "", 1, 5 74 210 81, multi return hsbar vsbar
  text "Delay:", 2, 5 162 16 8
  edit "1000", 3, 23 160 37 11, autohs center
  text "ms", 7, 62 162 11 8
  button "&Send", 4, 150 160 30 12, ok
  button "&Cancel", 5, 185 160 30 12, cancel
  edit "", 6, 0 0 0 0, hide disable read autohs
  list 9, 5 5 165 47, size vsbar
  button "New", 10, 177 6 37 12
  button "Save", 11, 177 20 37 12
  button "Delete", 12, 177 34 37 12
  button "Refresh", 13, 176 58 38 12
  combo 14, 175 73 37 50, hide size drop
  edit "", 15, 56 58 113 11
  edit "", 16, 5 58 47 11
  box "Type", 17, 4 52 50 19
  box "Title", 18, 55 52 116 19
  combo 8, 77 160 65 52, size drop
}

dialog quotemgr {
  title "Quote Manager"
  size -1 -1 220 175
  option dbu
  edit "", 1, 5 74 210 81, multi return hsbar vsbar
  text "Delay:", 2, 5 162 16 8
  edit "1000", 3, 22 160 20 11, autohs center
  text "ms", 7, 43 162 10 8
  button "&Send", 4, 150 160 30 12, ok
  button "&Cancel", 5, 185 160 30 12, cancel
  edit "", 6, 0 0 0 0, hide disable read autohs
  list 9, 5 5 165 47, size vsbar
  button "New", 10, 177 6 37 12
  button "Save", 11, 177 20 37 12
  button "Delete", 12, 177 34 37 12
  button "Refresh", 13, 176 58 38 12
  combo 14, 175 73 37 50, hide size drop
  edit "", 15, 56 58 113 11
  edit "", 16, 5 58 47 11
  box "Type", 17, 4 52 50 19
  box "Title", 18, 55 52 116 19
  combo 8, 81 160 65 52, size drop
  combo 19, 55 160 21 40, size drop
}

alias descmsg { .timerdsb 1 0 describe $1 : $2- }
ON *:PLAYEND: { if (quot*.tmp iswm $nopath($filename)) { .remove $filename } }
on 1:dialog:quotemgr:*:*:{
  if ($devent == init) { 
    did -ra $dname 15 | did -ra $dname 16
    var %txt.q = $query(0), %txt.c = $chan(0), %txt.h = 1, %txt.m = 0, %txt.a = 0
    while (%txt.h <= %txt.c) {
      inc %txt.m
      if (%txt.m == 1) { did -ra $dname 8 $chan(%txt.h) } | else { did -a $dname 8 $chan(%txt.h) }
      if ($chan(%txt.h) == $active) { %txt.a = %txt.m }
      inc %txt.h
    }
    %txt.h = 1
    while (%txt.h <= %txt.q) {
      inc %txt.m
      if (%txt.m == 1) { did -ra $dname 8 $query(%txt.q) } | else { did -a $dname 8 $query(%txt.q) }
      if ($query(%txt.q) == $active) { %txt.a = %txt.m }
      inc %txt.h
    }
    did -i $dname 19 1 msg
    did -i $dname 19 2 me
    did -c $dname 19 1
    did -c $dname 8 $iif(%txt.a != 0,%txt.a,1)
    if ($findfile($scriptdir,ircquote.txt,1)) {
      var %txt.all1, %txt.all2, %txt.all3
      var %txt.isi, %txt.hit = 1, %txt.total = $lines($shortfn($scriptdir\ircquote.txt)) 
      while (%txt.hit <= %txt.total) {
        %txt.isi = $read -l %txt.hit $shortfn($scriptdir\ircquote.txt)
        %txt.all1 = $gettok(%txt.isi,1,42)
        %txt.all2 = $gettok(%txt.isi,2,42)
        %txt.all3 = $gettok(%txt.isi,3,42)
        if (%txt.hit != 1) { did -a $dname 9 ·: %txt.all1 :: %txt.all2 :· | did -a $dname 14 %txt.hit } 
        else { 
          did -ra $dname 14 %txt.hit        
          did -ra $dname 16 %txt.all1
          did -ra $dname 15 %txt.all2 
          did -ra $dname 9 ·: %txt.all1 :: %txt.all2 :·
          var %txt.baris1 = $numtok(%txt.all3,160)
          var %txt.hit1 = 1
          while (%txt.hit1 <= %txt.baris1) {
            did -i $dname 1 %txt.hit1 $gettok(%txt.all3,%txt.hit1,160)
            inc %txt.hit1     
          } 
        }
        inc %txt.hit
      }
      did -c $dname 14 1 | did -c $dname 9 1
    }
  }
  if ($devent == sclick) {
    if ($did == 9) { 
      did -ra $dname 1 
      did -c $dname 14 $did(9).sel 
      var %txt.isi = $read -l $did(14).seltext $shortfn($scriptdir\ircquote.txt)
      var %txt.all1, %txt.all2, %txt.all3
      %txt.all1 = $gettok(%txt.isi,1,42)
      %txt.all2 = $gettok(%txt.isi,2,42)
      %txt.all3 = $gettok(%txt.isi,3,42)
      did -ra $dname 16 %txt.all1
      did -ra $dname 15 %txt.all2 
      var %txt.baris1 = $numtok(%txt.all3,160)
      var %txt.hit1 = 1
      while (%txt.hit1 <= %txt.baris1) {
        did -i $dname 1 %txt.hit1 $gettok(%txt.all3,%txt.hit1,160)
        inc %txt.hit1     
      } 
      did -a $dname 12 Delete
    }

    if ($did == 10) { 
      did -ra $dname 16
      did -ra $dname 15
      did -ra $dname 1
      did -c $dname 14 0 | did -c $dname 9 0
      did -a $dname 12 Cancel      
    }  
    if ($did == 4) { 
      if $calc($query(0) + $chan(0)) > 0 {
        var %t = $shortfn($scriptdir) $+ quot $+ $ticks $+ .tmp | .savebuf -o $dname 1 %t 
        .play $iif($did(19).sel == 2,-a descmsg,-p) $did(8).seltext %t $did(3)    
      }
    }

    if ($did == 13) { 
      if $did(12).text == Delete {
        if $did(9).sel != 0 {
          var %txt.isi = $read -l $did(14).seltext $shortfn($scriptdir\ircquote.txt)
          var %txt.all1, %txt.all2, %txt.all3
          %txt.all1 = $gettok(%txt.isi,1,42)
          %txt.all2 = $gettok(%txt.isi,2,42)
          %txt.all3 = $gettok(%txt.isi,3,42)
          did -ra $dname 1 
          did -ra $dname 16 %txt.all1
          did -ra $dname 15 %txt.all2 
          var %txt.baris1 = $numtok(%txt.all3,160)
          var %txt.hit1 = 1
          while (%txt.hit1 <= %txt.baris1) {
            did -i $dname 1 %txt.hit1 $gettok(%txt.all3,%txt.hit1,160)
            inc %txt.hit1     
          } 
        }
      }
    }

    if ($did == 11) { 
      if ($did(15) != $null) && ($did(16) != $null) {
        var %txt.save = $did(16) $+ $chr(42) $+ $did(15)  $+ $chr(42)
        var %txt.isi, %txt.hit = 1, %txt.line = $did(1).lines
        while (%txt.hit <= %txt.line) {
          %txt.isi = %txt.isi $+ $iif(%txt.hit != 1,$chr(160)) $+ $did(1,%txt.hit)
          inc %txt.hit     
        }  
        %txt.save = %txt.save $+ %txt.isi
        if $did(12).text != Cancel {
          if $did(14).sel != 0 {
            write -dl $+ $did(14).sel $shortfn($scriptdir) $+ ircquote.txt
          }
        }
        write $shortfn($scriptdir) $+ ircquote.txt %txt.save
        sorttxt $shortfn($scriptdir) $+ ircquote.txt
        did -a $dname 12 Delete 
        ;Refresh List

        var %txt.aktif = 0, %txt.all1, %txt.all2, %txt.all3, %txt.alla1, %txt.alla2, %txt.alla3
        var %txt.isi, %txt.hit = 1, %txt.total = $lines($shortfn($scriptdir\ircquote.txt)) 
        while (%txt.hit <= %txt.total) {
          %txt.isi = $read -l %txt.hit $shortfn($scriptdir\ircquote.txt)
          %txt.all1 = $gettok(%txt.isi,1,42)
          %txt.all2 = $gettok(%txt.isi,2,42)
          %txt.all3 = $gettok(%txt.isi,3,42)
          if %txt.isi == %txt.save { %txt.aktif = %txt.hit | %txt.alla1 = %txt.all1 | %txt.alla2 = %txt.all2 | %txt.alla3 = %txt.all3 }
          if (%txt.hit != 1) { did -a $dname 9 ·: %txt.all1 :: %txt.all2 :· | did -a $dname 14 %txt.hit } 
          else { 
            did -ra $dname 14 %txt.hit        
            did -ra $dname 9 ·: %txt.all1 :: %txt.all2 :·
          }
          inc %txt.hit
        }
        if %txt.aktif != 0 { 
          did -c $dname 9 %txt.aktif | did -c $dname 14 %txt.aktif 
          did -ra $dname 16 %txt.alla1
          did -ra $dname 15 %txt.alla2 
          did -ra $dname 1
          var %txt.baris1 = $numtok(%txt.alla3,160)
          var %txt.hit1 = 1
          while (%txt.hit1 <= %txt.baris1) {
            did -i $dname 1 %txt.hit1 $gettok(%txt.alla3,%txt.hit1,160)
            inc %txt.hit1     
          }         
        }     
      } 
    }
    if ($did == 12) {
      if $did(12).text == Cancel {
        did -a $dname 12 Delete
        did -c $dname 14 0
        did -c $dname 9 0
      }
      else {
        if $did(9).sel != 0 {
          write -dl $+ $did(9).sel $shortfn($scriptdir) $+ ircquote.txt
          ;echo test write -dl $+ $did(9).sel $shortfn($scriptdir) $+ ircquote.txt
          did -ra $dname 15 | did -ra $dname 16
          did -ra $dname 1
          if ($findfile($scriptdir,ircquote.txt,1)) {
            var %txt.all1, %txt.all2, %txt.all3
            var %txt.isi, %txt.hit = 1, %txt.total = $lines($shortfn($scriptdir\ircquote.txt)) 
            while (%txt.hit <= %txt.total) {
              %txt.isi = $read -l %txt.hit $shortfn($scriptdir\ircquote.txt)
              %txt.all1 = $gettok(%txt.isi,1,42)
              %txt.all2 = $gettok(%txt.isi,2,42)
              %txt.all3 = $gettok(%txt.isi,3,42)
              if (%txt.hit != 1) { did -a $dname 9 ·: %txt.all1 :: %txt.all2 :· | did -a $dname 14 %txt.hit } 
              else { 
                did -ra $dname 14 %txt.hit        
                did -ra $dname 16 %txt.all1
                did -ra $dname 15 %txt.all2 
                did -ra $dname 9 ·: %txt.all1 :: %txt.all2 :·
                var %txt.baris1 = $numtok(%txt.all3,160)
                var %txt.hit1 = 1
                while (%txt.hit1 <= %txt.baris1) {
                  did -i $dname 1 %txt.hit1 $gettok(%txt.all3,%txt.hit1,160)
                  inc %txt.hit1     
                } 
              }
              inc %txt.hit
            }
            if %txt.total > 0 { did -c $dname 14 1 | did -c $dname 9 1 }
          }
        }
        if %txt.total == 0 { did -ra $dname 9 | did -ra $dname 14 }
      }
    }
  }
}

;=========
; alarm
;=========

alias alarm.sys dialog -m alarm alarm
dialog alarm {
  title "Alarm System [/alarm.sys]"
  size -1 -1 116 70
  option dbu
  icon icons\warn.ico, 0
  box "Alarm time", 2, 2 2 54 25
  edit "", 3, 6 12 25 10
  radio "On", 69, 36 8 15 8, push
  radio "Off", 96, 36 17 15 8, push
  box "Message", 5, 60 2 54 25
  check "", 6, 64 12 8 9
  edit "", 7, 73 12 37 9, autohs
  box "Play sound", 8, 2 29 112 25
  check "", 9, 6 39 8 9
  edit "", 10, 16 39 68 9, autohs
  button "Browse", 11, 87 38 22 10
  button "Close", 666, 78 57 35 11, ok
}
on *:dialog:alarm:*:*: {
  if ($devent == init) {
    if (!$did(3).text) did -u $dname 69 | did -u $dname 96 | did -b $dname 69 | did -b $dname 96 | if (%alarm.time) { did -a $dname 3 %alarm.time | did -e $dname 69 | did -e $dname 96 } | if (%alarm == on) { did -u $dname 96 | did -c $dname 69 } | if (%alarm == off) { did -u $dname 69 | did -c $dname 96 }
    if (%alarm.msg == on) { did -c $dname 6 | did -e $dname 7 } | if (!%alarm.msg) { did -u $dname 6 | did -b $dname 7 } | if (%alarm.snd == on) { did -c $dname 9 | did -e $dname 10 } | if (!%alarm.snd) { did -u $dname 9 | did -b $dname 10 } | did -a $dname 7 %alarm.message | did -a $dname 10 %alarm.sound
  }
  if ($devent == sclick) { if ($did == 69) { did -u $dname 96 | alarm | set %alarm on } | if ($did == 96) { did -u $dname 69 | .timerALARM off | set %alarm off } | if ($did == 6) { if ($did(6).state == 1) { did -e $dname 7 | set %alarm.msg on | set %alarm.message $did(7).text } | if ($did(6).state == 0) { did -b $dname 7 | unset %alarm.msg } } | if ($did == 9) { if ($did(9).state == 1) { did -e $dname 10 | set %alarm.snd on | set %alarm.sound $did(10).text } | if ($did(9).state == 0) { did -b $dname 10 | unset %alarm.snd } } | if ($did == 11) .set %alarm.sound $sfile(*.mp3;*.wav;*.mid,- Alarm Sound,ok >>) | did -r $dname 10 | did -a $dname 10 %alarm.sound | if ($did == 999) { dialog -m aboutalarm aboutalarm } }
  if ($devent == edit) { if ($did == 7) { .set %alarm.message $did(7).text } | if ($did == 3) { .set %alarm.time $did(3).text | did -e $dname 69 | did -e $dname 96 } }
  if ($devent == sclick) && ($did == 666) { if ($did(6).state == 1) && (!$did(7).text) { halt $input(Alarm message on! $crlf $+ Please define a message!,532,- Alarm System) } | if ($did(9).state == 1) && (!$did(10).text) { halt $input(Alarm sound on! $crlf $+ Please select a sound - or turn alarm sound off!,532,- Alarm System) } | if ($did(3).text isalpha) { halt $input(Alarm time must be a numeric value! $crlf eg.: 16:30,532,- Alarm System)  } }
}
alias alarm { if (%alarm.snd) { .timerALARM $did(3).text 1 1 .splay %alarm.sound } | if (%alarm.msg) { .timerALARM2 $did(3).text 1 1 echo -a  $+ $colour(info) $+ *** Alarm: %alarm.message } }
alias alarmpopups { if (%alarm.snd) { .timerALARM %alarm.time 1 1 .splay %alarm.sound } | if (%alarm.msg) { .timerALARM2 %alarm.time 1 1 echo -a  $+ $colour(info) $+ *** Alarm: %alarm.message } }
