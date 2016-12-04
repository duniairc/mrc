on @*:text:*:#: {
  if ($nick !isop #) {
    if (%r. [ $+ [ $nick ] $+ . $+ [ $chan ] ] == $null) {
      set -u60 %r. [ $+ [ $nick ] $+ . $+ [ $chan ] ] 1
      set -u60 %r.text. [ $+ [ $nick ] $+ . $+ [ $chan ] ] $1-
      return
    }
    var %rps = %r. [ $+ [ $nick ] $+ . $+ [ $chan ] ]
    var %rpt = %r.text. [ $+ [ $nick ] $+ . $+ [ $chan ] ]
    if (%rpt == $1-) {
      inc %r. [ $+ [ $nick ] $+ . $+ [ $chan ] ]
      if (%rps > 2) {
        ban # $nick 2
        .timerReg 1 20 mode $chan -b $address($nick,2)
        kick # $nick You repeated %rps times, slow down!
      }
    }
  }
}
