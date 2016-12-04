dialog explorer {
  title "wIRC explorer"
  size 100 92 260 145
  option dbu
  button "Exit",1,230 115 25 10,ok
  button "Open",2,230 49 25 10
  button "Delete",3,230 61 25 10
  button "Move",4,230 73 25 10
  button "Rename",5,230 85 25 10
  button "Open",6,2 49 25 10
  button "Delete",7,2 61 25 10
  button "Refresh",8,2 73 25 10
  button "New",9,2 85 25 10
  button "Search",10,230 5 25 10
  list 11,28 5 100 130,sort vsbar
  list 12,128 18 100 114,sort vsbar hsbar extsel
  edit "",20,128 5 100 10,autohs
  text "25 files",30,130 125 100 10
  text "Free space:",31,28 125 100 10
  text "Used space:",32,28 132 100 10
  text "Total space:",33,130 132 100 10
}
alias explorer {
  if ($1 == $null) {
    set %explorer.dir $mircdir
    goto explorer
  }
  else {
    set %explorer.dir $1-
    goto explorer
  }
  :explorer
  if ($isdir(%explorer.dir) == $false) {
    echo -at 12-(1313info12!11error: no such directory ( $+ $1- $+ )12)- 
    halt
  }
  dialog -m explorer explorer
}
on 1:DIALOG:explorer:init:0:{
  if (%explorer.dir) {
    explorer.dir %explorer.dir
    explorer.file * %explorer.dir
  }
}
on 1:DIALOG:explorer:sclick:2:{
  if ($did($dname,12).seltext) run " $+ %explorer.cdir $+ $did($dname,12).seltext $+ "
}
on 1:DIALOG:explorer:sclick:3:{
  if ($did($dname,12).seltext) {
    if ($did($dname,12,0).sel == 1) var %explorer.del = $?!="Are you sure you want to delete $crlf $+ %explorer.cdir $+ $did($dname,12).seltext $+ ?"
    else var %explorer.del = $?!="Are you sure you want to delete these $did($dname,12,0).sel files?"
    if (%explorer.del == $false) halt
    var %explorer.del.var = 1
    while (%explorer.del.var <= $did($dname,12,0).sel) {
      .remove " $+ %explorer.cdir $+ $did($dname,12,$did($dname,12,%explorer.del.var).sel).text $+ "
      did -d explorer 12 $did($dname,12,%explorer.del.var).sel
      inc %explorer.del.var
    }
    if ($did($dname,12).seltext) {
      .remove " $+ %explorer.cdir $+ $did($dname,12).seltext $+ "
      did -d $dname 12 $did($dname,12,$did($dname,12,0).sel).sel
    }
  }
}
on 1:DIALOG:explorer:sclick:4:{
  if ($did($dname,12).seltext) {
    var %explorer.mdir = $sdir($left(%explorer.dir,2),Select directory to move to)
    if (%explorer.mdir == $null) halt
    if ($isfile(%explorer.mdir $+ $did($dname,12).seltext) == $true) {
      echo -at 12-(1313info12!11error: file already exists ( %+ %explorer.mdir $+ $did($dname,12).seltext $+ ) halt12)- 
    }
    .rename " $+ %explorer.cdir $+ $did($dname,12).seltext $+ " " $+ %explorer.mdir $+ $did($dname,12).seltext $+ "
    did -d explorer 12 $did($dname,12,$did($dname,12,0).sel).sel
  }
}
on 1:DIALOG:explorer:sclick:5:{
  if ($did($dname,12).seltext) {
    var %explorer.rfile = $?="Rename $crlf $+ %explorer.cdir $+ $did($dname,12).seltext $crlf $+ to:"
    var %explorer.rfile = %explorer.cdir $+ $nopath(%explorer.rfile)
    if (%explorer.rfile == $null) halt
    if ($isfile(%explorer.rfile) == $true) {
      echo -at 12-(1313info12!11error: file already exists ( $+ %explorer.rfile $+ )12)- 
      halt
    }
    .rename " $+ %explorer.cdir $+ $did($dname,12).seltext $+ " " $+ %explorer.rfile $+ "
    did -o explorer 12 $did($dname,12,$did($dname,12,0).sel).sel $nopath(%explorer.rfile)
  }
}
on 1:DIALOG:explorer:sclick:6:{
  if ($did($dname,11).seltext) {
    if ($did($dname,11).seltext == \..) {
      explorer.file * $explorer.dirup(%explorer.cdir)
      explorer.dir $explorer.dirup(%explorer.cdir)
    }
    else {
      explorer.file * %explorer.cdir $+ $did($dname,11).seltext
      explorer.dir %explorer.cdir $+ $did($dname,11).seltext
    }
  }
}
on 1:DIALOG:explorer:sclick:7:{
  if ($did($dname,11).seltext) {
    if ($did($dname,11).seltext != \..) {
      var %explorer.ddir = $?!="Are you sure you want to delete the folder $crlf $+ %explorer.cdir $+ $did($dname,11).seltext $crlf $+ and all its contents?"
      if (%explorer.ddir == $false) halt
      explorer.ddir %explorer.cdir $+ $did(explorer,11).seltext
      did -d explorer 11 $did(explorer,11).sel
    }
  }
}
on 1:DIALOG:explorer:sclick:8:{
  if (%explorer.cdir) {
    explorer.file * %explorer.cdir
    explorer.dir %explorer.cdir
  }
}
on 1:DIALOG:explorer:sclick:9:{
  var %explorer.ndir = $?="Enter name for new directory:"
  var %explorer.ndir = %explorer.cdir $+ $nopath(%explorer.ndir)
  if (%explorer.ndir == $null) halt
  if ($isdir(%explorer.ndir)) {
    echo -at 12-(1313info12!11error: directory already exists ( $+ %explorer.ndir $+ )12)-  
    halt
  }
  .mkdir " $+ %explorer.ndir $+ "
  if ($dialog(explorer)) did -a explorer 11 $nopath(%explorer.ndir)
}
on 1:DIALOG:explorer:sclick:10:{
  if (($did($dname,20).text) && (%explorer.cdir)) {
    var %explorer.search = $?!="WARNING: $crlf $+ Searching for files may freeze your mIRC for a long period of time. $crlf $+ Do you still wish to proceed?"
    if (%explorer.search == $false) halt
    explorer.search $gettok($did($dname,20).text,1,32)
  }
}
on 1:DIALOG:explorer:dclick:12:{
  if ($did($dname,12).seltext) run " $+ %explorer.cdir $+ $did($dname,12).seltext $+ "
}
on 1:DIALOG:explorer:dclick:11:{
  if ($did($dname,11).seltext) {
    if ($did($dname,11).seltext == \..) {
      explorer.file * $explorer.dirup(%explorer.cdir)
      explorer.dir $explorer.dirup(%explorer.cdir)
    }
    else {
      explorer.file * %explorer.cdir $+ $did($dname,11).seltext
      explorer.dir %explorer.cdir $+ $did($dname,11).seltext
    }
  }
}
alias explorer.dir {
  if ($1 == $null) halt
  if ($dialog(explorer)) {
    did -r explorer 11
    did -a explorer 11 \..
    var %explorer.dir.num = $finddir($1-,*,0,$calc($numtok($1-,92) - 1))
    var %explorer.dir.var = 1
    while (%explorer.dir.var <= %explorer.dir.num) {
      did -a explorer 11 $nopath($finddir($1-,*,%explorer.dir.var))
      inc %explorer.dir.var
    }
    if ($right($1-,1) == \) set %explorer.cdir $1-
    else set %explorer.cdir $1- $+ \
    explorer.stats %explorer.cdir
  }
}
alias explorer.dirup {
  if ($1 == $null) return
  if ($isdir($1-) == $false) return
  return $deltok($1-,$numtok($1-,92),92)
}
alias explorer.file {
  if ($2 == $null) halt
  if ($dialog(explorer)) {
    did -r explorer 12
    var %explorer.file.num = $findfile($2-,$1,0,$calc($numtok($2-,92) - 1))
    var %explorer.file.var = 1
    while (%explorer.file.var <= %explorer.file.num) {
      did -az explorer 12 $nopath($findfile($2-,$1,%explorer.file.var))
      inc %explorer.file.var
    }
  }
}
alias explorer.dsize {
  if ($1 == $null) halt
  if ($isdir($1-) == $false) halt
  var %explorer.dsize.num = $findfile($1-,*,0,$calc($numtok($1-,92) - 1))
  var %explorer.dsize.var = 1
  while (%explorer.dsize.var <= %explorer.dsize.num) {
    var %explorer.dsize = $calc(%explorer.dsize + $lof($findfile($1-,*,%explorer.dsize.var)))
    inc %explorer.dsize.var
  }
  return $bytes(%explorer.dsize).suf
}
alias explorer.ddir {
  if ($1 == $null) halt
  if ($isdir($1-) == $false) halt
  :file
  var %explorer.ddir.num = $findfile($1-,*,0)
  var %explorer.ddir.var = 1
  while ($findfile($1-,*,%explorer.ddir.var)) {
    .remove " $+ $findfile($1-,*,%explorer.ddir.var) $+ "
    inc %explorer.ddir.var
  }
  if ($findfile($1-,*,0) >= 1) goto file
  else explorer.ddir2 $1-
}
alias explorer.ddir2 {
  if ($1 == $null) halt
  :dir
  var %explorer.ddir.num = $finddir($1-,*,0)
  var %explorer.ddir.var = 1
  while ($finddir($1-,*,%explorer.ddir.var)) {
    if ($finddir($finddir($1-,*,%explorer.ddir.var),*,0) == 0) .rmdir " $+ $finddir($1-,*,%explorer.ddir.var) $+ "
    inc %explorer.ddir.var
  }
  if ($finddir($1-,*,0) >= 1) goto dir
  else .rmdir " $+ $1- $+ "
}
alias explorer.stats {
  if ($1 == $null) halt
  if ($dialog(explorer)) {
    did -r explorer 30
    did -a explorer 30 $findfile($1-,*,0,$calc($numtok($1-,92) - 1)) files ( $+ $explorer.dsize($1-) $+ )
    did -r explorer 31
    did -a explorer 31 Free space: $bytes($disk($left($1-,2)).free).suf
    did -r explorer 32
    did -a explorer 32 Used space: $bytes($calc($disk($left($1-,2)).size - $disk($left($1-,2)).free)).suf
    did -r explorer 33
    did -a explorer 33 Total space: $bytes($disk($left($1-,2)).size).suf
  }
}
alias explorer.search {
  if ($1 == $null) halt
  if ($dialog(explorer)) {
    did -r explorer 12
    did -az explorer 12 Searching...
    var %explorer.search.num = $findfile($left(%explorer.dir,2),$1,0)
    if (%explorer.search.num == 0) {
      did -r explorer 12
      did -az explorer 12 No matches found!
      halt
    }
    did -r explorer 12
    did -az explorer 12 %explorer.search.num matches found:
    var %explorer.search.var = 1
    while (%explorer.search.var <= %explorer.search.num) {
      did -az explorer 12 $findfile($left(%explorer.dir,2),$1,%explorer.search.var)
      inc %explorer.search.var
    }
  }
}
;****************************

