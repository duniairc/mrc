on *:start:{
  hmake reflex 10
  if ($exists(" $+ $scriptdirreflex.hsh $+ ")) hload reflex " $+ $scriptdirreflex.hsh $+ "
}

on *:exit:{
  if ($hget(reflex)) hsave -o reflex " $+ $scriptdirreflex.hsh $+ "
}

on *:unload:{
  if ($timer(reflex)) .timerreflex off
  if (%reflex.ticks) unset %reflex.ticks
  if (($hget(reflex)) || ($exists(" $+ $scriptdirreflex.hsh $+ "))) {
    var %msg = $input(Do you want to clear your Reflex Tester stats?,yh,Erase Stats?)
    if (%msg == $true) {
      if ($hget(reflex)) hfree reflex
      if ($exists(" $+ $scriptdirreflex.hsh $+ ")) .remove -b " $+ $scriptdirreflex.hsh $+ "
    }
  }
}

alias reflexstats { 
  var %reflex.uses = $hget(reflex,uses)
  var %reflex.record = $hget(reflex,record)
  var %reflex.average = $round($hget(reflex,average),3)
  msg $active Reflex Tester Stats - Uses: $iif(%reflex.uses,$ifmatch,0) - Record: $iif($hget(reflex,record) == $null,N/A,$hget(reflex,record) $+ secs) - Average Time: $iif(%reflex.average == $null,N/A,%reflex.average $+ secs)
}

alias reflex {
  if (%reflex.ticks) unset %reflex.ticks
  if ($timer(reflex)) .timerreflex off
  if ($window(@reflex)) clear @reflex
  else window -pdfk0 @Reflex -1 -1 250 185
  ; draw the outer-most border (black)
  drawrect -nr @reflex $rgb(0,0,0) 3 0 0 250 185
  ; draw the inner rectangle (white-ish)
  drawrect -nrf @reflex $rgb(235,235,235) 1 3 3 243 178
  ; draw the second border (silver)
  drawrect -nr @reflex $rgb(192,192,192) 2 3 3 244 179
  drawtext -nro @reflex $rgb(0,0,0) Verdana -16 10 5 Reflex Tester
  ; draw the border under Reflex Tester
  drawline -nr @reflex $rgb(192,192,192) 2 3 30 245 30
  drawline -nr @reflex $rgb(0,0,0) 3 3 32 246 32
  drawline -nr @reflex $rgb(192,192,192) 2 3 35 245 35
  ; draw the directions
  drawtext -nr @reflex $rgb(0,0,0) Verdana -8 10 45 1. Click Start
  drawtext -nr @reflex $rgb(0,0,0) Verdana -8 10 65 2. When the Stop button turns green
  drawtext -nr @reflex $rgb(0,0,0) Verdana -8 10 78 $str($chr(160),3) click it.
  ; draw the Start/Stop buttons
  drawstart
  drawred
  ; draw the results part
  drawtext -nro @reflex $rgb(0,0,0) Verdana -12 10 135 Result:
  ; draw the record part
  drawtext -nro @reflex $rgb(0,0,0) Verdana -12 10 155 Record:
  drawrecord
  ; draw the reset button
  drawbutton @reflex $rgb(0,0,0) $rgb(255,255,255) $rgb(192,192,192) $rgb(0,0,0) 200 10 40 15 reset Verdana -8
  if ($active != @reflex) window -a @reflex
}

alias -l drawstart { drawbutton @reflex $rgb(0,0,0) $rgb(255,255,255) $rgb(192,192,192) $rgb(0,0,0) 37 100 70 25 Start Verdana -12 }
alias -l drawresult { drawtext -rc @reflex $rgb(255,0,0) Verdana -12 85 135 158 23 $1- }
alias -l clearresult { drawrect -rf @reflex $rgb(235,235,235) 1 85 135 158 23 }
alias -l drawrecord { drawtext -rc @reflex $rgb(255,0,0) Verdana -12 85 155 158 23 $iif($hget(reflex,record),$ifmatch $+ secs,none) }
alias -l clearrecord { drawrect -rf @reflex $rgb(235,235,235) 1 85 155 158 23 }
alias -l drawred { drawbutton @reflex $rgb(255,0,0) $rgb(255,255,255) $rgb(192,192,192) $rgb(0,0,0) 142 100 70 25 Stop Verdana -12 }
alias -l drawgreen { 
  drawbutton @reflex $rgb(0,255,0) $rgb(255,255,255) $rgb(192,192,192) $rgb(0,0,0) 142 100 70 25 Stop Verdana -12
  set %reflex.ticks $ticks
}

