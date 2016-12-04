;wIRC oper security module for use with Unreal X
on ^1:snotice:*PONG*:{ HALT }
on 1:snotice:*used SAJOIN to make*:{
  if ($me = $9) {
    part $11
    echo -a # $timestamp 4[NOTICE4] $4 wanted you to join $11
    echo @Security $timestamp  12,1[4,1FAILED SAJOIN12,1] 14( $+ $4 $+ 14) wanted you to join 14( $+ $11 $+ 14)
  msg $4 %version lol you think you can SAJOIN me? rofl }
  else halt
}
on ^1:snotice:*/links*disabled*:{
  echo -at 12-(1313info12!11/links has been disabled on this server - bastards :(12)-
  HALT
}
on ^1:snotice:*/map*disabled*:{
  echo -at 12-(1313info12!11/map has been disabled on this server - bastards :(12)-
  HALT
}
on ^1:snotice:*added an akill*:{
  window -e @Security K:Line added
  echo @Security $timestamp 12,1[4,1AKILL ADDED12,1] $1-
  HALT
}
on ^1:snotice:*removed akill*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1AKILL REMOVED12,1] $1-
  HALT
}
on ^1:snotice:*k*line*added*:{
  window -e @Security 
  echo @Security $timestamp 12,1[4,1KLINE ADDED12,1] $1-
  HALT
}
on ^1:snotice:*removed*k*line*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1KLINE REMOVED12,1] $1-
  HALT
}
on ^1:snotice:*user ban for*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1KLINE ADDED12,1] $1-
  HALT
}
on ^1:snotice:*removed temporary user ban*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1KLINE REMOVED12,1] $1-
  HALT
}
on ^1:snotice:*Z*Line added*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1ZLINE ADDED12,1] $1-
  HALT
}
on ^1:snotice:*removed*z*line*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1ZLINE REMOVED12,1] $1-
  HALT
}
on ^1:snotice:*G*Line added for*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1G:LINE12,1] $1-
  HALT
}
on ^1:snotice:*Permanent G*Line added for*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1PERM G:LINE12,1] $1-
  HALT
}
on ^1:snotice:*Expiring G*Line*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1EXPIRED G:LINE12,1] $1-
  HALT
}
on ^1:snotice:*removed G*Line*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1REMOVED G:LINE12,1] $1-
  HALT
}
on ^1:snotice:*HelpOp*:{
  window -e @Security
  echo @Security $timestamp 12,1[9,1HELPOP IN USE12,1] $1-
  HALT
}
on ^1:snotice:*operoverride*:{
  window -e @Security
  echo @Security $timestamp 12,1[11,1OPER OVERRIDE12,1] $1-
  HALT
}
on ^1:snotice:*changed his/her nickname*:{
  window -e @Security               
  echo @Security $timestamp 12,1[9,1NICK CHANGE12,1] $1-
  HALT
}
on ^1:snotice:*clonesx*:{
  window -e @Security               
  echo @Security $timestamp 12,1[4,1CLONES FOUND12,1] $1-
  HALT
}
on ^1:snotice:*AdminChat*:{            
  echo -a $timestamp 12,1[11,1ADMIN CHAT12,1] $1-
  HALT
}
on ^1:snotice:*Global -- from NickServ*:{
  window -e @Security
  echo @Security $timestamp 12,1[9,1NICKSERV12,1] $1-
  HALT
}
on ^1:snotice:*Notice -- OperWalk*:{
  window -e @Security
  echo @Security $timestamp 12,1[8,1OPERWALK12,1] $1-
  HALT
}
on ^1:snotice:*Global -- from Floodworld*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1FLOODWORLD12,1] $1-
  HALT
}
on ^1:snotice:*used SAJOIN*:{
  window -e @Security
  echo @Security $timestamp 12,1[8,1SAJOIN12,1] $1-
  HALT
}
on ^1:snotice:*used SAPART*:{
  window -e @Security
  echo @Security $timestamp 12,1[8,1SAPART12,1] $1-
  HALT
}
on ^1:snotice:*Shun added for*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1SHUN ADDED12,1] $1-
  HALT
}
on ^1:snotice:*removed Shun*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1SHUN REMOVED12,1] $1-
  HALT
}
on ^1:snotice:*ChatOps -- from*:{
  window -e @Security
  echo -a $timestamp 12,1[9,1CHATOP12,1] $1-
  HALT
}
on ^1:snotice:*Opening config*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1REHASHING CONFIG12,1] $1-
  HALT
}
on ^1:snotice:*network administrator*:{
  window -e @Security
  echo @Security $timestamp 12,1[8,1NETADMIN ONLINE12,1] $1-
  HALT
}
on ^1:snotice:*server admin*:{
  window -e @Security
  echo @Security $timestamp 12,1[8,1SERVERADMIN ONLINE12,1] $1-
  HALT
}
on ^1:snotice:*co administrator*:{
  window -e @Security
  echo @Security $timestamp 12,1[8,1COADMIN ONLINE12,1] $1-
  HALT
}
on ^1:snotice:*services administrator*:{
  window -e @Security
  echo @Security $timestamp 12,1[8,1CSOP ONLINE12,1] $1-
  HALT
}
on ^1:snotice:*an operator*:{
  window -e @Security
  echo @Security $timestamp 12,1[8,1IRCOP ONLINE12,1] $1-
  HALT
}
on ^1:snotice:*from services*PANIC!*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1PANIC12,1] $1-
  HALT
}
on ^1:snotice:*Received KILL message*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1KILL12,1] $1-
  HALT
}
on ^1:snotice:*from services*:{
  window -e @Security
  echo @Security $timestamp 12,1[8,1SERVICES12,1] $1-
  HALT
}
on ^1:snotice:*Banwalk*:{
  window -e @Security
  echo @Security $timestamp 12,1[8,1BANWALK12,1] $1-
  HALT
}
on ^1:snotice:*total invisibility*:{
  window -e @Security
  echo @Security $timestamp 12,1[11,1TOTAL INVISIBILITY MODE12,1] $1-
  HALT
}
on ^1:snotice:*changed the virtual hostname*:{
  window -e @Security
  echo @Security $timestamp 12,1[9,1CHGHOST12,1] $1-
  HALT
}
on ^1:snotice:*changed the virtual ident*:{
  window -e @Security
  echo @Security $timestamp 12,1[9,1CHGIDENT12,1] $1-
  HALT
}
on ^1:snotice:*failed oper attempt by*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1FAILED OPER12,1] $1-
  HALT
}
on ^1:snotice:*did a /whois*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1WHOIS12,1] $1-
  echo -a $timestamp 12[8ALERT12] $1-
  HALT
}
on ^1:snotice:*Throttled connections*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1THROTTLE12,1] $1-
  HALT
}
on ^1:snotice:*has synched to network data*:{
  window -e @Security
  echo @Security $timestamp 12,1[9,1RELINKED12,1] $1-
  echo -a $timestamp 12[9RELINKED12] $1-
  msg #hell 12[9RELINKED12] $1-
  HALT
}
on ^1:snotice:*No response from*:{
  window -e @Security
  echo @Security $timestamp 12,1[4,1SERVER DROP12,1] $9 $1-
  echo -a $timestamp 12[8WARNING SERVER DROP DETECTED12] $9 $1-
  HALT
}
on ^1:snotice:*Global -- from NickServ*:{
  window -e @Security
  echo @Security $timestamp 12,1[9,1NICKSERV12,1] $1-
  HALT
}
on *:snotice:*Client connecting*:{
  window -e @Traffic 
  if (b0t isin $1-) || (bot isin $1-) {
    echo @Traffic $timestamp 12,1[9,1>>>12,1][4,1BOT CONNECTING12,1]14,1 $1- 
    echo -a $timestamp 12,1[9,1>>>12,1][8,1BOT CONNECTING12,1]14,1 $1-	    
    HALT
  }
  else {
    echo @Traffic $timestamp 12,1[9,1>>>12,1]14,1 $1-
    HALT
  }
}
on *:snotice:*Client exiting*:{
  window -e @Traffic
  if (b0t isin $1-) || (bot isin $1-) {
    echo @Traffic $timestamp 12,1[4,1<<<12,1][8,1BOT EXITING12,1]14,1 $1-
    HALT
  }
  else {
    echo @Traffic $timestamp 12,1[4,1<<<12,1]14,1 $1-
    HALT
  }
}
on ^1:snotice:*vhost*:{
  window -e @Security
  echo @Security $timestamp 12,1[9,1VHOST12,1] $1-
  HALT
}
on ^1:snotice:*LocOps*:{
  window -e @Security
  echo @Security $timestamp 12,1[9,1LOCOPS12,1] $1-
  HALT
}
on ^1:snotice:*used SAMODE*:{
  window -e @Security
  echo @Security $timestamp 12,1[9,1SAMODE12,1] $1-
  HALT
}
on ^1:snotice:*OperTopic*:{
  window -e @Security
  echo @Security $timestamp 12,1[8,1OPERTOPIC12,1] $1-
  HALT
}
on ^1:snotice:*OperMode*:{
  window -e @Security
  echo @Security $timestamp 12,1[8,1OPERMODE12,1] $1-
  HALT
}
on ^1:snotice:*OperKick*:{
  window -e @Security
  echo @Security $timestamp 12,1[8,1OPERKICK12,1] $1-
  HALT
}
