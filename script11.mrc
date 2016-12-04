;========
;  mp3
;========
dialog mp3c {
  title "MP3 Player"
  size -1 -1 359 356
  option pixels
  icon icons\mp3.ico, 0
  text "", 32, 4 5 98 46, center
  text "", 33, 106 5 246 46
  button "9", 35, 5 85 55 25
  button "4", 36, 65 85 54 25
  button ";", 37, 124 85 53 25
  button "<", 38, 182 85 53 25
  button ":", 39, 241 85 54 25
  button "5", 40, 302 85 51 25
  text "", 43, 110 13 236 16, center
  text "", 44, 110 29 78 16, center
  text "", 45, 188 29 78 16, center
  text "", 46, 268 29 78 16, center
  list 34, 4 56 348 24, size
  text "00:00", 47, 12 9 82 34, center
  button "Up", 48, 301 153 55 25
  button "Down", 49, 301 184 55 25
  list 51, 4 115 293 211, size extsel
  text "No music playing", 5, 111 20 234 16, center
  text "", 103, 5 330 293 22, center
  button "", 79, 0 0 0 0, hide ok
  button "Close", 27, 303 327 53 24, ok
  menu "Show", 11
  item "Volume", 13, 11
  item break, 14, 11
  item "ID3", 15, 11
  item break, 6, 11
  item "Hide", 16, 11
  item "Close", 66, 11
  menu "Playlist", 52
  item "Add file(s)", 53, 52
  item "Add folder", 54, 52
  item break, 55, 52
  menu "Load playlist", 56, 52
  item "*.m3u", 104, 56
  item "*.pls", 105, 56
  item "*.bpl", 106, 56
  item "*.b4s", 107, 56
  item break, 57, 52
  item "Save playlist", 58, 52
  menu "Save playlist as...", 59, 52
  item "*.m3u", 77, 59
  item "*.pls", 78, 59
  item "*.b4s", 80, 59
  item break, 60, 52
  item "Remove file(s)", 61, 52
  item "Clear playlist", 62, 52
  item break, 63, 52
  menu "Move", 65, 52
  item "Up", 69, 65
  item "Down", 70, 65
  menu "Sort by", 67, 52
  item "Title", 71, 67
  item "Filename", 72, 67
  item "Path/filename", 73, 67
  item "Length", 74, 67
  item break, 68, 52
  item "Hide", 64, 52
  menu "Options", 1
  menu "Set path to", 81, 1
  item "Popups", 12, 81
  item "MDX", 84, 81
  item break, 82, 1
  menu "Colors", 17, 1
  menu "Text", 18, 17
  item "Face", 85, 18
  item "Shadow", 86, 18
  item "Hilight", 87, 18
  item "3Dlight", 88, 18
  item "Frame", 89, 18
  item "Text", 90, 18
  item break, 91, 18
  item "mIRC's defaults", 92, 18
  menu "Background", 19, 17
  item "Face", 93, 19
  item "Shadow", 94, 19
  item "Hilight", 95, 19
  item "3Dlight", 96, 19
  item "Frame", 97, 19
  item "Text", 98, 19
  item break, 101, 19
  item "mIRC's defaults", 102, 19
  menu "Method", 7, 1
  item "Continuous", 8, 7
  item "Random", 9, 7
  item break, 26, 7
  item "Repeat", 10, 7
  item "Loop", 75, 7
  menu "Duration", 2, 1
  item "Increasing", 3, 2
  item "Decreasing", 4, 2
  menu "Send to", 20, 1
  item "Active window", 108, 20
  item break, 109, 20
  item "Channels", 21, 20
  item "Queries", 22, 20
  item break, 23, 20
  item "Both", 24, 20
  item "None", 25, 20
  item break, 99, 20
  item "Set message", 100, 20
}

dialog mp3id3 {
  title "MP3 Player - ID3"
  icon icons\mp3.ico
  size -1 -1 151 123
  option dbu
  edit "", 1, 3 3 146 1
  text "Info on MP3: N/A", 2, 4 5 145 8, disabled
  edit "", 3, 3 14 146 1
  text "Title: N/A", 4, 4 19 141 8
  text "Artist: N/A", 5, 4 29 141 8
  text "Genre: N/A", 7, 4 49 141 8
  text "Track: N/A", 9, 4 59 141 8
  text "Comment:", 10, 4 79 42 8
  edit "N/A", 11, 2 89 147 32, read multi autovs
  text "Album: N/A", 12, 4 39 141 8
  text "Year: N/A", 6, 5 69 140 8
  button "", 8, 0 0 0 0, hide ok
}

dialog mp3volume {
  title "Volume"
  icon icons\mp3.ico
  size -1 -1 145 207
  text "Master", 1, 6 3 40 16, disabled
  list 2, 12 18 34 170, size
  text "Wave", 3, 58 3 40 16, disabled
  list 4, 61 18 34 170, size
  text "Midi", 5, 110 3 32 16, disabled
  list 6, 110 18 34 170, size
  check "Mute", 7, 5 188 37 16, push
  check "Mute", 8, 54 188 37 16, push
  check "Mute", 9, 102 188 37 16, push
  button "", 10, 0 0 0 0, hide Ok
}

dialog colors {
  title "Colors"
  icon icons\mp3.ico
  size -1 -1 96 34
  option dbu
  button "", 1, 4 7 10 10
  button "", 2, 15 7 10 10
  button "", 3, 26 7 10 10
  button "", 4, 37 7 10 10
  button "", 5, 48 7 10 10
  button "", 6, 59 7 10 10
  button "", 7, 70 7 10 10
  button "", 8, 81 7 10 10
  button "", 9, 4 18 10 10
  button "", 10, 15 18 10 10
  button "", 11, 26 18 10 10
  button "", 12, 37 18 10 10
  button "", 13, 48 18 10 10
  button "", 14, 59 18 10 10
  button "", 15, 70 18 10 10
  button "", 16, 81 18 10 10
  box "", 17, 2 0 92 4
  box "", 18, 2 28 92 4
  button "", 19, 0 0 0 0, hide result
  button "", 20, 0 0 0 0, hide ok
}

dialog mp3w {
  title "Mp3 Player"
  icon icons\mp3.ico
  size -1 -1 114 15
  option dbu
  edit "", 1, 2 2 110 1
  text "", 2, 2 4 110 8, center, disabled
  edit "", 3, 2 13 110 1
  button "", 4, 0 0 0 0, hide ok
}

;; Events

