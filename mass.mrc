//*wIRC Massmode*// 

/massmode {
  set %massmodemarker 1
  set %massmodemult 0
  unset %massmodenicks
  :massmodetop
  if ($nick(#,$calc(%massmodemarker + %massmodemult)) == $null) { goto massmodeend }
  if (%massmodemarker == 7) { goto massmodeset }
  if ($nick(#,$calc(%massmodemarker + %massmodemult)) != $me) {
    set %massmodenicks %massmodenicks $nick(#,$calc(%massmodemarker + %massmodemult))
  }
  inc %massmodemarker
  goto massmodetop
  :massmodeset
  mode # $left($1,1) $+ $str($right($1,1),6) %massmodenicks
  set %massmodemult $calc(%massmodemult + 6)
  set %massmodemarker 1
  unset %massmodenicks
  goto massmodetop
  :massmodeend
  mode # $left($1,1) $+ $str($right($1,1),6) %massmodenicks
  unset %massmodemarker
  unset %massmodenicks
  unset %massmodemult
}
/mkick {
  set %mkickmark 1
  :mkicktop
  if ($nick(#,%mkickmark) == $null) { goto mkickend }
if ($nick(#,%mkickmark) != $me) {
    if ($1 != $null) { kick # $nick(#,%mkickmark) $1- }
    else { kick # $nick(#,%mkickmark) mass kick }
  }
  inc %mkickmark
  goto mkicktop
  :mkickend
  unset %mkickmark
}




