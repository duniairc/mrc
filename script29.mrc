#joinpart off
on *:JOIN:#: {
  if ($nick == $me) { return }
  .guser joinpart $nick 0
  set %j. $+ $chan $chan
  .timer 1 5 .ruser $nick 0
}
on +joinpart:PART:#: {
  if (%j. [ $+ [ $chan ] ]) {
    kick $chan $nick %joinpartkick
    mode $chan +b $address($nick,0)
    .ruser $nick 0
  }
}
#joinpart end
