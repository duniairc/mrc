
alias -l c.set {
  if ($isid) return $readini -n $scriptdirccontrol.ini $1 $2
  else writeini $scriptdirccontrol.ini $1 $2 $3-
}
alias -l c.pcom {
  write -c $scriptdirtmptmptmp.txt $1-
  .play -c $me $scriptdirtmptmptmp.txt 0
  .timer 1 1 .remove $scriptdirtmptmptmp.txt
}

dialog c.chans {
  title "configure channel monitor"
  size -1 -1 365 295
  ;buttons
  button "save..", 1, 250 260 50 25, ok
  button "cancel..", 2, 305 260 50 25, cancel

  ;boxes
  box "  channels to monitor  ", 3, 10 10 345 240
  box "  caps kick  ", 4, 20 30 325 60
  box "  colour kick  ", 5, 20 100 325 60
  box "  swear kick  ", 6, 20 170 325 60

  ;radio
  radio "all", 7, 30 55 30 17, group
  radio "selected", 8, 80 55 60 17
  radio "all", 9, 30 125 30 17, group
  radio "selected", 10, 80 125 60 17
  radio "all", 11, 30 195 30 17, group
  radio "selected", 12, 80 195 60 17

  ;edit
  edit "", 13, 150 52 185 21, autohs
  edit "", 14, 150 122 185 21, autohs
  edit "", 15, 150 192 185 21, autohs

  ;label
  text "separate multiple channels by spaces, ie: #chan1 #chan2 #chan3", 16, 10 253 200 35
}

dialog c.control {
  title "caps / colour / swear text control"
  size -1 -1 400 405

  ;buttons
  button "add word..", 1, 10 335 60 25
  button "rem word..", 2, 73 335 60 25
  button "save..", 3, 287 370 50 25, ok
  button "cancel..", 4, 340 370 50 25, cancel
  button "channels..", 32, 10 370 70 25

  ;boxes
  box "  options  ", 5, 145 10 245 350
  box "  caps kick  ", 6, 160 25 215 90
  box "  colour kick  ", 7, 160 125 215 90
  box "  swear kick  ", 8, 160 225 215 65

  ;checks
  check "ban for", 9, 170 91 60 17
  check "ban for", 10, 170 191 60 17
  check "ban for", 11, 170 266 60 17

  ;list
  list 12, 10 30 123 300, size

  ;combos
  combo 13, 235 40 130 100, drop
  combo 14, 235 86 130 100, drop
  combo 15, 235 140 130 100, drop
  combo 30, 235 186 130 100, drop
  combo 31, 235 261 130 100, drop

  ;labels
  text "swear words / phrases..", 16, 15 10 120 17
  text "kick on", 17, 165 45 60 17, right
  text "kick on", 18, 165 145 60 17, right
  text "message", 20, 165 68 60 17, right
  text "message", 21, 165 168 60 17, right
  text "message", 22, 165 243 60 17, right

  ;edits
  edit "", 23, 234 63 132 21, autohs
  edit "", 24, 234 163 132 21, autohs
  edit "", 25, 234 238 132 21, autohs

  ;toggles
  box "  enable kick for  ", 26, 160 300 215 45
  check "caps", 27, 170 317 50 17
  check "colour", 28, 240 317 50 17
  check "swear", 29, 310 317 50 17
}