on *:dialog:mp3c:*:*:{
  if ($devent == init) {
    dialog -t $dname $mp3name
    mp3setmdx
    mp3domdx SetFont $dname 35,36,37,38,39,40 -15 400 Webdings
    mp3domdx SetControlMDX $dname 34 trackbar noticks > $mp3mdx(.).bars
    mp3domdx SetBorderStyle $dname 34
    mp3domdx SetFont $dname 47 ANSI 34 400 Arial
    mp3domdx SetBorderStyle $dname 32,33,103 clientedge staticedge
    mp3domdx SetBorderStyle $dname 35,36,37,38,39,40,41,50,76 staticedge
    mp3domdx SetFont $dname 5,33,43,44,45,46 ANSI 13 700 Tahoma
    mp3domdx SetBorderStyle $dname 48,49 clientedge
    mp3domdx SetFont $dname 42,51,103 ANSI 13 700 Tahoma
    mp3domdx SetControlMDX $dname 51 listview report rowselect showsel > $mp3mdx(.).views
    did -i $dname 51 1 headerdims 329
    did -i $dname 51 1 headertext Filename
    mp3color.aux2
    mp3color.aux3
    if ($mp3ret(main,repeat)) did -c mp3c 10
    if ($mp3ret(main,loop)) did -c mp3c 75
    if (%mp3shuffle) did -c mp3c 9
    else did -c mp3c 8
    if (%mp3duration) did -c mp3c 3
    else did -c mp3c 4
    var %t = $mp3ret(main,show)
    if (%t == 1) var %t = 21
    elseif (%t == 2) var %t = 22
    elseif (%t == 3) var %t = 24
    elseif (%t == 4) var %t = 108
    elseif (%t == 0) var %t = 25
    did -c mp3c %t
    if (!$mp3ret(main,playlist)) did -b mp3c 58
    if ($mp3ret(main,hide)) {
      dialog -s mp3c -1 -1 358 120
      did -c mp3c 64
    }
    mp3ldisp
    if (!$read($mp3.path(mp3f.ml),wn,$inmp3.fname)) {
      did -b mp3c 34,35,37,38,39
    }
    else {
      if (%mp3aux) var %t = $v1
      else {
        var %t = $read($mp3.path(mp3f.ml),wn,$inmp3.fname)
        var %t = $readn
      }
      if (%mp3pause) did -b mp3c 37
      did -c mp3c 51 $calc(%t + 1)
      mp3binfo
      mp3pos
      mp3upd $inmp3.fname
    }
  }
  elseif ($devent == dclick) && ($did == 51) mp3play $calc($did(mp3c,51).sel - 1)
  elseif ($devent == sclick) {
    if ($did == 51) {
      if ($did(mp3c,51).sel) {
        if ($gettok($did(mp3c,51,1),1,32) == rclick) mp3pop
        if ($did(mp3c,51).sel) mp3binfo
      }
    }
    elseif ($did == 34) .splay seek $gettok($did(mp3c,34,1).text,1,32)
    elseif ($did == 35) mp3previous
    elseif ($did == 36) mp3play $iif($did(mp3c,51).sel,$calc($v1 - 1))
    elseif ($did == 37) mp3pause
    elseif ($did == 38) mp3stop
    elseif ($did == 39) mp3next
    elseif ($did == 40) mp3addir
    elseif ($did == 48) if ($did(mp3c,51).sel) mp3upf
    elseif ($did == 49) if ($did(mp3c,51).sel) mp3downf
    elseif ($did == 200) help mp3
  }
  elseif ($devent == menu) {
    if ($did == 3) mp3duration 1
    elseif ($did == 4) mp3duration 0
    elseif ($did == 8) mp3method 1
    elseif ($did == 9) mp3method 2
    elseif ($did == 10) mp3repeat $iif($did(mp3c,10).state,0,1)
    elseif ($did == 12) setpoppath
    elseif ($did == 13) mp3volume
    elseif ($did == 15) mp3id3 $read($mp3.path(mp3f.ml),n,$calc($did(mp3c,51).sel - 1))
    elseif ($did == 16) dialog -x mp3c
    elseif ($did == 21) mp3setshow 1
    elseif ($did == 22) mp3setshow 2
    elseif ($did == 24) mp3setshow 3
    elseif ($did == 25) mp3setshow 0
    elseif ($did == 108) mp3setshow 4
    elseif ($did == 28) mp3readme
    elseif ($did == 29) mp3help
    elseif ($did == 31) mp3about
    elseif ($did == 53) mp3add
    elseif ($did == 54) mp3addir
    elseif ($did == 58) mp3savepl $mp3ret(main,playlist)
    elseif ($did == 61) if ($did(mp3c,51).sel) mp3delf
    elseif ($did == 62) mp3clear
    elseif ($did == 64) {
      if ($did(mp3c,64).state) {
        mp3write main hide 0
        dialog -s mp3c -1 -1 358 359
        did -u mp3c 64
      }
      else {
        mp3write main hide 1
        dialog -s mp3c -1 -1 358 120
        did -c mp3c 64
      }
    }
    elseif ($did == 66) {
      mp3stop
      dialog -x mp3c
    }
    elseif ($did == 69) if ($did(mp3c,51).sel) mp3upf
    elseif ($did == 70) if ($did(mp3c,51).sel) mp3downf
    elseif ($did == 71) mp3sort 1
    elseif ($did == 72) mp3sort 2
    elseif ($did == 73) mp3sort 3
    elseif ($did == 74) mp3sort 4
    elseif ($did == 75) mp3loop $iif($did(mp3c,75).state,0,1)
    elseif ($did == 77) mp3savepl *.m3u
    elseif ($did == 78) mp3savepl *.pls
    elseif ($did == 80) mp3savepl *.b4s
    elseif ($did == 84) setmdxpath
    elseif ($did == 85) mp3color text face
    elseif ($did == 86) mp3color text shadow
    elseif ($did == 87) mp3color text hilight
    elseif ($did == 88) mp3color text 3dlight
    elseif ($did == 89) mp3color text frame
    elseif ($did == 90) mp3color text text
    elseif ($did == 92) mp3color text $color($stdc)
    elseif ($did == 93) mp3color back face
    elseif ($did == 94) mp3color back shadow
    elseif ($did == 95) mp3color back hilight
    elseif ($did == 96) mp3color back 3dlight
    elseif ($did == 97) mp3color back frame
    elseif ($did == 98) mp3color back text
    elseif ($did == 100) mp3setmsg $$input(Tags: <title> $+ $chr(44) <length> $+ $chr(44) <bitrate> $+ $chr(44) <mode> $+ $chr(44) <sample> $+ $chr(44) <size>,e,MP3 message,%mp3msg)
    elseif ($did == 102) mp3color back $color($stdc)
    elseif ($did == 104) mp3loadpl m3u
    elseif ($did == 105) mp3loadpl pls
    elseif ($did == 106) mp3loadpl bpl
    elseif ($did == 107) mp3loadpl b4s
  }
}

on *:dialog:mp3volume:*:*:{
  if ($devent == init) {
    mp3setmdx
    mp3domdx SetFont $dname 1,3,5 ANSI 13 700 Tahoma
    mp3domdx SetBorderStyle $dname 7,8,9 clientedge
    mp3domdx SetControlMDX $dname 2,4,6 trackbar vertical noticks > $mp3mdx(.).bars
    mp3domdx SetBorderStyle $dname 2,4,6
    did -i $dname 2 1 params $calc(65535 - $vol(master)) 0 65535
    did -i $dname 4 1 params $calc(65535 - $vol(wave)) 0 65535
    did -i $dname 6 1 params $calc(65535 - $vol(midi)) 0 65535
    if ($vol(master).mute) did -c $dname 7
    if ($vol(wave).mute) did -c $dname 8
    if ($vol(midi).mute) did -c $dname 9
  }
  elseif ($devent == sclick) {
    if ($did == 2) vol -v $mixeraux(2)
    elseif ($did == 4) vol -w $mixeraux(4)
    elseif ($did == 6) vol -m $mixeraux(6)
    elseif ($did == 7) vol -vu $+ $mixeraux2(7)
    elseif ($did == 8) vol -wu $+ $mixeraux2(8)
    elseif ($did == 9) vol -mu $+ $mixeraux2(9)
  }
}

