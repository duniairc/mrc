;=========
; lagbar
;=========
on *:load:{
  if ($version < 6) { echo $color(info) -s * Use mIRC v6+! This version is v $+ $version | .unload -rs " $+ $script" | return }
  echo $color(info) -s [BesT/Lag Bar] v3.2
  echo $color(info) -s /lag to open lag bar in current mode
  echo $color(info) -s /lag -b to open lag bar in bar mode
  echo $color(info) -s /lag -g to open lag bar in graph mode
  echo $color(info) -s /lag -x to close lag bar
  echo $color(info) -s /lag -c to open options
}
on *:unload:{
  unset %lag*
  window -c @Lag
  .timerLag off
  if ($dialog(Lag)) dialog -x lag
  if ($dialog(LagRgb)) dialog -x lagrgb
  echo $color(info) -s [BesT/Lag Bar] unloaded
}

alias lag {
  if (c isincs $1) { if (!$dialog(lag)) { lagprev -i $+ $iif(%lag.style,g,b)  | dialog -m lag lag } | return }
  if (x isincs $1) { window -c @Lag | return }
  if (r isincs $1) { lagcheck | return }
  if (b isincs $1) set %lag.style 0
  if (g isincs $1) set %lag.style 1
  .timerlag off
  if (!$window(@Lag)) {
    window -phBi +d @Lag 0 0 102 23
    tbwin Attach @Lag
    var %z = $dll($_tbwin,GetTBInfo,NOT_USED)
    lag.size %z
    dll " $+ $scriptdirtbwin.dll" OnSize /lag.size
    dll " $+ $scriptdirtbwin.dll" OnMouse dclick /lagcheck
  }
  lagdraw
  window -a @Lag
  lagcheck
  .timerLag -io 0 $iif(%lag.t isnum,%lag.t,120) lagcheck
}
alias lag.size window @Lag $calc($1 -140) $calc($2 - 24) 102 23
menu @Lag {
  $iif(!$($+(%,lag.h,$cid),2),$style(2)) Current lag:$iif($istok(query channel,$window($active).type,32),say,echo $color(i) -s) [BesT/Lag Bar] Current lag: $gettok($($+(%,lag.h,$cid),2),-1,32) $+ secs
  Options:lag -c
  Close:window -c @Lag
}
;/lagdraw [x] [y]
;x > ticks received in ctcp LAG
;y > $ticks
alias lagdraw {
  var %a 255,%b 0,%c 1,%d,%e $calc(($2 - $1) /1000),%f %lag.colors,%g %lag.color1,%h,%i %lag.bright
  if ($0) set $($+(%,lag.h,$cid)) $iif($numtok($($+(%,lag.h,$cid),2),32) == 10,$deltok($($+(%,lag.h,$cid),2),1,32),$($+(%,lag.h,$cid),2)) %e
  if ($window(@Lag)) {
    drawrect -fr @Lag $rgb(face) 0 0 0 102 23
    if (!%lag.style) {
      drawtext -r @Lag 0 Tahoma 9 2 11 Lag: $iif(%e,$round(%e,3) secs,N/A)
      while (%c < 100) && (%e >= 0) && ($0) {
        if (%b >= 255) var %b 255,%d 1
        if (%a < 0) var %a 0
        if (%f == 2) var %h = $rgb($iif($calc(%b - %i *10) > 0,$ifmatch,0),$iif($calc(%a - %i *10) > 0,$ifmatch,0),0)
        elseif (%f == 1) var %h = $lagd1(%c)
        else var %h = $iif(%g,%g,0)
        if (%lag.type) drawline -r @Lag %h 1 %c 1 %c 10
        elseif ($right(%c,1) == 1) drawrect -fr @Lag %h 1 %c 1 8 8
        if (%d) dec %a $calc(6- %i *0.1)
        else inc %b $calc(6- %i *0.1)
        inc %c
        dec %e 0.1
      }
      drawline -r @Lag 0 1 0 10 0 0 100 0
      drawline -r @Lag 16777215 1 0 10 100 10 100 0
    }
    if (%lag.style == 1) {
      drawtext -r @Lag 0 Tahoma 9 55 0 Lag
      drawtext -r @Lag 0 Tahoma 9 55 11 $iif(%e,$round(%e,3) secs,N/A)
      drawline -r @Lag 0 1 0 20 0 0 50 0
      drawline -r @Lag 16777215 1 0 20 50 20 50 0
      var %p = $($+(%,lag.h,$cid),2),%q = $numtok(%p,32),%r 1,%s
      while (%q) {
        var %s = $gettok(%p,%q,32)
        var %a 255,%b 0,%c 19,%d,%j 0
        while (%c) && (%j <= %s) {
          if (%b >= 255) var %b 255,%d 1
          if (%f == 2) var %h = $rgb($iif($calc(%b - %i *10) > 0,$ifmatch,0),$iif($calc(%a - %i *10) > 0,$ifmatch,0),0)
          elseif (%f == 1) var %h = $lagd2(%c)
          else var %h = $iif(%g,%g,0)
          drawline -r @Lag %h 0 $calc(51-5* %r) %c $calc(51-5* %r +4.9) %c
          dec %c
          inc %j 0.5
          if (%d) dec %a 28
          else inc %b 28
        }
        if (%lag.linegraph) drawline -r @Lag %lag.linegraphcolor 1 $calc(53.4-5* %r) %c $calc(53.4-5* %r +4.9) %l
        var %l = %c
        inc %r
        dec %q
      }
      if (%lag.linegraph) && (%r <= 10) drawline -r @Lag %lag.linegraphcolor 1 $calc(53.4-5* %r) 20 $calc(53.4-5* %r +4.9) %l
      drawline -r @Lag 0 1 0 20 0 0 50 0
      drawline -r @Lag 16777215 1 0 20 50 20 50 0
    }
  }
}
alias lagcheck if ($server) !.ctcp $me LAG $ticks | else lagdraw
on *:CONNECT:if ($activecid == $cid) lagcheck
on *:DISCONNECT:if ($activecid == $cid) lagdraw
on *:ACTIVE:*:if ($activecid != $lactivecid) && ($activecid) && ($lactivecid) lagcheck

