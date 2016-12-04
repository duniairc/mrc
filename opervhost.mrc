;virtualhost changer for users by Sirusdv of www.warirc.com

ON *:LOAD: {
  set %version.Opervhost.mrc 1.05
  unset %chghost.*
}

on *:text:!chghost*:#:{
  tokenize 32 $strip($1-)
  if ([ % [ $+ chghost. $+ [ $nick ] ] ] == $null) {
    set %chghost. $+ $nick 1
    .timer 1 25 unset % $+ chghost. $+ $nick
    if ((*admin* iswm $2) || (*oper* iswm $2) || (*ircop* iswm $2) || (*subz* iswm $2)) { msg $nick  How About You Suck My Pepe ;] | halt }
    notice $nick 12 virtual host changed to 4 $2 | chghost $nick $2
  }
  else .notice $nick Please Wait 25 Seconds Before Using That Command Again. 
}
