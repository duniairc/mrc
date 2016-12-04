;wIRC access backup

alias backup_access {
  ;;;;SET ME
  set %access_backup_channel $?="What channel?"
  ;;;;SET ME
  set %access_i on
  .msg chanserv access %access_backup_channel list
  .timer 1 5  echo -a 8 $+  $lines(access.dat)  Users Backed Up.
  .timer 1 5 unset %access_i
  .timer 1 5 unset %access_backup_channel
}
alias restore_access {
  var %i 1
  .msg chanserv sop $gettok($read(access.dat,1),2,32) clear
  .msg chanserv aop $gettok($read(access.dat,1),2,32) clear
  .msg chanserv hop $gettok($read(access.dat,1),2,32) clear
  .msg chanserv vop $gettok($read(access.dat,1),2,32) clear

  while (%i <= $lines(access.dat) ) {
    .msg chanserv  $read(access.dat, %i)
    inc %i
  }
  echo -a 8 Access List Restored With %i  $+  Users 
}
on *:notice:*:?: {
  if ( $nick == ChanServ ) && ( %access_i == on ) {
    if ( $1 == Num ) ||  ( $1 == Access ) { .remove access.dat | halt }
    if ($2 == 10)  .write access.dat SOP %access_backup_channel add  $3
    if ($2 == 5  )  .write access.dat AOP %access_backup_channel add  $3
    if ($2 == 4  )  .write access.dat HOP %access_backup_channel add  $3
    if ($2 == 3  )  .write access.dat VOP  %access_backup_channel add  $3



  }
}
