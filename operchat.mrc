;------------------ Unreal IRCOp Chat Channels
; Version 0.0.1
#OperChat_MW off
on ^*:SNOTICE:*NetAdmin.Chat -- from*:{
  oc_wnmsg nc $5 $6-
  haltdef
}
on ^*:SNOTICE:*AdminChat -- from*:{
  oc_wnmsg ac $5 $6-
  haltdef
}
on ^*:SNOTICE:*Global -- from*:{
  if ($chr(46) isin $5) set -u0 %oc.globdot 1
  else set -u0 %oc.globdot 0
  if (%oc.globdot == 0) {
    oc_wnmsg go $5 $6-
    haltdef
  }
}
on ^*:SNOTICE:*ChatOps -- from*:{
  oc_wnmsg co $5 $6-
  haltdef
}
on ^*:SNOTICE:*LocOps -- from*:{
  oc_wnmsg lo $5 $6-
  haltdef
}
on ^*:SNOTICE:*HelpOp -- from*:{
  oc_wnmsg ho $5 $6-
  haltdef
}
on ^*:WALLOPS:*:{
  oc_wnmsg wo $nick $+ : $1-
  haltdef
}

on 1:INPUT:@NetAdminChat:{
  if ($left($1) == $chr(47)) $1-
  else $oc_wncmd(nc) $1-
}
on 1:INPUT:@AdminChat:{
  if ($left($1) == $chr(47)) $1-
  else $oc_wncmd(ac) $1-
}
on 1:INPUT:@GlobOps:{
  if ($left($1) == $chr(47)) $1-
  else $oc_wncmd(go) $1-
}
on 1:INPUT:@ChatOps:{
  if ($left($1) == $chr(47)) $1-
  else $oc_wncmd(co) $1-
}
on 1:INPUT:@LocOps:{
  if ($left($1) == $chr(47)) $1-
  else $oc_wncmd(lo) $1-
}
on 1:INPUT:@HelpOp:{
  if ($left($1) == $chr(47)) $1-
  else $oc_wncmd(ho) $1-
}
on 1:INPUT:@WallOps:{
  if ($left($1) == $chr(47)) $1-
  else $oc_wncmd(wo) $1-
}


alias oc_mkall {
  oc_mkwin nc
  oc_mkwin ac
  oc_mkwin go
  oc_mkwin co
  oc_mkwin lo
  oc_mkwin ho
  oc_mkwin wo
}

alias oc_clall {
  window -c $oc_wnnam(nc)
  window -c $oc_wnnam(ac)
  window -c $oc_wnnam(go)
  window -c $oc_wnnam(co)
  window -c $oc_wnnam(lo)
  window -c $oc_wnnam(ho)
  window -c $oc_wnnam(wo)
}

alias oc_mkwin {
  ;  if ($window($oc_wnnam($1)) != $oc_wnnam($1)) window -dEg0k0z +Lnstx $oc_wnnam($1)
  if ($window($oc_wnnam($1)) != $oc_wnnam($1)) window -aEg0k0z +bnstx $oc_wnnam($1)
}

alias oc_wnnam {
  if ($1 == nc) set -u0 %oc.win @NetAdminChat
  elseif ($1 == ac) set -u0 %oc.win @AdminChat
  elseif ($1 == go) set -u0 %oc.win @GlobOps
  elseif ($1 == co) set -u0 %oc.win @ChatOps
  elseif ($1 == lo) set -u0 %oc.win @LocOps
  elseif ($1 == ho) set -u0 %oc.win @HelpOp
  elseif ($1 == wo) set -u0 %oc.win @WallOps
  else set -u0 %oc.win $null

  return [ %oc.win ]
}

alias oc_wncmd {
  if ($1 == nc) set -u0 %oc.cmd /nachat
  elseif ($1 == ac) set -u0 %oc.cmd /adchat
  elseif ($1 == go) set -u0 %oc.cmd /gochat
  elseif ($1 == co) set -u0 %oc.cmd /cochat
  elseif ($1 == lo) set -u0 %oc.cmd /lochat
  elseif ($1 == ho) set -u0 %oc.cmd /hochat
  elseif ($1 == wo) set -u0 %oc.cmd /wochat
  else set -u0 %oc.cmd /echo

  return [ %oc.cmd ]
}

alias oc_wnmsg {
  oc_mkwin $1
  aline -hp $oc_wnnam($1) $timestamp $2 $3-
  window -g1 $oc_wnnam($1)
}

