#shitkick off
alias chkshtlist { if ($input(Want to get revenge? Yes / No,y,Revenge Option)) { mode %chantemp +b %shittynick | kick %chantemp %shittynick 4sh*tlisted! | guser -a 5 %shittynick | .msg chanserv aop %chantemp del %shittynick | .msg chanserv access %chantemp del %shittynick | .msg chanserv akick %chantemp add %shittynick blacklisted by $me www.warirc.com } | else { halt } }
#shitkick end

on *:deop:# $me:{
  if ( $nick = $me ) { /halt }
  if ($opnick = $me) {
    msg chanserv op # $me
    msg chanserv halfop # $me
    .timer 1 1 /mode # +e $+ * $+ $me $+ *!*@*  
    .timer 1 2 /msg chanserv unban #
    .timer 1 3 /join #
  }
}



on !*:BAN:#:{
  if ($banmask iswm $address($me,5)) {
    set %shittynick $nick
    set %chantemp $chan
    .timer 1 0 chkshtlist
    msg chanserv op # $me
    msg chanserv halfop # $me
    .timer 1 1 mode # +e $banmask
    .timer 1 2 mode # -b $banmask
    .timer 1 3 msg chanserv unban #
    .timer 1 4 join #
  }
}

on *:KICK:# $me:{
  if ($banmask iswm $address($me,5)) {
    .timer 1 1 /mode # +e $banmask
    .timer 1 2 /mode # -b $banmask
    .timer 1 3 /msg chanserv unban #
    .timer 1 4 /join #
    else
    .timer 1 5 /join #
  }
}
