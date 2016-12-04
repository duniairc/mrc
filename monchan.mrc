; Clonesmon for mIRC v6.x 
; wIRC Project v6.0

; |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
; |       Events        |
; |_____________________|


#onjointhingie on

; -- Netsplit 1/2 start --
On *:quit:{
  if . isin $1 && . isin $2 {
    hadd -mu300 netsplit $nick 1
  }
}
; -- Netsplit 1/2 end   --

On !*:join:#:{

  ; -- Netsplit 2/2 start --
  if $hget(netsplit, $nick) {
    return
  }
  ; -- Netsplit 2/2 end   --

  var %table = joinmon_ $+ #
  hadd -mu20 %table $nick -
  var %items = $hget(%table ,0).item 
  if %items <= 10 { return }

  var %win = @Mon. $+ #
  if $window(%win) {
    _addNick # $nick
    return
  }
  _addLastJoined #
}

raw 302:*:{
  var %address = $replace($2, *=-, !, *=+, !, =-, !, =+, !)
  var %nick = $gettok(%address, 1, 33)
  var %table = awaiting_host
  var %chan = $hget(%table, %nick)
  if !%chan { return }
  var %win = @Mon. $+ %chan
  if !$window(%win) { return }
  var %host = $gettok(%address, 2, 64)
  aline -l %win $+(%nick, $chr(9), %host)
  hdel %table %nick
  halt
}

#onjointhingie end

; |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
; |       Menus         |
; |_____________________|

menu nicklist {
  Open monitor with
  .turn $iif($group(#onjointhingie) = off,on,off) : if ($group(#onjointhingie) = off) enable #onjointhingie | else disable #onjointhingie
  .-
  .all         { _addAll # }
  .selected    { _addSelected # }
  .last joined { _addLastJoined # }
}

menu @Mon.* {
  Kick    { _forEach kick CHAN NICK $$?="Kick Reason?" }
  Ban     { _forEach mode CHAN +b HOST }
  UnBan   { _forEach mode CHAN -b HOST }
  -
  Kill    { _forEach kill NICK $$?="Kill Reason?" }
  Kline   { _forEach kline HOST $$?="Kline Reason?" }
  UnKline { _forEach unkline HOST }
  Gline   { _forEach gline HOST 30d $$?="Gline Reason?" }
  UnGline { _forEach gline -HOST }
}


; |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
; |       Aliases       |
; |_____________________|


; /_openWin <window>
alias -l _openWin {
  if $window($1) { return }
  window -nkl40 -t15 $1
  echo $1 12(wIRC) Clonesmon for11 $gettok($1, 2-, 46) 12opened.
  echo $1 12(wIRC)14 $fulldate
}

; /_addAll <chan>
alias -l _addAll {
  var %win = @Mon. $+ $1
  _openWin %win

  var %i = 1, %nicks = $nick($1, 0)
  while %i <= %nicks {
    _addNick $1 $nick($1, %i)
    inc %i
  }
}

; /_addSelected <chan>
alias -l _addSelected {
  var %i = 1, %nicks = $snick($1, 0)

  if !%nicks { return }
  var %win = @Mon. $+ $1

  _openWin %win
  while %i <= %nicks {
    _addNick $1 $snick($1, %i)
    inc %i
  }
}

; /addLastJoined <chan>
alias -l _addLastJoined {
  var %table = joinmon_ $+ $1
  var %i = 1, %nicks = $hget(%table, 0).item

  if !%nicks { return }
  var %win = @Mon. $+ $1

  _openWin %win
  while %i <= %nicks {
    _addNick $1 $hget(%table, %i).item
    inc %i
  }
}

; /_addNick <chan> <nick>
alias -l _addNick {
  hadd -mu20 awaiting_host $2 $1
  !userhost $2
}

alias -l _forEach {
  var %win = $active
  if @Mon.* !iswm %win { return }
  var %i = 1, %lines = $sline(%win, 0)
  if !%lines { 
    echo -e %win 04<!>11 Select some lines first.
    return
  }
  linesep %win
  var %chan = $gettok(%win, 2-, 46)
  while %i <= %lines {
    var %line = $sline(%win, %i)
    var %nick = $gettok(%line, 1, 9)
    var %host = *@ $+ $gettok(%line, 2, 9)
    var %cmd = $replacecs($1-, NICK, %nick, HOST, %host, CHAN, %chan)
    %cmd
    echo %win ->>14 %cmd 
    inc %i
  }
  linesep %win
}
