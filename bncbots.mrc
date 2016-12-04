#BNC BOTS v1.0 by SubZ irc.bluehell.org #w4rl0rdz #bluehell
#designed for ezbouncer
#/bncgo (this will only load up one clone)
#/bncgo.time <number.of.vhosts.to.load> <how.long.to.wait.to.load.the.next(in seconds)>
#edit USER/PASS below and IP PORT add vhosts to hosts.txt and nicks to nicks.txt on individual lines
#if you cant figure this out and what to change then dont bother using it.

alias bncloop {
  inc %bncloop.vhosts
  inc %bncloop.nicks
  if (%bncloop.vhosts < $lines($1)) && ($1 == hosts.txt) { return $read($1,%bncloop.vhosts) | echo -a %hosts | halt }
  elseif (%bncloop.vhost == $lines($1)) { set %bncloop.vhosts 0 }  
  if (%bncloop.nicks < $lines($1)) && ($1 == nicks.txt) { return $read($1,%bncloop.nicks) | echo -a %nick | halt }
  elseif (%bncloop.nicks == $lines($1)) { set %bncloop.nicks 0 }
}

alias bncgo {
  if (!%net) && (!%chan) {
    set %net $$?="Enter Server"
  set %chan $$?="Enter #channel" }
  else { server -m IP PORT -i $bncloop(nicks.txt) }
}
alias bncgo.time { .timer $1 $2 bncgo }

on *:notice:*:?: {
  if (login/pass isin $1-) {
    raw login USER PASS
    raw vhost $bncloop(hosts.txt)
    raw conn %net
    timerBNC $+ $r(1,9) $+ $r(a,z) $+ $r(1,9) 1 4 mode $me -x
    timerBNC $+ $r(1,9) $+ $r(a,z) $+ $r(1,9) 1 5 join %chan
  }
}

