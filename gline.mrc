alias F2 {
  var %i = 1, %r = $$?="Enter a reason"
  while $sline(#,%i) {
    set -u20 %gline. $+ $ifmatch %r
    userhost $ifmatch
    inc %i
  }
}

raw 302:*:{
  var %a = $replace($2,*=-,!,*=+,!,=-,!,=+,!), %n = $gettok(%a,1,33)
  if %gline. [ $+ [ %n ] ] {
    gline *@ $+ $gettok(%a,2,64) 30d : $+ $ifmatch
    echo -at > Glined %n 
    unset %gline. $+ %n
  }
}