on *:dialog:colors:*:*: { 
  if ($devent == init) {
    mp3setmdx
    mp3domdx SetBorderStyle $dname 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16 clientedge
    mp3domdx SetControlMDX $dname 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16 Text > $ctl_gen
    mp3domdx SetDialog $dname style 0 title
    var %i = 1
    while (%i <= 16) {
      mp3domdx SetColor $dname %i background $color($calc(%i - 1))
      inc %i
    }
  }
  elseif ($devent == sclick) {
    if ($did >= 1) && ($did <= 16) {
      did -a $dname 19 $calc($did - 1)
      dialog -k colors
    }
  }
}

on *:dialog:mp3id3:init:0: { 
  dialog -t $dname $mp3name - ID3
  mp3setmdx
  mp3domdx SetFont $dname 2 ANSI 13 700 Tahoma
  mp3domdx SetBorderStyle $dname 1,3,11 staticedge
}

on *:dialog:mp3w:init:0:{
  mp3setmdx
  mp3domdx SetFont $dname 2 ANSI 13 700 Tahoma
  mp3domdx SetDialog $dname style 0 title
  mp3domdx SetBorderStyle $dname 1,3 staticedge
}

on *:START:{
  if (!$isfile($mp3.path(mp3f.ml))) write -c $mp3.path(mp3f.ml)
  if (!$isfile($mp3.path(mp3i.ml))) write -c $mp3.path(mp3i.ml)
  var %t = $remove($scriptdir $+ temp\,$mircdir)
  if (!$isdir(%t)) .mkdir %t
}

on *:LOAD:{
  set %mp3index 0
  set %mp3shuffle 0
  set %mp3duration 1
  set %mp3msg on <title>   » [<length>]
  mp3write main Popups $remove($scriptdir $+ Popups\Popups.dll,$mircdir)
  mp3write main MDX $remove($scriptdir $+ MDX\,$mircdir)
}

on *:UNLOAD:{
  mp3stop
  unset %mp3*
}

on *:EXIT:{
  while ($findfile($mp3.path(temp\),*,1,0)) .remove " $+ $v1 $+ "
}

on *:MP3END:{
  if ($mp3ret(main,repeat)) .splay -p " $+ $filename $+ "
  else mp3next
}

on *:EXIT:mp3stop

;; Commands

alias mp3c if (!$dialog(mp3c)) dialog -md mp3c mp3c

alias mp3volume if (!$dialog(mp3volume)) dialog -hmd mp3volume mp3volume

alias mp3help run $mp3.path(contents.htm)

alias mp3readme run $mp3.path(readme.txt)

alias mp3about var %n = $input($mp3name written by Snake,oi,$mp3name)

alias setpoppath {
  var %t = $$sfile($+($scriptdir,Popups.dll),Set Popups.dll path,Ok)
  if ($nopath(%t) == Popups.dll) writeini $mp3.path(mp3.ini) main Popups %t
  else var %null = $input(Wrong file name,o,$mp3name)
}

alias setmdxpath {
  var %t = $$sdir($scriptdir,Set MDX path,Ok)
  if ($isfile(%t $+ mdx.dll)) && ($isfile(%t $+ bars.mdx)) && ($isfile(%t $+ views.mdx)) && ($isfile(%t $+ ctl_gen.mdx)) writeini $mp3.path(mp3.ini) main mdx %t
  else var %null = $input(MDX files are missing. You need at least mdx.dll $+ $chr(44) bars.mdx $+ $chr(44) ctl_gen.mdx and views.mdx,o,MP3 system)
}

alias mp3id3 {
  if (!$isfile($1-)) return
  if (!$dialog(mp3id3)) dialog -hmd mp3id3 mp3id3
  mp3id.aux 2 Info on MP3: $nopath($1-)
  mp3id.aux 4 Title: $iif($mp3($1-).title,$v1,N/A)
  mp3id.aux 5 Artist: $iif($mp3($1-).artist,$v1,N/A)
  mp3id.aux 12 Album: $iif($mp3($1-).album,$v1,N/A)
  mp3id.aux 7 Genre: $iif($mp3($1-).genre,$v1,N/A)
  mp3id.aux 9 Track: $iif($ord($mp3($1-).track) != -1st,$v1,N/A)
  mp3id.aux 6 Year: $iif($mp3($1-).year,$v1,N/A)
  mp3id.aux 11 $iif($mp3($1-).comment,$v1,N/A)
}

alias mp3play {
  set %mp3index $lines($mp3.path(mp3f.ml))
  if (%mp3pause) {
    .splay resume
    unset %mp3pause
    if ($dialog(mp3c)) did -e mp3c 37
  }
  else {
    if ($1 isnum) mp3start $1
    elseif ($dialog(mp3c)) && ($did(mp3c,51).sel) mp3start $calc($did(mp3c,51).sel - 1)
    else mp3start 1
  }
}

alias mp3pause {
  if (!$inmp3) return
  .splay pause
  set %mp3pause 1
  if ($dialog(mp3c)) did -b mp3c 37
}

alias mp3previous {
  var %f = $mp3.path(mp3s.ml)
  var %f2 = $mp3.path(mp3c.ml)
  if ($isfile(%f2)) {
    if ($mp3previous.aux($1)) mp3previous.aux3
    else {
      dec %mp3aux
      if (%mp3aux < 1) set %mp3aux %mp3index
      var %t = $gettok($read(%f2,wn,*|1,%mp3aux),1,124)
      if (%t) mp3previous.aux2 $readn %f2
      else {
        var %t = $gettok($read(%f2,wn,*|1),1,124)
        if (%t) mp3previous.aux2 $readn %f2
        else mp3stop
      }
    }
  }
  elseif ($isfile(%f)) {
    if ($mp3previous.aux($1)) mp3previous.aux3
    else {
      write -il1 %f $read($mp3.path(mp3spre.ml),n,1)
      write -dl1 $mp3.path(mp3spre.ml)
      inc %mp3si
      if (%mp3si <= %mp3index) {
        set %mp3line 1
        var %null = $read($mp3.path(mp3f.ml),wn,$read(%f,n,1))
        mp3auxp $readn
      }
      else mp3stop
    }
  }
  else mp3stop
}

