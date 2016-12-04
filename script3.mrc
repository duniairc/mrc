#rekick off
on *:kick:#:{
  if ($knick == $me) { 
    if $level($address($nick,3)) >= 80 { halt }
    else { msg chanserv deop $chan $nick | .auser 10 $nick | /kick $chan $nick 4,14“5,1“14 D4o15n14'4t 15k14i4c15k 14m4e15! 5,1“4,14“ }
  }
}
on *:kick:#: { 
  if (bot isin $nick) { halt }
  if (b0t isin $nick) { halt }
  if (serv isin $nick) { halt }
  if (sevr isin $nick) { halt }
  if (dal.net isin $nick) { halt }
  if (chanserv isin $nick) { halt }
  if ($knick = $me) { .set %kicker $nick | .auser 10 $nick | .timer1 1000 5 join $chan }
}
on *:op:#: {  if (%kicker ison $chan) kick $chan %kicker 4,14“5,1“14 D4o15n14'4t 15k14i4c15k 14m4e15! 5,1“4,14“ | .unset %kicker | .timer1 off }
on 10:join:#: { kick $chan $nick 4Tùh kàn  | .ruser 10 $nick | .auser 20 $nick } 
on 20:join:#: { kick $chan $nick 4ßùkàn §à£àhkù £òh  | .ruser 20 $nick | .auser 30 $nick }
on 30:join:#: { kick $chan $nick 4kòk Jàdí ßéGíní | .ruser 30 $nick | .auser 40 $nick }  
on 40:join:#: { kick $chan $nick 4wà£àh | .ruser 40 $nick  | .auser 50 $nick }  
on 50:join:#: { kick $chan $nick 4àdùh ùdàhàn ©àPék ýà©h...  | .ruser 50 $nick | .auser 60 $nick } 
on 60:join:#: { kick $chan $nick 4GíMànà néCh  | .ruser 60 $nick | .auser 70 $nick }
on 70:join:#: { kick $chan $nick 4kàýàknýà ùdàh dé©h....  | .ruser 70 $nick | .auser 80 $nick }
on 80:join:#: { kick $chan $nick 4éh TàPí kòQ Jàdí nGé kí©k Té®ù§ ýà©h  | .ruser 80 $nick | .auser 90 $nick }
on 90:join:#: { kick $chan $nick 4Gwé Jàdí ßínGùnG dé©h...  | .ruser 90 $nick | .auser 100 $nick }           
on 100:join:#: { kick $chan $nick 4wàdùhhhh....é®®ò® níh kàýàknýà :P  | .ruser 100 $nick | .auser 110 $nick }
on 110:join:#: { kick $chan $nick 4ßénTà® ýà ßéné®ín dù£ù...  | .ruser 110 $nick | .auser 120 $nick }
on 120:join:#: { kick $chan $nick 4§àßà® àJà ýà...  | .ruser 120 $nick | .auser 130 $nick }
on 130:join:#: { kick $chan $nick 4kàýàknýà Gàk Màù ßé®hénTí dé©h  | .ruser 130 $nick | .auser 140 $nick }
on 140:join:#: { kick $chan $nick 4GíMànà dònk...  | .ruser 140 $nick | .auser 150 $nick } 
on 150:join:#: { kick $chan $nick 4TàPí £àén kà£í....JànGàn í§énG!!  | .ruser 150 $nick | .auser 10 $nick } 
on 160:join:#: { kick $chan $nick 4àkhí®nýà §é£é§àí JùGà :) | .ruser 160 $nick | .auser 10 $nick }
on 200:JOIN:#: { kick # $nick 4,14“5,1“14 S4o15r14r4y 15k14e4n15a 14k4i15c14k4! 5,1“4,14“ | .ruser 200 $nick | .auser 300 $nick }
on 300:JOIN:#: { mode # +b $nick | /kick # $nick 4,14“5,1“14 S4o15r14r4y 15k14e4n15a 14b4a15n14! 5,1“4,14“ | .ruser 300 $nick | .auser 10 $nick }
#rekick end
}
raw 474:*:msg chanserv unban $2 $me | join $2
on 1:DEOP:#:{ if ($opnick == $me) && ($nick != $me) && (services !isin $nick) { if ($nick != ChanServ) { cs deop $chan $nick } | cs op $chan $me | set -u60 %tt $nick } }
