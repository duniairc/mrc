;==========
; setting
;==========
dialog setsecript {
  size -1 -1 200 119
  title "Script Setting"
  icon %aria
  option dbu
  menu "&View" 1000
  item "&General" 1010
  item "&Messages" 1011
  item "&text setting" 1012
  item "&Display" 1013
  item "&Sounds" 1014
  menu "&Help" 1100
  item "&Contents" 1110
  item "&Search..." 1120
  item "&Text File" 1130
  tab "General" 991, 5 -2 190 117
  tab "Messages" 992
  tab "Text Setting" 993
  tab "Display" 994
  tab "Sounds" 995
  box "" 1, 10 12 180 100
  box "" 111, 10 12 180 46 , tab 991
  button "OK" 100, 41 100 40 9 , ok default
  button "Help" 101, 87 100 40 9
  check "Highlight if said you'r nick" 2, 15 20 70 10 , tab 991
  check "Show time on display" 3, 15 33 60 10 , tab 991
  Check "Always Ask Me on invite" 4, 15 46 70 10 , tab 991
  check "Enable Auto Messages" 10 , 15 20 70 12 , tab 992
  check "if oped me:" 11, 25 35 35 10 , tab 992
  check "if deoped me:" 12, 25 47 41 10 , tab 992
  check "if voiced me:" 13, 25 59 41 10 , tab 992
  check "if devoiced me:" 14, 25 71 45 10 , tab 992
  edit "" 15 , 75 34 110 10 , tab 992, autohs
  edit "" 16 , 75 46 110 10 , tab 992, autohs
  edit "" 17 , 75 58 110 10 , tab 992, autohs
  edit "" 18 , 75 70 110 10 , tab 992, autohs
  edit "" 200 , 60 82 125 11 , tab 992, autohs
  text "Quit Message:" 19 , 25 85 35 10 , tab 992
  check "Enable auto color or input text" 20 , 15 20 80 12 , tab 993
  check "Fantasic Font" 21, 25 35 42 10 , tab 993
  check "Auto Colour" 22, 25 50 40 10 , tab 993
  check "input text" 23, 26 65 35 10 , tab 993
  button "Setting" 24, 80 35 40 9 , tab 993
  button "Setting" 25, 80 50 40 9 , tab 993
  button "Setting" 26, 80 65 40 9 , tab 993
  text "Back:" 27, 15 25 20 10 , tab 994
  text "Status:" 28, 15 40 20 10 , tab 994
  text "Switchbar:" 29, 15 55 30 10 , tab 994
  text "Toolbar:" 30, 15 70 30 10 , tab 994
  Combo 31, 41 22 42 50 , drop , tab 994
  Combo 32, 41 37 42 50 , drop , tab 994
  Combo 33, 41 52 42 50 , drop , tab 994
  Combo 34, 41 67 42 50 , drop , tab 994
  button "Select Picture" 35, 87 22 40 10 , tab 994
  button "Select Picture" 36, 87 37 40 10 , tab 994
  button "Select Picture" 37, 87 52 40 10 , tab 994
  button "Select Picture" 38, 87 67 40 10 , tab 994
  combo 44, 132 22 30 50 , drop , tab 994
  combo 45, 132 37 30 50 , drop , tab 994
  button "Clear" 39, 165 22 20 10 , tab 994
  button "Clear" 40, 165 36 20 10 , tab 994
  button "Clear" 41, 165 52 20 10 , tab 994
  button "Clear" 42, 165 67 20 10 , tab 994
  button "Themes" 46, 41 85 40 9 , tab 994
  button "Default" 43, 87 85 40 9 , tab 994
  check "Enable Sounds" 50, 15 20 45 10 , tab 995
  check "on open script" 51, 25 35 45 8 , tab 995
  check "on connect" 52, 25 45 40 8 , tab 995
  check "on disconnect" 53, 25 55 45 8 , tab 995
  check "join to channel" 54, 25 65 45 8 , tab 995
  check "part channel" 55, 25 75 42 8 , tab 995
  check "your nick said" 56, 105 35 45 8 , tab 995
  check "on open query" 57, 105 45 45 8 , tab 995
  check "you're kicked" 58, 105 55 45 8 , tab 995
  check "you're banned" 59, 105 65 45 8 , tab 995
  check "you're op/voiced" 60, 105 75 49 8 , tab 995
  button "+" 61, 75 35 8 8 , tab 995
  button "+" 62, 75 45 8 8 , tab 995
  button "+" 63, 75 55 8 8 , tab 995
  button "+" 64, 75 65 8 8 , tab 995
  button "+" 65, 75 75 8 8 , tab 995
  button "+" 66, 157 35 8 8 , tab 995
  button "+" 67, 157 45 8 8 , tab 995
  button "+" 68, 157 55 8 8 , tab 995
  button "+" 69, 157 65 8 8 , tab 995
  button "+" 70, 157 75 8 8 , tab 995
  button "!" 71, 85 35 8 8 , tab 995
  button "!" 72, 85 45 8 8 , tab 995
  button "!" 73, 85 55 8 8 , tab 995
  button "!" 74, 85 65 8 8 , tab 995
  button "!" 75, 85 75 8 8 , tab 995
  button "!" 76, 167 35 8 8 , tab 995
  button "!" 77, 167 45 8 8 , tab 995
  button "!" 78, 167 55 8 8 , tab 995
  button "!" 79, 167 65 8 8 , tab 995
  button "!" 80, 167 75 8 8 , tab 995
}

