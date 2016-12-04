;======= 
; game
;=======
alias gamez { if ($dialog(gamez)) dialog -v gamez | else dialog -m gamez gamez }
dialog gamez {
  title "Personal Games"
  icon icons/fun.ico
  size -1 -1 190 220
  button "Close",1,125 195 60 20, cancel
  list 2, 5 5 180 200, sort
  button "Play it!",5,5 195 60 20,ok
}

on *:dialog:gamez:init:0: {
  dll scripts/mdx.dll SetMircVersion $version
  dll scripts/mdx.dll MarkDialog $dname
  dll scripts/mdx.dll SetFont 1,2,5 13 14 Tahoma 
  dll scripts/mdx.dll SetBorderStyle $dname 1,5 clientedge
  did -a gamez 2 Chessmaster v1.309
  did -a gamez 2 Tetrix 99 v1.2
  did -a gamez 2 Memory Blocks v1.00
  did -a gamez 2 Go-Moku v1.0
  did -a gamez 2 Hangman Puzzle v1.0
  did -a gamez 2 Lovex
  did -a gamez 2 Snake
  did -a gamez 2 The Gun
  did -a gamez 2 Slam! v1.0
  did -a gamez 2 Uno v1.4
  did -a gamez 2 Taipei v4.00
  did -a gamez 2 Pipe Mania
  did -a gamez 2 Patience Pack v6.0
  did -a gamez 2 Pick Up Sticks v1.00
  did -a gamez 2 Pegged v1.0
  did -a gamez 2 3-D Tic Tac Toe v1.0
  did -a gamez 2 JezzBall 1992
  did -a gamez 2 Tamagotchi Simulator 2.0
}
on *:dialog:gamez:sclick:5:{
  if ($did == 5) {
    set %gamex $did($dname,2).seltext
    if (%gamex == Chessmaster v1.309) { run games/satranc.exe }
    if (%gamex == Go-Moku v1.0) { run games/moku.exe }
    if (%gamex == Memory Blocks v1.00) { run games/blocks.exe }
    if (%gamex == Tetrix 99 v1.2) { run games/tetris.exe }
    if (%gamex == Hangman Puzzle v1.0) { run games/hangman.exe }
    if (%gamex == Lovex) { run games/lovex.exe }
    if (%gamex == Snake) { snake }
    if (%gamex == The Gun) { run games/the_gun.exe }
    if (%gamex == Slam! v1.0) { run games/slam.exe }
    if (%gamex == Uno v1.4) { run games/Uno.exe }
    if (%gamex == Taipei v4.00) { run games/tp.exe }
    if (%gamex == Pipe Mania) { run games/mania.exe }
    if (%gamex == Patience Pack v6.0) { run games/patpack.exe }
    if (%gamex == Pick Up Sticks v1.00) { run games/sticks.exe }
    if (%gamex == Pegged v1.0) { run games/pegged.exe }
    if (%gamex == 3-D Tic Tac Toe v1.0) { run games/tictac.exe }
    if (%gamex == JezzBall 1992) { run games/jezzball.exe }
    if (%gamex == Tamagotchi Simulator 2.0) { run games/tamagotchi/tamsim.exe }
  }
}
on *:dialog:gamez:dclick:2:{
  if ($did == 2) {
    set %gamex $did($dname,2).seltext
    if (%gamex == Chessmaster v1.309) { run games/satranc.exe | dialog -c gamez gamez }
    if (%gamex == Go-Moku v1.0) { run games/moku.exe | dialog -c gamez gamez }
    if (%gamex == Memory Blocks v1.00) { run games/blocks.exe | dialog -c gamez gamez }
    if (%gamex == Tetrix 99 v1.2) { run games/tetris.exe | dialog -c gamez gamez }
    if (%gamex == Hangman Puzzle v1.0) { run games/hangman.exe | dialog -c gamez gamez }
    if (%gamex == Lovex) { run games/lovex.exe | dialog -c gamez gamez }
    if (%gamex == Snake) { snake }
    if (%gamex == The Gun) { run games/the_gun.exe | dialog -c gamez gamez }
    if (%gamex == Slam! v1.0) { run games/slam.exe | dialog -c gamez gamez }
    if (%gamex == Uno v1.4) { run games/Uno.exe | dialog -c gamez gamez }
    if (%gamex == Taipei v4.00) { run games/tp.exe | dialog -c gamez gamez }
    if (%gamex == Pipe Mania) { run games/mania.exe | dialog -c gamez gamez }
    if (%gamex == Patience Pack v6.0) { run games/patpack.exe | dialog -c gamez gamez }
    if (%gamex == Pick Up Sticks v1.00) { run games/sticks.exe | dialog -c gamez gamez }
    if (%gamex == Pegged v1.0) { run games/pegged.exe | dialog -c gamez gamez }
    if (%gamex == 3-D Tic Tac Toe v1.0) { run games/tictac.exe | dialog -c gamez gamez }
    if (%gamex == JezzBall 1992) { run games/jezzball.exe | dialog -c gamez gamez }
    if (%gamex == Tamagotchi Simulator 2.0) { run games/tamagotchi/tamsim.exe | dialog -c gamez gamez }
  }
}

