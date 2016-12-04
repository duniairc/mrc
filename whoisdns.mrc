raw &311:*:{ echo -a $timestamp 12|¯¯¯¯13( 0whois  $2 13 )12¯¯¯¯¯¯¯¯¯¯¯11 ¯¯¯¯¯ ¯¯¯¯ ¯¯¯13 ¯¯ ¯ | echo -a $timestamp 12| 0nick:14 $2 | echo -a $timestamp 12| 0name:14 ( $+ $6- $+ ) | echo -a $timestamp 12| 0hostname:14 $3 $+ @ $+ $4 | halt }
raw &314:*:echo -a $timestamp 12| 0name:14 $2-  | halt              
raw &312:*:echo -a $timestamp 12| 0server:14 $3 ( $+ $4- $+ ) 0IP:12 $serverip   | halt                          
raw &369:*:echo -a $timestamp 12| 0whowas:14 $2-  | halt                                       
raw &379:*:echo -a $timestamp 12| 0using modes:14 $6- | halt
raw &307:*:echo -a $timestamp 12| 0registered nick:14 Yes | halt
raw &319:*:echo -a $timestamp 12| 0channels:14 $3- | halt
raw &313:*:echo -a $timestamp 12| 0oper status:12 $5- | halt
raw &671:*:echo -a $timestamp 12| 0SSL:12 $4- | halt
raw &310:*:echo -a $timestamp 12| 0raw info:12 $4- | halt
raw &320:*:echo -a $timestamp 12| 0raw info:12 $3- | halt
raw &330:*:echo -a $timestamp 12| 0raw info:12 $4- | halt
raw &317:*:echo -a $timestamp 12| 0idle:14 $duration($3) | halt
raw &301:*:echo -a $timestamp 12| 0away:14 $3- | halt
raw &318:*:echo -a $timestamp 12|____13( 0end whois  $2 13 )12_____________ _______ 11_____ _____ ____ ___ 13__ _ | halt
raw &378:*:{
  haltdef
  var %host = $remove($6,*@) 
  hadd -mu1800 userhost $2 %host
  if $longip(%host) {
    echo -a $timestamp 12| 0real IP:12 $6
    return
  }
  if $hget(iptable,%host) {
    echo -a $timestamp 12| 0real Host:12 $6 0real IP:12 $ifmatch
    return
  }
  echo -a $timestamp 12| 0real Host:12 $6 0Getting IP...
  hadd -m iptable %host 0
  .dns -h %host 
}

On *:dns:{ 
  if $hget(iptable,$dns(1).addr) == 0 {
    hadd -mu1800 iptable $dns(1).addr $iif($dns(1).ip,$ifmatch,Unresolved)
    halt
  }
  echo -a $timestamp 13> 11dns12 [13!12] 
  var %n = $dns(0) 
  if (!$dns(0)) { echo -a $timestamp 12.11.13. 11Resolve 4Failed } 
  while (%n > 0) { 
    echo -a $timestamp 12.11.13. 11Resolved 12: 13[12 $+ $dns(%n).addr $+ 13]12 To 13[12 $+ $dns(%n).ip $+ 13] $iif($dns(%n).nick != $null, 13[12 $+ $dns(%n).nick $+ 13]) | HALTDEF
    dec %n 
  } 
} 

alias listip {
  var %i = $hget(userhost,0).item
  window -t20,40 @listip
  while %i {
    var %nick = $hget(userhost,%i).item, %ip = $hget(userhost,%nick), %i = %i - 1
    if $hget(iptable,%ip) {
      var %host = %ip, %ip = $ifmatch
    }
    aline @listip $+(Nick: %nick,$chr(9),IP: %ip,$chr(9),$iif(%host,Host: %host,Unresolved))
  }
}
