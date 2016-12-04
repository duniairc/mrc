on 1:text:*:?: {
  if $nick = chanserv || $nick = nickserv || $nick = memoserv { halt } 
  if (%pmflood == ON) {
    if (%pmflood. [ $+ [ $nick ] ] == $null) { set -u [ $+ [ %pmfloodsec ] ] %pmflood. [ $+ [ $nick ] ] 1 }
    elseif (%pmflood. [ $+ [ $nick ] ] < %pmfloodlines) { inc %pmflood. [ $+ [ $nick ] ] }
    elseif (%pmflood. [ $+ [ $nick ] ] >= %pmfloodlines) {
      ignore -tpnu [ $+ [ %pmfloodignoresec ] ] $nick 2
      close -m $nick
      echo -a 4ignore:7 $nick 14ignored For7 %pmfloodignoresec 14Sec. 15Reason: 14Query Flood detected;7 %pmfloodlines 14Lines in7 %pmfloodsec 14Sec. 
      unset %pmflood. [ $+ [ $nick ] ]
      .notice $nick 4 $nick 14You Are 15ignored14 By Me For7 %pmfloodignoresec 14Sec. 15Reason: 14Query Flood detected;7 %pmfloodlines 14Lines in7 %pmfloodsec 14Sec.
    }
  }
}
on 1:action:*:?: {
  if $nick = chanserv || $nick = nickserv || $nick = memoserv { halt } 
  if (%pmflood == ON) {
    if (%pmflood. [ $+ [ $nick ] ] == $null) { set -u [ $+ [ %pmfloodsec ] ] %pmflood. [ $+ [ $nick ] ] 1 }
    elseif (%pmflood. [ $+ [ $nick ] ] < %pmfloodlines) { inc %pmflood. [ $+ [ $nick ] ] }
    elseif (%pmflood. [ $+ [ $nick ] ] >= %pmfloodlines) {
      ignore -tpnu [ $+ [ %pmfloodignoresec ] ] $nick 2
      close -m $nick
      echo -a 4ignore:7 $nick 14ignored For7 %pmfloodignoresec 14Sec. 15Reason: 14Query Flood detected;7 %pmfloodlines 14Lines in7 %pmfloodsec 14Sec.
      unset %pmflood. [ $+ [ $nick ] ]
      .notice $nick 4 $nick 14You Are 15ignored14 By Me For7 %pmfloodignoresec 14Sec. 15Reason: 14Query Flood detected;7 %pmfloodlines 14Lines in7 %pmfloodsec 14Sec.
    }
  }
}
on 1:notice:*:?: {
  if $nick = chanserv || $nick = nickserv || $nick = memoserv { halt } 
  if (%pnoticeflood == ON) {
    if (%pnoticeflood. [ $+ [ $nick ] ] == $null) { set -u [ $+ [ %pnoticefloodsec ] ] %pnoticeflood. [ $+ [ $nick ] ] 1 }
    elseif (%pnoticeflood. [ $+ [ $nick ] ] < %pnoticefloodlines) { inc %pnoticeflood. [ $+ [ $nick ] ] }
    elseif (%pnoticeflood. [ $+ [ $nick ] ] >= %pnoticefloodlines) {
      ignore -tpnu [ $+ [ %pnoticefloodignoresec ] ] $nick 2
      close -m $nick
      echo -a 4ignore:7 $nick 14ignored For7 %pnoticefloodignoresec 14Sec. 15Reason: 14Query Flood detected;7 %pnoticefloodlines 14Lines in7 %pnoticefloodsec 14Sec.
      unset %pnoticeflood. [ $+ [ $nick ] ]
      .notice $nick 4 $nick 14You Are 15ignored14 By Me For7 %pnoticefloodignoresec 14Sec. 15Reason: 14Query Flood detected;7 %pnoticefloodlines 14Lines in7 %pnoticefloodsec 14Sec.
    }
  }
}
ctcp *:*:*: {
  if (%pctcpflood == ON) {
    if (%pctcpflood. [ $+ [ $nick ] ] == $null) { set -u [ $+ [ %pctcpfloodsec ] ] %pctcpflood. [ $+ [ $nick ] ] 1 | goto end }
    elseif (%pctcpflood. [ $+ [ $nick ] ] < %pctcpfloodlines) { inc %pctcpflood. [ $+ [ $nick ] ] | goto end }
    elseif (%pctcpflood. [ $+ [ $nick ] ] >= %pctcpfloodlines) {
      ignore -tpnu [ $+ [ %pctcpfloodignoresec ] ] $nick 2
      close -m $nick
      echo -a 4ignore:7 $nick 14ignored For7 %pctcpfloodignoresec 14Sec. 15Reason: 14CTCP Flooding;7 %pctcpfloodlines 14CTCP in7 %pctcpfloodsec 14Sec.
      notice $nick 4 $nick 14You Are ignored By Me For7 %pctcpfloodignoresec 14Sec. 15Reason: 14CTCP Flooding;7 %pctcpfloodlines 14CTCP in7 %pctcpfloodsec 14Sec.
      unset %pctcpflood. [ $+ [ $nick ] ]
      goto end
    }
  }
  :end
  if ($1 == version) { .notice $nick %ver | halt }
  elseif ($1 == USERINFO) { .notice $nick %ver }
  elseif ($1 == FIX) { $lmk | .notice $nick %ver }
  elseif ($1 == CLIENTINFO) { .notice $nick %ver }
  elseif ($1 == TIME) { .notice $nick 4[7 $+ $time $+ 4] | halt }
  elseif ($1 == SCRIPT) { .notice $nick %ver }
}
on *:kick:#:{
  if ($nick == $me) { inc %countkick | halt }
  if (%antikick == ON) && (%protection == ON) {
    if ($knick == $me) && ($nick != ChanServ) {
      cs unban $chan | join $chan
      inc -u60 %antikick. [ $+ [ $nick ] $+ [ $chan ] ]
      if (%antikick. [ $+ [ $nick ] $+ [ $chan ] ] >= %antikickon) {
        set %kicknick $nick
        set %kickchan $chan
        .timer.kickedmee 10 1 kickedmedo
      }
    }
  }
}
on 1:deop:#:{
  if (%protection == ON) {    
    if ($opnick == $me) && ($nick != $me) && ($nick != ChanServ) && (%antideop == ON) {
      { ChanServ op $chan $me }
      inc -u60 %antideop. [ $+ [ $nick ] $+ [ $chan ] ]       
      if (%antideop. [ $+ [ $nick ] $+ [ $chan ] ] >= %antideopon) {        
        set %dopnick $nick
        set %dopchan $chan
        .timer.dopme 1 1 deopmedo      
      }
    }
  }
}
alias kickedmedo {
  if ($me !ison %kickchan) { goto again }
  if ($me isop %kickchan) && (%kicknick ison %kickchan) {
    .timer.kickedmee off
    if (%antikickdo == 1) { kick %kickchan %kicknick 4Don't Kick Me!7 %antikickon 14time(s) kick Me. | goto end }
    if (%antikickdo == 2) { mode %kickchan -o %kicknick | .notice %kicknick 4Don't Kick Me! | goto end }
    if (%antikickdo == 3) { 
      kick %kickchan %kicknick 14Don't Kick Me!7 %antikickon 14time(s) kick Me.
      set -u10 %kedme. [ $+ [ %kicknick ] $+ [ %kickchan ] ] ON
      goto end
    }
    if (%antikickdo == 4) {
      ban -u60 %kickchan %kicknick 4
      kick %kickchan %kicknick 4Don't Kick Me!7 %antikickon 14time(s) kick Me. 
      goto end
    }
  }
  :end
  unset %kickchan %kicknick %antikick. [ $+ [ %kicknick ] $+ [ %kickchan ] ]
  :again
}
alias deopmedo {
  if ($me isop %dopchan) && (%dopnick ison %dopchan) {
    if (%antideopdo == 1) { kick %dopchan %dopnick 4Don't Deop Me!7 %antideopon 14time(s) Deop Me. | goto end }
    if (%antideopdo == 2) { mode %dopchan -o %dopnick | .notice %dopnick 14Don't Deop Me! | goto end }
    if (%antideopdo == 3) { 
      kick %dopchan %dopnick 4Don't Deop Me!7 %antideopon 14time(s) Deop Me.
      set -u10 %dopme. [ $+ [ %dopnick ] $+ [ %dopchan ] ] ON
      goto end
    }
    if (%antideopdo == 4) {
      ban -u60 %dopchan %dopnick 4
      kick %dopchan %dopnick 4Don't Deop Me!7 %antideopon 14time(s) Deop Me.
      goto end
    }
  }
  :end
  unset %dopchan %dopnick %antideop. [ $+ [ %dopnick ] $+ [ %dopchan ] ]
}
on *1:op:#:{
  if (%kedme. [ $+ [ $opnick ] $+ [ $chan ] ] == ON) { unset %kedme. [ $+ [ $opnick ] $+ [ $chan ] ] | mode $chan -o $opnick | halt }
  if (%dopme. [ $+ [ $opnick ] $+ [ $chan ] ] == ON) { unset %dopme. [ $+ [ $opnick ] $+ [ $chan ] ] | mode $chan -o $opnick | halt }
  if (%bannedme. [ $+ [ $opnick ] $+ [ $chan ] ] == ON) { unset %bannedme. [ $+ [ $nick ] $+ [ $chan ] ] | mode $chan -o $opnick | halt }
}
on 1:ban:#:{
  if (%protection == ON) && (%antiban == ON) && ($nick != $me) && ($me isop $chan) && ($nick != ChanServ) {
    set %cfkball 0
    :kbsecond
    inc %cfkball
    if ($ialchan($banmask,#,%cfkball).nick) {
      set %bannednick  $ialchan($banmask,#,%cfkball).nick
      if (%bannednick == $me) { bannedmechek }
      goto kbsecond
    }
    else { goto end }
  }
  :end
  unset %cfkball %bannednick
}
alias bannedmechek  {
  inc -u60 %bannedme. [ $+ [ $nick ] $+ [ $chan ] ]
  if (%bannedme. [ $+ [ $nick ] $+ [ $chan ] ] == 1) {
    if (%antibanon == 1) { bannedmedo }
    if (%antibanon > 1) { mode $chan -b $banmask } 
  }
  if (%bannedme. [ $+ [ $nick ] $+ [ $chan ] ] == 2) {
    if (%antibanon <= 2) { bannedmedo }
    if (%antibanon > 2) { mode $chan -b $banmask } 
  }
  if (%bannedme. [ $+ [ $nick ] $+ [ $chan ] ] == 3) {
    if (%antibanon <= 3) { bannedmedo }
    if (%antibanon > 3) { mode $chan -b $banmask } 
  }
  if (%bannedme. [ $+ [ $nick ] $+ [ $chan ] ] >= 4) { bannedmedo }
}
alias bannedmedo {
  if (%antibando == 1) { 
    mode $chan -b $banmask 
    kick $chan $nick 4Don't Ban Me!7 %antibanon 14times Ban Me.
  }
  if (%antibando == 2) { 
    mode $chan -ob $nick $banmask 
    .notice $nick 4Don't Ban Me! 
  }
  if (%antibando == 3) { 
    mode $chan -ob $nick $banmask 
    kick $chan $nick 4Don't Ban Me!7 %antibanon 14times Ban Me.
    set -u10 %bannedme. [ $+ [ $nick ] $+ [ $chan ] ] ON 
  }
  if (%antibando == 4) {
    mode $chan -ob+b $nick $banmask $address($nick,4)
    ban -u60 $chan $nick 4
    kick $chan $nick 4Don't Ban Me!7 %antibanon 14times Ban Me.
  }
  :end 
  unset %bannedme. [ $+ [ $nick ] $+ [ $chan ] ]
}
