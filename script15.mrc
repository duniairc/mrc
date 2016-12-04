dialog aj {
  title "Auto-join [/aj]"
  size -1 -1 145 159
  option dbu
  list 1, 2 2 140 69, size
  button "Add network", 2, 3 73 42 11
  button "Delete selected", 3, 49 73 42 11
  box "Choose a network...", 4, 4 86 138 58
  check "Auto-join directly after you've connected", 5, 8 95 108 10
  check "Wait", 6, 8 107 22 10
  edit "", 7, 32 107 14 10
  text "seconds and then auto-join", 8, 50 108 67 8
  check "Wait until you've authed/identified", 9, 8 119 94 10
  check "Disable everything", 10, 8 131 56 10
  button "&Ok", 11, 112 146 30 11, ok
}
on *:dialog:aj:*:*: {
  if ($devent == init) {
    aj.mdx SetMircVersion $version
    aj.mdx MarkDialog $dname
    aj.mdx SetControlMDX $dname 1 ListView report nosortheader rowselect single grid > $scriptdir $+ views.mdx
    did -i $dname 1 1 headerdims 70:1 270:2
    did -i $dname 1 1 headertext Network $chr(9) Channels
    var %w,%x = 1,%y = 1,%z
    while (%x <= $var(%aj.*,0)) {
      while (%y <= $gettok($var(%aj.*,%x).value,0,44)) {
        if ($gettok($var(%aj.*,%x).value,6-,32) == Double click to set up your channels!) { %z = Double click to set up your channels! }
        else { %z = %z $iif(%w,$gettok($gettok($var(%aj.*,%x).value,%y,44),1,32),$gettok($gettok($var(%aj.*,%x).value,%y,44),6,32)) }
        %w = 1
        inc %y
      }
      did -a $dname 1 $gettok($var(%aj.*,%x),2,46) $chr(9) %z
      var %w = "",%y = 1,%z = ""
      inc %x
    }
  }
  if ($devent == sclick) {
    if ($did == 2) {
      did -ra $dname 2 Loading...
      .echo -q $dialog(aj.netsel,aj.netsel,-4)
      if (!%aj.netsel) { unset %aj.netsel | return }
      if (%aj. [ $+ [ %aj.netsel ] ]) { unset %aj.netsel | return }
      set %aj. [ $+ [ %aj.netsel ] ] 1 0 0 0 5 Double click to set up your channels!
      did -a $dname 1 %aj.netsel $chr(9) Double click to set up your channels!
      unset %aj.netsel
    }
    if ($did(1).seltext) {
      tokenize 32 $v1
      if ($did == 1) {
        var %aj.tmp = $6
        tokenize 32 %aj. [ $+ [ $6 ] ]
        did -u $dname 5,6,9,10
        if ($1) { did -c $dname 5 }
        if ($2) { did -c $dname 6 }
        if ($3) { did -c $dname 9 }
        if ($4) { did -c $dname 10 }
        did -ra $dname 7 $5
        did -ra $dname 4 Options for %aj.tmp
      }
      if ($did == 3) {
        if ($input(Do you really want to delete $6 $+ ?,yq,Delete network)) {
          unset %aj. [ $+ [ $6 ] ]
          did -u $dname 5,6,9,10
          did -r $dname 7
          did -d $dname 1 $did(1).sel
          did -ra $dname 4 Choose a network...
        }
      }
      if ($did == 5) { aj.switch $6 5 }
      if ($did == 6) { aj.switch $6 6 }
      if ($did == 9) { aj.switch $6 9 }
      if ($did == 10) { aj.switch $6 10 }
    } 
  }
  if ($devent == dclick) {
    if ($did(1).seltext) {
      tokenize 32 $v1
      if ($did == 1) {
        set %aj.tmp $did(1).sel $6 $11-
        dialog -ma aj.edit aj.edit
      }
    }
  }
  if ($devent == edit) && ($did(1).seltext) {
    tokenize 32 $did(1).seltext
    if ($did == 7) { 
      if ($did($did) < 1) || ($did($did) !isnum) { var %aj.tmp = $input(Please enter a number larger than 1!,wo,Error) | return }
      set %aj. [ $+ [ $6 ] ] $puttok(%aj. [ $+ [ $6 ] ],$did($did),5,32)
    }
  }
}
dialog aj.edit {
  title "Auto-join edit"
  size -1 -1 83 95
  option dbu
  text "Format: <channel> [password]", 1, 3 1 77 8
  text "Each channel into a single line!", 2, 4 10 74 8
  edit "", 3, 2 22 78 58, multi return vsbar autohs
  button "Ok", 4, 50 82 30 11, ok
  button "Cancel", 5, 18 82 30 11, cancel
}
on *:dialog:aj.edit:*:*: {
  if ($devent == init) {
    if (!$gettok(%aj. [ $+ [ $gettok(%aj.tmp,2,32) ] ],6-,32)) { return }
    if ($gettok(%aj. [ $+ [ $gettok(%aj.tmp,2,32) ] ],6-,32) == Double click to set up your channels!) { return }
    var %x = 1,%w
    while (%x <= $gettok(%aj. [ $+ [ $gettok(%aj.tmp,2,32) ] ],0,44)) {
      did -a $dname 3 $+($iif(!%w,$gettok($gettok(%aj. [ $+ [ $gettok(%aj.tmp,2,32) ] ],%x,44),6,32),$gettok($gettok(%aj. [ $+ [ $gettok(%aj.tmp,2,32) ] ],%x,44),1,32)),$iif($iif(!%w,$gettok($gettok(%aj. [ $+ [ $gettok(%aj.tmp,2,32) ] ],%x,44),7,32),$gettok($gettok(%aj. [ $+ [ $gettok(%aj.tmp,2,32) ] ],%x,44),2,32)),$chr(32) $v1 $+ $crlf,$crlf)) 
      %w = 1
      inc %x
    }
  }
  if ($devent == sclick) { 
    if ($did == 4) {
      write -c $+(",$scriptdiraj.tmp,")
      savebuf -o $dname 3 $+(",$scriptdiraj.tmp,")
      var %x = 1,%y,%z
      while (%x <= $lines($+(",$scriptdiraj.tmp,"))) {
        %z = $+(%z,$+($read($+(",$scriptdiraj.tmp,"),%x),$chr(44)))
        %y = %y $gettok($read($+(",$scriptdiraj.tmp,"),%x),1,32)
        inc %x
      }
      %z = $left(%z,$calc($len(%z) - 1))
      if (!%z) { %z = Double click to set up your channels! | %y = Double click to set up your channels! }
      set %aj. [ $+ [ $gettok(%aj.tmp,2,32) ] ] $gettok(%aj. [ $+ [ $gettok(%aj.tmp,2,32) ] ],1-5,32) %z
      did -o aj 1 $gettok(%aj.tmp,1,32) $gettok(%aj.tmp,2,32) $chr(9) %y
      unset %aj.tmp
      .remove $+(",$scriptdiraj.tmp,")
    }
    if ($did == 5) { unset %aj.tmp }
  }
}
dialog aj.netsel {
  title "Add network"
  size -1 -1 101 94
  option dbu
  list 1, 2 2 60 90, size
  button "Ok", 2, 66 64 31 12, ok
  button "Cancel", 3, 66 79 31 12, cancel
}
on *:dialog:aj.netsel:*:*: {
  if ($devent == init) {
    var %x = 1,%y
    write -c $+(",$scriptdiraj.tmp,")
    while (%x <= $ini($+(",$mircdirservers.ini,"),servers,0)) {
      if ($isfile($+(",$mircdirscript\nnscript.nns,"))) {
        %y = $gettok($readini($+(",$mircdirservers.ini,"),servers,$ini($+(",$mircdirservers.ini,"),servers,%x)),1,58)
      }
      else {
        %y = $gettok($readini($+(",$mircdirservers.ini,"),servers,$ini($+(",$mircdirservers.ini,"),servers,%x)),4,58)
      }
      if (!$read($+(",$scriptdiraj.tmp,"),w,$+(*,%y,*))) { did -a $dname 1 %y | write $+(",$scriptdiraj.tmp,") %y }
      inc %x
    }
    did -ra aj 2 Add network
    .remove $+(",$scriptdiraj.tmp,")
  }
  if ($devent == sclick) {
    if ($did == 2) && ($did(1).seltext) { set %aj.netsel $did(1).seltext }
  }
}
on *:connect: {
  if (%aj. [ $+ [ $network ] ]) {
    tokenize 32 %aj. [ $+ [ $network ] ]
    if ($4) { return }
    if ($1) { aj -j $network $cid }
    if ($3) { set %aj.auth. [ $+ [ $network ] ] 1 }
    if ($2) { .timeraj [ $+ [ $network ] ] $gettok(%aj. [ $+ [ $network ] ],5,32) 1 aj -j $network $cid }
  }
}
on *:notice:*:*: {
  if ($nick == Q) {
    if (%aj.auth. [ $+ [ $network ] ]) && (AUTH'd successfully. isin $1-) {
      aj -j $network $cid
      unset %aj.auth. [ $+ [ $network ] ]
    }
  }
  if ($nick == NickServ) {
    if (%aj.auth. [ $+ [ $network ] ]) && (Password accepted isin $1-) {
      aj -j $network $cid
      unset %aj.auth. [ $+ [ $network ] ]
    }
  }
  if ($nick == AuthServ) {
    if (%aj.auth. [ $+ [ $network ] ]) && (I recognize you. isin $1-) {
      aj -j $network $cid
      unset %aj.auth. [ $+ [ $network ] ]
    }
  }
  if ($nick == X) {
    if (%aj.auth. [ $+ [ $network ] ]) && (AUTHENTICATION SUCCESSFUL isin $1-) {
      aj -j $network $cid
      unset %aj.auth. [ $+ [ $network ] ]
    }
  }
}
on *:start: { unset %aj.auth.* %aj.tmp.* }
on *:exit: { unset %aj.auth.* %aj.tmp.* }
alias aj {
  if (!$1) { dialog $iif($dialog(aj),-v,-m) aj aj }
  var %p = $gettok($gettok($1,1,45),1,32)
  if (*j* iswm %p) {
    var %x. [ $+ [ $2 ] ] 1
    while (%x. [ $+ [ $2 ] ] <= $gettok(%aj. [ $+ [ $2 ] ],0,44)) {
      scid $3 join $iif(%w. [ $+ [ $2 ] ],$gettok($gettok(%aj. [ $+ [ $2 ] ],%x. [ $+ [ $2 ] ],44),1,32),$gettok($gettok(%aj. [ $+ [ $2 ] ],%x. [ $+ [ $2 ] ],44),6,32)) $iif($gettok($gettok(%aj. [ $+ [ $2 ] ],%x. [ $+ [ $2 ] ],44),$iif(%w. [ $+ [ $2 ] ],2,7),32),$v1)
      var %w. [ $+ [ $2 ] ] 1
      inc %x. [ $+ [ $2 ] ]
    }
  }
  if (*m* iswm %p) {
    var %x = 1,%w 
    while (%x <= $gettok(%aj. [ $+ [ $network ] ],0,44)) {
      join $iif(%w,$gettok($gettok(%aj. [ $+ [ $network ] ],%x,44),1,32),$gettok($gettok(%aj. [ $+ [ $network ] ],%x,44),6,32)) $iif($gettok($gettok(%aj. [ $+ [ $network ] ],%x,44),$iif(%w,2,7),32),$v1)
      %w = 1
      inc %x
    }
  }
}
alias aj.switch {
  if ($2 == 5) { set %aj. [ $+ [ $1 ] ] 1 0 0 0 $gettok(%aj. [ $+ [ $1 ] ],5,32) $gettok(%aj. [ $+ [ $1 ] ],6-,32) | did -u aj 5,6,9,10 | did -c aj 5 }
  if ($2 == 6) { set %aj. [ $+ [ $1 ] ] 0 1 0 0 $gettok(%aj. [ $+ [ $1 ] ],5,32) $gettok(%aj. [ $+ [ $1 ] ],6-,32) | did -u aj 5,6,9,10 | did -c aj 6 }
  if ($2 == 9) { set %aj. [ $+ [ $1 ] ] 0 0 1 0 $gettok(%aj. [ $+ [ $1 ] ],5,32) $gettok(%aj. [ $+ [ $1 ] ],6-,32) | did -u aj 5,6,9,10 | did -c aj 9 }
  if ($2 == 10) { set %aj. [ $+ [ $1 ] ] 0 0 0 1 $gettok(%aj. [ $+ [ $1 ] ],5,32) $gettok(%aj. [ $+ [ $1 ] ],6-,32) | did -u aj 5,6,9,10 | did -c aj 10 }
}
alias aj.mdx { return $dll($scriptdir $+ mdx.dll,$1,$2-) }
; ––––––––––––––––––––––––––––––––––––––––
; End of file
}