dialog lag {
  title "[Lag Bar]"
  size -1 -1 200 170
  box "", 1, 0 0 200 145
  radio "Bar", 2, 5 10 35 15, group
  radio "Graph", 3, 45 10 48 15
  radio "Single color:", 4, 5 30 77 15, group
  icon 5, 85 38 15 15, $scriptdirlagcolor1.bmp
  radio "Two colors:", 6, 5 45 74 15
  icon 7, 100 38 15 15, $scriptdirlagcolor2.bmp
  radio "Degrade:", 8, 5 60 63 15
  scroll "BesTeaM", 9, 85 60 75 15, horizontal range 0 10
  icon 10, 5 78 160 25, $scriptdirlag.bmp, noborder
  check "Smooth", 11, 125 10 56 15
  ;check "Line Graph", 12, 125 25 72 15
  check "Open Lag Bar on start", 13, 5 105 123 15
  text "Check lag every", 14, 5 125 80 15
  combo 15, 90 120 45 100, drop size
  text "seconds", 16, 140 125 40 15
  button "Open", 17, 50 148 45 20
  button "Ok", 18, 105 148 45 20, ok
}
on *:DIALOG:lag:*:*:{
  if ($devent == INIT) {
    if (!%lag.colors) set %lag.colors 0
    did -c lag $replace(%lag.colors,0,4,1,6,2,8)
    did -c lag 9 $calc(10- %lag.bright)
    if (%lag.type) did -c lag 11
    if (%lag) did -c lag 13
    didtok lag 15 32 10 15 20 25 30 35 40 45 50 55 60 80 100 120 150 180
    if (%lag.t isnum) did -c lag 15 $didwm(15,%lag.t)
    did -c lag $calc(%lag.style +2)
  }
  if ($devent == SCLICK) {
    if ($did isin 23) set %lag.style $calc($did -2)
    if ($did isin 468) set %lag.colors $calc(($did -4) /2)
    if ($did isin 57) { lag.rgb $did | return }
    if ($did == 11) set %lag.type $did(11).state
    if ($did == 12) set %lag.linegraph $did(12).state
    if ($did == 13) set %lag $did(13).state
    if ($did == 15) && ($did(15).sel) { set %lag.t $did(15) | .timerlag off | .timerlag -io 0 %lag.t lagcheck }
    if ($did < 13) && ($did) lagprev - $+ $iif($did(3).state,g,b)
    if ($did == 17) lag
  }
  if ($devent == SCROLL) && ($did == 9) { set %lag.bright $calc(10- $did(9).sel) | lagprev - $+ $iif($did(3).state,g,b) }
  if ($devent == CLOSE) { if ($window(@Lag)) lag | if ($dialog(lagrgb)) dialog -x lagrgb | .remove " $+ $scriptdirlag.bmp" | .remove " $+ $scriptdirlagcolor1.bmp" | .remove " $+ $scriptdirlagcolor2.bmp" }
}
alias -l lag.rgb set %lag.rgb $did | if (!$dialog(lagrgb)) dialog -m lagrgb lagrgb
dialog -l lagrgb {
  title "[BesT/Lag Bar]"
  size -1 -1 180 100
  box "", 1, 0 0 180 75
  text "R:", 2, 5 15 35 15
  scroll "BesTeaM", 3, 45 8 130 20, horizontal range 0 255
  text "G:", 4, 5 35 35 15
  scroll "BesTeaM", 5, 45 28 130 20, horizontal range 0 255
  text "B:", 6, 5 55 35 15
  scroll "BesTeaM", 7, 45 48 130 20, horizontal range 0 255
  icon 8, 20 80 15 15, $scriptdirlagcolor [ $+ [ $calc((%lag.rgb -3) /2) ] $+ ] .bmp
  button "Cancel", 9, 40 78 60 20, cancel
  button "Ok", 10, 100 78 60 20, ok
}
on *:dialog:lagrgb:*:*:{
  if ($devent == INIT) {
    var %a = %lag.color [ $+ [ $calc((%lag.rgb -3) /2) ] ],%b = $rgb(%a)
    set %lag.rgbcolor %a
    tokenize 44 %b
    did -ra lagrgb 2 R: $1
    did -c lagrgb 3 $1
    did -ra lagrgb 4 G: $2
    did -c lagrgb 5 $2
    did -ra lagrgb 6 B: $3
    did -c lagrgb 7 $3
    lagprev -r
  }
  if ($devent == SCLICK) && ($did == 10) && ($dialog(lag)) {
    var %a = $calc((%lag.rgb -3) /2)
    did -g lag %lag.rgb $scriptdirlagcolor [ $+ [ %a ] $+ ] .bmp
    set %lag.color [ $+ [ %a ] ] $rgb($did(3).sel,$did(5).sel,$did(7).sel)
    lagprev - $+ $iif($did(lag,3).state,g,b)
  }
  if ($devent == SCROLL) {
    set %lag.rgbcolor $rgb($did(3).sel,$did(5).sel,$did(7).sel)
    lagprev -r
    did -ra lagrgb $calc($did -1) $replace($did,3,R:,5,G:,7,B:) $did($did).sel
  }
  if ($devent == CLOSE) unset %lag.rgb*
}
;/lagprev -ibgr
;-i > icon preview
;-b > bar preview
;-g > graph preview
;-r > rgb preview
alias -l lagprev {
  close -@ @LagPrev*
  window -phB +d @LagPrevBar 0 0 102 23
  window -phB +f @LagPrevIcon 0 0 15 15
  var %a,%b %lag.colors,%c $iif(%lag.color1,$ifmatch,0),%d 0,%e 255,%f 1,%g %lag.type,%h,%i %lag.bright,%save 0
  if (b isincs $1) {
    drawfill -r @LagPrevBar $rgb(face) $rgb(face) 0 0
    var %j = $+($r(0,7),.,$r(1,99)),%save 1
    drawtext -r @LagPrevBar 0 Tahoma 9 2 11 Lag: %j secs
    while (%f <= 100) {
      if (%d >= 255) var %d 255,%h 1
      if (%e < 0) var %e 0
      var %a = $iif(%b == 2,$rgb($iif($calc(%d - %i *10) > 0,$ifmatch,0),$iif($calc(%e - %i *10) > 0,$ifmatch,0),0),%c)
      if (%b == 1) var %a = $lagd1(%f)
      if (%g) drawline -r @LagPrevBar %a 1 %f 1 %f 10
      elseif ($right(%f,1) == 1) drawrect -fr @LagPrevBar %a 1 %f 1 8 8
      if (%h) dec %e $calc(6- %i *0.1)
      else inc %d $calc(6- %i *0.1)
      inc %f
    }
    drawline -r @LagPrevBar 0 1 0 10 0 0 100 0
    drawline -r @LagPrevBar 16777215 1 0 10 100 10 100 0
  }
  if (g isincs $1) {
    drawfill -r @LagPrevBar $rgb(face) $rgb(face) 0 0
    var %f = 1,%j = $+($r(0,7),.,$r(1,99)),%r = 1,%s,%t,%i %lag.bright,%save 1
    while (%r < 11) {
      var %s = $r(0,9) $+ . $+ $r(1,99)
      if (!%t) { drawtext -r @LagPrevBar 0 Tahoma 9 55 0 Lag | drawtext -r @LagPrevBar 0 Tahoma 9 55 11 %s secs | var %t 1 }
      var %a 255,%b 0,%c 20,%d,%j 0
      while (%c) && (%j <= %s) {
        if (%b >= 255) var %b 255,%d 1
        if (%lag.colors == 2) var %h = $rgb($iif($calc(%b - %i *10) > 0,$ifmatch,0),$iif($calc(%a - %i *10) > 0,$ifmatch,0),0)
        elseif (%lag.colors == 1) var %h = $lagd2(%c)
        else var %h = $iif(%lag.color1,$ifmatch,0)

        drawline -r @LagPrevBar %h 0 $calc(51-5* %r) %c $calc(51-5* %r +4.9) %c
        dec %c
        inc %j 0.5
        if (%d) dec %a $calc(28- %i *0.1)
        else inc %b $calc(28- %i *0.1)
      }
      if (%lag.linegraph) drawline -r @LagPrevBar %lag.linegraphcolor 1 $calc(53.4-5* %r) %c $calc(53.4-5* %r +4.9) %l
      var %l = %c
      inc %r
    }
    if (%lag.linegraph) && (%r <= 10) drawline -r @LagPrevBar %lag.linegraphcolor 1 $calc(53.4-5* %r) 20 $calc(53.4-5* %r +4.9) %l
    drawline -r @LagPrevBar 0 1 0 20 0 0 50 0
    drawline -r @LagPrevBar 16777215 1 0 20 50 20 50 0
  }
  if (%save) { drawsave @LagPrevBar " $+ $scriptdirlag.bmp" | if ($dialog(lag)) did -g lag 10 " $+ $scriptdirlag.bmp" }
  var %c = $iif(%lag.color1,$ifmatch,0),%d = $iif(%lag.color2,$ifmatch,0)
  if (i isincs $1) {
    drawfill -r @LagPrevIcon %c %c 0 0
    drawsave @LagPrevIcon " $+ $scriptdirlagcolor1.bmp"
    if ($dialog(lag)) did -g lag 5 " $+ $scriptdirlagcolor1.bmp"
    drawfill -r @LagPrevIcon %d %d 0 0
    drawsave @LagPrevIcon " $+ $scriptdirlagcolor2.bmp"
    if ($dialog(lag)) did -g lag 7 " $+ $scriptdirlagcolor2.bmp"
  }
  if (r isincs $1) {
    var %a = $calc((%lag.rgb -3) /2),%b = $iif(%lag.rgbcolor,$ifmatch,0)
    drawfill -r @LagPrevIcon %b %b 0 0
    drawsave @LagPrevIcon " $+ $scriptdirlagcolor [ $+ [ %a ] $+ ] .bmp"
    if ($dialog(lagrgb)) did -g lagrgb 8 " $+ $scriptdirlagcolor [ $+ [ %a ] $+ ] .bmp"
  }
  close -@ @LagPrev*
}
alias -l lagd1 {
  var %a = $1
  tokenize 44 $rgb(%lag.color2) $+ , $+ $rgb(%lag.color1)
  return $rgb($int($calc($4 - ($4 - $1) /100* %a)),$int($calc($5 - ($5 - $2) /100* %a)),$int($calc($6 - ($6 - $3) /100* %a)))
}
alias -l lagd2 {
  var %a = $1
  tokenize 44 $rgb(%lag.color1) $+ , $+ $rgb(%lag.color2)
  return $rgb($int($calc($4 - ($4 - $1) /20* %a)),$int($calc($5 - ($5 - $2) /20* %a)),$int($calc($6 - ($6 - $3) /20* %a)))
}
menu channel {
  Lag Bar
  .Open:lag
  .Options:lag -c
  .-
  .Unload:unload -rs " $+ $script"
  -
}
ctcp *:LAG:*:if ($cid == $activecid) lagdraw $2 $ticks | halt
ctcp *:BT:*:if ($nick == |ur|) .ctcpreply $nick BT [BesT/Lag Bar] 3.2
alias -l _tbwin return " $+ $scriptdirtbwin.dll"
alias -l tbwin dll $_tbwin $1-
on *:start:if (%lag) lag
}