alias mp3next {
  var %f = $mp3.path(mp3s.ml)
  var %f2 = $mp3.path(mp3c.ml)
  if ($isfile(%f2)) {
    write -l %mp3aux %f2 $+($read($mp3.path(mp3f.ml),n,%mp3aux),|,1)
    inc %mp3aux
    if (%mp3aux > %mp3index) set %mp3aux 1
    var %t = $read(%f2,wn,*.mp3,%mp3aux)
    if (%t) mp3next.aux $readn
    else {
      var %t = $read(%f2,wn,*.mp3)
      if (%t) mp3next.aux $readn
      else {
        if ($mp3ret(main,loop)) mp3play %mp3aux
        else mp3stop
      }
    }
  }
  elseif ($isfile(%f)) {
    write -il1 $mp3.path(mp3spre.ml) $read(%f,n,%mp3line)
    write -dl %mp3line %f
    dec %mp3si
    if (%mp3si) {
      set %mp3line $rand(1,%mp3si)
      var %null = $read($mp3.path(mp3f.ml),wn,$read(%f,n,%mp3line))
      mp3auxp $readn
    }
    else {
      if ($mp3ret(main,loop)) mp3play
      else mp3stop
    }
  }
  else mp3stop
}

alias mp3stop {
  unset %mp3aux
  unset %mp3si
  unset %mp3line
  unset %mp3pause
  var %f = $mp3.path(mp3c.ml)
  if ($isfile(%f)) .remove %f
  var %f = $mp3.path(mp3s.ml)
  if ($isfile(%f)) .remove %f
  var %f = $mp3.path(mp3spre.ml)
  if ($isfile(%f)) .remove %f
  if ($inmp3) .splay stop
  if ($dialog(mp3c)) {
    did -v mp3c 5
    did -i mp3c 34 1 params 0 0 1
    did -h mp3c 43,44,45,46
    did -ra mp3c 47 00:00
    did -b mp3c 34,35,37,38,39
  }
  .timermp3 off
}

