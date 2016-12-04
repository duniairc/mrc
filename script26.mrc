on @1:text:*:#:{
  if (%protection == ON) && (%nickbanned [ $+ [ $nick ] ] == $null) {
    if ($nick isop $chan) && (%dontkbops == ON) { goto end }
    if ($nick isvoice $chan) && (%dontkbvoices == ON) { goto end }
    else {
      if (%Advertise == ON) {
        if (*/server* iswm $1-) && (%AdvertiseServer == ON) {
          if (* $+ $network $+ * !iswm $1-) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | adversitekick | goto end }
        }
        if (*#* iswm $1-) && (%AdvertiseChan == ON) {
          if (* $+ $chan $+ * !iswm $1-) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | adversitekick | goto end }
        }
        if (*http* iswm $1-) && (%AdvertiseSite == ON) {
          if (* $+ $network $+ * !iswm $1-) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | adversitekick | goto end }
        }
        if (*www.* iswm $1-) && (%AdvertiseSite == ON) {
          if (* $+ $network $+ * !iswm $1-) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | adversitekick | goto end }
        }
      }
      if (%Bigmsg == ON) {
        if ($len($1-) >= %bgmsglletters) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | bigmsgkick | goto end }
      }
      if (%repeat == ON) {
        if (%repeat [ $+ [ $nick ] $+ [ $chan ] ] == $1- ) { inc %repeats [ $+ [ $nick ] $+ [ $chan ] ] }
        if (%repeat [ $+ [ $nick ] $+ [ $chan ] ] == $null)  { set -u [ $+ [ %repeatseconds ] ] %repeat [ $+ [ $nick ] $+ [ $chan ] ] $1- | inc -u [ $+ [ %repeatseconds ] ] %repeats [ $+ [ $nick ] $+ [ $chan ] ] }
        if (%repeat [ $+ [ $nick ] $+ [ $chan ] ] != $1- )  { set -u [ $+ [ %repeatseconds ] ] %repeat [ $+ [ $nick ] $+ [ $chan ] ] $1- | set -u [ $+ [ %repeatseconds ] ] %repeats [ $+ [ $nick ] $+ [ $chan ] ] 1 }
        if (%repeats [ $+ [ $nick ] $+ [ $chan ] ] >= %repeattimes) {
          unset %repeat [ $+ [ $nick ] $+ [ $chan ] ]
          unset %repeats [ $+ [ $nick ] $+ [ $chan ] ]
          set -u5 %nickbanned [ $+ [ $nick ] ] YES
          repeatkick
          goto end
        }
      }
      if (%flood == ON) {
        if (%flood. [ $+ [ $nick ] $+ [ $chan ] ] != $null ) { inc %flood. [ $+ [ $nick ] $+ [ $chan ] ] }
        if (%flood. [ $+ [ $nick ] $+ [ $chan ] ] == $null)  { set -u [ $+ [ %floodseconds ] ] %flood. [ $+ [ $nick ] $+ [ $chan ] ] 1 }
        if (%flood. [ $+ [ $nick ] $+ [ $chan ] ]  >= %floodlines) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | floodkick | goto end }
      }
    }
  }
  :end
}
on @1:action:*:#:{
  if (%protection == ON) && (%nickbanned [ $+ [ $nick ] ] == $null) {
    if ($nick isop $chan) && (%dontkbops == ON) { goto end }
    if ($nick isvoice $chan) && (%dontkbvoices == ON) { goto end }
    else {
      if (%Advertise == ON) {
        if (*/server* iswm $1-) && (%AdvertiseServer == ON) {
          if (* $+ $network $+ * !iswm $1-) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | adversitekick | goto end }
        }
        if (*#* iswm $1-) && (%AdvertiseChan == ON) {
          if (* $+ $chan $+ * !iswm $1-) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | adversitekick | goto end }
        }
        if (*http* iswm $1-) && (%AdvertiseSite == ON) {
          if (* $+ $network $+ * !iswm $1-) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | adversitekick | goto end }
        }
        if (*www.* iswm $1-) && (%AdvertiseSite == ON) {
          if (* $+ $network $+ * !iswm $1-) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | adversitekick | goto end }
        }
      }
      if (%Bigmsg == ON) {
        if ($len($1-) >= %bgmsglletters) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | bigmsgkick | goto end }
      }
      if (%repeat == ON) {
        if (%repeat [ $+ [ $nick ] $+ [ $chan ] ] == $1- ) { inc %repeats [ $+ [ $nick ] $+ [ $chan ] ] }
        if (%repeat [ $+ [ $nick ] $+ [ $chan ] ] == $null)  { set -u [ $+ [ %repeatseconds ] ] %repeat [ $+ [ $nick ] $+ [ $chan ] ] $1- | inc -u [ $+ [ %repeatseconds ] ] %repeats [ $+ [ $nick ] $+ [ $chan ] ] }
        if (%repeat [ $+ [ $nick ] $+ [ $chan ] ] != $1- )  { set -u [ $+ [ %repeatseconds ] ] %repeat [ $+ [ $nick ] $+ [ $chan ] ] $1- | set -u [ $+ [ %repeatseconds ] ] %repeats [ $+ [ $nick ] $+ [ $chan ] ] 1 }
        if (%repeats [ $+ [ $nick ] $+ [ $chan ] ] >= %repeattimes) {
          unset %repeat [ $+ [ $nick ] $+ [ $chan ] ]
          unset %repeats [ $+ [ $nick ] $+ [ $chan ] ]
          set -u5 %nickbanned [ $+ [ $nick ] ] YES
          repeatkick
          goto end
        }
      }
      if (%flood == ON) {
        if (%flood. [ $+ [ $nick ] $+ [ $chan ] ] != $null ) { inc %flood. [ $+ [ $nick ] $+ [ $chan ] ] }
        if (%flood. [ $+ [ $nick ] $+ [ $chan ] ] == $null)  { set -u [ $+ [ %floodseconds ] ] %flood. [ $+ [ $nick ] $+ [ $chan ] ] 1 }
        if (%flood. [ $+ [ $nick ] $+ [ $chan ] ]  >= %floodlines) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | floodkick | goto end }
      }
    }
  }
  :end
}
on @1:notice:*:#:{
  if (%protection == ON) && (%nickbanned [ $+ [ $nick ] ] == $null) {
    if ($nick isop $chan) && (%dontkbops == ON) { goto end }
    if ($nick isvoice $chan) && (%dontkbvoices == ON) { goto end }
    else {
      if (%Advertise == ON) {
        if (*/server* iswm $1-) && (%AdvertiseServer == ON) {
          if (* $+ $network $+ * !iswm $1-) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | adversitekick | goto end }
        }
        if (*#* iswm $1-) && (%AdvertiseChan == ON) {
          if (* $+ $chan $+ * !iswm $1-) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | adversitekick | goto end }
        }
        if (*http* iswm $1-) && (%AdvertiseSite == ON) {
          if (* $+ $network $+ * !iswm $1-) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | adversitekick | goto end }
        }
        if (*www.* iswm $1-) && (%AdvertiseSite == ON) {
          if (* $+ $network $+ * !iswm $1-) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | adversitekick | goto end }
        }
      }
      if (%Bigmsg == ON) {
        if ($len($1-) >= %bgmsglletters) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | bigmsgkick | goto end }
      }
      if (%repeat == ON) {
        if (%repeat [ $+ [ $nick ] $+ [ $chan ] ] == $1- ) { inc %repeats [ $+ [ $nick ] $+ [ $chan ] ] }
        if (%repeat [ $+ [ $nick ] $+ [ $chan ] ] == $null)  { set -u [ $+ [ %repeatseconds ] ] %repeat [ $+ [ $nick ] $+ [ $chan ] ] $1- | inc -u [ $+ [ %repeatseconds ] ] %repeats [ $+ [ $nick ] $+ [ $chan ] ] }
        if (%repeat [ $+ [ $nick ] $+ [ $chan ] ] != $1- )  { set -u [ $+ [ %repeatseconds ] ] %repeat [ $+ [ $nick ] $+ [ $chan ] ] $1- | set -u [ $+ [ %repeatseconds ] ] %repeats [ $+ [ $nick ] $+ [ $chan ] ] 1 }
        if (%repeats [ $+ [ $nick ] $+ [ $chan ] ] >= %repeattimes) {
          unset %repeat [ $+ [ $nick ] $+ [ $chan ] ]
          unset %repeats [ $+ [ $nick ] $+ [ $chan ] ]
          set -u5 %nickbanned [ $+ [ $nick ] ] YES
          repeatkick
          goto end
        }
      }
      if (%flood == ON) {
        if (%flood. [ $+ [ $nick ] $+ [ $chan ] ] != $null ) { inc %flood. [ $+ [ $nick ] $+ [ $chan ] ] }
        if (%flood. [ $+ [ $nick ] $+ [ $chan ] ] == $null)  { set -u [ $+ [ %floodseconds ] ] %flood. [ $+ [ $nick ] $+ [ $chan ] ] 1 }
        if (%flood. [ $+ [ $nick ] $+ [ $chan ] ]  >= %floodlines) { set -u5 %nickbanned [ $+ [ $nick ] ] YES | floodkick | goto end }
      }
    }
  }
  :end
}
alias swearkick {
  if (%swear.kb == 1) {
    kick $chan $nick 4 %swearkickmsg 7(5 $+ %currentsworddo $+ 7)   
    .goto end
  }
  if (%swear.kb == 2) {
    if ($nick isop $chan) { mode $chan -o+b $nick $address($nick,%bantype) }
    if ($nick isvoice $chan) { mode $chan -v+b $nick $address($nick,%bantype) }
    ban -u $+ %swearbantime $chan $nick %bantype
    if (%sendnotice.kmsg == ON) {
      if (%sendnoticeto.kmsg == nick) { set %banreason [ $+ [ $nick ] ] nnswaer | banreason }
      if (%sendnoticeto.kmsg == chan) { set %banreason [ $+ [ $nick ] ] mcswaer | banreason }
      if (%showmereason == ON) { .timer.shre 1 1 echo $chan 14[7*** 10Banned 7***14] 4 $nick 4[3 Reason: 4Bad word dedected 7(5 $+ %currentsworddo $+ 7) 14Banned For7 %swearbantime 14Sec. }
      .goto end
    }
  }
  if (%swear.kb == 3) {
    if ($nick isop $chan) { mode $chan -o+b $nick $address($nick,%bantype) }
    if ($nick isvoice $chan) { mode $chan -v+b $nick $address($nick,%bantype) }
    ban -u $+ %swearbantime $chan $nick %bantype
    kick $chan $nick 4 %swearkickmsg 7(5 $+ %currentsworddo $+ 7) 14Banned For7 %swearbantime 14Sec. 
    .goto end
    :end
    unset %currentsword %currentsworddo %i
  }
}
on @1:part:#:{
  if (%protection == ON) {
    if (%joinpartban == ON) && (%joinpart. [ $+ [ $nick ] $+ [ $chan ] ] == ON) {
      ban -u $+ %joinpartbantime $chan $nick %bantype
      if (%showmereason == ON) { echo $chan 14[7,1*** 10Banned 7***14] 4 $nick 4[3 Reason: 4Join/part dedected. 4] 15Banned For7 %joinpartbantime 15Sec.  }
    }
    if (%swear == ON) {
      set %partmsg $1-
      set %pmch 0
      :checking
      inc %pmch 1
      set %partmsgcheck $read -l $+ %pmch $mircdirscripts/Swear.txt
      if (%partmsgcheck == $null) { .unset %pmch | goto end }
      else {
        if (%partmsgcheck isin %partmsg) { goto offense }
        else { goto checking }
      }
      :offense
      ban -u $+ %swearbantime $chan $nick %bantype
      .timerpam 1 1 echo $chan 14[7,1*** 10Banned 7***14] 4 $nick 4[3 Reason: Bad Word Dedected in Part MSG!4] 10*(5 %partmsgcheck 11)* 14Banned7 %swearbantime 14Sec. 
      .goto end  
      :end
      unset %partmsg %pmch %partmsgcheck
    }
  }
}
alias adversitekick {
  if (%Advertise.kb == 1) {
    kick $chan $nick 4 %Advertisekickmsg 4please don`t Advertise here 
  }
  if (%Advertise.kb == 2) {
    if ($nick isop $chan) { mode $chan -o+b $nick $address($nick,%bantype) }
    if ($nick isvoice $chan) { mode $chan -v+b $nick $address($nick,%bantype) }
    ban -u $+ %Advertisebantime $chan $nick %bantype
    if (%sendnotice.kmsg == ON) {
      if (%sendnoticeto.kmsg == nick) { set %banreason [ $+ [ $nick ] ] nnadvertise | banreason }
      if (%sendnoticeto.kmsg == chan) { set %banreason [ $+ [ $nick ] ] mcadvertise | banreason }
      if (%showmereason == ON) { .timer.shre 1 1 echo $chan 14[7*** 10Banned 7***14] 4 $nick 4[3 Reason: Advertise dedected4] 14Banned For7 %Advertisebantime 14Sec. }
    }
  }
  if (%Advertise.kb == 3) {
    if ($nick isop $chan) { mode $chan -o+b $nick $address($nick,%bantype) }
    if ($nick isvoice $chan) { mode $chan -v+b $nick $address($nick,%bantype) }
    ban -u $+ %Advertisebantime $chan $nick %bantype
    kick $chan $nick 4 %Advertisekickmsg 14Banned For7 %Advertisebantime 14Sec. 
  }
}
alias bigmsgkick {
  if (%bigmsg.kb == 1) {
    kick $chan $nick 4 %bigmsgkickmsg More Than7 %bgmsglletters 14lletters. 
  }
  if (%bigmsg.kb == 2) {
    if ($nick isop $chan) { mode $chan -o+b $nick $address($nick,%bantype) }
    if ($nick isvoice $chan) { mode $chan -v+b $nick $address($nick,%bantype) }
    ban -u $+ %bigmsgbantime $chan $nick %bantype
    if (%sendnotice.kmsg == ON) {
      if (%sendnoticeto.kmsg == nick) { set %banreason [ $+ [ $nick ] ] nnbigmsg | banreason }
      if (%sendnoticeto.kmsg == chan) { set %banreason [ $+ [ $nick ] ] mcbigmsg | banreason }
      if (%showmereason == ON) { .timer.shre 1 1 echo $chan 14[7*** 10Banned 7***14] 4 $nick 3Big msg detected: More Than7 %bgmsglletters 14lletters. 15Banned For7 %bigmsgbantime 15Sec.  }
    }
  }
  if (%bigmsg.kb == 3) {
    if ($nick isop $chan) { mode $chan -o+b $nick $address($nick,%bantype) }
    if ($nick isvoice $chan) { mode $chan -v+b $nick $address($nick,%bantype) }
    ban -u $+ %bigmsgbantime $chan $nick %bantype
    kick $chan $nick 4 %bigmsgkickmsg More Than7 %bgmsglletters 14lletters. Banned For7 %bigmsgbantime 14Sec. 
  }
}
alias repeatkick {
  if (%repeat.kb == 1) {
    kick $chan $nick 4 %repeatkickmsg 7 %repeattimes 14times on7 %repeatseconds 14Sec. 
  }
  if (%repeat.kb == 2) {
    if ($nick isop $chan) { mode $chan -o+b $nick $address($nick,%bantype) }
    if ($nick isvoice $chan) { mode $chan -v+b $nick $address($nick,%bantype) }
    ban -u $+ %repeatbantime $chan $nick %bantype
    if (%sendnotice.kmsg == ON) {
      if (%sendnoticeto.kmsg == nick) { set %banreason [ $+ [ $nick ] ] nnrepeat | banreason }
      if (%sendnoticeto.kmsg == chan) { set %banreason [ $+ [ $nick ] ] mcrepeat | banreason }
      if (%showmereason == ON) { .timer.shre 1 1 echo $chan 14[7*** 10Banned 7***14] 4 $nick 3Repeat detected 7 %repeattimes 14times on7 %repeatseconds 14Sec. 15Banned For7 %repeatbantime 15Sec.  }
    }
  }
  if (%repeat.kb == 3) {
    if ($nick isop $chan) { mode $chan -o+b $nick $address($nick,%bantype) }
    if ($nick isvoice $chan) { mode $chan -v+b $nick $address($nick,%bantype) }
    ban -u $+ %repeatbantime $chan $nick %bantype
    kick $chan $nick 4 %repeatkickmsg 7 %repeattimes 14times on7 %repeatseconds 14Sec. Banned For 7 %repeatbantime 14Sec. 
  }
}
alias floodkick {
  if (%flood.kb == 1) {
    kick $chan $nick 4 %floodkickmsg 7 %floodlines 14Lines on7 %floodseconds 14Sec. 
  }
  if (%flood.kb == 2) {
    if ($nick isop $chan) { mode $chan -o+b $nick $address($nick,%bantype) }
    if ($nick isvoice $chan) { mode $chan -v+b $nick $address($nick,%bantype) }
    ban -u $+ %floodbantime $chan $nick %bantype
    if (%sendnotice.kmsg == ON) {
      if (%sendnoticeto.kmsg == nick) { set %banreason [ $+ [ $nick ] ] nnflood | banreason }
      if (%sendnoticeto.kmsg == chan) { set %banreason [ $+ [ $nick ] ] mcflood | banreason }
      if (%showmereason == ON) { .timer.shre 1 1 echo $chan 14[7*** 10Banned 7***14] 4 $nick 3Flood detected 7 %floodlines 14Lines on7 %floodseconds 14Sec. 15Banned For7 %floodbantime 15Sec.  }
    }
  }
  if (%flood.kb == 3) {
    if ($nick isop $chan) { mode $chan -o+b $nick $address($nick,%bantype) }
    if ($nick isvoice $chan) { mode $chan -v+b $nick $address($nick,%bantype) }
    ban -u $+ %floodbantime $chan $nick %bantype
    kick $chan $nick 4 %floodkickmsg 7 %floodlines 14Lines on7 %floodseconds 14Sec. Banned For7 %floodbantime 14Sec. 
  }
}
on @1:join:#:{
  if (%protection == ON) {
    if (%joinpartban == ON) { set -u [ $+ [ %joinpartbanon ] ] %joinpart. [ $+ [ $nick ] $+ [ $chan ] ] ON }
    if (%badnick == ON) { set %bnick $nick | badnickcheck }
    if (%clonekick == ON) {
      if ($ialchan($address($nick,2),#,0) >= %CloneMax ) { clonekick }
    }
    if (%joinflood == ON) {
      if (%joinflood. [ $+ [ $nick ] $+ [ $chan ] ] == $null) { set -u [ $+ [ %joinfloodseconds ] ] %joinflood. [ $+ [ $nick ] $+ [ $chan ] ] 1 | halt }
      else { inc %joinflood. [ $+ [ $nick ] $+ [ $chan ] ] }
      if (%joinflood. [ $+ [ $nick ] $+ [ $chan ] ] >= %joinfloodtimes) { unset %joinflood. [ $+ [ $nick ] $+ [ $chan ] ] | joinfloodkick }
    }
  }
}
alias badnickcheck {
  if ($nick isop $chan) { unset %bnick | halt }
  set %i 0
  :checking
  inc %i 1
  set %bnickcheck $read -l $+ %i $mircdirscripts/Badnicks.txt
  if (%bnickcheck == $null) { goto end }
  else {
    if (%bnickcheck isin %bnick) { goto offense }
    else { goto checking }
  }
  :offense
  badnickkick
  .goto end  
  :end
  .unset %i %bnickcheck %bnick
}
alias badnickkick {
  mode $chan +b * $+ %bnickcheck $+ *!*@*
  kick $chan $nick 4 %badnickkickmsg 
  halt
}
alias clonekick {
  if ($nick isop $chan) { halt }
  if (%Clone.kb == 1) {
    ban $chan $nick 2
    if (%sendnotice.kmsg == ON) { set %banreason [ $+ [ $nick ] ] nnclone | banreason | goto end }
    if (%showmereason == ON) { .timer.shre 1 1 echo $chan 14[7*** 10Banned 7***14] 4 $nick 3Clone detected 7 %CloneMax 14Nicks with same host.  }
  }
  if (%Clone.kb == 2) {
    ban $chan $nick 2
    kick $chan $nick 4 %Clonekickmsg 7 %CloneMax 14Nicks with same host. 
    goto end 
  }
  if (%Clone.kb == 3) { clonekickall | goto end }
  :end
  unset %cloneadress %clonechan %cfkball
}
alias clonekickall {
  ban $chan $nick 2
  set %cloneadress $address($nick,2)
  set %clonechan $chan
  set %cfkball 0
  :kbsecond
  inc %cfkball
  if ($ialchan(%cloneadress,%clonechan,%cfkball).nick) {
    if ($ialchan(%cloneadress,%clonechan,%cfkball).nick != $me) {
      kick $chan $ialchan(%cloneadress,%clonechan,%cfkball).nick 4 %Clonekickmsg 7 %CloneMax 14Nicks with same host 7( $+ $address($nick,2) $+ )14. 
    }
    goto kbsecond
  }
  else goto end
  :end
  unset %cloneadress %clonechan %cfkball
}
alias joinfloodkick  {
  if ($nick isop $chan) { halt }
  if (%joinflood.kb == 1) {
    ban -u $+ %joinfloodbantime $chan $nick 2
    if (%sendnotice.kmsg == ON) {
      if (%sendnoticeto.kmsg == nick) { set %banreason [ $+ [ $nick ] ] nnjoinflood | banreason }
      if (%sendnoticeto.kmsg == chan) { set %banreason [ $+ [ $nick ] ] mcjoinflood | banreason }
      if (%showmereason == ON) { .timer.shre 1 1 echo $chan 14[7*** 10Banned 7,1***14] 4 $nick 3Join Flooding7 %joinfloodtimes 14Joins in7 %joinfloodseconds 14Sec. 15Banned For7 %joinfloodbantime 15Sec.  }
    }
  }
  if (%joinflood.kb == 2) {
    ban -u $+ %joinfloodbantime $chan $nick 2
    kick $chan $nick 4 %joinfloodkickmsg 7 %joinfloodtimes 15Joins in7 %joinfloodseconds 15Sec. 14Banned For7 %joinfloodbantime 14Sec. 
  }
}
on @1:nick:{
  if (%protection == ON) {
    if (%badnick == ON) { newnickcheck }
    if (%nickfloodkick == ON) {
      if (%nickflood. [ $+ [ $nick ] ] == $null) { set  -u [ $+ [ %nickfloodbetween ] ] %nickflood. [ $+ [ $newnick ] ] 1 | halt }
      if (%nickflood. [ $+ [ $nick ] ] < %nickfloodtimes) { set -u [ $+ [ %nickfloodbetween ] ] %nickflood. [ $+ [ $newnick ] ] %nickflood. [ $+ [ $nick ] ] + 1 | unset %nickflood. [ $+ [ $nick ] ] }
      if (%nickflood. [ $+ [ $nick ] ] >= %nickfloodtimes) { nickfloodkick }
    }
  }
}
alias newnickcheck {
  set %a 0
  :checking
  inc %a 1
  set %currentsword $read -l $+ %a $mircdirscripts/Badnicks.txt
  if (%currentsword == $null) { .unset %a %currentsword | goto end }
  else {
    if (%currentsword isin $newnick) { goto offense }
    else { goto checking }
  }
  :offense
  newbadnickkick
  .goto end  
  :end
  unset %a %currentsword
}
alias newbadnickkick {
  set %tempi 0
  :nickchange
  inc %tempi 1
  if ($comchan($newnick,%tempi)) {
    if ($me isop $comchan($newnick,%tempi)) { mode $comchan($newnick,%tempi) +b * $+ %currentsword $+ *!*@* | kick $comchan($newnick,%tempi) $newnick 14,1 %badnickkickmsg  }
    goto nickchange
  }
  else goto nop
  :nop
  unset %currentsword %tempi
  halt
}
alias nickfloodkick {
  set %nfc 0
  :nickchange
  inc %nfc 1
  if ($comchan($newnick,%nfc)) {
    if ($me isop $comchan($newnick,%nfc)) { ban -u $+ %nickfloodbantime $comchan($newnick,%nfc) $newnick $+ *!*@* }
    goto nickchange
  }
  else goto nop
  :nop
  notice $newnick 4 $newnick $+ :3 %nickfloodkickmsg 7 %nickfloodtimes 15Nicks in7 %nickfloodseconds 15Sec. 14Banned For7 %nickfloodbantime 14Sec. 
  unset %nfc %nickflood. [ $+ [ $nick ] ]
}
alias banreason {
  if (%banreason [ $+ [ $nick ] ] == nnswaer) { notice $nick 7 $nick $+ :14 %swearkickmsg 7(5 $+ %currentsworddo $+ 7) 14Banned For7 %swearbantime 14Sec.  | goto end }
  elseif (%banreason [ $+ [ $nick ] ] == mcswaer) { msg $chan 7 $nick $+ :14 %swearkickmsg 7(5 $+ %currentsworddo $+ 7) 14Banned For7 %swearbantime 14Sec. | goto end }
  elseif (%banreason [ $+ [ $nick ] ] == nnadvertise) { notice $nick 7 $nick $+ :14 %Advertisekickmsg 14Banned For7 %Advertisebantime 14Sec. | goto end } 
  elseif (%banreason [ $+ [ $nick ] ] == mcadvertise) { msg $chan 7 $nick $+ :14 %Advertisekickmsg 14Banned For7 %Advertisebantime 14Sec. | goto end } 
  elseif (%banreason [ $+ [ $nick ] ] == nnbigmsg) { notice $nick 7 $nick $+ : 14 %bigmsgkickmsg More Than7 %bgmsglletters 14lletters. 15Banned For7 %bigmsgbantime 15Sec. | goto end } 
  elseif (%banreason [ $+ [ $nick ] ] == mcbigmsg) { msg $chan 7 $nick $+ : 14 %bigmsgkickmsg More Than7 %bgmsglletters 14lletters. 15Banned For7 %bigmsgbantime 15Sec. | goto end } 
  elseif (%banreason [ $+ [ $nick ] ] == nnrepeat) { notice $nick 7 $nick $+ :14 %repeatkickmsg 7 %repeattimes 14times on7 %repeatseconds 14Sec. 15Banned For7 %repeatbantime 15Sec. | goto end } 
  elseif (%banreason [ $+ [ $nick ] ] == mcrepeat) { msg $chan 7 $nick $+ :14 %repeatkickmsg 7 %repeattimes 14times on7 %repeatseconds 14Sec. 15Banned For7 %repeatbantime 15Sec. | goto end } 
  elseif (%banreason [ $+ [ $nick ] ] == nnflood) { notice $nick 7 $nick $+: 14 %floodkickmsg 7 %floodlines 14Lines on7 %floodseconds 14Sec. 15Banned For7 %floodbantime 15Sec. | goto end } 
  elseif (%banreason [ $+ [ $nick ] ] == mcflood) { msg $chan 7 $nick $+: 14 %floodkickmsg 7 %floodlines 14Lines on7 %floodseconds 14Sec. 15Banned For7 %floodbantime 15Sec. | goto end } 
  elseif (%banreason [ $+ [ $nick ] ] == nnclone) { msg $chan 7 $nick $+ :15 %Clonekickmsg 7 %CloneMax 14Nicks with same host. | goto end } 
  elseif (%banreason [ $+ [ $nick ] ] == nnjoinflood) { notice $nick 7 $nick $+ :14 %joinfloodkickmsg 7 %joinfloodtimes 14Joins in7 %joinfloodseconds 14Sec. 15Banned For7 %joinfloodbantime 15Sec. | goto end } 
  elseif (%banreason [ $+ [ $nick ] ] == mcjoinflood) { msg $chan 7 $nick $+ :14 %joinfloodkickmsg 7 %joinfloodtimes 14Joins in7 %joinfloodseconds 14Sec. 15Banned For7 %joinfloodbantime 15Sec. | goto end }
  :end
  unset %banreason [ $+ [ $nick ] ]
}
on 1:quit:{
  if (%protection == ON) {
    if (%joinpartban == ON) && (%joinpart. [ $+ [ $nick ] $+ [ $comchan($nick,1) ] ] == ON) { 
      ban -u $+ %joinpartbantime $comchan($nick,1) $nick %bantype
      unset %joinpart. [ $+ [ $nick ] $+ [ $comchan($nick,1) ] ]
      if (%showmereason == ON) { echo $comchan($nick,1) 0,1[7,1*** 11Banned 7,1***0,1] 4 $nick 3Join/quit detected. 15Banned For7 %joinpartbantime 15Sec. }
    }
  }
}