alias oc_single oc_clall | disable #OperChat_MW | enable #OperChat_SW | .timer 1 2 oc_mkall
#OperChat_MW end
#OperChat_SW on
on ^*:SNOTICE:*NetAdmin.Chat -- from*:{
  oc_wnmsg nc $2 $5 $6-
  haltdef
}
on ^*:SNOTICE:*AdminChat -- from*:{
  oc_wnmsg ac $2 $5 $6-
  haltdef
}
on ^*:SNOTICE:*Global -- from*:{
  if ($chr(46) isin $5) set -u0 %oc.globdot 1
  else set -u0 %oc.globdot 0
  if (%oc.globdot == 0) {
    oc_wnmsg go $2 $5 $6-
    haltdef
  }
}
on ^*:SNOTICE:*ChatOps -- from*:{
  oc_wnmsg co $2 $5 $6-
  haltdef
}
on ^*:SNOTICE:*LocOps -- from*:{
  oc_wnmsg lo $2 $5 $6-
  haltdef
}
on ^*:SNOTICE:*HelpOp -- from*:{
  oc_wnmsg ho $2 $5 $6-
  haltdef
}
on ^*:WALLOPS:*:{
  oc_wnmsg wo WallOps $nick $+ : $1-
  haltdef
}

on 1:INPUT:@OperChat:{
  if ($left($1,1) == $chr(47)) $1-
  else %oc_cmd $1-
}

menu @OperChat {
  Use Command
  . $+ $iif(%oc_cmd == /nachat,$style(1)) NetAdminChat:set %oc_cmd /nachat
  . $+ $iif(%oc_cmd == /adchat,$style(1)) AdminChat:set %oc_cmd /adchat
  . $+ $iif(%oc_cmd == /gochat,$style(1)) GlobalChat:set %oc_cmd /gochat
  . $+ $iif(%oc_cmd == /cochat,$style(1)) ChatOps:set %oc_cmd /cochat
  . $+ $iif(%oc_cmd == /lochat,$style(1)) LocalChat:set %oc_cmd /lochat
  . $+ $iif(%oc_cmd == /hochat,$style(1)) HelpChat:set %oc_cmd /hochat
  . $+ $iif(%oc_cmd == /wochat,$style(1)) WallOps:set %oc_cmd /wochat
  -
  Close Window:window -c @OperChat
}



alias oc_mkall {
  oc_mkwin nc
}

alias oc_clall {
  window -c $oc_wnnam(nc)
}

alias oc_mkwin {
  ;  if ($window($oc_wnnam($1)) != $oc_wnnam($1)) window -dEg0k0z +Lnstx $oc_wnnam($1)
  if ($window($oc_wnnam($1)) != $oc_wnnam($1)) window -aEg0k0z +bnstx $oc_wnnam($1)
}

alias oc_wnnam {
  if ($1 == nc) set -u0 %oc.win @OperChat
  elseif ($1 == ac) set -u0 %oc.win @OperChat
  elseif ($1 == go) set -u0 %oc.win @OperChat
  elseif ($1 == co) set -u0 %oc.win @OperChat
  elseif ($1 == lo) set -u0 %oc.win @OperChat
  elseif ($1 == ho) set -u0 %oc.win @OperChat
  elseif ($1 == wo) set -u0 %oc.win @OperChat
  else set -u0 %oc.win $null

  return [ %oc.win ]
}

alias oc_wncmd {
  if ($1 == nc) set -u0 %oc.cmd /nachat
  elseif ($1 == ac) set -u0 %oc.cmd /adchat
  elseif ($1 == go) set -u0 %oc.cmd /gochat
  elseif ($1 == co) set -u0 %oc.cmd /cochat
  elseif ($1 == lo) set -u0 %oc.cmd /lochat
  elseif ($1 == ho) set -u0 %oc.cmd /hochat
  elseif ($1 == wo) set -u0 %oc.cmd /wochat
  else set -u0 %oc.cmd /echo

  return [ %oc.cmd ]
}

alias oc_wnmsg {
  oc_mkwin $1
  set -u0 %suf 
  if ($1 == nc) set -u0 %pre 4
  elseif ($1 == ac) set -u0 %pre 8
  elseif ($1 == go) set -u0 %pre 9
  elseif ($1 == co) set -u0 %pre 11
  elseif ($1 == lo) set -u0 %pre 15
  elseif ($1 == ho) set -u0 %pre 12
  elseif ($1 == wo) set -u0 %pre 7
  set -u0 %mtype %pre $+ $2 $+ %suf
  aline -hp $oc_wnnam($1) $timestamp $chr(91) $+ %mtype $+ $chr(93) $3 $4-
  window -g1 $oc_wnnam($1)
}

alias oc_multi oc_clall | .disable #OperChat_SW | .enable #OperChat_MW | .timer 1 2 oc_mkall
#OperChat_SW end
#OperChat_LA on


alias nachat .quote nachat $1-
alias adchat .quote adchat $1-
alias gochat .quote globops $1-
alias cochat .quote chatops $1-
alias lochat .quote locops $1-
alias hochat .quote helpop $1-
alias wochat .quote wallops $1-

alias oc_longals disable #OperChat_SA | enable #OperChat_LA
#OperChat_LA end
#OperChat_SA off


alias nach .quote nachat $1-
alias adch .quote adchat $1-
alias glop .quote globops $1-
alias chop .quote chatops $1-
alias loop .quote locops $1-
alias heop .quote helpop $1-
alias waop .quote wallops $1-

alias oc_shortals disable #OperChat_LA | enable #OperChat_SA
#OperChat_SA end
