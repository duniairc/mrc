#sounds on
on *:start: { if (%soundstart == ON) { .splay %sound-start } }
on *:connect: { if (%soundconnect == ON) { .splay %sound-connect } }
on *:disconnect: { if (%sound-discon == ON) { .splay %sound-discon } }
on *:join:#:{ if ($nick == $me) && (%soundjoin == ON) { .splay %sound-join } }
on *:part:#:{ if ($nick == $me) && (%soundpart == ON) { .splay %sound-part } }
on *:open:?:{ if (%soundquery == ON) { .splay %sound-query } }
on *:kick:#:{ if ($knick == $me) && (%soundkick == ON) { .splay %sound-kick } }
on *:ban:#:{
  if (%soundban == ON) {
    set %cfkball2 0
    :kbsecond
    inc %cfkball2
    if ($ialchan($banmask,#,%cfkball2).nick) {
      if ($ialchan($banmask,#,%cfkball2).nick == $me) { .splay %sound-ban }
      goto kbsecond
    }
    else { goto end }
  }
  :end
  unset %cfkball2 %bannednick
}
on *:op:#:{ if ($opnick == $me) && (%soundopv == ON) { .splay %sound-opv } }
on *:voice:#:{ if ($vnick == $me) && (%soundopv == ON) { .splay %sound-opv } }
on *:TEXT:*:#: {
  if (* [ $+ [ $me ] ] $+ * iswm $1-) && (%soundcall == ON) { .splay %sound-call }
}
on *:action:*:#: {
  if (* [ $+ [ $me ] ] $+ * iswm $1-) && (%soundcall == ON) { .splay %sound-call }
}
#sounds end
dialog themes {
  size -1 -1 200 120
  title "Themes"
  option dbu
  icon %aria
  box "" 1, 5 0 190 115
  text "Themse:" 2, 15 10 20 10
  list 3, 10 17 60 85 , sort , vsbar
  icon 4, 75 5 110 100
  button "Use selected theme" 5, 10 100 60 10 , default
  button "Close" 6, 75 100 40 10 , cancel
}
on 1:dialog:themes:*:*:{
  if ($devent == init) { var %tmp = $finddir(themes,*.*,0,1,themeveiw $1-) }
  if ($devent == sclick) && ($did == 3) {
    did -g $dname 4 $mircdirThemes\ $+ $did(3).seltext $+ \nombre.bmp
  }
  if ($devent == sclick) && ($did == 5) {
    var %setback1 $readini $mircdirThemes\ $+ $did(3).seltext $+ \set.ini set-theme set1
    %setback1
    var %setback2 $readini $mircdirThemes\ $+ $did(3).seltext $+ \set.ini set-theme set2
    %setback2
    var %setback3 $readini $mircdirThemes\ $+ $did(3).seltext $+ \set.ini set-theme set3
    %setback3
    var %setback4 $readini $mircdirThemes\ $+ $did(3).seltext $+ \set.ini set-theme set4
    %setback4
    var %setback5 $readini $mircdirThemes\ $+ $did(3).seltext $+ \set.ini set-theme set5
    %setback5
    var %setback6 $readini $mircdirThemes\ $+ $did(3).seltext $+ \set.ini set-theme set6
    %setback6
  }
}
alias themeveiw {
  did -a themes 3 $replace($nopath($1-),$chr(95),$chr(32))
  did -c themes 3 1
  did -g themes 4 $mircdirThemes\ $+ $did(3).seltext $+ \nombre.bmp
}
dialog setfont {
  size -1 -1 187 120
  option dbu
  title "Fantasic Font Setting"
  icon %set
  box "" 101, 5 5 45 98
  box "" 102, 49 5 45 98
  box "" 103, 93 5 45 98
  box "" 104, 137 5 44 98
  box "Set on the pleace of:" 100, 5 5 176 98
  text "A,a:" 31, 12 17 10 7
  text "B,b:" 32, 12 29 10 7
  text "C,c:" 33, 12 41 10 7
  text "D,d:" 34, 12 53 10 7
  text "E,e:" 35, 12 65 10 7
  text "F,f:" 36, 12 77 10 7
  text "G,g:" 37, 12 89 10 7
  text "H,h:" 38, 55 17 10 7
  text "I,i:" 39, 55 29 10 7
  text "J,j:" 40, 55 41 10 7
  text "K,k:" 41, 55 53 10 7
  text "L,l:" 42, 55 65 10 7
  text "M,m:" 43, 55 77 11 7
  text "N,n:" 44, 55 89 10 7
  text "O,o:" 45, 99 17 10 7
  text "P,p:" 46, 99 29 10 7
  text "Q,q:" 47, 99 41 10 7
  text "R,r:" 48, 99 53 10 7
  text "S,s:" 49, 99 65 10 7
  text "T,t:" 50, 99 77 10 7
  text "U,u:" 51, 99 89 10 7
  text "V,v:" 52, 143 17 10 7
  text "W,w:" 53, 143 29 12 7
  text "X,x:" 54, 143 41 10 7
  text "Y,y:" 55, 143 53 10 7
  text "Z,z:" 56, 143 65 10 7
  text "Ch:" 57, 143 77 10 7
  text "Sh:" 58, 143 89 10 7
  combo 1, 25 15 20 50 , drop
  combo 2, 25 27 20 50 , drop
  combo 3, 25 39 20 50 , drop
  combo 4, 25 51 20 50 , drop
  combo 5, 25 63 20 50 , drop
  combo 6, 25 75 20 50 , drop
  combo 7, 25 87 20 50 , drop
  combo 8, 68 15 20 50 , drop
  combo 9, 68 27 20 50 , drop
  combo 10, 68 39 20 50 , drop
  combo 11, 68 51 20 50 , drop
  combo 12, 68 63 20 50 , drop
  combo 13, 68 75 20 50 , drop
  combo 14, 68 87 20 50 , drop
  combo 15, 112 15 20 50 , drop
  combo 16, 112 27 20 50 , drop
  combo 17, 112 39 20 50 , drop
  combo 18, 112 51 20 50 , drop
  combo 19, 112 63 20 50 , drop
  combo 20, 112 75 20 50 , drop
  combo 21, 112 87 20 50 , drop
  combo 22, 157 15 20 50 , drop
  combo 23, 157 27 20 50 , drop
  combo 24, 157 39 20 50 , drop
  combo 25, 157 51 20 50 , drop
  combo 26, 157 63 20 50 , drop
  combo 27, 157 75 20 50 , drop
  combo 28, 157 87 20 50 , drop
  check "Use Fantasic Font" 60, 20 107 51 10 
  button "OK" 61, 115 107 30 10 ,ok , default
  button "Help" 62 , 150 107 30 10
}
on 1:dialog:setfont:init:*:{
  if (%fantastico == ON) did -c $dname 60
  did -a $dname 1 $chr(97)
  did -a $dname 1 $chr(65)
  did -a $dname 1 $chr(224) 
  did -a $dname 1 $chr(225)
  did -a $dname 1 $chr(226)
  did -a $dname 1 $chr(227)
  did -a $dname 1 $chr(228)
  did -a $dname 1 $chr(229)
  did -a $dname 1 $chr(192)
  did -a $dname 1 $chr(193)
  did -a $dname 1 $chr(194) 
  did -a $dname 1 $chr(195)
  did -a $dname 1 $chr(196)
  did -a $dname 1 $chr(197)
  did -c $dname 1 %setfont-a
  did -a $dname 2 $chr(98)
  did -a $dname 2 $chr(66)
  did -a $dname 2 $chr(223)
  did -c $dname 2 %setfont-b
  did -a $dname 3 $chr(99)
  did -a $dname 3 $chr(67)
  did -a $dname 3 $chr(162)
  did -a $dname 3 $chr(169)
  did -a $dname 3 $chr(231)
  did -a $dname 3 $chr(199)
  did -c $dname 3 %setfont-c
  did -a $dname 4 $chr(100)
  did -a $dname 4 $chr(68)
  did -c $dname 4 %setfont-d
  did -a $dname 5 $chr(101)
  did -a $dname 5 $chr(69)
  did -a $dname 5 $chr(128)
  did -a $dname 5 $chr(232)
  did -a $dname 5 $chr(233)
  did -a $dname 5 $chr(234)
  did -a $dname 5 $chr(235)
  did -a $dname 5 $chr(200)
  did -a $dname 5 $chr(201)
  did -a $dname 5 $chr(202)
  did -a $dname 5 $chr(203)
  did -c $dname 5 %setfont-e
  did -a $dname 6 $chr(102)
  did -a $dname 6 $chr(70)
  did -a $dname 6 $chr(131)
  did -c $dname 6 %setfont-f
  did -a $dname 7 $chr(103)
  did -a $dname 7 $chr(71)
  did -a $dname 7 $chr(208)
  did -c $dname 7 %setfont-g
  did -a $dname 8 $chr(104)
  did -a $dname 8 $chr(72)
  did -c $dname 8 %setfont-h
  did -a $dname 9 $chr(105)
  did -a $dname 9 $chr(73)
  did -a $dname 9 $chr(236)
  did -a $dname 9 $chr(237)
  did -a $dname 9 $chr(238)
  did -a $dname 9 $chr(239)
  did -a $dname 9 $chr(204)
  did -a $dname 9 $chr(205)
  did -a $dname 9 $chr(206)
  did -a $dname 9 $chr(207)
  did -c $dname 9 %setfont-i 
  did -a $dname 10 $chr(106)
  did -a $dname 10 $chr(74)
  did -c $dname 10 %setfont-j
  did -a $dname 11 $chr(107)
  did -a $dname 11 $chr(75)
  did -c $dname 11 %setfont-k
  did -a $dname 12 $chr(108)
  did -a $dname 12 $chr(76)
  did -a $dname 12 $chr(163)
  did -c $dname 12 %setfont-l
  did -a $dname 13 $chr(109)
  did -a $dname 13 $chr(77)
  did -c $dname 13 %setfont-m
  did -a $dname 14 $chr(110)
  did -a $dname 14 $chr(78)
  did -a $dname 14 $chr(241)
  did -a $dname 14 $chr(209)
  did -c $dname 14 %setfont-n
  did -a $dname 15 $chr(111)
  did -a $dname 15 $chr(79)
  did -a $dname 15 $chr(240)
  did -a $dname 15 $chr(242)
  did -a $dname 15 $chr(243)
  did -a $dname 15 $chr(244)
  did -a $dname 15 $chr(245)
  did -a $dname 15 $chr(246)
  did -a $dname 15 $chr(248)
  did -a $dname 15 $chr(210)
  did -a $dname 15 $chr(211)
  did -a $dname 15 $chr(212)
  did -a $dname 15 $chr(213)
  did -a $dname 15 $chr(214)
  did -a $dname 15 $chr(216)
  did -c $dname 15 %setfont-o
  did -a $dname 16 $chr(112)
  did -a $dname 16 $chr(80)
  did -c $dname 16 %setfont-p
  did -a $dname 17 $chr(113)
  did -a $dname 17 $chr(81)
  did -c $dname 17 %setfont-q
  did -a $dname 18 $chr(114)
  did -a $dname 18 $chr(82)
  did -a $dname 18 $chr(174)
  did -c $dname 18 %setfont-r
  did -a $dname 19 $chr(115)
  did -a $dname 19 $chr(83)
  did -a $dname 19 $chr(154)
  did -a $dname 19 $chr(138)
  did -a $dname 19 $chr(254)
  did -a $dname 19 $chr(222)
  did -a $dname 19 $chr(36)
  did -a $dname 19 $chr(167)
  did -c $dname 19 %setfont-s
  did -a $dname 20 $chr(116)
  did -a $dname 20 $chr(84)
  did -a $dname 20 $chr(134)
  did -c $dname 20 %setfont-t
  did -a $dname 21 $chr(117)
  did -a $dname 21 $chr(85)
  did -a $dname 21 $chr(181)
  did -a $dname 21 $chr(249)
  did -a $dname 21 $chr(250)
  did -a $dname 21 $chr(251)
  did -a $dname 21 $chr(252)
  did -a $dname 21 $chr(217)
  did -a $dname 21 $chr(218)
  did -a $dname 21 $chr(219)
  did -a $dname 21 $chr(220)
  did -c $dname 21 %setfont-u
  did -a $dname 22 $chr(118)
  did -a $dname 22 $chr(86)
  did -c $dname 22 %setfont-v
  did -a $dname 23 $chr(119)
  did -a $dname 23 $chr(87)
  did -c $dname 23 %setfont-w
  did -a $dname 24 $chr(120)
  did -a $dname 24 $chr(88)
  did -c $dname 24 %setfont-x
  did -a $dname 25 $chr(121)
  did -a $dname 25 $chr(89)
  did -a $dname 25 $chr(253)
  did -a $dname 25 $chr(255)
  did -a $dname 25 $chr(159)
  did -a $dname 25 $chr(221)
  did -a $dname 25 $chr(165)
  did -c $dname 25 %setfont-y
  did -a $dname 26 $chr(122)
  did -a $dname 26 $chr(90)
  did -a $dname 26 $chr(158)
  did -a $dname 26 $chr(142)
  did -c $dname 26 %setfont-z
  did -a $dname 27 ch
  did -a $dname 27 Ch
  did -a $dname 27 $chr(231)
  did -a $dname 27 $chr(199)
  did -c $dname 27 %setfont-ch
  did -a $dname 28 sh
  did -a $dname 28 Sh
  did -a $dname 28 $chr(254)
  did -a $dname 28 $chr(222)
  did -c $dname 28 %setfont-sh
}
on 1:dialog:setfont:sclick:*:{
  if ($did == 60) {
    if (%fantastico == ON) { set %fantastico OFF | if ($dialog(setsecript) != $null) { did -u setsecript 21 } }
    else { fantasticon }
  }
  if ($did == 62) { help }
  if ($did == 1) { set %setfont-a $did(1).sel | set %setfonta $did(1).text }
  if ($did == 2) { set %setfont-b $did(2).sel | set %setfontb $did(2).text }
  if ($did == 3) { set %setfont-c $did(3).sel | set %setfontc $did(3).text }
  if ($did == 4) { set %setfont-d $did(4).sel | set %setfontd $did(4).text }
  if ($did == 5) { set %setfont-e $did(5).sel | set %setfonte $did(5).text }
  if ($did == 6) { set %setfont-f $did(6).sel | set %setfontf $did(6).text }
  if ($did == 7) { set %setfont-g $did(7).sel | set %setfontg $did(7).text }
  if ($did == 8) { set %setfont-h $did(8).sel | set %setfonth $did(8).text }
  if ($did == 9) { set %setfont-i $did(9).sel | set %setfonti $did(9).text }
  if ($did == 10) { set %setfont-j $did(10).sel | set %setfontj $did(10).text }
  if ($did == 11) { set %setfont-k $did(11).sel | set %setfontk $did(11).text }
  if ($did == 12) { set %setfont-l $did(12).sel | set %setfontl $did(12).text }
  if ($did == 13) { set %setfont-m $did(13).sel | set %setfontm $did(13).text }
  if ($did == 14) { set %setfont-n $did(14).sel | set %setfontn $did(14).text }
  if ($did == 15) { set %setfont-o $did(15).sel | set %setfonto $did(15).text }
  if ($did == 16) { set %setfont-p $did(16).sel | set %setfontp $did(16).text }
  if ($did == 17) { set %setfont-q $did(17).sel | set %setfontq $did(17).text }
  if ($did == 18) { set %setfont-r $did(18).sel | set %setfontr $did(18).text }
  if ($did == 19) { set %setfont-s $did(19).sel | set %setfonts $did(19).text }
  if ($did == 20) { set %setfont-t $did(20).sel | set %setfontt $did(20).text }
  if ($did == 21) { set %setfont-u $did(21).sel | set %setfontu $did(21).text }
  if ($did == 22) { set %setfont-v $did(22).sel | set %setfontv $did(22).text }
  if ($did == 23) { set %setfont-w $did(23).sel | set %setfontw $did(23).text }
  if ($did == 24) { set %setfont-x $did(24).sel | set %setfontx $did(24).text }
  if ($did == 25) { set %setfont-y $did(25).sel | set %setfonty $did(25).text }
  if ($did == 26) { set %setfont-z $did(26).sel | set %setfontz $did(26).text }
  if ($did == 27) { set %setfont-ch $did(27).sel | set %setfontch $did(27).text }
  if ($did == 28) { set %setfont-sh $did(28).sel | set %setfontsh $did(28).text }
}
;XXX AWAY XXX:
dialog away {
  icon %awayicon
  size -1 -1 180 128
  title "Away System"
  option dbu
  box "" 50, 2 2 176 124
  box "" 51, 2 2 176 20
  box "" 52, 2 2 176 70
  box "" 53, 2 2 176 87
  box "" 54, 2 2 176 103
  button "OK" 20, 140 110 30 10 , cancel default
  combo 1, 27 8 117 65 , drop , edit
  button "Set color" 14, 146 8 29 11
  text "Reason:" 2, 5 10 20 8
  check "Show away reason on channel when set away" 3, 10 25 120 10
  check "Show reason on channel every" 4, 10 37 84 10
  check "Log incoming messags" 7, 10 49 60 10
  check "Pager" 8, 10 61 22 10
  edit "" 5, 95 37 17 10 , center
  text "Mins." 6, 114 39 15 10
  text "Away Nick:" 10, 12 77 30 8
  radio "My nick" 11, 44 76 28 10 
  radio "This nick:" 12 , 74 76 32 10
  edit "" 13, 107 75 65 10 , autohs
  check "Auto Away After:" 15, 10 92 50 10
  edit  "" 16, 62 92 15 10 , center
  text "Mins." 17, 79 94 18 8
  button "Set Away" 18, 12 110 50 10
  button "Back From Away" 19, 75 110 50 10
}
on *:dialog:away:*:*:{
  if ($devent == init) {
    did -a $dname 1 %myawayreason
    did -a $dname 1 I am busy
    did -a $dname 1 Be Right Back
    did -a $dname 1 Not at home
    did -a $dname 1 Not in the office
    did -a $dname 1 On the phone
    did -a $dname 1 Lunching
    did -a $dname 1 <not reason>
    did -c $dname 1 %awayreasonsel
    if (%awayreasonshow == ON) did -c $dname 3
    if (%awayreasonsh.evr == ON) did -c $dname 4
    if (%awaylog == ON) { did -c $dname 7 | did -b $dname 9 }
    if (%awaypage == ON) did -c $dname 8
    if (%awaynickset == OFF) { did -c $dname 11 | did -b $dname 13 }
    if (%awaynickset == ON) did -c $dname 12
    if (%autoaway == ON) did -c $dname 15
    did -a $dname 13 %awaynick
    did -a $dname 16 %autoawaytime
    did -a $dname 5 %awayreasonsh.evrtime
    falsetrue
  }
  if ($devent == edit) {
    if ($did == 1) { set %myawayreason $did(1).text | set %awaymsg $did(1).text | set %awayreasonsel 1 }
    if ($did == 5) { set %awayreasonsh.evrtime $did(5) }
    if ($did == 13) { set %awaynick $did(13) }
    if ($did == 16) { set %autoawaytime $did(16) }
  }
  if ($devent == sclick) {
    if ($did == 1) {
      set %awayreasonsel $did(1).sel 
      if ($did(1) == <not reason>) { set %awaymsg None }
      else { set %awaymsg $did(1).text }
    }
    if ($did == 3) {
      if (%awayreasonshow == ON) { set %awayreasonshow OFF }
      else { set %awayreasonshow ON }
    }
    if ($did == 4) {
      if (%awayreasonsh.evr == ON) { set %awayreasonsh.evr OFF }
      else { set %awayreasonsh.evr ON }
    }
    if ($did == 7) {
      if (%awaylog == ON) { set %awaylog OFF | did -e $dname 9 }
      else { set %awaylog ON | set %awayclosepm ON | did -bc $dname 9 }
    }
    if ($did == 8) {
      if (%awaypage == ON) { set %awaypage OFF }
      else { set %awaypage ON }
    }
    if ($did == 9) {
      if (%awayclosepm == ON) { set %awayclosepm OFF }
      else { set %awayclosepm ON }
    }
    if ($did == 11) { set %awaynickset OFF | did -b $dname 13 }
    if ($did == 12) { set %awaynickset ON | did -e $dname 13 }
    if ($did == 14) {
      if ($dialog(awayre) == $null) { dialog -m awayre awayre }
      else { dialog -v awayre awayre }
    }
    if ($did == 15) {
      if (%autoaway == ON) { set %autoaway OFF | .disable #autoaway | .timer.autoaway off }
      else { set %autoaway ON | .enable #autoaway | .timer.autoaway 0 $calc(%autoawaytime * 60) autoawaycont }
    }
  }
  if ($did == 18) { 
    if ($did(1) == $null) { set %awaymsg None | set %awayreasonsel 8 }
    if ($did(13) == $null) { set %awaynickset OFF }
    if ($did(5) == $null) { set %awayreasonsh.evr OFF }
    if ($did(16) == $null) { set %autoaway OFF | .disable #autoaway | .timer.autoaway off }
    usbaway
    .timer.ftaw 1 1 falsetrue
  }
  if ($did == 19) { 
    if ($did(1) == $null) { set %awaymsg None | set %awayreasonsel 8 }
    if ($did(13) == $null) { set %awaynickset OFF }
    if ($did(5) == $null) { set %awayreasonsh.evr OFF }
    if ($did(16) == $null) { set %autoaway OFF | .disable #autoaway | .timer.autoaway off }
    usbback
    .timer.ftaw 1 1 falsetrue
  }
  if ($did == 20) {    
    if ($did(1) == $null) { set %awaymsg None | set %awayreasonsel 8 } 
    if ($did(13) == $null) { set %awaynickset OFF }
    if ($did(5) == $null) { set %awayreasonsh.evr OFF }
    if ($did(16) == $null) { set %autoaway OFF | .disable #autoaway | .timer.autoaway off }
  }
}
#autoaway off
on *:input:*:{
  if ($left($1,1) = /) { return }
  else { set -u [ $+ [ $calc(%autoawaytime * 60) ] ] %autoawayme NO }
}
#autoaway end
dialog awayre {
  size -1 -1 315 220
  title "way reason text and color"
  icon %awayicon
  box "" 100, 253 0 60 215
  box "" 102, 5 0 250 215
  box "Set Away Msg Color:" 101, 5 0 250 180
  text "00" 200, 258 15 20 15
  icon 300, 260 15 60 15 , color/0.bmp
  text "01" 201, 258 27 20 15
  icon 301, 260 27 60 15 , color/1.bmp
  text "02" 202, 258 39 20 15
  icon 302, 260 39 60 15 , color/2.bmp
  text "03" 203, 258 51 20 15
  icon 303, 260 51 60 15 , color/3.bmp
  text "04" 204, 258 62 20 15
  icon 304, 260 62 60 15 , color/4.bmp
  text "05" 205, 258 74 20 15
  icon 305, 260 74 60 15 , color/5.bmp
  text "06" 206, 258 86 20 15
  icon 306, 260 86 60 15 , color/6.bmp
  text "07" 207, 258 98 20 15
  icon 307, 260 98 60 15 , color/7.bmp
  text "08" 208, 258 110 20 15
  icon 308, 260 110 60 15 , color/8.bmp
  text "09" 209, 258 122 20 15
  icon 309, 260 122 60 15 , color/9.bmp
  text "10" 210, 258 134 20 15
  icon 310, 260 134 60 15 , color/10.bmp
  text "11" 211, 258 146 20 15
  icon 311, 260 146 60 15 , color/11.bmp
  text "12" 212, 258 158 20 15
  icon 312, 260 158 60 15 , color/12.bmp
  text "13" 213, 258 170 20 15
  icon 313, 260 170 60 15 , color/13.bmp
  text "14" 214, 258 182 20 15
  icon 314, 260 182 60 15 , color/14.bmp
  text "15" 215, 258 194 20 15
  icon 315, 260 194 60 15 , color/15.bmp
  radio "Normal Text" 1, 15 20 80 20
  radio "Colour Text" 2, 15 45 80 20
  combo 3, 95 70 40 90 , drop
  combo 4, 205 70 40 90 , drop
  combo 5, 95 100 40 90 , drop
  combo 6, 205 100 40 90 , drop
  combo 7, 95 130 40 90 , drop
  combo 8, 205 130 40 90 , drop
  combo 9, 205 150 40 90 , drop
  text "Reason Color:" 11, 25 75 70 15
  text "Back Color:" 12, 145 75 55 15
  text "Info Color:" 13, 43 105 50 15
  text "Info2 Color:" 14, 145 105 55 15
  text "Char Color:" 15, 40 135 53 15
  text "Select Char:" 16, 142 135 58 15
  button "Close" 20 , 35 187 60 20 , cancel
  button "Show Example" 21 , 125 187 100 20
}
on 1:dialog:awayre:*:*:{
  if ($devent == init) {
    if (%awaymsgcolor == ON) { did -c $dname 2 }
    if (%awaymsgcolor == OFF) {
      did -c $dname 1
      did -b $dname 3
      did -b $dname 4
      did -b $dname 5
      did -b $dname 6
      did -b $dname 7
      did -b $dname 8
      did -b $dname 9
    }
    colorshowinawaydialog
  }
  if ($devent == sclick) {
    if ($did == 1) {
      set %awaymsgcolor OFF
      did -b $dname 3
      did -b $dname 4
      did -b $dname 5
      did -b $dname 6
      did -b $dname 7
      did -b $dname 8
      did -b $dname 9
    }
    if ($did == 2) {
      set %awaymsgcolor ON
      did -e $dname 3
      did -e $dname 4
      did -e $dname 5
      did -e $dname 6
      did -e $dname 7
      did -e $dname 8
      did -e $dname 9
    }
    if ($did == 3) { set %awmasgcolo.res $did(3) }
    if ($did == 4) { set %awmasgcolo.back $did(4) }
    if ($did == 5) { set %awmasgcolo.info $did(5) }
    if ($did == 6) { set %awmasgcolo.info2 $did(6) }
    if ($did == 7) { set %awmasgcolo.alaco $did(7) }
    if ($did == 8) { set %awmasgcolo.ala $did(8) | set %awmasgcolo.alasel $did(8).sel |   did -c awayre 9 %awmasgcolo.alasel | set %awmasgcolo.ala2 $did(9) }
    if ($did == 9) { set %awmasgcolo.ala2 $did(9) | set %awmasgcolo.alasel $did(9).sel |   did -c awayre 8 %awmasgcolo.alasel | set %awmasgcolo.ala $did(8) }
    if ($did == 20) { window -c @example }
    if ($did == 21) {
      if ($active != @Example) { window -ak @Example }
      clear @Example
      if (%awaymsgcolor == OFF) { echo @Example 6 $me is away,  $+ %awaymsg $+ , (Pager\ $+ %awaypage $+ -Log\ $+ %awaylog $+ ) }
      if (%awaymsgcolor == ON) { echo @Example 6 $me $+  $+ %awmasgcolo.info $+ , $+ %awmasgcolo.back Is Away...  $+ %awmasgcolo.info2 $+ Reason:  $+ %awmasgcolo.alaco $+ %awmasgcolo.ala $+  $+ %awmasgcolo.res $+ %awaymsg $+  $+ %awmasgcolo.alaco $+ %awmasgcolo.ala2 $+  $+ %awmasgcolo.info2 On:  $+ %awmasgcolo.res $+ $time(HH) $+ : $+ $time(nn) $+ : $+ $time(ss)  $+ %awmasgcolo.alaco $+ %awmasgcolo.ala $+  $+ %awmasgcolo.info $+ Pager\ $+ %awaypage $+ -Log\ $+ %awaylog $+  $+ %awmasgcolo.alaco $+ %awmasgcolo.ala2 }
    }
  }
}
alias colorshowinawaydialog {
  did -a awayre 3 00
  did -a awayre 3 01
  did -a awayre 3 02
  did -a awayre 3 03
  did -a awayre 3 04
  did -a awayre 3 05
  did -a awayre 3 06
  did -a awayre 3 07
  did -a awayre 3 08
  did -a awayre 3 09
  did -a awayre 3 10
  did -a awayre 3 11
  did -a awayre 3 12
  did -a awayre 3 13
  did -a awayre 3 14
  did -a awayre 3 15
  did -c awayre 3 $calc(%awmasgcolo.res + 1)
  did -a awayre 4 00
  did -a awayre 4 01
  did -a awayre 4 02
  did -a awayre 4 03
  did -a awayre 4 04
  did -a awayre 4 05
  did -a awayre 4 06
  did -a awayre 4 07
  did -a awayre 4 08
  did -a awayre 4 09
  did -a awayre 4 10
  did -a awayre 4 11
  did -a awayre 4 12
  did -a awayre 4 13
  did -a awayre 4 14
  did -a awayre 4 15
  did -c awayre 4 $calc(%awmasgcolo.back + 1)
  did -a awayre 5 00
  did -a awayre 5 01
  did -a awayre 5 02
  did -a awayre 5 03
  did -a awayre 5 04
  did -a awayre 5 05
  did -a awayre 5 06
  did -a awayre 5 07
  did -a awayre 5 08
  did -a awayre 5 09
  did -a awayre 5 10
  did -a awayre 5 11
  did -a awayre 5 12
  did -a awayre 5 13
  did -a awayre 5 14
  did -a awayre 5 15
  did -c awayre 5 $calc(%awmasgcolo.info + 1)
  did -a awayre 6 00
  did -a awayre 6 01
  did -a awayre 6 02
  did -a awayre 6 03
  did -a awayre 6 04
  did -a awayre 6 05
  did -a awayre 6 06
  did -a awayre 6 07
  did -a awayre 6 08
  did -a awayre 6 09
  did -a awayre 6 10
  did -a awayre 6 11
  did -a awayre 6 12
  did -a awayre 6 13
  did -a awayre 6 14
  did -a awayre 6 15
  did -c awayre 6 $calc(%awmasgcolo.info2 + 1)
  did -a awayre 7 00
  did -a awayre 7 01
  did -a awayre 7 02
  did -a awayre 7 03
  did -a awayre 7 04
  did -a awayre 7 05
  did -a awayre 7 06
  did -a awayre 7 07
  did -a awayre 7 08
  did -a awayre 7 09
  did -a awayre 7 10
  did -a awayre 7 11
  did -a awayre 7 12
  did -a awayre 7 13
  did -a awayre 7 14
  did -a awayre 7 15
  did -c awayre 7 $calc(%awmasgcolo.alaco +1)
  did -a awayre 8 "
  did -a awayre 8 ¤
  did -a awayre 8 [
  did -a awayre 8 (
  did -a awayre 8 ^
  did -a awayre 8 ~
  did -a awayre 8 $chr(169)
  did -a awayre 8 $chr(248)
  did -a awayre 8 '
  did -a awayre 8 [(
  did -a awayre 8 ([
  did -c awayre 8 %awmasgcolo.alasel
  did -a awayre 9 "
  did -a awayre 9 ¤
  did -a awayre 9 ]
  did -a awayre 9 )
  did -a awayre 9 ^
  did -a awayre 9 ~
  did -a awayre 9 $chr(169)
  did -a awayre 9 $chr(248)
  did -a awayre 9 '
  did -a awayre 9 )]
  did -a awayre 9 ])
  did -c awayre 9 %awmasgcolo.alasel
}
on *:CONNECT: {
  if (%autoaway == ON) { .enable #autoaway | .timer.autoaway 0 $calc(%autoawaytime * 60) autoawaycont }
}
on *:open:?:{
  if ($away == $true) {
    .notice $nick Away, %awaymsg
    if (%awaylog == ON) {
      window -bk @Away.Log
      echo @Away.Log 7*** 5Private Msg: $chr(160) 10Date:2 $date(dddd) - $date(mmm) $date(dd) $date(yyyy) $chr(160) 10Time:2 $time(hh) $+ : $+ $time(nn) $time(tt)
      echo @Away.Log 7*** 4Nick:2 $nick ( $+ $address $+ )
      echo @Away.Log 7*** 4MSG: $1-
      echo @Away.Log 1-
    }
    if (%awayclosepm == ON) { close -m $nick }
  }
  elseif (%NOPM == ON) {
    if (%nopmlog == ON) {
      window -bk @NoPM.Log
      echo @NoPM.Log 7*** 5Private $chr(160) 10Date:2 $date(dddd) - $date(mmm) $date(dd) $date(yyyy) $chr(160) 10Time:2 $time(hh) $+ : $+ $time(nn) $time(tt)
      echo @NoPM.Log 7*** 4Nick:2 $nick ( $+ $address $+ )
      echo @NoPM.Log 7*** 4MSG: $1-
      echo @NoPM.Log 1-
    }
    if (%nopmsendn == ON) { .notice $nick (X) %nopmmsg  }
    close -m $nick
  }
}
menu @Away.Log,@Pager {
  Background
  .Select:/background -a $shortfn($$file="Select Photo" $mircdirimages\*.bmp;*.png;*.jpg)
  .None:/background -xa
  .-
  .Center:/background -ca
  .Fill:/background -fa
  .Normal:/background -na
  .Stretch:/background -ra
  .Tile:/background -ta
  .Photo:/background -pa
  -
  Clear Logs:/Clear -la
  -
  Close Window:/window -c $active
  -
}