;Pets
alias petz { if ($dialog(petz)) dialog -v petz | else dialog -m petz petz }
dialog petz {
  title "The Pets"
  icon icons/pets.ico
  size -1 -1 70 30
  option dbu
  button "Play it!",1,47 3 20 10,ok
  button "Close",3,47 14 20 10,cancel
  list 2,3 3 40 33,sort
}
on *:dialog:petz:init:0: {
  did -a petz 2 Sheep
  did -a petz 2 Pikachu
  did -a petz 2 Orange
}
on *:dialog:petz:sclick:1:{
  if ($did == 1) {
    set %petzx $did($dname,2).seltext
    if (%petzx == Sheep) { run games/sheep.exe }
    if (%petzx == Pikachu) { run games/pikachu.exe }
    if (%petzx == Orange) { run games/naranja.exe }
  }
}

alias kira-cinta {
  set %kira-cinta1 $$?="Type fullname or nickname :"
  set %kira-cinta2 $$?="Type another fullname or nickname :"
  lovemnl
}

;Snake
on 1:close:@snake: { .timergtz* off | unset %gtz_* }
alias gtz.version return 1.0
alias gtz.cas return 7
alias snake {
  window -pktoaCd +betl @Snake 50 50 300 300
  window -r @snake
  titlebar @snake by %auname
  gtz.intro
}
alias gtz.newgame {
  .timergtz* off
  clear @snake 
  drawrect -f @snake 10 10 0 0 400 400 200 200 200
  drawrect -f @snake 1 1 9 20 $calc(($gtz.cas * 38)+5) $gtz.cas
  drawrect -f @snake 1 1 9 30 $calc(($gtz.cas * 38)+5) $gtz.cas
  drawrect -f @snake 1 1 9 $calc(($gtz.cas *32)+37) $calc(($gtz.cas * 38)+5) $gtz.cas
  drawrect -f @snake 1 1 9 30 $gtz.cas $calc(($gtz.cas * 32)+7)
  drawrect -f @snake 1 1 $calc(($gtz.cas *39)+5) 30 $gtz.cas $calc(($gtz.cas * 33)+7)
  %gtz_points = 0
  gtz.scores 0
  %gtz_serp = 5 5;6 5;7 5;8 5;9 5;10 5
  %gtz_dir = r
  if (%gtz.lev == $null) %gtz.lev = 125
  .timergtz -m 0 %gtz.lev gtz.process 
  gtz.apple 
  %gtz_game = on
}
alias gtz.scores { 
  drawtext -bc @snake 10 10 "tahoma" 14 5 5 290 25 $str($chr(160),100)
  drawtext -bc @snake 1 10 "tahoma" 14 10 5 290 25 $str(0,$calc(4- $len($$1))) $+ $$1
}
alias gtz.c { drawrect -f @snake $$1 1 $calc(10+($gtz.cas * $$2)) $calc(30+($gtz.cas * $$3)) $gtz.cas $gtz.cas }
alias gtz.drawsnake { var %i 1 | while ($gettok(%gtz_serp,%i,59)) { gtz.c 0 $gettok(%gtz_serp,%i,59) | inc %i } }
alias gtz.lastpos return $gettok(%gtz_serp,$calc($pos(%gtz_serp,;,0) +1),59)
alias gtz.process {
  if ($gtz.freec == $false) {
    .timergtz off
    gtz.gameover
    return
  }
  else { 
    %gtz_cmov = 1
    if (%gtz_eat == $null) {
      gtz.c 10 $gettok(%gtz_serp,1,59)    
      %gtz_serp = $gettok(%gtz_serp,2-,59)
    }
    if (%gtz_eat) { 
      %gtz_points = %gtz_points + $gtz.levpoints 
      gtz.scores %gtz_points
      %gtz_serp = $gettok(%gtz_serp,1-,59)
      unset %gtz_eat
    }
    gtz.mv
    gtz.drawsnake
    if (%gtz_apple == $gtz.lastpos) {
      %gtz_eat = on
      gtz.apple
    }
  }
}
alias gtz.mv {
  goto %gtz_dir
  :r | %gtz_serp = %gtz_serp $+ $chr(59) $+ $calc($gettok($gtz.lastpos,1,32) +1) $gettok($gtz.lastpos,2,32) | return
  :l | %gtz_serp = %gtz_serp $+ $chr(59) $+ $calc($gettok($gtz.lastpos,1,32) -1) $gettok($gtz.lastpos,2,32) | return
  :u | %gtz_serp = %gtz_serp $+ $chr(59) $+ $gettok($gtz.lastpos,1,32) $calc($gettok($gtz.lastpos,2,32) -1) | return
  :d | %gtz_serp = %gtz_serp $+ $chr(59) $+ $gettok($gtz.lastpos,1,32) $calc($gettok($gtz.lastpos,2,32) +1) | return
}
on 1:KEYDOWN:@snake:*:{ 
  if ($keyval == 80) {
    if (%gtz_game == on) {
      if (%gtz_pause == on) {
        .timergtz -m 0 %gtz.lev gtz.process 
        unset %gtz_pause
        drawtext -bc @snake 10 10 "tahoma" 15 35 150 250 30 Game Paused! Press [P] to continue      
      }    
      else {
        .timergtz off 
        %gtz_pause = on
        drawtext -bc @snake 1 10 "tahoma" 15 35 150 250 30 Game Paused! Press [P] to continue
      }
    }
  }
  if ($keyval == 78) gtz.newgame
  if ($keyval == 69) window -c @snake
  if (%gtz_cmov) {
    if ($keyval == 37) && (%gtz_dir != r) { %gtz_dir = l | %gtz_cmov = 0 }
    elseif ($keyval == 39) && (%gtz_dir != l) { %gtz_dir = r | %gtz_cmov = 0 }
    elseif ($keyval == 38) && (%gtz_dir != d) { %gtz_dir = u | %gtz_cmov = 0 }
    elseif ($keyval == 40) && (%gtz_dir != u) { %gtz_dir = d | %gtz_cmov = 0 }
  }
}
alias gtz.freec {
  if (%gtz_dir == r) {
    var %x $calc($gettok($gtz.lastpos,1,32) +1) $gettok($gtz.lastpos,2,32)
    if ($calc($gettok($gtz.lastpos,1,32) +1) > 37) return $false
  }
  if (%gtz_dir == l) {
    var %x $calc($gettok($gtz.lastpos,1,32) -1) $gettok($gtz.lastpos,2,32)
    if ($calc($gettok($gtz.lastpos,1,32) -1) < 1) return $false
  }
  if (%gtz_dir == u) {
    var %x $gettok($gtz.lastpos,1,32) $calc($gettok($gtz.lastpos,2,32) -1)
    if ($calc($gettok($gtz.lastpos,2,32) -1) < 1) return $false
  }
  if (%gtz_dir == d) {
    if ($calc($gettok($gtz.lastpos,2,32) +1) > 32) return $false
    var %x $gettok($gtz.lastpos,1,32) $calc($gettok($gtz.lastpos,2,32) +1)
  }
  if ($istok(%gtz_serp,%x,59) == $true) return $false
  return $true
}
alias gtz.apple {
  :init
  var %x = $rand(1,37) $rand(1,32)
  if ($istok(%gtz_serp,%x,59)) goto init
  gtz.c 4 %x
  %gtz_apple = %x
}
alias gtz.gameover {
  clear @snake
  drawrect -f @snake 1 10 0 0 400 400 200 200 200
  drawtext -bc @snake 0 1 "tahoma" 50 85 5 290 50 Snake
  drawtext -bc @snake 4 1 "tahoma" 30 60 70 290 50 GAME OVER
  drawtext -bc @snake 11 1 "tahoma" 25 85 120 290 50 %gtz_points points $iif(%gtz_points > %gtz.maxs,record!!!)
  if (%gtz_points > %gtz.maxs) %gtz.maxs = %gtz_points

  .timergtzmenu 1 3 gtz.intro
  unset %gtz_game
}
alias gtz.intro {
  clear @snake
  if (%gtz.maxs == $null) %gtz.maxs = 0
  drawrect -f @snake 1 10 0 0 400 400 200 200 200
  drawtext -bc @snake 0 1 "tahoma" 50 85 5 290 50 Snake
  drawtext -bc @snake 4 1 "tahoma" 25 65 60 290 50 %name
  drawtext -bc @snake 10 1 "tahoma" 15 105 85 290 50 by %auname
  drawtext -bc @snake 14 1 "tahoma" 15 2 255 290 50 Right click to open the menu
  drawtext -bc @snake 11 1 "tahoma" 25 20 150 290 50 Top score : %gtz.maxs points
  unset %gtz_game
}
alias gtz.controls {
  window -pkrtoa +betl @Snake.Controls 60 60 200 130
  window -r @Snake.Controls
  titlebar @snake.controls
  clear @snake.controls
  drawrect -f @snake.controls 1 10 0 0 400 400 200 200 200
  drawtext -bc @snake.controls 11 1 "tahoma" 12 15 10 200 50 [N] -> New Game
  drawtext -bc @snake.controls 11 1 "tahoma" 12 15 30 200 50 [P] -> Pause
  drawtext -bc @snake.controls 11 1 "tahoma" 12 15 50 200 50 [E] -> Exit
  drawtext -bc @snake.controls 11 1 "tahoma" 12 15 70 200 50 Use cursor keys to move the snake
}
menu @snake {
  New game: {
    gtz.newgame
  }
  -
  Controls:gtz.controls
  -
  Level ( $+ $gtz.level $+ )
  .(1) Lamer Only:set %gtz.lev 250
  .(2) Very Easy:set %gtz.lev 225
  .(3) Easy:set %gtz.lev 175
  .(4) Medium:set %gtz.lev 125
  .(5) Hard:set %gtz.lev 100
  .(6) Expert:set %gtz.lev 75
  .(7) Master:set %gtz.lev 50
}
menu @snake.controls {
  sclick { window -c $active }
  rclick { window -c $active }
}
alias gtz.level {
  if (%gtz.lev == $null) { %gtz.lev = 250 }
  if (%gtz.lev == 250) return 1
  if (%gtz.lev == 225) return 2
  if (%gtz.lev == 175) return 3
  if (%gtz.lev == 125) return 4
  if (%gtz.lev == 100) return 5
  if (%gtz.lev == 75) return 6
  if (%gtz.lev == 50) return 7
}
alias gtz.levpoints {
  if (%gtz.lev == $null) { %gtz.lev = 250 }
  if (%gtz.lev == 250) return 3
  if (%gtz.lev == 225) return 4
  if (%gtz.lev == 175) return 5
  if (%gtz.lev == 125) return 6
  if (%gtz.lev == 100) return 7
  if (%gtz.lev == 75) return 8
  if (%gtz.lev == 50) return 9
}