; /drawbutton @window <buttonColor> <buttonTextColor> <borderColor1> <borderColor2> <x> <y> <w> <h> <buttonText> [fontName fontSize]
; all parameters are required except for the font name/font size (if one is specified, the other must be as well)
; buttonColor, buttonTextColor, borderColor1, and borderColor2 are taken in RGB format
alias -l drawbutton {
  ; this draws the button itself
  drawrect -fr $1 $2 2 $6 $7 $8 $9
  ; this draws the bottom border
  drawline -r $1 $5 1 $6 $calc($7 + $9) $calc($6 + $8 + 1) $calc($7 + $9)
  ; this draws the right border
  drawline -r $1 $5 1 $calc($6 + $8) $7 $calc($6 + $8) $calc($7 + $9)
  ; this draws the top border
  drawline -r $1 $4 1 $6 $7 $calc($6 + $8 + 1) $7
  ; this draws the left border
  drawline -r $1 $4 1 $6 $7 $6 $calc($7 + $9)
  if ($11) && ($12) {
    var %drawfont $11
    var %drawsize $12
  }
  else {
    var %drawfont $window($1).font
    var %drawsize $window($1).fontsize
  }
  var %x $int($calc($6 + (($8 / 2) - ($width($10,[ %drawfont ],[ %drawsize ]) / 2))))
  var %y $int($calc($7 + (($9 / 2) - ($height($10,[ %drawfont ],[ %drawsize ]) / 2))))
  inc %y
  ; this draws the text inside the button
  drawtext -r $1 $3 %drawfont %drawsize %x $calc(%y - 1) $10
}

menu @Reflex {
  uclick {
    if ($inrect($mouse.x,$mouse.y,37,100,70,25)) {
      ; the start button was clicked
      if ($timer(reflex)) .timerreflex off
      .timerreflex 1 $r(2,5) drawgreen
      drawbutton @reflex $rgb(0,0,0) $rgb(0,0,0) $rgb(192,192,192) $rgb(0,0,0) 37 100 70 25 Start Verdana -12
      drawred
      clearresult
    }
    if ($inrect($mouse.x,$mouse.y,200,10,40,15)) {
      ; the reset button was clicked
      if ($timer(reflex)) .timerreflex off
      drawred
      drawstart
      clearresult
      unset %reflex.ticks
    }
  }
  sclick {
    if ($inrect($mouse.x,$mouse.y,142,100,70,25)) {
      ; the stop button was clicked
      if ($getdot(@reflex,143,103) == 65280) {
        ; if the stop button is green
        set -l %reflex.result $calc($calc($ticks - %reflex.ticks) / 1000)
        hinc reflex uses
        hadd -m reflex total $calc($hget(reflex,total) + %reflex.result)
        hadd -m reflex average $calc($hget(reflex,total) / $hget(reflex,uses))
        drawred
        drawresult %reflex.result $+ secs
        unset %reflex.ticks
        drawstart
        var %reflex.record = $hget(reflex,record)
        if (%reflex.record == $null) {
          hadd reflex record %reflex.result
          clearrecord
          drawrecord
        }
        else {
          if (%reflex.result < %reflex.record) {
            var %msg = $input(Congrats! $crlf $crlf $+ You just broke your record: $crlf $+ %reflex.record $+ secs $crlf $crlf $+ Your new record is: $crlf $+ %reflex.result $+ secs,oi,Congrats!)
            hadd reflex record %reflex.result
            clearrecord
            drawrecord
          }
        }
      }
      else {
        ; if the stop button is red
        if ($timer(reflex)) {
          ; if the test is going on, reset and tell about cheating :)
          .timerreflex off
          drawred
          drawstart
          clearresult
          if (%reflex.ticks) unset %reflex.ticks
          var %msg = $input(No cheating! Wait until it's green and THEN click! $+ $crlf $+ Restarting Test...,ow,No Cheating!)
        }
      }
    }
  }
}

on *:close:@reflex:{
  if ($timer(reflex)) .timerreflex off
  if (%reflex.ticks) unset %reflex.ticks
}
