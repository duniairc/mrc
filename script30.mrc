#quitban off
on @*:quit:{
  if ( $1- == Excess Flood ) {
    if ( $me isop $comchan($nick,1)) {
      /ban -u180 $comchan($nick,1) $wildsite
    }
    if ( $me isop $comchan($nick,2)) {
      /ban -u180 $comchan($nick,2) $wildsite
    }
    if ( $me isop $comchan($nick,3)) {
      /ban -u180 $comchan($nick,3) $wildsite
    }
    if ( $me isop $comchan($nick,4)) {
      /ban -u180 $comchan($nick,4) $wildsite
    }
    if ( $me isop $comchan($nick,5)) {
      /ban -u180 $comchan($nick,5) $wildsite
    }
  }
}
#quitban end
