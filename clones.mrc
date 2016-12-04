alias clones {
  var %i,%address,%chan = #$1,%t0 = $ticks
  if (%chan == $null) %chan = $active
  if (%chan !ischan) { echo $colour(info) -at *** Syntax: /clones [chan] | return }
  if ($chan(%chan).ial != $true) {
    if ($show) echo $colour(info) -at 12-(1313clonescan12)-11 scanning...  %chan   $+ .
    .ial on
    %clones.who = $addtok(%clones.who,%chan,32)
    if ($chan(%chan).ial == $false) .who # 
    return
  }
  window -c @~clones
  window -lhs @~clones
  linesep $active
  echo $colour(info) -at 12-(1313clonescan12)-11 scanning in process on  %chan 
  %i = $nick(%chan,0)
  while (%i) {
    aline @~clones $address($nick(%chan,$ifmatch),2) $nick(%chan,$ifmatch) $ifmatch
    dec %i
  }
  %i = 2
  %clones.total = 0
  %address = $gettok($line(@~clones,1),1,32)
  unset %clones.nicks
  while ($line(@~clones,%i)) {
    if ($gettok($line(@~clones,%i),1,32) == %address) clones.addclone %chan %i
    else {
      if (%clones.nicks) {  echo $colour(info) -at 12-(1313clonescan12)-11 $gettok(%clones.nicks,0,32) from %address $+ : %clones.nicks  | unset %clones.nicks }
      set %address $gettok($line(@~clones,%i),1,32)
    }
    inc %i
  }
  if (%clones.nicks) { if ($show) echo $colour(info) -at 12-(1313clonescan12)-11 $gettok(%clones.nicks,0,32) from %address $+ : %clones.nicks   }
  echo $colour(info) -at 12-(1313clonescan12)-11 $iif(%clones.total,%clones.total,No) clones found on %chan in $calc(($ticks - %t0) / 1000) second(s) 
  unset %clones.nicks %clones.total
  window -c @~clones
  linesep $active
}
alias -l clones.addclone {
  if (%clones.nicks == $null) {
    set %clones.nicks $gettok($line(@~clones,$calc($2 - 1)),2,32)
    if (%clones.total) sline -a $1 $gettok($line(@~clones,$calc($2 - 1)),3,32)
    else sline -s $1 $gettok($line(@~clones,$calc($2 - 1)),3,32)
    inc %clones.total
  }
  %clones.nicks = %clones.nicks $+ , $gettok($line(@~clones,$2),2,32)
  sline -a $1 $gettok($line(@~clones,$2),3,32)
  inc %clones.total
}
raw 352:* {
  if ($istok(%clones.who,$2,32)) halt
}
raw 315:* {
  if ($istok(%clones.who,$2,32)) {
    %clones.who = $remtok(%clones.who,$2,1,32)
    if (%clones.who == $null) unset %clones.who
    if ($2 ischan) .clones $2
    halt
  }
}
on *:connect {
  unset %clones.who
}
