mass {
  if ($me isop $chan) {
    if ($1 == voice) { set %prefix $+(+,$str(v,$modespl)) | goto start }
    if ($1 == devoice) { set %prefix $+(-,$str(v,$modespl)) }
    if ($1 == hop) { set %prefix $+(+,$str(h,$modespl)) | goto start }
    if ($1 == dehop) { set %prefix $+(-,$str(h,$modespl)) }
    if ($1 == op) { set %prefix $+(+,$str(o,$modespl)) | goto start }
    if ($1 == deop) { set %prefix $+(-,$str(o,$modespl)) }
    :start
    set %massing $nick($chan,0)
    while (%massing) {
      if ($nick($chan,%massing) != $me) { set %mass1 %mass1 $nick($chan,%massing) }
      if ($gettok(%mass1,0,32) = $modespl) { mode $chan %prefix %mass1 | unset %mass1 }
      dec %massing
    }
    mode $chan %prefix %mass1 | unset %mass1
  }
  else { echo -a »»» Ga punya pangkat aja belagu Lu! ««« }
}