menu @servers {
  refresh map:linksandshow baseNo
  save to desktop:drawsave -q100 @Servers "C:\Documents and Settings\All Users\Desktop\wIRCServerMap.jpeg"
}

#DAL-Links2 off
;a typical /LINKS Line
raw 364:*:{
  %sg.firstserver = 1
  %sg.secondserver = 1
  if ( %sg.links. [ $+ [ $2 ] ] != $null ) set %sg.firstserver %sg.links. [ $+ [ $2 ] ] 
  else {
    inc %sg.linkscount
    set %sg.links. [ $+ [ $2 ] ] %sg.linkscount
    set %sg.firstserver %sg.linkscount
    set %sg.servers. [ $+ [ %sg.linkscount ] ] $2
    set %sg.hop. [ $+ [ %sg.linkscount ] ] $4
  }
  if ( %sg.links. [ $+ [ $3 ] ] != $null ) set %sg.secondserver %sg.links. [ $+ [ $3 ] ]
  else {
    inc %sg.linkscount
    set %sg.links. [ $+ [ $3 ] ] %sg.linkscount
    set %sg.secondserver %sg.linkscount
    set %sg.servers. [ $+ [ %sg.linkscount ] ] $3
    set %sg.hop. [ $+ [ %sg.linkscount ] ] $4
  }
  if ( ( %sg.setting.basemyserver == 1 ) || ( %sg.firstserver != %sg.secondserver ) ) {
    set %sg.link.con. [ $+ [ %sg.firstserver ]  $+ ] . [ $+ [ %sg.secondserver ] ] 1
    set %sg.link.con. [ $+ [ %sg.secondserver ]  $+ ] . [ $+ [ %sg.firstserver ] ] 1 
    if (%temp.debug == ON) echo @DeBug.Servers $2 $3 %sg.links. [ $+ [ $2 ] ] %sg.links. [ $+ [ $3 ] ] %sg.linkscount %sg.firstserver %sg.secondserver
  }
  if ($4 > %sg.hop.max) { set %sg.hop.max $4 }
  halt
}
;End of /LINKS list.
raw 365:*:{
  echo -at 12-(1313info12!11MAP: Retrieved Links, Calculating Map Items.. Please be patient...12)-  
  .disable #DAL-Links2
  set %sg.language EN
  unset %sg.links.*
  .timer -om 1 10 showservergraph 
  set %sg.setting.showonlinks $false
  halt
}
#DAL-Links2 end
alias linksandshow {
  unset %con.* %no.* %distAngle %txcolor %digits %m 
  unset %sg.* %lev.* %graphised.* %sg.hop.*
  unset %place* %pos* %x.* %y.*
  unset %sibling.* %unc.* %rec.*
  unset %origindeg.* %stDist.* %endDist.*
  unset %n %r %Pi %debug %i %j 
  unset %t %highest %unleveledcount %greatestlev 
  unset %k %deep %maxx %maxy %minx %miny 
  unset %temp.debug
  if ( %sg.Language == $null ) { set %sg.language EN }
  echo -at 12-(1313info12!11MAP: Getting links for map... please wait...12)-  
  if ( $1 == $null ) set %sg.setting.basemyserver 0
  elseif ( $1 == baseNo ) set %sg.setting.basemyserver 0
  else set %sg.setting.basemyserver 1
  set %sg.hop.max 0
  set %sg.max.con 0
  set %sg.setting.showonlinks $true
  set %sg.linkscount 0
  .enable #DAL-Links2
  .disable #RAW.FailOver
  links
}
alias showservergraph {
  ;initialisation
  %n = %sg.linkscount
  ;element count
  %r = 50 
  ;distance of two elements
  %Pi = 3.141592
  %debug = 0
  ;create connections table
  %i = 1
  :contable1
  %j = 1
  :contable2
  if ( $sglinkcon(%i,%j) == 1 ) set %con. [ $+ [ %i  ] $+ ] . [ $+ [ %j ] ] 1
  else set %con. [ $+ [ %i ] $+ ] . [ $+ [ %j ] ] 0
  if (%j < %n) { inc %j | goto contable2 }
  if (%i < %n) { inc %i | goto contable1 }
  ;calculate levels
  %i = 1
  :calclevs1
  %lev. [ $+ [ %i ] ] = -1
  if (%i < %n) { inc %i | goto calclevs1 }
  %highest = 1
  ;element having the highest level
  %i = 0
  :calclevs2
  %j = 1
  :calclevs3
  if (%lev. [ $+ [ %j ] ] > -1) goto 220
  %unleveledcount = 0 |  %greatestlev = -1
  %k = 1
  :calclevs4
  if ( $con(%j,%k) > 0 ) {
    if ( %lev. [ $+ [ %k ] ] == -1 ) inc %unleveledcount
    if ( %lev. [ $+ [ %k ] ] > %greatestlev ) {
      set %greatestlev %lev. [ $+ [ %k ] ]
    }
  }
  if (%k < %n ) { inc %k | goto calclevs4 }
  if ( ( %unleveledcount < 2 ) && ( %i == $calc( %greatestlev + 1 ) ) ) { set %lev. [ $+ [ %j ] ] %i | if ( %i > %lev. [ $+ [ %highest ] ] ) { %highest = %j } }
  :220
  if (%j < %n ) { inc %j | goto calclevs3 } | if (%i < $calc(%n -1) ) { inc %i | goto calclevs2 }
  ;graphisation
  window -p $sgtext(win) | clear $sgtext(win) | drawfill -h $sgtext(win) 1 0 1 1
  %i = 1
  :graph1
  %graphised. [ $+ [ %i ] ] = 0
  if (%i < %n) { inc %i | goto graph1 }
  %deep = 1
  %no.1 = %highest
  %origindeg.1 = -1
  %maxx = -10000
  %maxy = -10000
  %minx = +10000
  %miny = +10000
  %posX.1 = $calc($window($sgtext(win)).w /2)
  %posY.1 = $calc($window($sgtext(win)).h /2)
  :1000
  %placeX. [ $+ [ $no(%deep) ] ] = %posX. [ $+ [ %deep ] ]
  %placeY. [ $+ [ $no(%deep) ] ] = %posY. [ $+ [ %deep ] ]
  if ( %posX. [ $+ [ %deep ] ] > %maxx ) %maxx = %posX. [ $+ [ %deep ] ]
  if ( %posX. [ $+ [ %deep ] ] < %minx ) %minx = %posX. [ $+ [ %deep ] ]
  if ( %posY. [ $+ [ %deep ] ] > %maxy ) %maxy = %posY. [ $+ [ %deep ] ]
  if ( %posY. [ $+ [ %deep ] ] < %miny ) %miny = %posY. [ $+ [ %deep ] ]
  %graphised. [ $+ [ $no(%deep) ] ] = 1
  %unc. [ $+ [ %deep ] ] = 0
  %x = 1
  :graph2
  if ( ( $con($no(%deep),%x) == 1 ) && ( %graphised. [ $+ [ %x ] ] == 0 ) ) inc %unc. [ $+ [ %deep ] ]
  if (%x < %n) { inc %x | goto graph2 }
  if (%temp.debug == ON) echo @DeBug.Servers UNC %unc. [ $+ [ %deep ] ]
  if ( %unc. [ $+ [ %deep ] ] == 0 ) goto 1400
  if ( %origindeg. [ $+ [ %deep ] ] > -1 ) {
    %stDist. [ $+ [ %deep ] ] = $calc( %origindeg. [ $+ [ %deep ] ] -90 + 180 / ( %unc. [ $+ [ %deep ] ] + 1 ) )
    %endDist. [ $+ [ %deep ] ] = $calc( %origindeg. [ $+ [ %deep ] ] +90 - 180 / ( %unc. [ $+ [ %deep ] ] + 1 ) )
  }
  else { %stDist. [ $+ [ %deep ] ] = 0 | %endDist. [ $+ [ %deep ] ] = 360 }
  %sibling. [ $+ [ %deep ] ] = 0
  %rec. [ $+ [ %deep ] ] = 1
  :1115
  %i = %rec. [ $+ [ %deep ] ]
  if ( ( %graphised. [ $+ [ %i ] ] == 0 ) && ( $con($no(%deep),%i) == 1) ) {
    inc %sibling. [ $+ [ %deep ] ]
    if ( %unc. [ $+ [ %deep ] ] == 1 ) { %distAngle = %origindeg. [ $+ [ %deep ] ] | goto 1145 }
    if ( %origindeg. [ $+ [ %deep ] ] == -1 ) {
      %distAngle = $calc( %stDist. [ $+ [ %deep ] ] + ( %sibling. [ $+ [ %deep ] ] - 1 ) * ( %endDist. [ $+ [ %deep ] ] - %stDist. [ $+ [ %deep ] ] ) / %unc. [ $+ [ %deep ] ] )
      goto 1145
    }
    %distAngle = $calc( %stDist. [ $+ [ %deep ] ] + ( %sibling. [ $+ [ %deep ] ] - 1 ) * ( %endDist. [ $+ [ %deep ] ] - %stDist. [ $+ [ %deep ] ] ) / $calc( %unc. [ $+ [ %deep ] ] - 1 ) )
    :1145
    if ( %distAngle < 0 ) set %distAngle %distAngle + 360
    inc %deep
    set %no. [ $+ [ %deep ] ] %i
    %origindeg. [ $+ [ %deep ] ] = %distAngle
    %posX. [ $+ [ %deep ] ] = $calc( %posX. [ $+ [ $calc( %deep - 1 ) ] ] + $cos( $calc( %distAngle * %Pi / 180 ) ) * %r )
    %posY. [ $+ [ %deep ] ] = $calc( %posY. [ $+ [ $calc( %deep - 1 ) ] ] - $sin( $calc( %distAngle * %Pi / 180 ) ) * %r )
    goto 1000
  }
  :1200
  if ( %rec. [ $+ [ %deep ] ] < %n ) { inc %rec. [ $+ [ %deep ] ] | goto 1115 }
  :1400
  if ( %deep > 1 ) { dec %deep | goto 1200 }
  ;visualisation

  %i = 1
  :visual1
  %x. [ $+ [ %i ] ] = $calc( ( %placeX. [ $+ [ %i ] ] - %minx ) / ( %maxx - %minx ) * $window($sgtext(win)).w *4/5 + $window($sgtext(win)).w / 10)
  %y. [ $+ [ %i ] ] = $calc( ( %placeY. [ $+ [ %i ] ] - %miny ) / ( %maxy - %miny ) * $window($sgtext(win)).h *7/10 + $window($sgtext(win)).h / 10)
  %j = 1
  :visual2
  if ( $con(%i,%j) == 1 ) drawline -h $sgtext(win) 14 $calc(%lev. [ $+ [ %i ] ] + %lev. [ $+ [ %j ] ] +1) %x. [ $+ [ %i ] ] %y. [ $+ [ %i ] ] %x. [ $+ [ %j ] ] %y. [ $+ [ %j ] ]
  if (%j < %n) { inc %j | goto visual2 }
  if (%i < %n) { inc %i | goto visual1 }
  %i = 1
  :visual3
  %sg.max.con. [ $+ [ %i ] ] = $sg.getlinks(%i)
  if (%sg.max.con. [ $+ [ %i ] ] > 0) { dec %sg.max.con. [ $+ [ %i ] ] }
  if (%sg.max.con. [ $+ [ %i ] ] > %sg.max.con ) { set %sg.max.con %sg.max.con. [ $+ [ %i ] ] }
  %txcolor = 0
  %lev.tmp = %sg.max.con. [ $+ [ %i ] ]
  if (%lev.tmp < 1)  %color.dot = 9
  if (%lev.tmp = 1)  %color.dot = 8
  if (%lev.tmp = 2)  %color.dot = 7
  if (%lev.tmp = 3)  %color.dot = 5
  if (%lev.tmp > 3)  %color.dot = 4
  if ( %i > 9 )  %digits = 2
  else  %digits = 1
  set %sg.i.srv $gettok( %sg.servers. [ $+ [ %i ] ] ,1-2,46)
  set %m $len(%sg.i.srv)
  if (%sg.servers. [ $+ [ %i ] ] = $server) { drawdot -h $sgtext(win) 14 $calc($calc(6+ %lev. [ $+ [ %i ] ] ) * 3) %x. [ $+ [ %i ] ] %y. [ $+ [ %i ] ] | %color.txt = 4 }
  else { drawdot -h $sgtext(win) 12 $calc($calc(7+ %lev. [ $+ [ %i ] ] ) * 2) %x. [ $+ [ %i ] ] %y. [ $+ [ %i ] ] | %color.txt = 0 }
  drawdot -h $sgtext(win) %color.dot $calc($calc(6+ %lev. [ $+ [ %i ] ] ) * 2) %x. [ $+ [ %i ] ] %y. [ $+ [ %i ] ]
  drawtext -oh $sgtext(win) 1 "Arial" 17 $calc(%x. [ $+ [ %i ] ] -5* %digits) $calc(%y. [ $+ [ %i ] ] -10) %i
  drawtext -oh $sgtext(win) %color.txt "Arial" 14 $calc(%x. [ $+ [ %i ] ] -5* %digits - %m * 2) $calc(%y. [ $+ [ %i ] ] +10) %sg.i.srv
  drawtext -h $sgtext(win) 0 "Arial" 13 $calc(%x. [ $+ [ %i ] ] -5* %digits - %m * 2) $calc(%y. [ $+ [ %i ] ] +22) %lev.tmp leaf(s).
  drawtext -h $sgtext(win) 0 "Arial" 13 $calc(%x. [ $+ [ %i ] ] -5* %digits - %m * 2) $calc(%y. [ $+ [ %i ] ] +32) %sg.hop. [ $+ [ %i ] ] hop(s).
  if (%i < %n) { inc %i | goto visual3 }
  drawdot $sgtext(win)
  drawtext -bh $sgtext(win) 0 1 "Arial" 14 20 35 $upper($gettok($server,1,46)) - $upper($sg.servernet)
  drawtext -bh $sgtext(win) 0 1 "Arial" 14 20 50 %sg.linkscount Total Servers Online.
  drawtext -bh $sgtext(win) 0 1 "Arial" 14 20 65 %sg.hop.max Max hop(s) - %sg.max.con Max leaf(s).
  drawtext -bh $sgtext(win) 0 1 "Arial" 14 20 80 Dated: $fulldate
  ;finalisation
  unset %con.* %no.* %distAngle %txcolor %digits %m 
  unset %sg.* %lev.* %graphised.* %sg.hop.*
  unset %place* %pos* %x.* %y.*
  unset %sibling.* %unc.* %rec.*
  unset %origindeg.* %stDist.* %endDist.*
  unset %n %r %Pi %debug %i %j 
  unset %t %highest %unleveledcount %greatestlev 
  unset %k %deep %maxx %maxy %minx %miny 
  unset %temp.debug
  set %sg.Language EN
  window -a  $sgtext(win)
  echo -at 12-(1313info12!11MAP: Finished...You can save the image by right clicking on it...12)-  
}
alias sg.getlinks {
  var %sg.tmp = 0
  var %sg.maxed = 0
  while (%sg.tmp <= %sg.linkscount) {
    inc %sg.tmp
    %sg.maxed = $calc(%sg.maxed + $sglinkcon($1,%sg.tmp))
  }
  return %sg.maxed
}
alias ifTrue { if ($1) return $2- }
alias con { %t = con. $+ $1 $+ . $+ $2 | return % [ $+ [ %t ] ] }
alias sglinkcon { %t = sg.link.con. $+ $1 $+ . $+ $2 | return % [ $+ [ %t ] ] }
alias no { %t = no. [ $+ [ $1 ] ] | return % [ $+ [ %t ] ] }
alias drawtest {
  set %sg.language EN
  window -p $sgtext(win)
  drawtext -bh $sgtext(win) 11 8 "Arial" 14 40 40 irc.ContraIRC.Net
  drawtext -bh $sgtext(win) 11 1 "Times New Roman" 18 $calc($window($sgtext(win)).w - 130) $calc($window($sgtext(win)).h - 40) ServerGraph v1 by <someone>
}
alias sgtext {
  if ($1 == process) return @Servers...
  if ($1 == win) return @Servers
  if ($1 == init) return Initialisation...
  if ($1 == contable) return Creating connections table...
  if ($1 == calclevs) return Calculating levels...
  if ($1 == graph) return Allocating elements...
  if ($1 == vislines) return Drawing lines...
  if ($1 == visdots) return Drawing servers...
  if ($1 == final) return Finalizing...
  if ($1 == OK) return OK
}
alias sg.servernet {
  %tmp.cnt = 0
  while ($gettok($server,%tmp.cnt,46) != $null) {
    inc %tmp.cnt
    %tmp.chk = $gettok($server,%tmp.cnt,46)
    if ((org = %tmp.chk) || (net = %tmp.chk) || (com = %tmp.chk)) {
      %tmp.bef = $calc(%tmp.cnt - 1)
      return $gettok($server,%tmp.bef,46) $+ . $+ %tmp.chk
    }
  }
  %tmp.bef = $calc(%tmp.cnt - 1)
  return Unknown $+ . $+ $gettok($server,%tmp.bef,46)
}