on 1:dialog:setsecript:*:*:{
  if ($devent == menu) {
    if ($did == 1010) { did -f $dname 991 }
    if ($did == 1011) { did -f $dname 992 }
    if ($did == 1012) { did -f $dname 993 }
    if ($did == 1013) { did -f $dname 994 }
    if ($did == 1014) { did -f $dname 995 }
    if ($did == 1110) { help }
    if ($did == 1120) { help - Enter replay }
    if ($did == 1130) { run $mircdirRead me.txt }
  }
  if ($devent == init) {
    if (%highlight == ON) did -c $dname 2
    if (%timestamp == ON) did -c $dname 3
    if (%inviteask == ON) did -c $dname 4
    if ($group(#automsgs) == ON)  did -c $dname 10
    if (%automsgo == ON) did -c $dname 11
    if (%automsgdo == ON) did -c $dname 12
    if (%automsgv == ON) did -c $dname 13
    if (%automsgdv == ON) did -c $dname 14
    if (%enableinput == ON) did -c $dname 20
    if (%enableinput == OFF) { did -b $dname 21 | did -b $dname 22 | did -b $dname 23 }
    if (%fantastico == ON) did -c $dname 21
    if (%inputset == ON) did -c $dname 22
    if (%input == ON) did -c $dname 23
    if ($group(#sounds) == ON) did -c $dname 50
    if ($group(#sounds) == OFF) { did -b $dname 51 | did -b $dname 52 | did -b $dname 53 | did -b $dname 54 | did -b $dname 55 | did -b $dname 56 | did -b $dname 57 | did -b $dname 58 | did -b $dname 59 | did -b $dname 60 }
    if (%soundstart == ON) did -c $dname 51
    if (%soundconnect == ON) did -c $dname 52
    if (%sounddiscon == ON) did -c $dname 53
    if (%soundjoin == ON) did -c $dname 54
    if (%soundpart == ON) did -c $dname 55
    if (%soundcall == ON) did -c $dname 56
    if (%soundquery == ON) did -c $dname 57
    if (%soundkick == ON) did -c $dname 58
    if (%soundban == ON) did -c $dname 59
    if (%soundopv == ON) did -c $dname 60
    did -a $dname 15 %automsgo.msg
    did -a $dname 16 %automsgdo.msg
    did -a $dname 17 %automsgv.msg
    did -a $dname 18 %automsgdv.msg
    did -a $dname 200 %quit.msg
    ColorList
    backgcombo
  }
  if ($devent == sclick) {
    if ($did == 2) {
      if (%highlight == ON) { set %highlight OFF }
      else { set %highlight ON }
    }
    if ($did == 3) {
      if (%timestamp == ON) { .timestamp off | set %timestamp OFF }
      else { .timestamp ON | set %timestamp ON }
    }
    if ($did == 4) {
      if (%inviteask == ON) { set %inviteask OFF }
      else { set %inviteask ON }
    }    
    if ($did == 10) {
      if ($group(#automsgs) == ON) { .disable #automsgs }
      else { .enable #automsgs }
    }
    if ($did == 11) {
      if (%automsgo == ON) { set %automsgo OFF }
      else { set %automsgo ON }
    }
    if ($did == 12) {
      if (%automsgdo == ON) { set %automsgdo OFF }
      else { set %automsgdo ON }
    }
    if ($did == 13) {
      if (%automsgv == ON) { set %automsgv OFF }
      else { set %automsgv ON }
    }
    if ($did == 14) {
      if (%automsgdv == ON) { set %automsgdv OFF }
      else { set %automsgdv ON }
    }
    if ($did == 20) {
      if (%enableinput == ON) { inputalloff | set %enableinput OFF | did -ub $dname 21 | did -ub $dname 22 | did -ub $dname 23 }
      else { set %enableinput ON | did -e $dname 21 | did -e $dname 22 | did -e $dname 23 }
    }
    if ($did == 21) {
      if (%fantastico == ON) { fantasticoff }
      else { fantasticon }
    }
    if ($did == 22) {
      if (%inputset == ON) { inputsetoff }
      else { inputseton }
    }
    if ($did == 23) { inputon }
    if ($did == 24) { setfont }
    if ($did == 25) { rencolor }
    if ($did == 26) { inputlist }
    if ($did == 31) { if ($did(31).sel != 1) background -mt color\ $+ $calc($did(31).sel - 2) $+ .bmp }
    if ($did == 32) { if ($did(32).sel != 1) background -st color\ $+ $calc($did(32).sel - 2) $+ .bmp }
    if ($did == 33) { if ($did(33).sel != 1) background -ht color\ $+ $calc($did(33).sel - 2) $+ .bmp }
    if ($did == 34) { if ($did(34).sel != 1) background -lt color\ $+ $calc($did(34).sel - 2) $+ .bmp }
    if ($did == 35) { background -mf $$file="Select a picture" photos\*.png;*.bmp;*.jpg }
    if ($did == 36) { background -sf $$file="Select a picture" photos\*.png;*.bmp;*.jpg }
    if ($did == 37) { background -ht $$file="Select a picture" photos\*.png;*.bmp;*.jpg }
    if ($did == 38) { background -lt $$file="Select a picture" photos\*.png;*.bmp;*.jpg }
    if ($did == 39) { background -mx | did -c $dname 31 1 }
    if ($did == 40) { background -sx | did -c $dname 32 1 }
    if ($did == 41) { background -hx | did -c $dname 33 1 }
    if ($did == 42) { background -lx | did -c $dname 34 1 }
    if ($did == 43) { background -mx | background -lx | background -sx | background -hx | did -c $dname 31 1 | did -c $dname 32 1 | did -c $dname 33 1 | did -c $dname 34 1 }
    if ($did == 44) { 
      if ($did(44).sel == 1) { background -mc }
      if ($did(44).sel == 2) { background -mf }
      if ($did(44).sel == 3) { background -mn }
      if ($did(44).sel == 4) { background -mr }
      if ($did(44).sel == 5) { background -mt }
      if ($did(44).sel == 6) { background -mp }
    }
    if ($did == 45) { 
      if ($did(45).sel == 1) { background -sc }
      if ($did(45).sel == 2) { background -sf }
      if ($did(45).sel == 3) { background -sn }
      if ($did(45).sel == 4) { background -sr }
      if ($did(45).sel == 5) { background -st }
      if ($did(45).sel == 6) { background -sp }
    }
    if ($did == 46) { themes }
    if ($did == 50) {
      if ($group(#sounds) == OFF) { .enable #sounds | did -e $dname 51 | did -e $dname 52 | did -e $dname 53 | did -e $dname 54 | did -e $dname 55 | did -e $dname 56 | did -e $dname 57 | did -e $dname 58 | did -e $dname 59 | did -e $dname 60 }
      elseif ($group(#sounds) == ON) { .disable #sounds | did -b $dname 51 | did -b $dname 52 | did -b $dname 53 | did -b $dname 54 | did -b $dname 55 | did -b $dname 56 | did -b $dname 57 | did -b $dname 58 | did -b $dname 59 | did -b $dname 60 }
    }
    if ($did == 51) {
      if (%soundstart == ON) { set %soundstart OFF }
      else { set %soundstart ON }
    }
    if ($did == 52) {
      if (%soundconnect == ON) { set %soundconnect OFF }
      else { set %soundconnect ON }
    }
    if ($did == 53) {
      if (%sounddiscon == ON) { set %sounddiscon OFF }
      else { set %sounddiscon ON }
    }
    if ($did == 54) {
      if (%soundjoin == ON) { set %soundjoin OFF }
      else { set %soundjoin ON }
    }
    if ($did == 55) {
      if (%soundpart == ON) { set %soundpart OFF }
      else { set %soundpart ON }
    }
    if ($did == 56) {
      if (%soundcall == ON) { set %soundcall OFF }
      else { set %soundcall ON }
    }
    if ($did == 57) {
      if (%soundquery == ON) { set %soundquery OFF }
      else { set %soundquery ON }
    }
    if ($did == 58) {
      if (%soundkick == ON) { set %soundkick OFF }
      else { set %soundkick ON }
    }
    if ($did == 59) {
      if (%soundban == ON) { set %soundban OFF }
      else { set %soundban ON }
    }
    if ($did == 60) {
      if (%soundopv == ON) { set %soundopv OFF }
      else { set %soundopv ON }
    }
    if ($did == 61) { 
      set %soundtest $$file="Select sound" sounds\*.wav 
      if ($mircdirSounds* iswm %soundtest) { set %sound-start $remove(%soundtest,$mircdirSounds,/,\) }
      else { set %sound-start %soundtest }
      unset %soundtest
    }
    if ($did == 71) { if (%sound-start != $null) .splay %sound-start }
    if ($did == 62) { 
      set %soundtest $$file="Select sound" sounds\*.wav 
      if ($mircdirSounds* iswm %soundtest) { set %sound-connect $remove(%soundtest,$mircdirSounds,/,\) }
      else { set %sound-connect %soundtest }
      unset %soundtest
    }
    if ($did == 72) { if (%sound-connect != $null) .splay %sound-connect }
    if ($did == 63) {
      set %soundtest $$file="Select sound" sounds\*.wav 
      if ($mircdirSounds* iswm %soundtest) { set %sound-discon $remove(%soundtest,$mircdirSounds,/,\) }
      else { set %sound-discon %soundtest }
      unset %soundtest
    }
    if ($did == 73) { if (%sound-discon != $null) .splay %sound-discon }
    if ($did == 64) {
      set %soundtest $$file="Select sound" sounds\*.wav 
      if ($mircdirSounds* iswm %soundtest) { set %sound-join $remove(%soundtest,$mircdirSounds,/,\) }
      else { set %sound-join %soundtest }
      unset %soundtest
    }
    if ($did == 74) { if (%sound-join != $null) .splay %sound-join }
    if ($did == 65) { 
      set %soundtest $$file="Select sound" sounds\*.wav 
      if ($mircdirSounds* iswm %soundtest) { set %sound-part $remove(%soundtest,$mircdirSounds,/,\) }
      else { set %sound-part %soundtest }
      unset %soundtest
    }
    if ($did == 75) { if (%sound-part != $null) .splay %sound-part }
    if ($did == 66) { 
      set %soundtest $$file="Select sound" sounds\*.wav 
      if ($mircdirSounds* iswm %soundtest) { set %sound-call $remove(%soundtest,$mircdirSounds,/,\) }
      else { set %sound-call %soundtest }
      unset %soundtest
    }
    if ($did == 76) { if (%sound-call != $null) .splay %sound-call }
    if ($did == 67) { 
      set %soundtest $$file="Select sound" sounds\*.wav 
      if ($mircdirSounds* iswm %soundtest) { set %sound-query $remove(%soundtest,$mircdirSounds,/,\) }
      else { set %sound-query %soundtest }
      unset %soundtest
    }
    if ($did == 77) { if (%sound-query != $null) .splay %sound-query }
    if ($did == 68) {
      set %soundtest $$file="Select sound" sounds\*.wav 
      if ($mircdirSounds* iswm %soundtest) { set %sound-kick $remove(%soundtest,$mircdirSounds,/,\) }
      else { set %sound-kick %soundtest }
      unset %soundtest
    }
    if ($did == 78) { if (%sound-kick != $null) .splay %sound-kick }
    if ($did == 69) {
      set %soundtest $$file="Select sound" sounds\*.wav 
      if ($mircdirSounds* iswm %soundtest) { set %sound-ban $remove(%soundtest,$mircdirSounds,/,\) }
      else { set %sound-ban %soundtest }
      unset %soundtest
    }
    if ($did == 79) { if (%sound-ban != $null) .splay %sound-ban }
    if ($did == 70) { 
      set %soundtest $$file="Select sound" sounds\*.wav 
      if ($mircdirSounds* iswm %soundtest) { set %sound-opv $remove(%soundtest,$mircdirSounds,/,\) }
      else { set %sound-opv %soundtest }
      unset %soundtest
    }
    if ($did == 80) { if (%sound-opv != $null) .splay %sound-opv }
    if ($did == 101) { help }
  }
  if ($devent == edit) {
    if ($did == 8) { set %nopmmsg $did(8) }
    if ($did == 15) { set %automsgo.msg $did(15) }
    if ($did == 16) { set %automsgdo.msg $did(16) }
    if ($did == 17) { set %automsgv.msg $did(17) }
    if ($did == 18) { set %automsgdv.msg $did(18) }
    if ($did == 200) { set %quit.msg $did(200) }
  }
}
#automsgs off
on *:OP:#: {
  if (%automsgo == ON) && (%oped. [ $+ [ $chan ] ] != ON ) {
    if ($opnick == $me) && ($nick != $me) { msg $chan $nick $+ : %automsgo.msg | set -u5 %oped. [ $+ [ $chan ] ] ON | .splay -a sounds/+o.wav }
  }
}
on *:DEOP:#: {
  if (%automsgdo == ON) && (%deoped. [ $+ [ $chan ] ] != ON) {
    if ($opnick == $me) && ($nick != $me) { msg $chan $nick $+ : %automsgdo.msg | set -u5 %deoped. [ $+ [ $chan ] ] ON | .splay -a sounds/-o.wav }
  }
} 
on *:VOICE:#: {
  if (%automsgv == ON) && (%voiced. [ $+ [ $chan ] ] != ON) {
    if ($vnick == $me) && ($nick != $me) { msg $chan $nick $+ : %automsgv.msg | set -u5 %voiced. [ $+ [ $chan ] ] ON | .splay -a sounds/+v.wav }
  }
} 
on *:DEVOICE:#: {
  if (%automsgdv == ON) && (%devoiced. [ $+ [ $chan ] ] != ON) {
    if ($vnick == $me) && ($nick != $me) { msg $chan $nick $+ : %automsgdv.msg | set -u5 %devoiced. [ $+ [ $chan ] ] ON | .splay -a sounds/-v.wav }
  }
} 
#automsgs end
dialog cod {
  size -1 -1 205 115
  title "Lock Password"
  icon %aria
  box "" 1, 5 5 195 105
  box "" 10, 5 5 195 70
  check "Enable Lock Password" 2, 15 20 130 20
  text "Password:" 3, 15 50 50 15
  edit "" 4, 68 47 120 20
  button "OK" 5, 60 83 80 20 , default , cancel
}
on 1:dialog:cod:*:*:{
  if ($devent == init) {
    if (%lockpass == ON) did -c $dname 2
    did -a $dname 4 %lockpass2
  }
  if ($devent == sclick) && ($did == 2) {
    if (%lockpass == ON) { set %lockpass OFF | did -r cod 4 | unset %lockpass2 }
    else { set %lockpass ON }
  }
  if ($devent == sclick) && ($did == 5) { if ($did(4) == $null) set %lockpass OFF }
  if ($devent == edit) && ($did == 4) { set %lockpass2 $did(4) }
}

dialog rencolor {
  size -1 -1 170 120
  title "Auto Colour Setting"
  icon %set
  option dbu
  box "" 90, 3 0 164 117
  box "" 91, 3 0 164 37
  box "" 92, 3 0 164 79
  box "" 93, 3 0 164 100
  text "Befor text:" 8, 13 10 35 8
  combo 1, 42 8 40 50 , drop
  icon 11, 85 8 60 10 
  text "After text:" 9, 13 25 35 8 
  combo 2, 42 23 40 50 , drop
  icon 12, 85 23 60 10 
  radio "" 4, 10 40 10 10
  radio "" 5, 10 53 10 10
  radio "Other" 6, 10 66 23 10
  combo 7, 40 65 50 50 , drop
  icon 41, 20 37 130 15 , images/autoco.bmp
  icon 51, 20 50 130 15 , images/autoco2.bmp
  text "Back:" 105, 10 85 20 8
  text "Text:" 106, 57 85 20 8
  Combo 34, 23 83 20 50 , drop 
  Combo 31, 70 83 20 50 , drop
  Combo 32, 102 83 20 50 , drop 
  Combo 33, 134 83 20 50 , drop 
  icon 304, 19 81 60 15 
  icon 301, 66 81 60 15 
  icon 302, 98 81 60 15
  icon 303, 130 81 60 15 
  Combo 21, 70 83 20 50 , drop
  Combo 22, 102 83 20 50 , drop 
  Combo 23, 23 83 20 50 , drop 
  icon 201, 66 81 60 15 
  icon 202, 98 81 60 15
  icon 203, 19 81 60 15 
  Combo 111, 70 83 20 50 , drop
  Combo 112, 23 83 20 50 , drop 
  icon 101, 66 81 60 15 
  icon 102, 19 81 60 15
  check "U" 113, 120 84 15 10
  check "B" 114, 135 84 15 10
  button "OK" 107, 10 103 40 10 ,cancel default
  button "Show" 108, 55 103 40 10
  check "Enable Auto Color" 109, 107 103 53 10
}
on 1:dialog:rencolor:*:*:{
  if ($devent == init) {
    did -a $dname 1
    did -a $dname 1 ¤¤¤¤¤
    did -a $dname 1 --'´-{@
    did -a $dname 1 @}-`'--
    did -a $dname 1 !i!i!i!
    did -a $dname 1 ^_^
    did -a $dname 1 ^_*
    did -a $dname 1 ;:;:;:;:;
    did -a $dname 1 ?¿?¿?
    did -a $dname 1 ¶¶¶
    did -a $dname 1 «««
    did -a $dname 1 »»»
    did -a $dname 1 °°°°°°
    did -a $dname 1 ®®®
    did -a $dname 1 ••••••
    did -a $dname 1 §§§§§§
    did -a $dname 1 ††††††
    did -a $dname 1 ºººººººººº
    did -a $dname 2
    did -a $dname 2 ¤¤¤¤¤
    did -a $dname 2 --'´-{@
    did -a $dname 2 @}-`'--
    did -a $dname 2 !i!i!i!
    did -a $dname 2 ^_^
    did -a $dname 2 ^_*
    did -a $dname 2 ;:;:;:;:;
    did -a $dname 2 ?¿?¿?
    did -a $dname 2 ¶¶¶
    did -a $dname 2 «««
    did -a $dname 2 »»»
    did -a $dname 2 °°°°°°
    did -a $dname 2 ®®®
    did -a $dname 2 ••••••
    did -a $dname 2 §§§§§§
    did -a $dname 2 ††††††
    did -a $dname 2 ºººººººººº
    did -c $dname 1 %ghablekalame
    did -c $dname 2 %badekalame
    did -a $dname 7 One Colour
    did -a $dname 7 Two Colours
    did -a $dname 7 Three Colours
    did -a $dname 7 Select
    did -c $dname 7 4
    if (%inputset == ON) { did -c $dname 109 }
    if (%renautocolor == 1) { did -c $dname 7 1 | did -c $dname 6 }
    if (%renautocolor == 2) { did -c $dname 7 2 | did -c $dname 6 }
    if (%renautocolor == 3) { did -c $dname 7 3 | did -c $dname 6 }
    if (%renautocolor == 4) { did -c $dname 4 | did -b $dname 7 }
    if (%renautocolor == 5) { did -c $dname 5 | did -b $dname 7 }
    if (** iswm %BBB) { did -c $dname 113 }
    if (** iswm %BBB) { did -c $dname 114 }
    did -g $dname 11 images/beaf/beaf $+ $did(1).sel $+ .bmp
    did -g $dname 12 images/beaf/beaf $+ $did(2).sel $+ .bmp
    did -g $dname 301 color/ $+ %renco3-1 $+ .bmp
    did -g $dname 302 color/ $+ %renco3-2 $+ .bmp
    did -g $dname 303 color/ $+ %renco3-3 $+ .bmp
    did -g $dname 304 color/ $+ %rencoba3 $+ .bmp
    did -g $dname 201 color/ $+ %renco2-1 $+ .bmp
    did -g $dname 202 color/ $+ %renco2-2 $+ .bmp
    did -g $dname 203 color/ $+ %rencoba2 $+ .bmp
    did -g $dname 101 color/ $+ %renco1 $+ .bmp
    did -g $dname 102 color/ $+ %rencoba1 $+ .bmp
    renshowdi
    renhide
  }
  if ($devent == sclick) {
    if ($did == 1) { set %ghablekalame $did(1).sel | did -g $dname 11 images/beaf/beaf $+ $did(1).sel $+ .bmp | setghabkalame }
    if ($did == 2) { set %badekalame $did(2).sel | did -g $dname 12 images/beaf/beaf $+ $did(2).sel $+ .bmp | setbadekalame }
    if ($did == 4) { set %renautocolor 4 | did -c $dname 7 4 | did -b $dname 7 | renhide }
    if ($did == 5) { set %renautocolor 5 | did -c $dname 7 4 | did -b $dname 7 | renhide }
    if ($did == 6) { did -e $dname 7 | renhide }
    if ($did == 7) {
      if ($did(7).sel != 4) { set %renautocolor $did(7).sel }
      renhide 
    }
    if ($did == 31) { set %renco3-1 $calc($did(31).sel - 1) | did -g $dname 301 color/ $+ %renco3-1 $+ .bmp }
    if ($did == 32) { set %renco3-2 $calc($did(32).sel - 1) | did -g $dname 302 color/ $+ %renco3-2 $+ .bmp }
    if ($did == 33) { set %renco3-3 $calc($did(33).sel - 1) | did -g $dname 303 color/ $+ %renco3-3 $+ .bmp }
    if ($did == 34) { set %rencoba3 $calc($did(34).sel - 1) | did -g $dname 304 color/ $+ %rencoba3 $+ .bmp }
    if ($did == 21) { set %renco2-1 $calc($did(21).sel - 1) | did -g $dname 201 color/ $+ %renco2-1 $+ .bmp }
    if ($did == 22) { set %renco2-2 $calc($did(22).sel - 1) | did -g $dname 202 color/ $+ %renco2-2 $+ .bmp }
    if ($did == 23) { set %rencoba2 $calc($did(23).sel - 1) | did -g $dname 203 color/ $+ %rencoba2 $+ .bmp }
    if ($did == 111) { set %renco1 $calc($did(111).sel - 1) | did -g $dname 101 color/ $+ %renco1 $+ .bmp }
    if ($did == 112) { set %rencoba1 $calc($did(112).sel - 1) | did -g $dname 102 color/ $+ %rencoba1 $+ .bmp }
    if ($did == 113) {
      if (** iswm %BBB) { set %BBB $remove(%BBB,) }
      else { set %BBB %BBB $+  }
    }
    if ($did == 114) {
      if (** iswm %BBB) { set %BBB $remove(%BBB,) }
      else { set %BBB %BBB $+  }
    }
    if ($did == 109) {
      if (%inputset == ON) { set %inputset OFF | if ($dialog(setsecript) != $null) { did -u setsecript 22 } }
      else { inputseton }
    }
    if ($did == 107) { window -c @Text_Setting }
    if ($did == 108) { ren Example Of Script Auto Colour Setting  }
  }
}
alias setghabkalame {
  if (%ghablekalame == 1) { set %ghablekalame_ }
  if (%ghablekalame == 2) { set %ghablekalame_ 4,11 ¤6¤13¤7¤8¤11,11. }
  if (%ghablekalame == 3) { set %ghablekalame_ 3,1 --'´-{4@1,1. }
  if (%ghablekalame == 4) { set %ghablekalame_ 4,1 @3}-`'--1,1. }
  if (%ghablekalame == 5) { set %ghablekalame_ 11,1 !9i11!9i11!9i11!1,1. }
  if (%ghablekalame == 6) { set %ghablekalame_ 1,7 ^4_1^7,7. }
  if (%ghablekalame == 7) { set %ghablekalame_ 1,7 ^4_1*7,7. }
  if (%ghablekalame == 8) { set %ghablekalame_ 7,1 ;8:7;8:7;8:7;8:7;1,1. }
  if (%ghablekalame == 9) { set %ghablekalame_ 3,4 ?9¿10?9¿3?4,4. }
  if (%ghablekalame == 10) { set %ghablekalame_ 4,3 ¶3,4¶4,3¶3,3. }
  if (%ghablekalame == 11) { set %ghablekalame_ 3,1 «9«10«1,1. }
  if (%ghablekalame == 12) { set %ghablekalame_ 10,1 »9»3»1,1. }
  if (%ghablekalame == 13) { set %ghablekalame_ 2,4 °12°11°10°9°3°4,4. }
  if (%ghablekalame == 14) { set %ghablekalame_ 3,2 ®8®4®2,2. }
  if (%ghablekalame == 15) { set %ghablekalame_ 4,1•1,4•4,1•1,4•4,1•1,4•4,1• }
  if (%ghablekalame == 16) { set %ghablekalame_ 7,11 §5§8§7§5§8§11,11. }
  if (%ghablekalame == 17) { set %ghablekalame_ 6,12 †13†6†13†6†12,12. }
  if (%ghablekalame == 18) { set %ghablekalame_ 4,1 º5º6º7º8º9º10º11º12º13º1,1. }
}
alias setbadekalame {
  if (%badekalame == 1) { set %badekalame_ }
  if (%badekalame == 2) { set %badekalame_ 8,11 ¤7¤13¤6¤4¤11,11. }
  if (%badekalame == 3) { set %badekalame_ 3,1 --'´-{4@1,1. }
  if (%badekalame == 4) { set %badekalame_ 4,1 @3}-`'--1,1. }
  if (%badekalame == 5) { set %badekalame_ 11,1 !9i11!9i11!9i11!1,1. }
  if (%badekalame == 6) { set %badekalame_ 1,7 ^4_1^7,7. }
  if (%badekalame == 7) { set %badekalame_ 1,7 ^4_1*7,7. }
  if (%badekalame == 8) { set %badekalame_ 7,1 ;8:7;8:7;8:7;8:7;1,1. }
  if (%badekalame == 9) { set %badekalame_ 3,4 ?9¿10?9¿3?4,4. }
  if (%badekalame == 10) { set %badekalame_ 4,3 ¶3,4¶4,3¶3,3. }
  if (%badekalame == 11) { set %badekalame_ 3,1 «9«10«1,1. }
  if (%badekalame == 12) { set %badekalame_ 10,1 »9»3»1,1. }
  if (%badekalame == 13) { set %badekalame_ 2,4 °12°11°10°9°3°4,4. }
  if (%badekalame == 14) { set %badekalame_ 3,2 ®8®4®2,2. }
  if (%badekalame == 15) { set %badekalame_ 4,1•1,4•4,1•1,4•4,1•1,4•4,1• }
  if (%badekalame == 16) { set %badekalame_ 7,11 §5§8§7§5§8§11,11. }
  if (%badekalame == 17) { set %badekalame_ 6,12 †13†6†13†6†12,12. }
  if (%badekalame == 18) { set %badekalame_ 4,1 º5º6º7º8º9º10º11º12º13º1,1. }
}
alias renshowdi {
  did -a rencolor 31 00
  did -a rencolor 31 01
  did -a rencolor 31 02
  did -a rencolor 31 03
  did -a rencolor 31 04
  did -a rencolor 31 05
  did -a rencolor 31 06
  did -a rencolor 31 07
  did -a rencolor 31 08
  did -a rencolor 31 09
  did -a rencolor 31 10
  did -a rencolor 31 11
  did -a rencolor 31 12
  did -a rencolor 31 13
  did -a rencolor 31 14
  did -a rencolor 31 15
  did -c rencolor 31 $calc(%renco3-1 + 1)
  did -a rencolor 32 00
  did -a rencolor 32 01
  did -a rencolor 32 02
  did -a rencolor 32 03
  did -a rencolor 32 04
  did -a rencolor 32 05
  did -a rencolor 32 06
  did -a rencolor 32 07
  did -a rencolor 32 08
  did -a rencolor 32 09
  did -a rencolor 32 10
  did -a rencolor 32 11
  did -a rencolor 32 12
  did -a rencolor 32 13
  did -a rencolor 32 14
  did -a rencolor 32 15
  did -c rencolor 32 $calc(%renco3-2 + 1)
  did -a rencolor 33 00
  did -a rencolor 33 01
  did -a rencolor 33 02
  did -a rencolor 33 03
  did -a rencolor 33 04
  did -a rencolor 33 05
  did -a rencolor 33 06
  did -a rencolor 33 07
  did -a rencolor 33 08
  did -a rencolor 33 09
  did -a rencolor 33 10
  did -a rencolor 33 11
  did -a rencolor 33 12
  did -a rencolor 33 13
  did -a rencolor 33 14
  did -a rencolor 33 15
  did -c rencolor 33 $calc(%renco3-3 + 1)
  did -a rencolor 34 00
  did -a rencolor 34 01
  did -a rencolor 34 02
  did -a rencolor 34 03
  did -a rencolor 34 04
  did -a rencolor 34 05
  did -a rencolor 34 06
  did -a rencolor 34 07
  did -a rencolor 34 08
  did -a rencolor 34 09
  did -a rencolor 34 10
  did -a rencolor 34 11
  did -a rencolor 34 12
  did -a rencolor 34 13
  did -a rencolor 34 14
  did -a rencolor 34 15
  did -c rencolor 34 $calc(%rencoba3 + 1)
  did -a rencolor 21 00
  did -a rencolor 21 01
  did -a rencolor 21 02
  did -a rencolor 21 03
  did -a rencolor 21 04
  did -a rencolor 21 05
  did -a rencolor 21 06
  did -a rencolor 21 07
  did -a rencolor 21 08
  did -a rencolor 21 09
  did -a rencolor 21 10
  did -a rencolor 21 11
  did -a rencolor 21 12
  did -a rencolor 21 13
  did -a rencolor 21 14
  did -a rencolor 21 15
  did -c rencolor 21 $calc(%renco2-1 + 1)
  did -a rencolor 22 00
  did -a rencolor 22 01
  did -a rencolor 22 02
  did -a rencolor 22 03
  did -a rencolor 22 04
  did -a rencolor 22 05
  did -a rencolor 22 06
  did -a rencolor 22 07
  did -a rencolor 22 08
  did -a rencolor 22 09
  did -a rencolor 22 10
  did -a rencolor 22 11
  did -a rencolor 22 12
  did -a rencolor 22 13
  did -a rencolor 22 14
  did -a rencolor 22 15
  did -c rencolor 22 $calc(%renco2-2 + 1)
  did -a rencolor 23 00
  did -a rencolor 23 01
  did -a rencolor 23 02
  did -a rencolor 23 03
  did -a rencolor 23 04
  did -a rencolor 23 05
  did -a rencolor 23 06
  did -a rencolor 23 07
  did -a rencolor 23 08
  did -a rencolor 23 09
  did -a rencolor 23 10
  did -a rencolor 23 11
  did -a rencolor 23 12
  did -a rencolor 23 13
  did -a rencolor 23 14
  did -a rencolor 23 15
  did -c rencolor 23 $calc(%rencoba2 + 1)
  did -a rencolor 111 00
  did -a rencolor 111 01
  did -a rencolor 111 02
  did -a rencolor 111 03
  did -a rencolor 111 04
  did -a rencolor 111 05
  did -a rencolor 111 06
  did -a rencolor 111 07
  did -a rencolor 111 08
  did -a rencolor 111 09
  did -a rencolor 111 10
  did -a rencolor 111 11
  did -a rencolor 111 12
  did -a rencolor 111 13
  did -a rencolor 111 14
  did -a rencolor 111 15
  did -c rencolor 111 $calc(%renco1 + 1)
  did -a rencolor 112 00
  did -a rencolor 112 01
  did -a rencolor 112 02
  did -a rencolor 112 03
  did -a rencolor 112 04
  did -a rencolor 112 05
  did -a rencolor 112 06
  did -a rencolor 112 07
  did -a rencolor 112 08
  did -a rencolor 112 09
  did -a rencolor 112 10
  did -a rencolor 112 11
  did -a rencolor 112 12
  did -a rencolor 112 13
  did -a rencolor 112 14
  did -a rencolor 112 15
  did -c rencolor 112 $calc(%rencoba1 + 1)
}
alias renhide {
  if (%renautocolor == 3) {
    did -v rencolor 31
    did -v rencolor 32
    did -v rencolor 33
    did -v rencolor 34
    did -v rencolor 301
    did -v rencolor 302
    did -v rencolor 303
    did -v rencolor 304
    did -v rencolor 105
    did -v rencolor 106
    did -h rencolor 21
    did -h rencolor 22
    did -h rencolor 23
    did -h rencolor 201
    did -h rencolor 202
    did -h rencolor 203
    did -h rencolor 111
    did -h rencolor 112
    did -h rencolor 113
    did -h rencolor 114
    did -h rencolor 101
    did -h rencolor 102
  }
  elseif (%renautocolor == 2) {
    did -v rencolor 105
    did -v rencolor 106
    did -v rencolor 21
    did -v rencolor 22
    did -v rencolor 23
    did -v rencolor 201
    did -v rencolor 202
    did -v rencolor 203
    did -h rencolor 31
    did -h rencolor 32
    did -h rencolor 33
    did -h rencolor 34
    did -h rencolor 301
    did -h rencolor 302
    did -h rencolor 303
    did -h rencolor 304
    did -h rencolor 111
    did -h rencolor 112
    did -h rencolor 113
    did -h rencolor 114
    did -h rencolor 101
    did -h rencolor 102
  }
  elseif (%renautocolor == 1) {
    did -v rencolor 105
    did -v rencolor 106
    did -v rencolor 111
    did -v rencolor 112
    did -v rencolor 113
    did -v rencolor 114
    did -v rencolor 101
    did -v rencolor 102
    did -h rencolor 31
    did -h rencolor 32
    did -h rencolor 33
    did -h rencolor 34
    did -h rencolor 301
    did -h rencolor 302
    did -h rencolor 303
    did -h rencolor 304
    did -h rencolor 21
    did -h rencolor 22
    did -h rencolor 23
    did -h rencolor 201
    did -h rencolor 202
    did -h rencolor 203
  }
  else {
    did -h rencolor 105
    did -h rencolor 106
    did -h rencolor 31
    did -h rencolor 32
    did -h rencolor 33
    did -h rencolor 34
    did -h rencolor 301
    did -h rencolor 302
    did -h rencolor 303
    did -h rencolor 304
    did -h rencolor 21
    did -h rencolor 22
    did -h rencolor 23
    did -h rencolor 201
    did -h rencolor 202
    did -h rencolor 203
    did -h rencolor 111
    did -h rencolor 112
    did -h rencolor 113
    did -h rencolor 114
    did -h rencolor 101
    did -h rencolor 102
  }
}
dialog inputlist {
  size -1 -1 160 113
  title "Input List Setting"
  icon %set
  option dbu
  box "" 1, 3 0 154 110
  list 2, 8 10 60 100 , sort
  check "Enable input set" 3, 75 15 47 10
  edit "" 4, 72 38 80 10 , autohs
  edit "" 5, 72 58 80 10 , autohs
  text "Text:" 6, 72 30 20 8
  text "Input:" 7, 72 50 20 8
  button "Add" 8, 95 73 25 9
  button "Delet" 9, 125 73 25 9
  button "OK" 11, 74 92 35 10 ,cancel
  button "Show List" 12, 115 92 35 10
}
on 1:dialog:inputlist:*:*:{
  if ($devent == init) {
    if (%input == ON) { did -c $dname 3 }
    inputlistshow
    did -b $dname 9
  } 
  if ($devent == sclick) {
    if ($did == 3) { inputon }
    if ($did == 2) && ($did(2).sel != $null) {
      did -e $dname 9
      did -ra $dname 4 $did(2).seltext
      did -ra $dname 5 %input [ $+ [ $did(2).seltext ] ]
      if ($active != @Input-List) { window -ak @Input-List }
      clear @Input-List
      echo @Input-List *** $did(2).seltext => %input [ $+ [ $did(2).seltext ] ]
    }
    if ($did == 8) {
      if (* * iswm $did(4)) { set %errorinadd Don't leave empty char! | errorinadd }
      elseif ($did(4) != $null) && ($did(5) != $null) {
        set %inputadd $did(4)
        set %input-add $did(5)
        inputadd
      }
    }
    if ($did == 9) && ($did(2).sel != $null) {
      set %inputdel $did(2).seltext
      inputdel
    }
    if ($did == 11) { window -c @inpu-set }
    if ($did == 12) { inputlistshoww }
  }
}
alias inputlistshow {
  did -r inputlist 2
  set %§in 0
  :inp
  inc %§in
  if (%§in > 500) { goto end }
  elseif (%input [ $+ [ %§in ] ] != $null) { did -a inputlist 2 %input [ $+ [ %§in ] ] }
  goto inp
  :end
  unset %§in
  did -b $dname 9
  did -r $dname 4
  did -r $dname 5
}
alias inputadd {
  set %§in 0
  :inp
  inc %§in
  if (%§in > 500) { goto end }
  elseif (%input [ $+ [ %§in ] ] == %inputadd) {
    set %input [ $+ [ %§in ] ] %inputadd
    set %input [ $+ [ %inputadd ] ] %input-add
    goto end
  }
  elseif (%input [ $+ [ %§in ] ] == $null) { 
    set %input [ $+ [ %§in ] ] %inputadd
    set %input [ $+ [ %inputadd ] ] %input-add
    goto end
  }
  else { goto inp }
  :end
  unset %§in %inputadd %input-add
  inputlistshow
}
alias inputdel {
  set %§in 0
  :inp
  inc %§in
  if (%§in > 500) { goto end }
  elseif (%input [ $+ [ %§in ] ] == %inputdel) {
    unset %input [ $+ [ %§in ] ] %input [ $+ [ %inputdel ] ]
    goto end
  }
  else { goto inp }
  :end
  unset %§in %inputdel
  inputlistshow
}
alias inputlistshoww {
  if ($active != @Input-List) { window -ak @Input-List }
  clear @Input-List
  set %§in 0
  :inp
  inc %§in
  if (%§in > 500) { goto end }
  elseif (%input [ $+ [ %§in ] ] != $null) {
    set %DanSip %input [ $+ [ %§in ] ]
    echo @Input-List 2 ***   %DanSip 2=> %input [ $+ [ %DanSip ] ]
  }
  goto inp
  :end
  unset %§in
}