on *:dialog:c.control:init:0: {
  %c.i = 1
  :s
  if (%c.i <= $c.set(options, words)) {
    did -a $dname 12 $c.set(words, %c.i)
    inc %c.i
    goto s
  }
  if ($c.set(options, swearkick)) did -c $dname 29
  if ($c.set(options, capskick)) did -c $dname 27
  if ($c.set(options, colourkick)) did -c $dname 28
  ; caps
  did -a $dname 13 50 percent caps
  did -a $dname 13 75 percent caps
  did -a $dname 13 100 percent caps
  did -a $dname 13 custom ( $+ $c.set(caps, custom) percent)
  did -c $dname 13 $c.set(caps, percent)
  did -o $dname 23 1 $c.set(caps, message)
  if ($c.set(caps, ban)) did -c $dname 9
  did -a $dname 14 30 seconds
  did -a $dname 14 60 seconds
  did -a $dname 14 90 seconds
  did -a $dname 14 120 seconds
  did -c $dname 14 $c.set(caps, time)

  ; colour
  did -a $dname 15 1 different colour
  did -a $dname 15 5 different colours
  did -a $dname 15 10 different colours
  did -a $dname 15 custom ( $+ $c.set(colour, custom) colours)
  did -c $dname 15 $c.set(colour, number)
  did -o $dname 24 1 $c.set(colour, message)
  if ($c.set(colour, ban)) did -c $dname 10
  did -a $dname 30 30 seconds
  did -a $dname 30 60 seconds
  did -a $dname 30 90 seconds
  did -a $dname 30 120 seconds
  did -c $dname 30 $c.set(colour, time)

  ; swear
  did -o $dname 25 1 $c.set(swear, message)
  if ($c.set(swear, ban)) did -c $dname 11
  did -a $dname 31 30 seconds
  did -a $dname 31 60 seconds
  did -a $dname 31 90 seconds
  did -a $dname 31 120 seconds
  did -c $dname 31 $c.set(swear, time)
  unset %c.*
}

on *:dialog:c.control:sclick:3: {
  c.set options swearkick $did(29).state
  c.set options capskick $did(27).state
  c.set options colourkick $did(28).state
  c.set options words $did(12).lines
  %c.i = 1
  :s
  if (%c.i <= $did(12).lines) {
    c.set words %c.i $did(12, %c.i)
    inc %c.i
    goto s
  }
  c.set caps message $did(23)
  c.set caps percent $did(13, 1).sel
  if ($did(13, 1).sel == 4) c.set caps custom $right($left($did(13, 4), -9), -8)
  c.set caps ban $did(9).state
  c.set caps time $did(14, 1).sel
  c.set colour message $did(24)
  c.set colour number $did(15, 1).sel
  c.set colour custom $right($left($did(15, 4), -9), -8)
  c.set colour ban $did(10).state
  c.set colour time $did(30, 1).sel
  c.set swear message $did(25)
  c.set swear ban $did(11).state
  c.set swear time $did(31, 1).sel
  unset %c.*
}
on *:dialog:c.control:sclick:13: if ($did(13, 1).sel == 4) c.pcom did -o $dname 13 4 custom ( $!+ $$!?="enter percent (%) caps to kick on" percent) $chr(124) did -c $dname 13 4 $chr(124) dialog -v $dname
on *:dialog:c.control:sclick:15: if ($did(15, 1).sel == 4) c.pcom did -o $dname 15 4 custom ( $!+ $$!?="enter number of colours to kick on" colours) $chr(124) did -c $dname 15 4 $chr(124) dialog -v $dname
on *:dialog:c.control:sclick:1: c.pcom did -a $dname 12 $$!?="enter new swear word or phrase" $chr(124) did -c $dname 15 4 $chr(124) dialog -v $dname
on *:dialog:c.control:sclick:2: if ($did(12, 0).sel) did -d $dname 12 $did(12, 1).sel
on *:dialog:c.control:sclick:32: dialog -m c.chans c.chans

