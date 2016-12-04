;=================
; IP locator v1.0 
;=================
menu status,nicklist,channel,query {
  -
  IP Locator { locate }
  -
}

dialog locate {
  title "IP Locator"
  size -1 -1 134 93
  option dbu notheme
  text "IP Address", 1, 4 4 26 8, right
  edit "", 2, 32 2 62 11
  button "Locate", 3, 96 2 34 11
  text "Status", 4, 4 16 25 8, right
  edit "", 5, 32 14 62 11, read
  text "City", 6, 4 34 25 8, right
  text "State", 7, 4 43 25 8, right
  text "Country", 8, 4 52 25 8, right
  text "ISP", 9, 4 61 25 8, right
  text "", 10, 32 34 98 8
  text "", 11, 32 43 98 8
  text "", 12, 32 52 98 8
  text "", 13, 32 61 98 8
  button "Clipboard", 14, 62 78 34 11
  button "OK", 15, 96 78 34 11, ok
  box "", 16, -4 25 142 4
  box "", 17, -3 70 142 4
}

alias -l locate {
  if ($1) {
    did -ra locate 5 Opening socket...
    did -r locate 10,11,12,13
    sockclose locate
    sockopen locate www.melissadata.com 80
    sockmark locate $1-
  }
  else {
    dialog $iif($dialog(locate),-x,-m) locate locate
  }
}
alias -l striphtml {
  var %txt = $mid($1-,1,800)
  var %p = 1, %b = $replace(%txt,$chr(38),$+($chr(32),$chr(38)),;,$+(;,$chr(32)),>,$+(>,$chr(32)),<,$+($chr(32),<,)), %c
  while ($gettok(%b,%p,32)) {
    %c = $ifmatch
    if (*<* iswm %c || *&*; iswm %c || *</* iswm %c || *solid* iswm %c || *px* iswm %c || *:* iswm %c && $remove(%c,:) !isnum || */* iswm %c || *'* iswm %c || *;* iswm %c || *&* iswm %c || *<*>* iswm %c || *=* iswm %c || *"* iswm %c || *>* iswm %c || $+(*,$chr(40),*) iswm %c || $+(*,$chr(41),*) iswm %c || $+(*,$chr(123),*) iswm %c || $+(*,$chr(125),*) iswm %c) { %b = $remove(%b,%c) | %p = 0 }
    inc %p
  }
  return %b
}
alias -l endlocate {
  did -ra locate 5 Transaction complete.
  if (%ip) { did -ra locate 10 %city | did -ra locate 11 %state | did -ra locate 12 %country | did -ra locate 13 %isp }
  else { did -r locate 10,11,12,13 | did -ra locate 5 Nothing found. }
  unset %isp
  unset %ip
  unset %city
  unset %state
  unset %country
  unset %isp
}

on *:dialog:locate:sclick:14:{
  var %a = IP: $did(2).text City: $did(10).text State: $did(11).text Country: $did(12).text ISP: $did(13).text
  clipboard %a
}
on *:dialog:locate:sclick:3:{
  if (!$did(2).text) { beep | return }
  locate $did(2).text
}
on *:sockopen:locate:{
  if ($sockerr > 0 && $dialog(locate)) { did -ra locate 5 Socket Open Error(s). | did -r locate 10,11,12,13 | return }
  sockwrite -n $sockname GET $+(/lookups/iplocation.asp?ipaddress=,$sock($sockname).mark) HTTP/1.1
  sockwrite -n $sockname Host: $+(www.melissadata.com,$str($crlf, 2))
  sockwrite -n $sockname Connection: keep-alive
}
on *:sockread:locate:{
  if ($sockerr > 0 && $dialog(locate)) { did -ra locate 5 Socket Read Error(s). | did -r locate 10,11,12,13 | return }
  var %q
  sockread %q
  tokenize 32 $striphtml(%q)
  did -ra locate 5 Reading data...
  if (* IP Address *.*.*.* iswm $1-) { %ip = $4 }
  if (* City * iswm $1-) { %city = $3- }
  if (* State or Region * iswm $1-) { %state = $5- }
  if (* Country * iswm $1-) { %country = $3- }
  if (* ISP * iswm $1-) { %ISP = $3- }
  .timertrace -o 1 1 endlocate $sock($sockname).mark
}

;==========
; traceip
;==========
on *:dialog:troute:close:*:{ .timercheckrt off | if ($exists(C:\tracert.txt)) { .remove C:\tracert.txt } }
dialog troute {
  title "Trace Route"
  size -1 -1 200 250
  option dbu
  button "",5,1 1 1 1,Ok
  list 1, 7 20 185 226, vsbar hsbar
  box "Trace Route", 2, 3 3 194 243
  text "Tracing:", 3, 11 11 200 8
  text %ip, 4, 32 11 240 8
}
menu nicklist {
  .Trace IP:{  
    if ($ialchan($+($1,!*@*),$active,0) == 0) { .enable #tracewho | .userhost $1 | return }
    echo -a 04!!! Tracing IP, one moment. 04!!!
    troute $remove($address($1,2),*!*@)   
  }
}
alias -l troute { 
  set %ip $1
  .run -n cmd /C tracert $1 > C:\tracert.txt 
  dialog -mde troute troute 
  did -z troute 1
  set %trtlines 1 
  .timercheckrt 0 1 chkrt 
}

#tracewho off
raw 302:*:{ echo -a 04!!! Tracing IP, one moment. 04!!! | .disable #tracewho | troute $gettok($2,2,64) }
#tracewho end


alias -l chkrt { 
  if ($lines(C:\tracert.txt) > %trtlines) { 
    while (%trtlines <= $lines(C:\tracert.txt)) { 
      if ($dialog(troute) == $null) { .timercheckrt off | halt } 
      var %line = $read(C:\tracert.txt,%trtlines) 
      var %lenoline = $len(%line) 
      if (($len($read(C:\tracert.txt,%trtlines)) < 25) && (%trtlines >= $lines(C:\tracert.txt))) { return } 
      dlogparse %trtlines 
      inc %trtlines 
    } 
  } 
  if (Trace comp* iswm $read(c:\tracert.txt,%trtlines)) { 
    .timercheckrt off 
    if ($exists(C:\tracert.txt)) { .remove C:\tracert.txt }
    did -a troute 1 Trace Complete. 
    .dialog -o troute
    .did -z troute 1
    .dialog -n troute
    echo -a 04!!! Trace Complete 04!!! 
  } 
}
on *:dialog:troute:dclick:1:{ clipboard $did($dname,$did).seltext }
alias -l dlogparse {
  var %i = $1
  tokenize 32 $replace($read(C:\tracert.txt,$1),1 ms,1ms,2 ms,2ms,3 ms,3ms,4 ms,4ms,5 ms,5ms,6 ms,6ms,7 ms,7ms,8 ms,8ms,9 ms,9ms,0 ms,0ms)
  if ($1 !isnum) { did -a troute 1 $1- | return }
  var %rest $+($chr(91),$5,$chr(93),$iif($6,$6))
  if (*Request time* iswm $5-) { var %rest $+([,$remove($5-,.),]) }
  did -a troute 1 $+([,$1,],$chr(32),[,$2,],[,$3,],[,$4,],%rest)
}
