;Page v1.1
;Team Nexgen 1999 by PepSiMan, revised by KnightFal
;www.team-nexgen.com

on *:load:{
  _vw pager switch on
  if (%page == [off]) { set %pager [on] }
}


#pageload off
ON *:LOAD: _vw away page.on always | set %page.a1 > | unset %page.a2 | .disable #pageload
#pageload end

CTCP *:PAGE: {
  if ($_vr(pager,switch) == on) {
    if (($away == $true) || ($_vr(away,page.on) == always))  {
      if ($2 == $null)  write data/page.txt $nick $time $date ::No Message::
      else  {  write data/page.txt $nick $time $date $replace($strip($2-),|,-|-) }
      set %page.no $lines(data/page.txt)
      page1
    }
  }
  else .notice $nick $me $+ 's pager is offline.
}
alias Page1 {
  set %page.show 1
  page2
  drawtext -c @page 1 26 44 200 16 Nick:  %page.nom
  drawtext -c @page 1 26 60 200 16 Time: %page.time %page.date
  unset %page.message* | unset %page.time | unset %page.date
}
alias page2 {
  if ($window(@page) == $null) window -rap +bn @Page 10 10 262 111
  clear @page
  drawpic -c @page 0 0 $findfile($mircdir,page.jpg,1)
  if (%page.no == $null) { set %page.no 1 }
  if (%page.no > $lines(data/page.txt)) { set %page.no $lines(data/page.txt) }
  if (%page.no < 1) set %page.no 1
  if (%page.no <= 1) drawpic -c @page 67 14 $findfile($mircdir,pageg2.jpg,1)
  else drawpic -c @page 67 14 $findfile($mircdir,pageg3.jpg,1)
  if ((%page.no >= $lines(data/page.txt)) || ($lines(data/page.txt) == $null)) drawpic -c @page 170 14 $findfile($mircdir,paged2.jpg,1)
  else drawpic -c @page 170 14 $findfile($mircdir,paged3.jpg,1)
  if ($lines(data/page.txt) < 1) {  drawtext @page 1 26 44 No Message | halt }
  set %page $read -l $+ %page.no data/page.txt
  set %page.nom $mid(%page, 1, $pos(%page,$chr(32),1))
  set %page $mid(%page, $calc(1+ $pos(%page,$chr(32),1)), $len(%page))
  set %page.time $mid(%page, 1, $pos(%page,$chr(32),1))
  set %page $mid(%page, $calc(1+ $pos(%page,$chr(32),1)), $len(%page))
  set %page.date $mid(%page, 1, $pos(%page,$chr(32),1))
  set %page.message $mid(%page, $calc(1+ $pos(%page,$chr(32),1)), $len(%page))
}
alias pageshow {
  set %page.show 2
  page2
  set %page.message1 $mid(%page.message,1,42)
  set %page.message2 $mid(%page.message,43,42)
  set %page.message3 $mid(%page.message,85,42)
  if (%page.message1 != $null) drawtext @page 1 Terminal 12 26 44 %page.message1
  if (%page.message2 != $null) drawtext @page 1 terminal 12 26 57 %page.message2
  if (%page.message3 != $null)  drawtext @page 1 terminal 12 26 70 %page.message3
  unset %page.message* | unset %page.nom | unset %page.time | unset %page.date
}

menu @Page {
  sclick : {
    if (($mouse.x >= 216) && ($mouse.x <= 243) && ($mouse.y >= 14) && ($mouse.y <= 27)) { 
      unset %pmouse.x | unset %pmouse.y | unset %page.nom
      Close -@ @page | unset %page.no | halt 
    }
    if (($mouse.x >= 67) && ($mouse.x <= 93) && ($mouse.y >= 14) && ($mouse.y <= 27)) { 
      unset %pmouse.x | unset %pmouse.y
      dec %page.no 1 | page1 | halt 
    }
    if (($mouse.x >= 170) && ($mouse.x <= 196) && ($mouse.y >= 14) && ($mouse.y <= 27)) { 
      unset %pmouse.x | unset %pmouse.y
      inc %page.no 1 | page1 | halt 
    }
    if (($mouse.x >= 18) && ($mouse.x <= 44) && ($mouse.y >= 14) && ($mouse.y <= 27)) { 
      unset %pmouse.x | unset %pmouse.y
      if (%page.show == 1) pageshow 
      else page1
      halt 
    }
    if (($mouse.x >= 26) && ($mouse.x <= 226) && ($mouse.y >= 44) && ($mouse.y <= 56) && (%page.show == 1))  {
      query %page.nom
      drawtext -c @page 1 26 44 200 16 Nick:  %page.nom
    }
    set %pos.x $mouse.x | set %pos.y $mouse.y
  }
  mouse  {
    if ($mouse.key == 1) { 
      if (%pos.x == $null) || (%pos.y == $null) halt
      set %^mouse.x $calc( [ $window(@page).x ] + [ $calc( [ $mouse.x ] - [ %pos.x ] ) ] )
      set %^mouse.y $calc( [ $window(@page).y ] + [ $calc( [ $mouse.y ] - [ %pos.y ] ) ] )
      window -r @page %^mouse.x %^mouse.y
      unset %^mouse.x | unset %^mouse.y 
      ;      unset %pos.x | unset %pos.y
    }
    else if (($mouse.x >= 26) && ($mouse.x <= 226) && ($mouse.y >= 44) && ($mouse.y <= 56) && (%page.show == 1)) {
      drawtext -c @page 4 26 44 200 16 Nick:  %page.nom
    }
    else if (%page.show == 1) drawtext -c @page 1 26 44 200 16 Nick:  %page.nom

    if ((%page.no < $lines(data/page.txt)) && ($lines(data/page.txt) != $null)) {
      if (($mouse.x >= 170) && ($mouse.x <= 196) && ($mouse.y >= 14) && ($mouse.y <= 27)) { 
        drawpic -c @page 170 14 $findfile($mircdir,paged1.jpg,1)
      }
      else  {
        drawpic -c @page 170 14 $findfile($mircdir,paged3.jpg,1)
      }
    }

    if (%page.no > 1) {
      if (($mouse.x >= 67) && ($mouse.x <= 93) && ($mouse.y >= 14) && ($mouse.y <= 27)) { 
        drawpic -c @page 67 14 $findfile($mircdir,pageg1.jpg,1)
      }    
      else    {
        drawpic -c @page 67 14 $findfile($mircdir,pageg3.jpg,1)
      }
    }
  }
  dclick : {
    if (($mouse.x >= 216) && ($mouse.x <= 243) && ($mouse.y >= 14) && ($mouse.y <= 27)) { 
      unset %pmouse.x | unset %pmouse.y | unset %page.nom
      Close -@ @page | unset %page.no | halt 
    }
    if (($mouse.x >= 67) && ($mouse.x <= 93) && ($mouse.y >= 14) && ($mouse.y <= 27)) { 
      unset %pmouse.x | unset %pmouse.y
      dec %page.no 1 | page1 | halt 
    }
    if (($mouse.x >= 170) && ($mouse.x <= 196) && ($mouse.y >= 14) && ($mouse.y <= 27)) { 
      unset %pmouse.x | unset %pmouse.y
      inc %page.no 1 | page1 | halt 
    }
    if (($mouse.x >= 18) && ($mouse.x <= 44) && ($mouse.y >= 14) && ($mouse.y <= 27)) { 
      unset %pmouse.x | unset %pmouse.y
      if (%page.show == 1) pageshow 
      else page1
      halt 
    }
  }
}
