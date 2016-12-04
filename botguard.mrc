//*Flood Protection Script By SubZ*//

on *:JOIN:#CHANNELHERE: {
  if ($me isop $chan || $me ishop $chan) {
    if ($nick != $me) {
      if (%JoinFloodInProgress != $true) {
        var %joinnum = 1
        inc -z %warjoincount
        while ( [ %lastjoined [ $+ [ %joinnum ] ] ] != $null ) inc %joinnum
        set -u10 %lastjoined $+ %joinnum $address($nick,2) $nick
        if (%warjoincount == 5) {
          mode $chan +imR
       
          .timerReg 1 35 mode $chan -R
          unset %warjoincount
          set %joinnum 1
          set -u8 %JoinFloodInProgress $true
          while ( $var(%lastjoined*,1).value != $null ) {
            mode $chan +b $gettok( $var(%lastjoined*,1).value ,1,32)
          kick $chan $gettok( $var(%lastjoined*,1).value ,2,32) Bots are not permitted on this network (- wIRC - SF -) ;edit with kill/gline w.e
            unset $var(%lastjoined*,1)
            inc %joinnum
          }
        }
      }
      else {
        mode $chan +b $address($nick,2)
        kick $chan $nick Bots are not permitted on this network (- wIRC - SF -) 
        set -u8 %JoinFloodInProgress $true
      }
    }
  }
}

on on ^*:OPEN:?: {
  if (%MsgFloodInProgress != $true) {
    var %messagenum = 1
    inc -z %warpmcount
    while ( [ %lastmsgme [ $+ [ %messagenum ] ] ] != $null ) inc %messagenum
    set -u10 %lastmsgme $+ %messagenum $nick
    if (%warpmcount == 5) {
      unset %warpmcount
      set %messagenum 1
      set -u10 %MsgFloodInProgress $true
      while ([ %lastmsgme [ $+ [ %messagenum ] ] ] != $null) {
        close -m $gettok( [ %lastmsgme [ $+ [ %messagenum ] ] ] ,1,32)
        unset [ %lastmsgme [ $+ [ %messagenum ] ] ]
        inc %messagenum
      }
    }
  }
  else {
    set -u10 %MsgFloodInProgress $true
    halt
  }
}
