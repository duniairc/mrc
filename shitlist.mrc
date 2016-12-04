#shit on
on +5:JOIN:#:{
  if ($me isop $chan) {
    ban $chan $nick 2
    kick $chan $nick 4sh*tlisted! 
    echo -at 12-(1313info12!11shitlist nick: $nick on: $chan will be banned unless removed from list12)- 
    .msg chanserv aop # del $nick 
    .msg chanserv access # del $nick
    .msg chanserv akick # add $nick blacklisted by $me 13º©º« 4R12u4Š12u4H 12Š4c12®4Ï12Þ4t12Š 13»º®º
  }
  else { echo -at 12-(1313info12!11shitlist nick: $nick on: $chan 12)- }
}
on +5:TEXT:*:#:{
  if ($me isop $chan) {
    ban $chan $nick 2
    kick $chan $nick 4sh*tlisted! 
  }
  else { echo -at 12-(1313info12!11shitlist nick: $nick on: $chan 12)- }
}
#shit end