on *:dialog:c.chans:init:0: {
  if ($c.set(caps, channels) == all) {
    did -b $dname 13
    did -c $dname 7
    did -u $dname 8
  }
  else { 
    did -e $dname 13
    did -o $dname 13 1 $c.set(caps, channels)
    did -c $dname 8
    did -u $dname 7
  }
  if ($c.set(colour, channels) == all) {
    did -b $dname 14
    did -c $dname 9
    did -u $dname 10
  }
  else { 
    did -e $dname 14
    did -o $dname 14 1 $c.set(colour, channels)
    did -c $dname 10
    did -u $dname 9
  }  
  if ($c.set(swear, channels) == all) {
    did -b $dname 15
    did -c $dname 11
    did -u $dname 12
  }
  else { 
    did -e $dname 15
    did -o $dname 15 1 $c.set(swear, channels)
    did -c $dname 12
    did -u $dname 11
  }
}
on *:dialog:c.chans:sclick:7: did -b $dname 13
on *:dialog:c.chans:sclick:8: did -e $dname 13
on *:dialog:c.chans:sclick:9: did -b $dname 14
on *:dialog:c.chans:sclick:10: did -e $dname 14
on *:dialog:c.chans:sclick:11: did -b $dname 15
on *:dialog:c.chans:sclick:12: did -e $dname 15
on *:dialog:c.chans:sclick:1: {
  if ($did(7).state) || ($len($did(13)) == 0) c.set caps channels all
  else c.set caps channels $did(13)
  if ($did(9).state) || ($len($did(14)) == 0) c.set colour channels all
  else c.set colour channels $did(14)
  if ($did(11).state) || ($len($did(15)) == 0) c.set swear channels all
  else c.set swear channels $did(15)
  if ($dialog(c.control)) dialog -v c.control
}
on *:dialog:c.chans:sclick:2: if ($dialog(c.control)) dialog -v c.control