alias mp3add {
  var %n = $$msfile(*.mp3,Choose your MP3's,Ok)
  if (%n == -1) {
    var %n = $anawarn(You've selected to many files at once)
    return
  }
  elseif (!%n) return
  mp3w
  .fopen -no mp3 $mp3.path(temp\mp3.t)
  var %i = 1
  while (%i <= %n) {
    .fwrite -n mp3 $msfile(%i)
    inc %i
  }
  .fclose mp3
  mp3addf $mp3dsel
  mp3ldisp
  dialog -x mp3w
}

alias mp3addir {
  var %d = $$adir(*,Choose a folder,Ok)
  mp3w
  var %i = 1
  .fopen -no mp3 $mp3.path(temp\mp3.t)
  while (1) {
    var %f = $findfile(%d,*.mp3,%i,.fwrite -n mp3 $1-)
    if (!%f) break
    inc %i
  }
  .fclose mp3
  mp3addf $mp3dsel
  mp3ldisp
  dialog -x mp3w
}

alias mp3del {
  var %f = $mp3.path(mp3f.ml)
  if (!$1) || ($1 < 1) || ($1 > $lines(%f)) return
  if ($dialog(mp3c)) && ($did(mp3c,51).sel) var %t = $did(mp3c,51).sel
  dec %mp3index
  if (%mp3aux) {
    if ($1 == %mp3aux) var %l = 1
    elseif ($1 < %mp3aux) dec %mp3aux
    if (%mp3aux > %mp3index) {
      set %mp3aux 1
      if (%t) var %t = -1
    }
    write -dl $1 $mp3.path(mp3c.ml)
  }
  elseif (%mp3line) {
    var %f2 = $mp3.path(mp3s.ml)
    var %n = $read(%f,n,$1)
    if ($read(%f2,wn,%n)) {
      var %n = $readn
      if (%n == %mp3line) var %l = 1
      if (%n <= %mp3line) dec %mp3line
      write -dl %n %f2 %f
      dec %mp3si
    }
    var %f2 = $mp3.path(mp3spre.ml)
    var %n = $read(%f,n,$1)
    if ($read(%f2,wn,%n)) {
      var %n = $readn
      write -dl %n %f2 %f
    }
  }
  write -dl $1 %f
  write -dl $1 $mp3.path(mp3i.ml)
  if (%l) mp3auxp $iif(%mp3aux,$v1,$1)
  if (!%mp3nd) mp3ldisp
  if (%t) && ($did(mp3c,51,2)) {
    if (%t == -1) did -c mp3c 51 2
    elseif ($did(mp3c,51).lines >= %t) did -c mp3c 51 %t
    else did -c mp3c 51 $calc(%t - 1)
  }
}

alias mp3clear {
  mp3stop
  set %mp3index 0
  write -c $mp3.path(mp3f.ml)
  write -c $mp3.path(mp3i.ml)
  if ($dialog(mp3c)) did -r mp3c 51,103  
}

alias mp3loadpl {
  if (!$istok(pls.m3u.bpl.b4s,$1,46)) return
  var %f = $$afile(*. $+ $1,Choose playlist,Ok)
  if (!$isfile(%f)) return
  mp3w
  mp3write main playlist %f
  var %x = $right(%f,4)
  mp3clear
  .fopen mp3 " $+ %f $+ "
  .fopen -no mp3out $mp3.path(temp\mp3.t)
  while (!$feof) {
    var %mp3t = $fread(mp3)
    if (%x == .m3u) {
      if ($left(%mp3t,4) != #EXT) && ($right(%mp3t,4) == .mp3) {
        if ($mid(%mp3t,2,1) != $chr(58)) && ($left(%mp3t,1) != $chr(92)) var %mp3t = $nofile(%f) $+ %mp3t
        elseif ($left(%mp3t,1) == $chr(92)) var %mp3t = $left(%f,2) $+ %mp3t
      }
    }
    elseif (%x == .pls) {
      if (File* iswm $gettok(%mp3t,1,61)) && ($right(%mp3t,4) == .mp3) {
        var %mp3t = $gettok(%mp3t,2,61)
        if ($mid(%mp3t,2,1) != $chr(58)) && ($left(%mp3t,1) != $chr(92)) var %mp3t = $nofile(%f) $+ %mp3t
        elseif ($left(%mp3t,1) == $chr(92)) var %mp3t = $left(%f,2) $+ %mp3t
      }
    }
    elseif (%x == .bpl) {
      var %winamp.string = <entry Playstring
      if (%winamp.string isin %mp3t) {
        var %mp3t = $gettok($gettok(%mp3t,2-,58),1,34)
        var %mp3t = $plrep(%mp3t)
      }
    }
    elseif (%x == .b4s) {
      var %t = <entry playstring
      if (%t isin %mp3t) && (file: isin %mp3t) var %mp3t = $plrep($gettok($gettok($gettok($remfirst(%mp3t,$calc($pos(%mp3t,playstring=,1) - 1)),2,61),1,34),2-,58))
    }
    if ($mp3(%mp3t).length) .fwrite -n mp3out %mp3t
  }
  .fclose mp3
  .fclose mp3out
  mp3addf
  if ($dialog(mp3c)) did -e mp3c 58
  mp3ldisp
  dialog -x mp3w
}

alias mp3savepl {
  if (!$1) return
  set -u %s $mp3.path(mp3f.ml)
  if ($isfile($1-)) {
    set -u %f $+(",$1-,")
    var %x = $right($1-,3)
    $+(save,%x) %f
  }
  else {
    set -u %f $$afile($1,Save playlist,Save)
    var %x = $remfirst($1,1)
    if ($right(%f,4) != %x) set -u %f %f $+ %x
    mp3write main playlist %f
    set -u %f $+(",%f,")
    .fopen mp3in %s
    .fopen -no mp3save %f
    if ($1 == *.m3u) savem3u %f
    elseif ($1 == *.pls) savepls %f
    elseif ($1 == *.b4s) saveb4s %f
    .fclose mp3*
  }
}

alias mp3sort {
  if ($1 !isnum) || ($1 <= 0) || ($1 > 4) return
  mp3w
  if ($dialog(mp3c)) && ($did(mp3c,51).sel) var %s = $did(mp3c,51).sel
  var %f = $mp3.path(mp3f.ml)
  var %df = $mp3.path(mp3i.ml)
  window -hs @mp3sort
  var %l = $lines(%f)
  var %i = 1
  while (%i <= %l) {
    var %t = $read(%f,n,%i)
    if ($1 == 1) var %x = $mp3info(%t)
    elseif ($1 == 2) var %x = $nopath(%t)
    elseif ($1 == 3) var %x = %t
    elseif ($1 == 4) var %x = $mp3(%t).length
    aline @mp3sort $+(%x,",%t)
    inc %i
  }
  write -c %f
  write -c %df
  var %f2 = $mp3.path(mp3c.ml)
  var %f3 = $mp3.path(mp3t.ml)
  var %i = 1
  while ($line(@mp3sort,%i)) {
    var %t = $gettok($v1,-1,34)
    if (%mp3aux) {
      if (%t == $inmp3.fname) set %mp3aux %i
      write %f3 %t $+ $iif($read(%f2,wn,%t $+ |1),|1)
    }
    write %f %t
    write %df $lv($nopath(%t))
    inc %i
  }
  if ($isfile(%f3)) {
    .copy -o %f3 %f2
    .remove %f3
  }
  window -c @mp3sort
  mp3ldisp
  if ($dialog(mp3c)) {
    if (%s) did -c mp3c 51 %s
    else did -u mp3c 51 %s
  }
  dialog -x mp3w
}

alias mp3up {
  var %f = $mp3.path(mp3f.ml)
  if (!$1) || ($1 <= 1) || ($1 > $lines(%f)) return
  var %t = $read(%f,n,$1)
  write -dl $1 %f
  write -il $calc($1 - 1) %f %t
  if (%mp3aux) {
    var %f = $mp3.path(mp3c.ml)
    var %t = $read(%f,n,$1)
    write -dl $1 %f
    write -il $calc($1 - 1) %f %t
    if (%mp3aux == $1) set %mp3aux $calc($1 - 1)
    elseif (%mp3aux == $calc($1 - 1)) set %mp3aux $1
  }
  var %f = $mp3.path(mp3i.ml)
  var %t1 = $read(%f,n,$1)
  var %t2 = $read(%f,n,$calc($1 - 1))
  write -l $calc($1 - 1) %f %t1
  write -l $1 %f %t2
  if ($dialog(mp3c)) {
    did -co mp3c 51 $1 %t1
    did -o mp3c 51 $calc($1 + 1) %t2
  }
}

alias mp3down {
  var %f = $mp3.path(mp3f.ml)
  if (!$1) || ($1 < 1) || ($1 >= $lines(%f)) return
  var %t = $read(%f,n,$1)
  write -dl $1 %f
  write -il $calc($1 + 1) %f %t
  if (%mp3aux) {
    var %f = $mp3.path(mp3c.ml)
    var %t = $read(%f,n,$1)
    write -dl $1 %f
    write -il $calc($1 + 1) %f %t
    if (%mp3aux == $1) set %mp3aux $calc($1 + 1)
    elseif (%mp3aux == $calc($1 + 1)) set %mp3aux $1
  }
  var %f = $mp3.path(mp3i.ml)
  var %t1 = $read(%f,n,$1)
  var %t2 = $read(%f,n,$calc($1 + 1))
  write -l $calc($1 + 1) %f %t1
  write -l $1 %f %t2
  if ($dialog(mp3c)) {
    did -co mp3c 51 $calc($1 + 2) %t1
    did -o mp3c 51 $calc($1 + 1) %t2
  }
}

alias mp3setmsg set %mp3msg $1-

alias mp3loop mp3lr loop 75 $1

alias mp3repeat mp3lr repeat 10 $1

alias mp3setshow {
  mp3write main show $1
  if ($dialog(mp3c)) {
    if ($1 == 1) var %t = 21
    elseif ($1 == 2) var %t = 22
    elseif ($1 == 3) var %t = 24
    elseif ($1 == 4) var %t = 108
    elseif ($1 == 0) var %t = 25
    did -u mp3c 21,22,24,25,108
    did -c mp3c %t
  }
}

alias mp3color {
  if ($rgb($2) != $null) {
    if ($1 == back) || ($1 == text) mp3write main $1-
    if ($dialog(mp3c)) {
      if ($1 == back) mp3color.aux2
      elseif ($1 == text) mp3color.aux3
    }
  }
}

alias mp3show {
  if (!$inmp3) || (!$server) return
  var %t = $mp3ret(main,show)
  var %m = $mp3showmsg($inmp3.fname)
  if ($1) describe $1 %m
  else {
    if ((%t == 1) || (%t == 3)) && ($chan(1)) ame %m
    elseif ((%t == 2) || (%t == 3)) && ($query(1)) qme %m
    elseif (%t == 4) && ($active ischan) || ($query($active)) || ($chat($active)) msg $active %m
  }
}

alias mp3duration {
  set %mp3duration $1
  if ($dialog(mp3c)) {
    if ($1) {
      did -c mp3c 3
      did -u mp3c 4
    }
    else {
      did -u mp3c 3
      did -c mp3c 4
    }
  }
}

alias mp3method {
  var %f = $mp3.path(mp3f.ml)
  var %f2 = $mp3.path(mp3s.ml)
  var %f3 = $mp3.path(mp3c.ml)
  var %f4 = $mp3.path(mp3spre.ml)
  if ($1 == 1) {
    if (%mp3line) {
      var %i = 1
      while ($read(%f,n,%i)) {
        var %t = $v1
        if ($inmp3.fname == %t) set %mp3aux %i
        write %f3 %t $+ $iif(!$read(%f2,wn,%t),|1)
        inc %i
      }
      unset %mp3si
      unset %mp3line
      if ($isfile(%f2)) .remove %f2
      if ($isfile(%f4)) .remove %f4
    }
    set %mp3shuffle 0
    if ($dialog(mp3c)) {
      did -c mp3c 8
      did -u mp3c 9
    }
  }
  elseif ($1 == 2) {
    if (%mp3aux) {
      var %i = 1
      while ($read(%f3,n,%i)) {
        var %t = $v1
        write $iif(*|1 iswm %t,%f4,%f2) $gettok(%t,1,124)
        if ($inmp3.fname == $gettok(%t,1,124)) set %mp3line $lines(%f2)
        inc %i
      }
      set %mp3si $lines(%f2)
      unset %mp3aux
      if ($isfile(%f3)) .remove %f3
    }
    set %mp3shuffle 1
    if ($dialog(mp3c)) {
      did -u mp3c 8
      did -c mp3c 9
    }
  }
}

alias ra echo -a $remove(Ro-Bot)

;; Auxiliar commands & identifiers

alias -l mp3name return MP3 Player [/mp3c]

alias -l mp3popups return $shortfn($mp3ret(main,popups) $+ %t)

alias -l mp3setmdx {
  mp3domdx SetMircVersion $version
  mp3domdx MarkDialog $dname $dialog($dname).hwnd
}

alias -l mp3mdx {
  if ($prop) {
    if ($prop == ctl_gen) var %t = ctl_gen.mdx
    elseif ($prop == views) var %t = views.mdx
    elseif ($prop == bars) var %t = bars.mdx
  }
  else var %t = mdx.dll
  return $shortfn($mp3ret(main,mdx) $+ %t)
}

alias -l mp3domdx dll $mp3mdx $1-

alias -l mp3lr {
  mp3write main $1 $3
  if ($dialog(mp3c)) {
    if ($3) did -c mp3c $2
    else did -u mp3c $2
  }
}

alias -l mp3color.aux {
  var %t = $mp3ret(main,$1)
  var %t = $iif(%t isnum,%t,$rgb(%t))
  return %t
}

alias -l mp3color.aux2 {
  var %t = $mp3color.aux(back)
  did -i mp3c 51 1 setbkg color %t
  did -i mp3c 51 1 settxt bgcolor %t
  mp3domdx SetColor mp3c 5,32,33,43,44,45,46,47,103 background %t
  mp3domdx SetColor mp3c 5,32,33,43,44,45,46,47,103 textbg %t
}

alias -l mp3color.aux3 {
  var %t = $mp3color.aux(text)
  did -i mp3c 51 1 settxt color %t
  mp3domdx SetColor mp3c 5,32,33,43,44,45,46,47,103 text %t
}

alias -l mp3ldisp {
  if ($dialog(mp3c)) && ($isfile($mp3.path(mp3i.ml))) {
    loadbuf -ro mp3c 51 $mp3.path(mp3i.ml)
    if ($dialog(mp3c)) {
      if ($did(mp3c,51,2)) {
        did -c mp3c 51 2
        mp3binfo
      }
      else did -r mp3c 103
    }
  }
}

alias -l mp3dsel return $iif($dialog(mp3c) && $did(mp3c,51).sel,$calc($did(mp3c,51).sel - 1))

alias -l mp3addf {
  if (!$lines($mp3.path(temp\mp3.t))) return
  var %l = $lines($mp3.path(mp3f.ml))
  .fopen mp3 $mp3.path(temp\mp3.t)
  .fopen mp3f $mp3.path(mp3f.ml)
  .fopen mp3i $mp3.path(mp3i.ml)
  if (%mp3aux) .fopen mp3c $mp3.path(mp3c.ml)
  elseif (%mp3si) {
    var %n = $lines($mp3.path(mp3s.ml))
    .fopen mp3s $mp3.path(mp3s.ml)
    mp3addf.aux2 s %n
  }
  if ($1 isnum) {
    .fopen -no mp3fx $mp3.path(temp\mp3fx.t)
    .fopen -no mp3ix $mp3.path(temp\mp3ix.t)
    if (%mp3aux) .fopen -no mp3cx $mp3.path(temp\mp3cx.t)
    var %i = 1
    while (1) {
      if (%i == $1) mp3addf.aux1 $1 cx fx ix
      if ($fread(mp3f)) .fwrite -n mp3fx $v1
      else break
      .fwrite -n mp3ix $fread(mp3i)
      if (%mp3aux) .fwrite -n mp3cx $fread(mp3c)
      inc %i
    }
    .fclose mp3*
    .copy -o $mp3.path(temp\mp3fx.t) $mp3.path(mp3f.ml)
    .copy -o $mp3.path(temp\mp3ix.t) $mp3.path(mp3i.ml)
    if ($isfile($mp3.path(temp\mp3cx.t))) {
      .copy -o $mp3.path(temp\mp3cx.t) $mp3.path(mp3c.ml)
      .remove $mp3.path(temp\mp3cx.t)
    }
  }
  else {
    mp3addf.aux2 f %l
    mp3addf.aux2 i %l
    if (%mp3aux) mp3addf.aux2 c %l
    mp3addf.aux1 0 c f i
    .fclose mp3*
  }
}

alias -l mp3addf.aux1 {
  while (1) {
    var %f = $fread(mp3)
    if (!%f) break
    inc %mp3index
    if (%mp3aux) {
      if ($1 <= %mp3aux) inc %mp3aux
      .fwrite -n mp3 $+ $2 %f
    }
    elseif (%mp3si) {
      inc %mp3si
      .fwrite -n mp3s %f
    }
    .fwrite -n mp3 $+ $3 %f
    .fwrite -n mp3 $+ $4 $lv($nopath(%f))
  }
}

alias -l mp3addf.aux2 {
  .fseek -l mp3 $+ $1 $2
  var %null = $fread(mp3 $+ $1)
}

alias -l mp3info {
  if ($prop == duration) var %t = $time($round($calc($mp3($1).length / 1000),0),nn:ss)
  elseif ($prop == length) var %t = $round($calc($mp3($1).length / 1000),0)
  else {
    if ($mp3($1).artist) && ($mp3($1).title) var %t = $mp3($1).artist - $mp3($1).title
    else var %t = $remlast($nopath($1),4)
  }
  return %t
}

alias -l afile return $remove($sfile($1,$2,$3),$mircdir)

alias -l adir return $remove($sdir($1,$2,$3),$mircdir)

alias -l remfirst return $right($1,$calc($len($1) - $2))

alias -l remlast return $left($1,$calc($len($1) - $2))

alias -l tab return $chr(9)

alias -l lv {
  var %t = 0 + 0 0 0 $1
  if ($chr(9) isin %t) {
    var %i = 2
    while ($gettok(%t,%i,9)) {
      var %t = $reptok(%t,$gettok(%t,%i,9),+ 0 0 0 $gettok(%t,%i,9),1,9)
      inc %i
    }
  }
  return %t
}

alias -l nolv {
  var %t = $gettok($1,6-,32)
  if ($chr(9) isin %t) {
    var %i = 2
    while ($gettok($gettok(%t,%i,9),5-,32)) {
      var %t = $reptok(%t,$gettok(%t,%i,9),$gettok($gettok(%t,%i,9),5-,32),1,9)
      inc %i
    }
  }
  return %t
}

alias -l stdc return $dialog(colors,colors)

alias -l mp3showmsg return $replace(%mp3msg,<title>,$mp3info($1-),<length>,$mp3info($1-).duration,<bitrate>,$mp3($1-).bitrate,<mode>,$mp3($1-).mode,<sample>,$calc($mp3($1-).sample / 1000),<size>,$bytes($file($1-).size).suf)

alias -l mp3delf {
  set -u %mp3nd 1
  var %n = $mp3faux
  var %i = 1
  while ($gettok(%n,%i,46)) {
    mp3del $calc($v1 - %i + 1)
    inc %i
  }
  mp3ldisp
}

alias -l mp3upf {
  var %n = $mp3faux
  var %i = 1
  while ($gettok(%n,%i,46)) {
    mp3up $v1
    inc %i
  }
}

alias -l mp3downf {
  var %n = $mp3faux
  var %i = -1
  while ($gettok(%n,%i,46)) {
    mp3down $v1
    dec %i
  }
}

alias -l mp3faux {
  var %i = 1
  while ($did(mp3c,51,%i).sel) {
    var %n = $+(%n,.,$calc($v1 - 1))
    inc %i
  }
  return %n
}

alias -l mp3pop {
  dll $mp3popups New mp3pop 9 9
  mp3pop.aux Play $cr mp3play
  mp3pop.aux
  mp3pop.aux Add file(s) $cr mp3add
  mp3pop.aux Remove file(s) $cr mp3delf
  mp3pop.aux Clear playlist $cr mp3clear
  mp3pop.aux
  mp3pop.aux Move Up $cr mp3upf
  mp3pop.aux Move Down $cr mp3downf
  mp3pop.aux
  mp3pop.aux Show ID3 $cr mp3id3 $read($mp3.path(mp3f.ml),n,$calc($did(mp3c,51).sel - 1))
  var %t = $dll($mp3popups,Popup,mp3pop + $mouse.dx $mouse.dy)
  if ($gettok(%t,1,32) == OK) $gettok(%t,4-,32)
}

alias -l mp3pop.aux dll $mp3popups AddItem mp3pop end + 0 0 $1-

alias -l mp3ret return $readini($mp3.path(mp3.ini),$1,$2)

alias -l mp3write writeini $mp3.path(mp3.ini) $1-

alias -l mp3.path return $+(",$scriptdir,$1,")

alias -l savem3u {
  .fwrite -n mp3save #EXTM3U
  while (1) {
    var %w = $fread(mp3in)
    if (!%w) break
    .fwrite -n mp3save #EXTINF: $+ $mp3info(%w).length $+ , $+ $mp3info(%w)
    .fwrite -n mp3save %w
  }
}

alias -l savepls {
  .fwrite -n mp3save [playlist]
  while (1) {
    var %w = $fread(mp3in)
    if (!%w) break
    .fwrite -n mp3save $+(File,%i,=,%w)
    .fwrite -n mp3save $+(Title,%i,=,$mp3info(%w))
    .fwrite -n mp3save $+(Length,%i,=,$mp3info(%w).length)
  }
  .fwrite -n mp3save $+(NumberOfEntries,=,$calc(%i - 1))
  .fwrite -n mp3save Version=2
}

alias -l saveb4s {
  .fwrite -n mp3save <WinampXML>
  .fwrite -n mp3save $+(<Playlist num_entries=",$lines(%s)," label=",$mp3name,">)
  while (1) {
    var %w = $fread(mp3in)
    if (!%w) break
    .fwrite -n mp3save $+(<Entry Playstring="file:,$plput(%w),">)
    .fwrite -n mp3save $+(<Name>,$plput($mp3info(%w)),</Name>)
    .fwrite -n mp3save $+(<Length>,$mp3(%w).length,</Length>)
    .fwrite -n mp3save </Entry>
  }
  .fwrite -n mp3save </Playlist>
  .fwrite -n mp3save </WinampXML>
}

alias -l plrep {
  var %t = $1-
  var %t = $replace(%t,&amp;,&,&apos;,',&#x80;,€)
  var %t = $replace(%t,&#x82;,‚)
  var %t = $replace(%t,&#x83;,ƒ,&#x84;,„,&#x85;,…,&#x86;,†,&#x87;,‡,&#x88;,ˆ,&#x89;,‰,&#x8a;,Š,&#x8b;,‹,&#x8c;,Œ)
  var %t = $replace(%t,&#x91;,‘,&#x92;,’,&#x93;,“,&#x94;,”,&#x95;,•,&#x96;,–,&#x97;,—,&#x98;,˜,&#x99;,™,&#x9a;,š)
  var %t = $replace(%t,&#x9b;,›,&#x9c;,œ,&#x9f;,Ÿ,&#xa1;,¡,&#xa2;,¢,&#xa3;,£,&#xa4;,¤,&#xa5;,¥,&#xa6;,¦,&#xa7;,§)
  var %t = $replace(%t,&#xa8;,¨,&#xa9;,©,&#xaa;,ª,&#xab;,«,&#xac;,¬,&#xae;,®,&#xaf;,¯,&#xb0;,°,&#xb1;,±,&#xb2;,²)
  var %t = $replace(%t,&#xb3;,³,&#xb4;,´,&#xb5;,µ,&#xb6;,¶,&#xb7;,·,&#xb8;,¸,&#xb9;,¹,&#xba;,º,&#xbb;,»,&#xbc;,¼)
  var %t = $replace(%t,&#xbd;,½,&#xbe;,¾,&#xbf;,¿,&#xc0;,À,&#xc1;,Á,&#xc2;,Â,&#xc3;,Ã,&#xc4;,Ä,&#xc5;,Å,&#xc6;,Æ)
  var %t = $replace(%t,&#xc7;,Ç,&#xc8;,È,&#xc9;,É,&#xca;,Ê,&#xcb;,Ë,&#xcc;,Ì,&#xcd;,Í,&#xce;,Î,&#xcf;,Ï,&#xd0;,Ð)
  var %t = $replace(%t,&#xd1;,Ñ,&#xd2;,Ò,&#xd3;,Ó,&#xd4;,Ô,&#xd5;,Õ,&#xd6;,Ö,&#xd7;,×,&#xd8;,Ø,&#xd9;,Ù,&#xda;,Ú)
  var %t = $replace(%t,&#xdb;,Û,&#xdc;,Ü,&#xdd;,Ý,&#xde;,Þ,&#xdf;,ß,&#xe0;,à,&#xe1;,á,&#xe2;,â,&#xe3;,ã,&#xe4;,ä)
  var %t = $replace(%t,&#xe5;,å,&#xe6;,æ,&#xe7;,ç,&#xe8;,è,&#xe9;,é,&#xea;,ê,&#xeb;,ë,&#xec;,ì,&#xed;,í,&#xee;,î)
  var %t = $replace(%t,&#xef;,ï,&#xf0;,ð,&#xf1;,ñ,&#xf2;,ò,&#xf3;,ó,&#xf4;,ô,&#xf5;,õ,&#xf6;,ö,&#xf7;,÷,&#xf8;,ø)
  var %t = $replace(%t,&#xf9;,ù,&#xfa;,ú,&#xfb;,û,&#xfc;,ü,&#xfd;,ý,&#xfe;,þ,&#xff;,ÿ)
  return %t
}

alias -l plput {
  var %t = $1-
  var %t = $replace(%t,&,&amp;,',&apos;,€,&#x80;)
  var %t = $replace(%t,‚,&#x82;)
  var %t = $replace(%t,ƒ,&#x83;,„,&#x84;,…,&#x85;,†,&#x86;,‡,&#x87;,ˆ,&#x88;,‰,&#x89;,Š,&#x8a;,‹,&#x8b;,Œ,&#x8c;)
  var %t = $replace(%t,‘,&#x91;,’,&#x92;,“,&#x93;,”,&#x94;,•,&#x95;,–,&#x96;,—,&#x97;,˜,&#x98;,™,&#x99;,š,&#x9a;)
  var %t = $replace(%t,›,&#x9b;,œ,&#x9c;,Ÿ,&#x9f;,¡,&#xa1;,¢,&#xa2;,£,&#xa3;,¤,&#xa4;,¥,&#xa5;,¦,&#xa6;,§,&#xa7;)
  var %t = $replace(%t,¨,&#xa8;,©,&#xa9;,ª,&#xaa;,«,&#xab;,¬,&#xac;,®,&#xae;,¯,&#xaf;,°,&#xb0;,±,&#xb1;,²,&#xb2;)
  var %t = $replace(%t,³,&#xb3;,´,&#xb4;,µ,&#xb5;,¶,&#xb6;,·,&#xb7;,¸,&#xb8;,¹,&#xb9;,º,&#xba;,»,&#xbb;,¼,&#xbc;)
  var %t = $replace(%t,½,&#xbd;,¾,&#xbe;,¿,&#xbf;,À,&#xc0;,Á,&#xc1;,Â,&#xc2;,Ã,&#xc3;,Ä,&#xc4;,Å,&#xc5;,Æ,&#xc6;)
  var %t = $replace(%t,Ç,&#xc7;,È,&#xc8;,É,&#xc9;,Ê,&#xca;,Ë,&#xcb;,Ì,&#xcc;,Í,&#xcd;,Î,&#xce;,Ï,&#xcf;,Ð,&#xd0;)
  var %t = $replace(%t,Ñ,&#xd1;,Ò,&#xd2;,Ó,&#xd3;,Ô,&#xd4;,Õ,&#xd5;,Ö,&#xd6;,×,&#xd7;,Ø,&#xd8;,Ù,&#xd9;,Ú,&#xda;)
  var %t = $replace(%t,Û,&#xdb;,Ü,&#xdc;,Ý,&#xdd;,Þ,&#xde;,ß,&#xdf;,à,&#xe0;,á,&#xe1;,â,&#xe2;,ã,&#xe3;,ä,&#xe4;)
  var %t = $replace(%t,å,&#xe5;,æ,&#xe6;,ç,&#xe7;,è,&#xe8;,é,&#xe9;,ê,&#xea;,ë,&#xeb;,ì,&#xec;,í,&#xed;,î,&#xee;)
  var %t = $replace(%t,ï,&#xef;,ð,&#xf0;,ñ,&#xf1;,ò,&#xf2;,ó,&#xf3;,ô,&#xf4;,õ,&#xf5;,ö,&#xf6;,÷,&#xf7;,ø,&#xf8;)
  var %t = $replace(%t,ù,&#xf9;,ú,&#xfa;,û,&#xfb;,ü,&#xfc;,ý,&#xfd;,þ,&#xfe;,ÿ,&#xff;)
  return %t
}

alias -l mp3start {
  var %f = $mp3.path(mp3f.ml)
  var %s = $mp3.path(mp3s.ml)
  var %c = $mp3.path(mp3c.ml)
  if ($isfile($read(%f,n,$1))) && ($1) {
    if (%mp3shuffle) {
      .copy -o %f %s
      set %mp3si %mp3index
      set %mp3line $1
      var %t1 = %mp3line
      var %t = $read(%f,n,%t1)
    }
    else {
      .copy -o %f %c
      set %mp3aux $1
      var %t1 = $1
      var %t = $read(%f,n,$1)
    }
    .splay -p " $+ %t $+ "
    mp3upd %t
    .timermp3 -im 0 250 mp3pos
    if ($dialog(mp3c)) {
      did -e mp3c 34,35,37,38,39
      did -c mp3c 51 $calc(%t1 + 1)
    }
    mp3show
  }
}

alias -l mp3previous.aux if ($calc($inmp3.pos / 1000) > 1) && (!$1) return 1

alias -l mp3previous.aux2 {
  set %mp3aux $1
  write -l %mp3aux $2- $read($mp3.path(mp3f.ml),n,%mp3aux)
  mp3auxp $1
}

alias -l mp3previous.aux3 {
  unset %mp3pause
  .splay -p " $+ $inmp3.fname $+ "
  if ($dialog(mp3c)) did -e mp3c 37
}

alias -l mp3next.aux {
  set %mp3aux $1
  mp3auxp $1
}

alias -l mp3auxp {
  var %t = $read($mp3.path(mp3f.ml),n,$1)
  if (%t) {
    unset %mp3pause
    .splay -p " $+ %t $+ "
    mp3show
    if ($dialog(mp3c)) {
      did -c mp3c 51 $calc($1 + 1)
      did -e mp3c 37
      mp3binfo
    }
    mp3upd %t
  }
  else mp3stop
}

alias -l mp3upd {
  if ($dialog(mp3c)) {
    did -h mp3c 5
    did -vra mp3c 43 $replace($mp3info($1-),$chr(32),$chr(160))
    if ($width($did(mp3c,43),Tahoma,11,1) > 236) did -ra mp3c 43 $did(mp3c,43) $+ $str($chr(160),30)
    did -vra mp3c 44 $mp3($1-).bitrate kbps
    did -vra mp3c 45 $mp3($1-).mode
    did -vra mp3c 46 $calc($mp3($1-).sample / 1000) khz
    did -i mp3c 34 1 params 0 0 $mp3($1-).length
  }
}

alias -l mp3pos {
  if (!$inmp3) return
  var %t = $iif(%mp3duration,$inmp3.pos,$calc($inmp3.length - $inmp3.pos))
  var %t = $time($round($calc(%t / 1000),0),nn:ss)
  if ($dialog(mp3c)) {
    if ($width($did(mp3c,43),Tahoma,11,1) > 236) did -ra mp3c 43 $remfirst($did(mp3c,43),1) $+ $left($did(mp3c,43),1)
    did -ra mp3c 47 %t
    did -i mp3c 34 1 params $inmp3.pos 0 $inmp3.length
  }
}

alias -l mp3binfo {
  var %n = $calc($did(mp3c,51).sel - 1)
  var %t = $read($mp3.path(mp3f.ml),n,%n)
  did -ra mp3c 103 $chr(35) $+ %n - $bytes($file(%t).size).suf - $mp3info(%t).duration
}

alias -l mp3w {
  if (!$dialog(mp3w)) {
    dialog -hmd mp3w mp3w
    did -a mp3w 2 Please wait while collecting musics
  }
}

alias -l mixeraux return $calc(65535 - $gettok($did(mp3volume,$1,1).text,1,32))

alias -l mixeraux2 return $iif($did(mp3volume,$1).state == 1,1,2)

alias -l mp3id.aux did -ra mp3id3 $1-
}
