#ban off
on *:ban:#:{
  .ial on
  if $me !isop $chan { halt }
  else { 
    if $ialchan($banmask,$chan,1).nick == $me { mode $chan -b $banmask | /kick $chan $nick 4,14“5,1“14 D4o15n14'4t 15b14a4n 15m14e4! 5,1“4,14“ | halt }
    if $level($address($ialchan($banmask,$chan,1).nick,3)) >= 80 { mode $chan -b $banmask | halt }
    if $ialchan($banmask,$chan,1).nick == $null { halt }
    else { 
      set %themusicman 0
      :monitorflash
      inc %themusicman
      if $ialchan($banmask,$chan,%themusicman).nick == $null { unset %themusicman | halt }
      else { kick $chan $ialchan($banmask,$chan,%themusicman).nick 4,14“5,1“14 S4o15r14r4y 15k14e4n15a 14b4a15n14! 5,1“4,14“ | goto monitorflash }
    }
  }
}
raw 474:*:msg chanserv unban $2 $me | join $2
#ban end

on *:part:#:{ if ($nick == $me) { part # Leaving }
}
#slaps off
on 1:ACTION:$(*slaps $me *):#:{ kick $chan $nick 4,14“5,1“14 D4o15n14'4t 15s14l4a15p14s 4m14e15! 5,1“4,14“ }
on 1:ACTION:$(*cium $me *):#:{ kick $chan $nick wedew pake cium² segala }
on 1:ACTION:$(*peluk $me *):#:{ kick $chan $nick peluk pluk pluk pluk }
on 1:ACTION:$(*toel $me *):#:{ kick $chan $nick toel² naksir yach!! }
on 1:ACTION:$(*elus $me *):#:{ kick $chan $nick kok di elus² kayak kucing aja :P }
on 1:ACTION:$(*cubit $me *):#:{ kick $chan $nick cubit² emangnya kue cubit :P }
on 1:ACTION:$(*cincang $me *):#:{ kick $chan $nick maen cincang aja emangnya daging -_-" }
on 1:ACTION:$(*tampar $me *):#:{ kick $chan $nick saplok loh :P }
on 1:ACTION:$(*pentung $me *):#:{ kick $chan $nick 4====[] *!*6JweDuGH!* }
#slaps end
}