on @*:text:*:#: {
  if ($nick isop $chan) || ($nick isvo $chan) return
  %c.text = $strip($1-)
  if ($c.set(options, swearkick)) && (($c.set(swear, channels) == all) || ($findtok($c.set(swear, channels), $chan, 32))) { 
    %c.btime = $calc($c.set(swear, time) * 30)
    %c.i = 1
    :s1
    if (%c.i <= $c.set(options, words)) {
      if ($c.set(words, %c.i) isin %c.text) {
        if ($c.set(swear, ban)) ban -u $+ %c.btime $chan $address($nick, 3) 
        kick $chan $nick $c.set(swear, message)
        unset %c.*
        return
      }
      inc %c.i
      goto s1
    }
  }
  if ($c.set(options, capskick)) && ($len(%c.text) > 12) && (($c.set(caps, channels) == all) || ($findtok($c.set(caps, channels), $chan, 32))) { 
    %c.btime = $calc($c.set(caps, time) * 30)
    %c.max = $iif($c.set(caps, percent) > 3, $c.set(caps, custom), $gettok(50 75 100, $c.set(caps, percent), 32))
    %c.letters = 0
    %c.caps = 0
    %c.i = 1
    :s2
    if (%c.i <= $len(%c.text)) {
      if ($mid(%c.text, %c.i, 1) isletter) {
        inc %c.letters
        if ($mid(%c.text, %c.i, 1) === $upper($mid(%c.text, %c.i, 1))) inc %c.caps
      }
      inc %c.i
      goto s2
    }
    if ($calc((%c.caps / %c.letters) * 100) >= %c.max) {
      if ($c.set(caps, ban)) ban -u $+ %c.btime $chan $address($nick, 3)
      kick $chan $nick $c.set(caps, message)
      unset %c.*
      return
    }
  }
  if ($c.set(options, colourkick)) && (($c.set(colour, channels) == all) || ($findtok($c.set(colour, channels), $chan, 32))) { 
    %c.btime = $calc($c.set(colour, time) * 30)
    %c.max = $iif($c.set(colour, number) > 3, $c.set(colour, custom), $gettok(1 5 10, $c.set(colour, number), 32))
    if ($count($1-, ) >= %c.max) {
      if ($c.set(colour, ban)) ban -u $+ %c.btime $chan $address($nick, 3)
      kick $chan $nick $c.set(colour, message)
    }
  }
  unset %c.*
}
on @*:action:*:#: {
  if ($nick isop $chan) || ($nick isvo $chan) return
  %c.text = $strip($1-)
  if ($c.set(options, swearkick)) && (($c.set(swear, channels) == all) || ($findtok($c.set(swear, channels), $chan, 32))) { 
    %c.btime = $calc($c.set(swear, time) * 30)
    %c.i = 1
    :s1
    if (%c.i <= $c.set(options, words)) {
      if ($c.set(words, %c.i) isin %c.text) {
        if ($c.set(swear, ban)) ban -u $+ %c.btime $chan $address($nick, 3) 
        kick $chan $nick $c.set(swear, message)
        unset %c.*
        return
      }
      inc %c.i
      goto s1
    }
  }
  if ($c.set(options, capskick)) && ($len(%c.text) > 12) && (($c.set(caps, channels) == all) || ($findtok($c.set(caps, channels), $chan, 32))) { 
    %c.btime = $calc($c.set(caps, time) * 30)
    %c.max = $iif($c.set(caps, percent) > 3, $c.set(caps, custom), $gettok(50 75 100, $c.set(caps, percent), 32))
    %c.letters = 0
    %c.caps = 0
    %c.i = 1
    :s2
    if (%c.i <= $len(%c.text)) {
      if ($mid(%c.text, %c.i, 1) isletter) {
        inc %c.letters
        if ($mid(%c.text, %c.i, 1) === $upper($mid(%c.text, %c.i, 1))) inc %c.caps
      }
      inc %c.i
      goto s2
    }
    if ($calc((%c.caps / %c.letters) * 100) >= %c.max) {
      if ($c.set(caps, ban)) ban -u $+ %c.btime $chan $address($nick, 3)
      kick $chan $nick $c.set(caps, message)
      unset %c.*
      return
    }
  }
  if ($c.set(options, colourkick)) && (($c.set(colour, channels) == all) || ($findtok($c.set(colour, channels), $chan, 32))) { 
    %c.btime = $calc($c.set(colour, time) * 30)
    %c.max = $iif($c.set(colour, number) > 3, $c.set(colour, custom), $gettok(1 5 10, $c.set(colour, number), 32))
    if ($count($1-, ) >= %c.max) {
      if ($c.set(colour, ban)) ban -u $+ %c.btime $chan $address($nick, 3)
      kick $chan $nick $c.set(colour, message)
    }
  }
  unset %c.*
}
on @*:notice:*:#: {
  if ($nick isop $chan) || ($nick isvo $chan) return
  %c.text = $strip($1-)
  if ($c.set(options, swearkick)) && (($c.set(swear, channels) == all) || ($findtok($c.set(swear, channels), $chan, 32))) { 
    %c.btime = $calc($c.set(swear, time) * 30)
    %c.i = 1
    :s1
    if (%c.i <= $c.set(options, words)) {
      if ($c.set(words, %c.i) isin %c.text) {
        if ($c.set(swear, ban)) ban -u $+ %c.btime $chan $address($nick, 3) 
        kick $chan $nick $c.set(swear, message)
        unset %c.*
        return
      }
      inc %c.i
      goto s1
    }
  }
  if ($c.set(options, capskick)) && ($len(%c.text) > 12) && (($c.set(caps, channels) == all) || ($findtok($c.set(caps, channels), $chan, 32))) { 
    %c.btime = $calc($c.set(caps, time) * 30)
    %c.max = $iif($c.set(caps, percent) > 3, $c.set(caps, custom), $gettok(50 75 100, $c.set(caps, percent), 32))
    %c.letters = 0
    %c.caps = 0
    %c.i = 1
    :s2
    if (%c.i <= $len(%c.text)) {
      if ($mid(%c.text, %c.i, 1) isletter) {
        inc %c.letters
        if ($mid(%c.text, %c.i, 1) === $upper($mid(%c.text, %c.i, 1))) inc %c.caps
      }
      inc %c.i
      goto s2
    }
    if ($calc((%c.caps / %c.letters) * 100) >= %c.max) {
      if ($c.set(caps, ban)) ban -u $+ %c.btime $chan $address($nick, 3)
      kick $chan $nick $c.set(caps, message)
      unset %c.*
      return
    }
  }
  if ($c.set(options, colourkick)) && (($c.set(colour, channels) == all) || ($findtok($c.set(colour, channels), $chan, 32))) { 
    %c.btime = $calc($c.set(colour, time) * 30)
    %c.max = $iif($c.set(colour, number) > 3, $c.set(colour, custom), $gettok(1 5 10, $c.set(colour, number), 32))
    if ($count($1-, ) >= %c.max) {
      if ($c.set(colour, ban)) ban -u $+ %c.btime $chan $address($nick, 3)
      kick $chan $nick $c.set(colour, message)
    }
  }
  unset %c.*
}


