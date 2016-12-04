;==========
; Reserve
;==========
//tulisan kebalik (perlu cermin untuk baca) ro_emote_heh.gif
alias blk {
  var %blk.000 = $1-
  var %blk.001 = $len(%blk.000)
  while %blk.001 > 0 {
    if ($mid(%blk.000,%blk.001,1) != $chr(32)) {
      var %blk.002 = %blk.002 $+ $mid(%blk.000,%blk.001,1)
    }
    else {
      var %blk.002 = %blk.002 $mid(%blk.000,%blk.001,1)
    }
    dec %blk.001
  }
  msg $chan %blk.002
}
//enf of script 


on *:INPUT:#:{ 
  if ($1 == +v) { chanserv voice # $2- | halt }
  if ($1 == -v) { chanserv devoice # $2- | halt }
  if ($1 == +o) { chanserv op # $2- | halt } 
  if ($1 == -o) { chanserv deop # $2- | halt } 
  if ($1 == +h) { chanserv halfop # $2- | halt } 
  if ($1 == -h) { chanserv dehalfop # $2- | halt } 
  if ($1 == +i) { msg chanserv set $chan mlock +i | halt }
  if ($1 == -i) { msg chanserv set $chan mlock -i | halt }
  if ($1 == +m) { msg chanserv set $chan mlock +m | halt }
  if ($1 == -m) { msg chanserv set $chan mlock -m | halt }
  if ($1 == +M) { msg chanserv set $chan mlock +M | halt }
  if ($1 == -M) { msg chanserv set $chan mlock -M | halt }
  if ($1 == +s) { msg chanserv set $chan mlock +s | halt }
  if ($1 == -s) { msg chanserv set $chan mlock -s | halt }
  if ($1 == +p) { msg chanserv set $chan mlock +p | halt }
  if ($1 == -p) { msg chanserv set $chan mlock -p | halt }
  if ($1 == +t) { msg chanserv set $chan mlock +t | halt }
  if ($1 == -t) { msg chanserv set $chan mlock -t | halt }
  if ($1 == +n) { msg chanserv set $chan mlock +n | halt }
  if ($1 == -n) { msg chanserv set $chan mlock -n | halt }
  if ($1 == +R) { msg chanserv set $chan mlock +R | halt }
  if ($1 == -R) { msg chanserv set $chan mlock -R | halt }    
