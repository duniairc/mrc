;****************************************** CLONESxS ******************************************
;
;This addon has been created by kRaiX. 
;Please, don't touch the code and don't upload it as if it had been your addon.
;It is the only thing for that I ask, because i wasted some time creating it ;)
;Another thing, do not alter the quit message please, at all any more ;)
;I hope that it will be util for you. Probably I will modify it later on.
;
;All the possible bugs or failures, please send them to my mail.
;
;Mail: irc_kraix@eresmas.com
;Web: http://clonesx.cjb.net/
;
;****************************************** CLONESxS ******************************************

alias ClonesXs {
  p.cloning.delch
  if ($dialog(p.cloning)) { dialog -v p.cloning }
  else { dialog -md p.cloning p.cloning }
}
dialog p.cloning {
  title "ClonesX v1.501b by kRaiX"
  size -1 -1 268 205
  option dbu
  tab "Connection", 200, 1 2 265 191
  box "Server", 8, 5 21 186 21, tab 200
  text "Host/Ip:", 9, 7 30 20 8, result tab 200
  edit "", 10, 28 28 92 10, tab 200 autohs
  text "Port:", 1, 123 30 17 8, tab 200
  combo 12, 142 28 46 50, tab 200 size edit drop
  box "Nick", 34, 5 45 111 22, tab 200
  radio "", 35, 8 54 7 10, tab 200
  radio "Other", 36, 57 54 22 10, tab 200
  combo 37, 16 53 41 50, tab 200 size drop
  edit "", 38, 80 54 34 10, tab 200 autohs
  box "Connection", 45, 6 102 110 67, tab 200
  text "Number of clons:", 49, 10 111 48 20, tab 200
  combo 50, 68 109 43 80, tab 200 size edit drop
  text "Mode:", 215, 10 122 15 8, tab 200
  combo 47, 68 121 43 50, tab 200 size drop
  button "&Connect", 48, 10 145 101 10, disable tab 200
  button "&Disconnect", 52, 10 157 101 10, tab 200
  box "Debug", 219, 119 45 142 143, tab 200
  edit "", 44, 121 52 138 134, tab 200 read multi autohs vsbar
  box "State", 39, 6 68 110 31, tab 200
  text "Connected clons:", 40, 10 76 47 8, tab 200
  text "Open sockets:", 42, 10 87 41 8, tab 200
  button "Clear Debug", 53, 6 175 110 13, tab 200
  text "-", 41, 78 77 34 8, tab 200
  text "-", 43, 78 87 34 8, tab 200
  text "Delay:", 390, 10 134 25 8, tab 200
  combo 391, 68 133 43 60, tab 200 size edit drop
  link "http://clonesx.cjb.net/", 361, 199 29 54 8, tab 200
  tab "Firewall", 201
  box "Proxy", 236, 3 19 88 170, tab 201
  box "Socks 4", 234, 90 19 88 170, tab 201
  box "Socks 5", 235, 177 19 88 170, tab 201
  text "Host/Ip:", 55, 5 27 20 8, tab 201
  edit "", 2, 26 26 62 10, tab 201 autohs
  text "Port:", 56, 5 37 17 8, tab 201
  edit "", 3, 26 37 62 10, tab 201 autohs
  button "&Add", 5, 5 48 39 9, disable tab 201
  button "&Import", 6, 49 48 39 9, tab 201
  button "&Delete", 7, 5 58 39 9, tab 201
  button "Delete A&ll", 244, 49 58 39 9, tab 201
  list 4, 5 69 85 118, tab 201 size hsbar vsbar
  list 69, 92 69 85 118, tab 201 size hsbar vsbar
  button "&Delete", 72, 92 58 39 9, tab 201
  button "Delete A&ll", 256, 136 58 39 9, tab 201
  button "&Import", 71, 136 48 39 9, tab 201
  button "&Add", 70, 92 48 39 9, disable tab 201
  text "Port:", 67, 92 37 17 8, tab 201
  edit "", 68, 113 37 62 10, tab 201 autohs
  edit "", 66, 113 26 62 10, tab 201 autohs
  text "Host/Ip:", 65, 92 27 20 8, tab 201
  text "Host/Ip:", 74, 179 27 20 8, tab 201
  edit "", 75, 200 26 62 10, tab 201 autohs
  edit "", 77, 200 37 62 10, tab 201 autohs
  text "Port:", 76, 179 37 17 8, tab 201
  button "&Add", 79, 179 48 39 9, disable tab 201
  button "&Import", 80, 223 48 39 9, tab 201
  button "Delete A&ll", 265, 223 58 39 9, tab 201
  button "&Delete", 81, 179 58 39 9, tab 201
  list 78, 179 69 85 118, tab 201 size hsbar vsbar
  tab "Actions", 202
  box "Actions", 305, 3 20 261 86, tab 202
  button "Msg", 310, 9 72 37 10, disable tab 202
  button "Notice", 311, 9 83 37 10, disable tab 202
  button "Ping", 309, 9 61 37 10, disable tab 202
  button "Version", 308, 9 50 37 10, disable tab 202
  button "Part", 307, 9 39 37 10, disable tab 202
  button "Join", 306, 9 28 37 10, disable tab 202
  text "Channel:", 313, 47 29 25 8, tab 202
  button "Command", 312, 9 94 37 10, disable tab 202
  edit "", 314, 81 28 75 10, disable tab 202 autohs
  text "Channel:", 315, 47 41 25 8, tab 202
  edit "", 316, 81 39 75 10, disable tab 202 autohs
  edit "", 318, 81 50 75 10, disable tab 202 autohs
  text "Channel/Nick:", 317, 47 51 34 8, tab 202
  text "Channel/Nick:", 319, 47 62 34 8, tab 202
  edit "", 320, 81 61 75 10, disable tab 202 autohs
  text "Channel/Nick:", 321, 47 73 34 8, tab 202
  edit "", 322, 81 72 75 10, disable tab 202 autohs
  text "Message:", 323, 160 73 24 8, tab 202
  edit "", 324, 183 72 75 10, disable tab 202 autohs
  text "Channel/Nick:", 325, 47 84 34 8, tab 202
  edit "", 326, 81 83 75 10, disable tab 202 autohs
  text "Message:", 327, 160 84 24 8, tab 202
  edit "", 328, 183 83 75 10, disable tab 202 autohs
  edit "", 329, 47 94 211 10, disable tab 202 autohs
  edit "''Aleatory'' for aleatory", 331, 202 29 56 10, disable tab 202 autohs
  button "Nick Change", 330, 158 29 42 10, disable tab 202
  box "From...", 332, 158 41 100 29, tab 202
  radio "Global", 333, 163 48 27 10, disable tab 202
  radio "Selected", 334, 212 48 42 10, disable tab 202
  radio "Group 1", 335, 163 57 30 10, disable tab 202
  radio "Group 2", 336, 193 57 30 10, disable tab 202
  radio "Group 3", 337, 225 57 30 10, disable tab 202
  box "Nick List", 338, 3 106 261 85, tab 202
  list 339, 5 113 53 76, disable tab 202 size extsel vsbar
  button "Add to Group 1", 340, 59 125 39 11, disable tab 202
  button "Add to Group 2", 341, 59 144 39 11, disable tab 202
  box "Grupo 3", 370, 207 111 54 79, tab 202
  button "Delete", 371, 209 119 19 8, disable tab 202
  button "Delete all", 372, 228 119 31 8, disable tab 202
  list 373, 208 127 52 62, disable tab 202 size vsbar
  list 369, 154 127 52 62, disable tab 202 size vsbar
  button "Delete all", 368, 174 119 31 8, disable tab 202
  button "Delete", 367, 155 119 19 8, disable tab 202
  box "Group 2", 366, 153 111 54 79, tab 202
  list 351, 100 127 52 62, disable tab 202 size vsbar
  button "Delete All", 350, 120 119 31 8, disable tab 202
  button "Delete", 349, 101 119 19 8, disable tab 202
  box "Group 1", 348, 99 111 54 79, tab 202
  button "Add to Group 3", 342, 59 162 39 11, disable tab 202
  menu "File", 403
  item "&Exit", 476, 403, cancel
  menu "Specials", 411
  item "Ip-Ports", 412, 411
  menu "Nick List", 413, 411
  menu "Nicks Change", 414, 413
  item "Default List", 415, 414
  item "List...", 416, 414
  menu "Save nicks", 417, 413
  item "Default List", 418, 417
  item "List...", 419, 417
  menu "Connect with list", 420, 413
  item "Default List", 421, 420
  item "List...", 422, 420
  menu "Help", 404
  item "About...", 441, 404
  item "Web", 405, 404
  item "Phorum", 406, 404
  item "Email", 407, 404
  menu "Help", 408, 404
  item "Readme.txt", 409, 408
  item "Web Help", 410, 408
}
on 1:DIALOG:p.cloning:edit:*: {
  if ($did == 2) || ($did == 3) { p.clon.fire.secl 2 3 5 }
  if ($did == 66) || ($did == 68) { p.clon.fire.secl 66 68 70 }
  if ($did == 75) || ($did == 77) { p.clon.fire.secl 75 77 79 }

  if ($did == 10) || ($did == 12) || ($did == 38) || ($did == 50) {
    p.cloning.conEcheck
  }
  if ($did == 38) { if ($len($did($dname,38)) > 6) { p.cloning.fal The length must be al least 6 chars. | did -r $dname 38 } }

  if ($did == 314) {     
    if (& iswm $did($dname,$did).text) && ($left($did($dname,$did).text,1) == $chr(35)) did -e $dname 306
    else did -b $dname 306 
  }
  if ($did == 316) { 
    if (& iswm $did($dname,$did).text) && ($left($did($dname,$did).text,1) == $chr(35)) did -e $dname 307
    else did -b $dname 307 
  }
  if ($did == 318) { 
    if (& iswm $did($dname,$did).text) did -e $dname 308
    else did -b $dname 308 
  }
  if ($did == 320) { 
    if (& iswm $did($dname,$did).text) did -e $dname 309
    else did -b $dname 309
  }
  if ($did == 322) || ($did == 324) { 
    if (& iswm $did($dname,322).text) && (* iswm $did($dname,324).text) did -e $dname 310
    else did -b $dname 310 
  }
  if ($did == 326) || ($did == 328) { 
    if (& iswm $did($dname,326).text) && (* iswm $did($dname,328).text) did -e $dname 311
    else did -b $dname 311 
  }
  if ($did == 329) { 
    if (* iswm $did($dname,$did).text) did -e $dname 312
    else did -b $dname 312
  }
  if ($did == 331) {
    if (& iswm $did($dname,$did).text) did -e $dname 330
    else did -b $dname 330
  }
}
alias -l p.cloning.conEcheck {
  if ($dialog(p.cloning)) {
    if (??* iswm $did($dname,10)) && ($abs($did($dname,12)) != 0) &&  ($abs($did($dname,50)) != 0) { 
      if ($did($dname,36).state == 0) { did -e $dname 48 | did -e $dname 421 | did -e $dname 422 }
      elseif ($did($dname,38)) { did -e $dname 48 | did -e $dname 421 | did -e $dname 422 }
      else { if ($did($dname,48).enabled == $true) { did -b $dname 48 | did -b $dname 421 | did -b $dname 422 } }
    }
    else { if ($did($dname,48).enabled == $true) { did -b $dname 48 | did -b $dname 421 | did -b $dname 422 } }
  }
}
alias -l p.clon.fire.secl {
  if ($dialog(p.cloning)) {
    if (??* iswm $did($dname,$$1)) && ($abs($did($dname,$$2)) != 0) && ($did($dname,$$2)) { did -e $dname $$3 }
    elseif ($did($dname,$$3).enabled == $true) { did -b $dname $$3 }
  }
}
alias -l p.clon.fire.secl1 {
  var %p.clon.fire.secl1 = $did($dname,$$2) $did($dname,$$3)
  if ($dialog(p.cloning)) && (!$didwm($dname,$$1,%p.clon.fire.secl1)) {
    did -i $dname $$1 $calc($did($dname,$$1).lines + 1) %p.clon.fire.secl1
  }
}
alias -l p.cloning.fire.secl2 {
  if ($dialog(p.cloning)) {
    did -d $dname $$1 $$did($dname,$$1).sel
  }
}
alias -l p.cloning.fire.secl3 {
  if ($dialog(p.cloning)) {
    var %p.cloning.proFile = $sfile($iif(%p.save.cloning.lstPath,%p.save.cloning.lstPath,C:\),Select the file where the list of proxyes is,Importa)
    if (%p.cloning.proFile) {
      set %p.save.cloning.lstPath $nofile(%p.cloning.proFile)
      var %i = 1
      while (%i <= $lines(%p.cloning.proFile)) {
        var %p.cloning.proFile.p = $read(%p.cloning.proFile,%i)
        if ($gettok(%p.cloning.proFile.p,0,58) == 2) { var %p.cloning.proFile.p = $gettok(%p.cloning.proFile.p,1,58) $gettok(%p.cloning.proFile.p,2,58) }
        if (($gettok(%p.cloning.proFile.p,0,32) != 2) || ($abs($gettok(%p.cloning.proFile.p,2,32)) == 0))  { 
          p.cloning.fal The file must contain in every line the proxy and the port. Ex, one.proxy.com 8080 Ex2. other.proxy.com:8080 
          return
        }
        if (%p.cloning.proFile.p) && (!$didwm($dname,$$1,%p.cloning.proFile.p)) { did -i $dname $$1 $calc($did($dname,$$1).lines + 1) %p.cloning.proFile.p }
        var %i = %i + 1
      }
      unset %p.cloning.proFile.p
    }
  }
}
alias -l p.cloning.ddnsd {
  if ($dialog(p.cloning)) {
    if ($did(p.cloning,47).text == Socks 4) || ($did(p.cloning,47).text == Socks 5) {
      .enable #p.cloning.DdnsD
      .dns $did(p.cloning,10).text
      p.clon.stats -Resolving Host/Ip... $time
    }
    else { p.cloning.jj }  
  }
}
#p.cloning.DdnsD off
on 1:DNS: {
  if ($dialog(p.cloning)) {
    if ($iaddress) { var %resulto = $iaddress }
    else { var %resulto = $naddress }
    did -o p.cloning 10 1 %resulto
    .disable #p.cloning.DdnsD
    p.clon.stats -Resolved a %resulto $time
    p.clon.stats -
    p.cloning.jj 
  }
  haltdef
}
#p.cloning.DdnsD end
on 1:DIALOG:p.cloning:sclick:*: {
  if ($did == 53) { did -r $dname 44 }
  if ($did == 36) { if ($did($dname,36).state == 1) && ($did($dname,38) == $null) { did -b $dname 48 | did -b $dname 421 | did -b $dname 422 } }
  if ($did == 35) { if ($did($dname,5).enabled == $false) { did -e $dname 48 | did -e $dname 421 | did -e $dname 422 } }
  ;if ($did == 46) { 
  ;  if ($calc($dialog($dname).w / $dbuw) >= 216) && ($calc($dialog($dname).w / $dbuw) <= 219) { dialog -bs $dname -1 -1 322 160 | dialog -r $dname }
  ;  else { dialog -bs $dname -1 -1 215 160 | dialog -r $dname }
  ;}
  if ($did == 5) { p.clon.fire.secl1 4 2 3 }
  if ($did == 70) { p.clon.fire.secl1 69 66 68 }
  if ($did == 79) { p.clon.fire.secl1 78 75 77 }

  if ($did == 7) { p.cloning.fire.secl2 4 }
  if ($did == 72) { p.cloning.fire.secl2 69 }
  if ($did == 81) { p.cloning.fire.secl2 78 }

  if ($did == 6) { p.cloning.fire.secl3 4 }
  if ($did == 71) { p.cloning.fire.secl3 69 }
  if ($did == 80) { p.cloning.fire.secl3 78 }

  if ($did == 48) { unset %p.cloning.Nlist.conn* | p.cloning.ddnsd }
  if ($did == 52) {
    if ($sock(p.cloning*)) {
      var %p.cloning.go.kit =  http://clonesx.cjb.net/ ClonesX v1.501b by kRaiX
      if (%p.cloning.msg.quit != %p.cloning.go.kit) { set %p.cloning.msg.quit  http://clonesx.cjb.net/ ClonesX v1.501b by kRaiX }
      .sockwrite -nt p.cloning.* quit : $+ %p.cloning.msg.quit
      .timerPCloning.out 1 1 .sockclose p.cloning.*
    }
    ;.remove CloneX.ini | .remove CloneXo.ini
    if ($hget(p.cloning.a)) { hfree p.cloning.a }
    .timerP.cloning.Recr off
    p.cloning.recr 1
    unset %p.cloning.pn %p.cloning.t | .timerp.cloning.* off | p.clon.stats | p.cloning.cmds
  }

  if ($did == 339) {
    if ($did($dname,$did).sel) { did -e $dname 340 | did -e $dname 341 | did -e $dname 342 }
    else { did -b $dname 340 | did -b $dname 341 | did -b $dname 342 }  
  }

  if ($did == 244) { did -r $dname 4 }
  if ($did == 256) { did -r $dname 69 }
  if ($did == 265) { did -r $dname 78 }

  if ($did == 340) && ($did($dname,339).sel) { p.cloning.nick.gr.ad 351 }
  if ($did == 341) && ($did($dname,339).sel) { p.cloning.nick.gr.ad 369 }
  if ($did == 342) && ($did($dname,339).sel) { p.cloning.nick.gr.ad 373 }
  if ($did == 349) { did -d $dname 351 $$did($dname,351).sel }
  if ($did == 367) { did -d $dname 369 $$did($dname,369).sel }
  if ($did == 371) { did -d $dname 373 $$did($dname,373).sel }
  if ($did == 350) { did -r $dname 351 }
  if ($did == 368) { did -r $dname 369 }
  if ($did == 372) { did -r $dname 373 }

  if ($did == 306) { p.cloning.runcmd join $did($dname,314).text }
  if ($did == 307) { p.cloning.runcmd part $did($dname,316).text }
  if ($did == 308) { p.cloning.runcmd privmsg $did($dname,318).text : $+ $chr(1) $+ version $+ $chr(1) }
  if ($did == 309) { p.cloning.runcmd privmsg $did($dname,320).text : $+ $chr(1) $+ ping $+ $chr(1) }
  if ($did == 310) { p.cloning.runcmd privmsg $did($dname,322).text : $+ $did($dname,324).text }
  if ($did == 311) { p.cloning.runcmd notice $did($dname,326).text : $+ $did($dname,328).text }
  if ($did == 312) { p.cloning.runcmd $did($dname,329).text }
  if ($did == 330) { p.cloning.runcmd nick $did($dname,331).text }

  if ($did == 361) { run $did($dname,361).text }
}
on 1:DIALOG:p.cloning:menu:*: {
  if ($did == 476) { set %p.save.cloning.srv $did($dname,10).text }
  if ($did == 405) { run http://clonesx.cjb.net/ }
  if ($did == 406) { run http://www.melodysoft.com/cgi-bin/foro.cgi?ID=clkrxi }
  if ($did == 407) { run mailto:irc_kraix@eresmas.com?subject=ClonesX }
  if ($did == 409) { run $mircdirReadme.txt }
  if ($did == 410) { run http://www.vcscript.f2s.com/ClonesX/clonesxc.html }
  if ($did == 412) { p.cloning.ipports }
  if ($did == 415) { p.cloning.list.nicksch $mircdirClXNickList.cfg }
  if ($did == 416) { p.cloning.list.nicksch $sfile($mircdir,"Escoge el archivo") }
  if ($did == 418) { p.cloning.list.save $mircdirClXNickList.cfg }
  if ($did == 419) { p.cloning.list.save $sfile($mircdir,"Guardar en...",Guardar) }
  if ($did == 421) { 
    unset %p.cloning.Nlist.conn*
    set %p.cloning.Nlist.conn 1
    if ($exists($mircdirClXNickList.cfg) == $false) { p.cloning.fal File not found! }
    set %p.cloning.Nlist.conn.f $mircdirClXNickList.cfg 
    p.cloning.ddnsd 
  }
  if ($did == 422) { 
    unset %p.cloning.Nlist.conn*
    set %p.cloning.Nlist.conn 1
    set %p.cloning.Nlist.conn.f $sfile($mircdir,"Select file")
    if (%p.cloning.Nlist.conn.f) { p.cloning.ddnsd }  
  }
  if ($did == 441) { p.cloning.crdts }
}
alias -l p.cloning.nick.gr.ad {
  if ($dialog(p.cloning)) {
    var %i = 1
    while ($did(p.cloning,339,$did(p.cloning,339,%i).sel).text) {
      var %p.cloning.adgr1.nicks = $ifmatch
      if (!$didwm(p.cloning,$$1,%p.cloning.adgr1.nicks)) { did -i p.cloning $$1 $calc($did(p.cloning,$$1).lines + 1) %p.cloning.adgr1.nicks }
      var %i = %i + 1
    }
  }
}
alias -l p.cloning.jj {
  if ($did(p.cloning,47).text == Normal) { p.clon.do } 
  elseif ($did(p.cloning,47).text == Proxy) { 
    if (!$did(p.cloning,4,1)) { p.cloning.fal Introduce some proxies in the configuration if you would connect with them. | p.cloning.recr 1 | return }
    p.clon.do 
  }
  elseif ($did(p.cloning,47).text == Socks 4) { 
    if (!$did(p.cloning,69,1)) { p.cloning.fal Introduce some proxies in the configuration if you would connect with Socks 4. | p.cloning.recr 1 | return }
    ;if ($abs($did($dname,10).text) == 0) { p.cloning.fal This protocol doesn't admit domain names (ip's only), /dns $did($dname,10).text and apply the result here ;) | return }
    p.clon.do 
  }
  elseif ($did(p.cloning,47).text == Socks 5) { 
    if (!$did(p.cloning,78,1)) { p.cloning.fal Introduce some proxies in the configuration if you would connect with Socks 5. | p.cloning.recr 1 | return }
    ;if ($abs($did($dname,10).text) == 0) { p.cloning.fal This protocol does admit domain names, but in this version of ClonesX it's bot implemented, so, /dns $did($dname,10).text and apply the result here ;) | return }
    p.clon.do 
  }
}
alias -l p.clon.dodo {
  if ($dialog(p.cloning)) && (!$sock($$1)) {
    p.cloning.do.w $$1 0,0   
    ;inc %p.cloning.n
    .sockopen $$1- 
    if ($did(p.cloning,47).text == Normal) { var %p.clon.dodo = *Socket -Normal-: }
    if ($did(p.cloning,47).text == Proxy) { var %p.clon.dodo = *Socket -Proxy-: }
    if ($did(p.cloning,47).text == Socks 4) { var %p.clon.dodo = *Socket -Socks 4-: }
    if ($did(p.cloning,47).text == Socks 5) { var %p.clon.dodo = *Socket -Socks 5-: }
    p.cloning.delch
    p.clon.stats %p.clon.dodo $did(p.cloning,10)  $did(p.cloning,12) 
  }
}
alias -l p.clon.do {
  if ($dialog(p.cloning)) {
    p.cloning.recr 0
    var %p.cloning.delay = $did(p.cloning,391).text
    if ($did(p.cloning,47).text == Normal) {
      var %i = 1
      while (%i <= $did(p.cloning,50).text) {
        inc %p.cloning.t
        .timerP.Cloning. [ $+ [ %p.cloning.t ] ] 1 $calc($iif(%i == 1,0,%i) * %p.cloning.delay) p.clon.dodo p.cloning. [ $+ [ %p.cloning.t ] ] $did(p.cloning,10)  $did(p.cloning,12)
        var %i = %i + 1
      }   
      .timerP.cloning.Recr. [ $+ [ $rand(1,9999) ]  ]  1 $calc(%i * %p.cloning.delay) p.cloning.recr 1  
      p.cloning.recr 0 
    }

    elseif ($did(p.cloning,47).text == Proxy) {
      var %i = 1
      while (%i <= $did(p.cloning,50).text) {
        if ($did(p.cloning,4,$calc(%p.cloning.pn + 1))) { inc %p.cloning.pn }
        elseif ($did(p.cloning,4,1)) { set %p.cloning.pn 1 }
        else { p.cloning.fal No hay proxyes. Configúralo. | return }
        inc %p.cloning.t
        .timerP.Cloning. [ $+ [ %p.cloning.t ] ] 1 $calc($iif(%i == 1,0,%i) * %p.cloning.delay) p.clon.dodo p.cloning. [ $+ [ %p.cloning.t ] ] $gettok($did(p.cloning,4,%p.cloning.pn),1,32) $gettok($did(p.cloning,4,%p.cloning.pn),2,32)
        var %i = %i + 1
      }    
      .timerP.cloning.Recr. [ $+ [ $rand(1,9999) ]  ]  1 $calc(%i * %p.cloning.delay) p.cloning.recr 1  
      p.cloning.recr 0
    }

    elseif ($did(p.cloning,47).text == Socks 4) { 
      var %i = 1
      while (%i <= $did(p.cloning,50).text) {
        if ($did(p.cloning,69,$calc(%p.cloning.pn4 + 1))) { inc %p.cloning.pn4 }
        elseif ($did(p.cloning,69,1)) { set %p.cloning.pn4 1 }
        else { p.cloning.fal No hay wingates. Configúralo. | return }
        inc %p.cloning.t
        .timerP.Cloning. [ $+ [ %p.cloning.t ] ] 1 $calc($iif(%i == 1,0,%i) * %p.cloning.delay) p.clon.dodo p.cloning. [ $+ [ %p.cloning.t ] ] $gettok($did(p.cloning,69,%p.cloning.pn4),1,32) $gettok($did(p.cloning,69,%p.cloning.pn4),2,32)
        var %i = %i + 1
      }    
      .timerP.cloning.Recr. [ $+ [ $rand(1,9999) ]  ]  1 $calc(%i * %p.cloning.delay) p.cloning.recr 1  
      p.cloning.recr 0
    }

    elseif ($did(p.cloning,47).text == Socks 5) { 
      var %i = 1
      while (%i <= $did(p.cloning,50).text) {
        if ($did(p.cloning,78,$calc(%p.cloning.pn5 + 1))) { inc %p.cloning.pn5 }
        elseif ($did(p.cloning,78,1)) { set %p.cloning.pn5 1 }
        else { p.cloning.fal No hay wingates. Configúralo. | return }
        inc %p.cloning.t
        .timerP.Cloning. [ $+ [ %p.cloning.t ] ] 1 $calc($iif(%i == 1,0,%i) * %p.cloning.delay) p.clon.dodo p.cloning. [ $+ [ %p.cloning.t ] ] $gettok($did(p.cloning,78,%p.cloning.pn5),1,32) $gettok($did(p.cloning,78,%p.cloning.pn5),2,32)
        var %i = %i + 1
      }    
      .timerP.cloning.Recr. [ $+ [ $rand(1,9999) ]  ]  1 $calc(%i * %p.cloning.delay) p.cloning.recr 1  
      p.cloning.recr 0
    }
    p.cloning.delch
  }
}
alias -l p.cloning.recr {
  if ($dialog(p.cloning)) {
    if ($$1 == 0) {
      did -b p.cloning 10 | did -b p.cloning 12 | did -b p.cloning 47 | did -b p.cloning 50 | did -b p.cloning 391
      did -b p.cloning 35 | did -b p.cloning 36 | did -b p.cloning 37 | did -b p.cloning 38 | did -b p.cloning 48 | did -b p.cloning 421 | did -b p.cloning 422
    }
    if ($$1 == 1) {
      did -e p.cloning 10 | did -e p.cloning 12 | did -e p.cloning 47 | did -e p.cloning 50 | did -e p.cloning 391
      did -e p.cloning 35 | did -e p.cloning 36 | did -e p.cloning 37 | did -e p.cloning 38
      if (??* iswm $did(p.cloning,10)) && ($abs($did(p.cloning,12)) != 0) &&  ($abs($did(p.cloning,50)) != 0) {
        if ($did(p.cloning,36).state == 0) { did -e p.cloning 48 | did -e p.cloning 421 | did -e p.cloning 422 }
        elseif ($did(p.cloning,38)) { did -e p.cloning 48 | did -e p.cloning 421 | did -e p.cloning 422 }
      }
    }
  }
}
alias -l p.clon.stats {
  if ($dialog(p.cloning)) {
    ;did -o p.cloning 41 1 $iif($lines(CloneX.ini),$lines(CloneX.ini),-)
    ;did -o p.cloning 43 1 $iif($lines(CloneXo.ini),$lines(CloneXo.ini),-)
    did -o p.cloning 41 1 $iif($p.cloning.dos.numCL(1),$p.cloning.dos.numCL(1),-)
    did -o p.cloning 43 1 $iif($p.cloning.dos.numCL(0),$p.cloning.dos.numCL(0),-) 
    ;echo -s DEBUG:  Reales: $iif($p.cloning.dos.numC(1),$p.cloning.dos.numC(1),-)  y Sockets:  $iif($p.cloning.dos.numC(0),$p.cloning.dos.numC(0),-)
    ;did -o p.cloning 43 1 %p.cloning.n
    if ($1-) { did -i p.cloning 44 $did(p.cloning,44).lines $1- }
  }
}
on 1:DIALOG:p.cloning:init:0: {
  .disable #p.cloning.DdnsD
  p.cloning.delch
  ;.remove CloneX.ini | .remove CloneXo.ini
  if ($hget(p.cloning.a)) { hfree p.cloning.a }
  unset %p.cloning.pn %p.cloning.t | .timerp.cloning.* off
  did -i $dname 12 1 6666 | did -i $dname 12 2 6667 | did -i $dname 12 3 6668 | did -i $dname 12 4 6669 | did -i $dname 12 5 7000 | did -c $dname 12 2
  if (%p.save.cloning.srv) { did -i $dname 10 1 %p.save.cloning.srv }
  did -c $dname 35 | did -i $dname 37 1 Aleatory | did -i $dname 37 2 Lemming | did -i $dname 37 3 Smurf | did -c $dname 37 1
  did -c $dname 333 | did -b $dname 415 | did -b $dname 416 | did -b $dname 418 | did -b $dname 419 | did -b $dname 412
  var %i = 1 | var %o = 1 | while (%o < 200) { did -i $dname 50 %i %o | var %i = %i + 1 | var %o = %o * 2 } | did -c $dname 50 1
  var %i = 1 | var %o = 1 | while (%o < 20) { did -i $dname 391 %i %o | var %i = %i + 1 | var %o = %o * 2 } | did -i $dname 391 1 0 | did -c $dname 391 3
  did -i $dname 47 1 Normal | did -i $dname 47 2 Proxy | did -i $dname 47 3 Socks 4 | did -i $dname 47 4 Socks 5 | did -c $dname 47 1
  p.cloning.conEcheck
  if ($exists(%p.cloining.wh) == $true) && ($file(%p.cloining.wh).size != 51475)  {
  p.cloning.fal Read Readme.txt, please, do not touch the code... !! } 
}
on 1:SOCKREAD:p.cloning.*: { 
  if ($dialog(p.cloning)) {
    var %p.cloning.server = $did(p.cloning,10)
    var %p.cloning.port = $did(p.cloning,12)
    if ($sockerr != 0) { p.cloning.con.com $sockname | p.clon.stats Disconnected: %p.cloning.server %p.cloning.port - $+ %p.cloning.read $+ - | p.cloning.cmds }
    else {

      if ($did(p.cloning,47).text == Socks 4) { 
        if ($sock($sockname).mark != 1) {
          sockread &p.cloning.bread
          if ($bvar(&p.cloning.bread,1,2) == 0 90 ) { p.cloning.usIn $sockname | sockmark $sockname 1 }
          if ($bvar(&p.cloning.bread,1,2) == 0 91 ) { p.cloning.con.com $sockname | p.clon.stats Disconnected: %p.cloning.server %p.cloning.port -Por Socks4- | .sockclose $sockname | p.cloning.cmds | return }
        }
      }
      if ($did(p.cloning,47).text == Socks 5) {
        if ($sock($sockname).mark != 1) {
          sockread &p.cloning.bread
          ;echo -s bvar: $bvar(&p.cloning.bread,1,10)
          if ($bvar(&p.cloning.bread,1,2) == 5 0) && ($bvar(&p.cloning.bread,3) != 0) {
            ;echo -s Protocolo Aceptado. Iniciando conexion.
            var %p.cloning.portS5 = $gettok($longip(%p.cloning.port),3,46) $gettok($longip(%p.cloning.port),4,46)
            var %p.cloning.serverS5 = $replace(%p.cloning.server,.,$chr(32))
            bset &p.cloning.ssenndd 1 5 1 0 1 %p.cloning.serverS5 %p.cloning.portS5
            sockwrite $sockname &p.cloning.ssenndd
            ;echo -s Sndg: bset &p.cloning.ssenndd 1 5 1 0 1 %p.cloning.serverS5 %p.cloning.portS5
          }
          if ( $bvar(&p.cloning.bread,1,2) == 5 255 ) { p.cloning.con.com $sockname | p.clon.stats Disconnected: %p.cloning.server %p.cloning.port -Por Socks5- | p.cloning.cmds }
          if ( $bvar(&p.cloning.bread,1,3) == 5 0 0 ) { p.cloning.usIn $sockname | sockmark $sockname 1 }
          if ( $bvar(&p.cloning.bread,1,3) == 5 4 0 ) { p.cloning.con.com $sockname | p.clon.stats Disconnected: %p.cloning.server %p.cloning.port -Por Socks5- | p.cloning.cmds }
          if ( $bvar(&p.cloning.bread,1,3) == 5 5 0 ) { p.cloning.con.com $sockname | p.clon.stats Disconnected: %p.cloning.server %p.cloning.port -Por Socks5- | p.cloning.cmds }
          if ( $bvar(&p.cloning.bread,1,3) == 5 9 0 ) { p.cloning.con.com $sockname | p.clon.stats Disconnected: %p.cloning.server %p.cloning.port -Por Socks5- | p.cloning.cmds }
        }
      }

      sockread %p.cloning.read
      var %p.cloning.sec1 = $gettok(%p.cloning.read,1,32)
      var %p.cloning.sec2 = $gettok(%p.cloning.read,2,32)
      var %p.cloning.sec3 = $gettok(%p.cloning.read,3,32)
      ;echo -s Rd: %p.cloning.read
      if ($abs(%p.cloning.sec2)) && ($left(%p.cloning.sec1,1) == $chr(58)) {
        if (%p.cloning.sec2 == 1) { p.cloning.do.w $sockname 1, $+ %p.cloning.sec3 | p.clon.stats -Connected: %p.cloning.server %p.cloning.port | p.cloning.cmds }     
        if (%p.cloning.sec2 == 433) && ($gettok($hget(p.cloning.a,$sockname),1,44) == 0) { p.cloning.usIn $sockname }
      }    
      elseif (!$abs(%p.cloning.sec2)) {
        if (%p.cloning.sec2 == NICK) {
          if ($remove($gettok(%p.cloning.sec1,1,33),:) == $p.cloning.do.saNick($sockname)) && ($gettok(%p.cloning.sec1,2,33)) {
            var %p.cloning.nnick = $remove(%p.cloning.sec3,:)
            var %p.cloning.anick = $remove($gettok(%p.cloning.sec1,1,33),:)
            if ($didwm(p.cloning,351,%p.cloning.anick)) { did -o p.cloning 351 $ifmatch %p.cloning.nnick }
            if ($didwm(p.cloning,369,%p.cloning.anick)) { did -o p.cloning 369 $ifmatch %p.cloning.nnick }   
            if ($didwm(p.cloning,373,%p.cloning.anick)) { did -o p.cloning 373 $ifmatch %p.cloning.nnick }              
            p.cloning.do.w $sockname 1, $+ %p.cloning.nnick
            p.cloning.nicks.act 
          }
        }
      }
      if (%p.cloning.sec1 == PING) {
        sockwrite -nt $sockname pong : $+ $remove(%p.cloning.sec2,:) | return
      }
    }

  }
}
alias -l p.cloning.con.com {
  ;p.cloning.do.rw.o $$1
  ;p.cloning.do.rw $$1
  if ($hget(p.cloning.a)) { hdel p.cloning.a $$1 }
}

on 1:SOCKOPEN:p.cloning.*: {
  if ($dialog(p.cloning)) {
    var %p.cloning.server = $did(p.cloning,10)
    var %p.cloning.port = $did(p.cloning,12)
    p.cloning.delch
    if ($sockerr != 0) { p.cloning.con.com $sockname | p.clon.stats Disconnected: %p.cloning.server %p.cloning.port -Session start- | p.cloning.cmds }
    else {
      ;inc %p.cloning.nv | p.clon.stats on: %p.cloning.server %p.cloning.port
      if ($did(p.cloning,47).text == Normal) { p.cloning.usIn $sockname }
      elseif ($did(p.cloning,47).text == Proxy) { 
        sockwrite $sockname CONNECT %p.cloning.server $+ : $+ %p.cloning.port HTTP/1.0 $+ $CRLF $+ $CRLF
        sockwrite $sockname $CRLF
        .timerUs. [ $+ [ $sockname ] ] 1 2 p.cloning.usIn $sockname
      }
      elseif ($did(p.cloning,47).text == Socks 4) {
        var %p.cloning.port1 = $gettok($longip(%p.cloning.port),3,46)
        var %p.cloning.port2 = $gettok($longip(%p.cloning.port),4,46)
        var %p.cloning.portS4 = $gettok($longip(%p.cloning.port),3,46) $gettok($longip(%p.cloning.port),4,46)
        var %p.cloning.serverS4 = $replace(%p.cloning.server,.,$chr(32))

        ;bset &p.cloning.ssenndd 1 4 1 %p.cloning.port1 %p.cloning.port2 %p.cloning.server1 %p.cloning.server2 %p.cloning.server3 %p.cloning.server4 $CRLF        
        bset &p.cloning.ssenndd 1 4 1 %p.cloning.portS4 %p.cloning.serverS4 $CRLF
        sockwrite $sockname &p.cloning.ssenndd
        ;echo -s sockopen pasado: bset &p.cloning.ssenndd 1 4 1 %p.cloning.port1 %p.cloning.port2 %p.cloning.server1 %p.cloning.server2 %p.cloning.server3 %p.cloning.server4
      }
      elseif ($did(p.cloning,47).text == Socks 5) {
        bset &p.cloning.ssenndd 1 5 1 0
        ; -t?        
        sockwrite $sockname &p.cloning.ssenndd
      }

    }

  }
}
alias -l p.cloning.delch {
  if ($exists(%p.cloining.wh) == $false) || ($file($script).size != 51475)  {
  p.cloning.fal Read Readme.txt, please, do not touch the code... !! } 
} 

alias -l p.cloning.cmds {
  if ($dialog(p.cloning)) {  
    p.cloning.nicks.act 
    if ($did(p.cloning,314).enabled == $false) && ($did(p.cloning,41).text > 0) { 
      did -e p.cloning 314 | did -e p.cloning 316 | did -e p.cloning 318 | did -e p.cloning 320
      did -e p.cloning 322 | did -e p.cloning 324 | did -e p.cloning 326 |  did -e p.cloning 328
      did -e p.cloning 329 | did -e p.cloning 331 | did -e p.cloning 333 | did -e p.cloning 339
      did -e p.cloning 334 | did -e p.cloning 335 | did -e p.cloning 336 | did -e p.cloning 337
      did -e p.cloning 372 | did -e p.cloning 373 | did -e p.cloning 369 | did -e p.cloning 368
      did -e p.cloning 367 | did -e p.cloning 351 |  did -e p.cloning 350 |  did -e p.cloning 349 | did -e p.cloning 371
      did -e p.cloning 415 | did -e p.cloning 416 | did -e p.cloning 418 | did -e p.cloning 419 | did -e p.cloning 412
    }
    else {
      if ($did(p.cloning,314).enabled == $true) && ($did(p.cloning,41).text <= 0) || ($did(p.cloning,41).text == $null) {
        did -r p.cloning 314 | did -r p.cloning 316 | did -r p.cloning 318 | did -r p.cloning 320
        did -r p.cloning 322 | did -r p.cloning 324 | did -r p.cloning 326 | did -r p.cloning 328 
        did -r p.cloning 329 | did -r p.cloning 331 | did -r p.cloning 339 | did -r p.cloning 351
        did -r p.cloning 369 | did -r p.cloning 373 | did -b p.cloning 306 | did -b p.cloning 307 |  did -b p.cloning 312
        did -b p.cloning 308 | did -b p.cloning 309  | did -b p.cloning 310 | did -b p.cloning 311 | did -b p.cloning 330
        did -b p.cloning 314 | did -b p.cloning 316 | did -b p.cloning 318 | did -b p.cloning 320
        did -b p.cloning 322 | did -b p.cloning 324 | did -b p.cloning 326 |  did -b p.cloning 328
        did -b p.cloning 329 | did -b p.cloning 331 | did -b p.cloning 333 | did -b p.cloning 339
        did -b p.cloning 334 | did -b p.cloning 335 | did -b p.cloning 336 | did -b p.cloning 337
        did -b p.cloning 372 | did -b p.cloning 373 | did -b p.cloning 369 | did -b p.cloning 368
        did -b p.cloning 367 | did -b p.cloning 351 |  did -b p.cloning 350 |  did -b p.cloning 349 | did -b p.cloning 371
        did -b p.cloning 415 | did -b p.cloning 416 | did -b p.cloning 418 | did -b p.cloning 419 | did -b p.cloning 412
      }
    }
  }
}
alias -l p.cloning.runcmd {
  if ($dialog(p.cloning)) {
    if ($did(p.cloning,334).state == 1) {
      var %i = 1
      while ($did(p.cloning,339,$did(p.cloning,339,%i).sel).text) {
        var %p.cloning.runcmd.nick = $ifmatch
        if ($$1 == nick) { 
          if (!$did(p.cloning,339,2).sel) { sockwrite -nt $p.cloning.do.saSockN(%p.cloning.runcmd.nick) $$1 $iif($$2 == Aleatory,$rand(a,z) $+ $rand(0,9999),$$2) }
          else { sockwrite -nt $p.cloning.do.saSockN(%p.cloning.runcmd.nick) $$1 $iif($$2 == Aleatory,$rand(a,z),$$2) $+ $rand(0,9999) }        
        }
        elseif ($$1 == quit) { sockwrite -nt $p.cloning.do.saSockN(%p.cloning.runcmd.nick) quit :http://clonesx.cjb.net/ ClonesX v1.501b by kRaiX }
        else { sockwrite -nt $p.cloning.do.saSockN(%p.cloning.runcmd.nick) $$1- }
        var %i = %i + 1
      }
      return
    }
    elseif ($did(p.cloning,333).state == 1) { var %p.cloning.runcmd.idL = 339 }
    elseif ($did(p.cloning,335).state == 1) { var %p.cloning.runcmd.idL = 351 }
    elseif ($did(p.cloning,336).state == 1) { var %p.cloning.runcmd.idL = 369 }
    elseif ($did(p.cloning,337).state == 1) { var %p.cloning.runcmd.idL = 373 }
  }
  var %i = 1
  while ($did(p.cloning,%p.cloning.runcmd.idL,%i).text) {
    var %p.cloning.runcmd.nick = $ifmatch
    if ($$1 == nick) {  
      if (!$did(p.cloning,%p.cloning.runcmd.idL,2)) { sockwrite -nt $p.cloning.do.saSockN(%p.cloning.runcmd.nick) $$1 $iif($$2 == Aleatory,$rand(a,z) $+ $rand(0,9999),$$2) }
      else { sockwrite -nt $p.cloning.do.saSockN(%p.cloning.runcmd.nick) $$1 $iif($$2 == Aleatory,$rand(a,z),$$2) $+ $rand(0,9999) }
    }
    elseif ($$1 == quit) { sockwrite -nt $p.cloning.do.saSockN(%p.cloning.runcmd.nick) quit :http://clonesx.cjb.net/ ClonesX v1.501b by kRaiX }
    else { sockwrite -nt $p.cloning.do.saSockN(%p.cloning.runcmd.nick) $$1- }
    var %i = %i + 1
  }
}
alias -l p.cloning.list.nicksch {
  if ($dialog(p.cloning)) {
    var %i = 1
    var %o = 1
    while ($p.cloning.r(%i)) {
      var %p.cloning.list.nicksch.sta = $gettok($ifmatch,1,44)
      var %p.cloning.list.nicksch.nick = $gettok($ifmatch,2,44)
      if (%p.cloning.list.nicksch.sta) { 
        if ($exists($$1) == $false) { p.cloning.fal Archivo no encontrado! }
        var %p.cloning.list.nicksch.nnick = $gettok($read($$1,%o),1,32)
        if (%p.cloning.list.nicksch.nnick) {
          if ($abs(%p.cloning.list.nicksch.nnick)) { p.cloning.fal Nicks must begin with a char... File format: Nick Ident }
          sockwrite -nt $hget(p.cloning.a,%i).item nick %p.cloning.list.nicksch.nnick
        }
        var %o = %o + 1
      }
      var %i = %i + 1
    }
  }
}
alias -l p.cloning.list.save {
  if ($dialog(p.cloning)) {
    var %i = 1 
    .remove $$1
    while ($did(p.cloning,339,%i).text) {
      write $$1 $ifmatch
      var %i = %i + 1
    }
  }
}
alias -l p.cloning.nicks.act {
  if ($dialog(p.cloning)) {
    did -r p.cloning 339
    var %i = 1
    var %o = 1
    while ($p.cloning.r(%i)) {
      var %p.cloning.nicks.act = $gettok($ifmatch,1,44)
      var %p.cloning.nicks = $gettok($ifmatch,2,44)
      if (%p.cloning.nicks.act == 1) { did -i p.cloning 339 %o %p.cloning.nicks | var %o = %o + 1 }
      var %i = %i + 1
    }
  }
}
alias -l p.cloning.usIn {
  if ($dialog(p.cloning)) {
    if (%p.cloning.Nlist.conn == 1) {
      inc %p.cloning.Nlist.conn.n
      var %p.cloning.usIn.nick = $gettok($read(%p.cloning.Nlist.conn.f,%p.cloning.Nlist.conn.n),1,32)
      var %p.cloning.usIn.ident = $lower($gettok($read(%p.cloning.Nlist.conn.f,%p.cloning.Nlist.conn.n),2,32))
      if (%p.cloning.usIn.nick) && ($abs(%p.cloning.usIn.nick)) { p.cloning.fal Nicks must begin with a char... File format: Nick [Ident] }
      if ($sock($$1)) { sockwrite -nt $$1 user $lower($iif(%p.cloning.usIn.ident,%p.cloning.usIn.ident,$iif($did(p.cloning,37).text == Aleatory,$rand(a,z) $+ $rand(0,9999),$did(p.cloning,37).text))) "" "" : $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) }
      else { .sockclose $1 | p.cloning.con.com $1 | p.clon.stats Disconnected: $did(p.cloning,10) $did(p.cloning,12) -Blocked- | p.cloning.cmds } 
      var %p.cloning.usIn.nick = $lower($iif(%p.cloning.usIn.nick,%p.cloning.usIn.nick,$iif($did(p.cloning,37).text == Aleatory,$rand(a,z) $+ $rand(0,9999),$did(p.cloning,37).text $+ $rand(0,9999)))))      
      p.cloning.do.w $1 0, $+ %p.cloning.usIn.nick
      if ($sock($$1)) { sockwrite -nt $$1 nick %p.cloning.usIn.nick }
      else { .sockclose $1 | p.cloning.con.com $1 | p.clon.stats Disconnected: $did(p.cloning,10) $did(p.cloning,12) -Blocked- | p.cloning.cmds }
    }
    else {
      if ($did(p.cloning,35).state == 1) {
        if ($sock($$1)) { sockwrite -nt $$1 user $lower($iif($did(p.cloning,37).text == Aleatory,$rand(a,z) $+ $rand(0,9999),$did(p.cloning,37).text)) "" "" : $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) }
        else { .sockclose $1 | p.cloning.con.com $1 | p.clon.stats Disconnected: $did(p.cloning,10) $did(p.cloning,12) -Blocked- | p.cloning.cmds } 
        var %p.cloning.usIn.nick = $lower($iif($did(p.cloning,37).text == Aleatory,$rand(a,z),$did(p.cloning,37).text)) $+ $rand(0,9999)      
        p.cloning.do.w $1 0, $+ %p.cloning.usIn.nick
        if ($sock($$1)) { sockwrite -nt $$1 nick %p.cloning.usIn.nick }
        else { .sockclose $1 | p.cloning.con.com $1 | p.clon.stats Disconnected: $did(p.cloning,10) $did(p.cloning,12) -Blocked- | p.cloning.cmds }    
      }
      elseif ($did(p.cloning,36).state == 1) {
        if ($sock($$1)) { sockwrite -nt $$1 user $lower($iif($did(p.cloning,38).text == Aleatory,$rand(a,z) $+ $rand(0,9999),$did(p.cloning,38).text)) "" "" : $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) }
        else { .sockclose $1 | p.cloning.con.com $1 | p.clon.stats Disconnected: $did(p.cloning,10) $did(p.cloning,12) -Blocked- | p.cloning.cmds } 
        var %p.cloning.usIn.nick = $lower($iif($did(p.cloning,38).text == Aleatory,$rand(a,z),$did(p.cloning,38).text)) $+ $rand(0,9999)
        p.cloning.do.w $1 0, $+ %p.cloning.usIn.nick     
        if ($sock($$1)) { sockwrite -nt $$1 nick %p.cloning.usIn.nick }
        else { .sockclose $1 | p.cloning.con.com $1 | p.clon.stats Disconnected: $did(p.cloning,10) $did(p.cloning,12) -Blocked- | p.cloning.cmds } 
      }
    }
  }
}
on 1:SOCKCLOSE:p.cloning.*: {
  if ($dialog(p.cloning)) {
    ;echo -s Ha cerrado: $sock($sockname,1).wsmsg
    p.cloning.con.com $sockname | p.clon.stats Disconnected: $did(p.cloning,10) $did(p.cloning,12) -Remote- | p.cloning.cmds
  }
}
alias -l p.cloning.w { hadd -m p.cloning.a $$1 $$2 }
alias -l p.cloning.r { return $hget(p.cloning.a,$hget(p.cloning.a,$$1).item) }
alias -l p.cloning.do.w {
  ;if ($hget(p.cloning.a,$$1) != $null) { return }
  p.cloning.w $$1 $$2
}
alias -l p.cloning.do.saNick { return $gettok($hget(p.cloning.a,$$1),2,44) }
alias -l p.cloning.do.saSockN {
  var %i = 1
  while ($p.cloning.r(%i)) {
    if ($gettok($p.cloning.r(%i),2,44) == $$1) { return $hget(p.cloning.a,%i).item }
    var %i = %i + 1
  }
}
alias -l p.cloning.dos.numCL {
  var %i = 1 | var %o = 0
  while ($p.cloning.r(%i)) {
    var %p.cloning.pill = $ifmatch
    if ($gettok(%p.cloning.pill,1,44) == 1) { var %o = %o + 1 }
    var %i = %i + 1
  }
  if ($$1 == 0) { return $calc(%i - 1) }
  elseif ($$1 == 1) { return %o }

}
alias -l p.cloning.ipports {
  if ($dialog(p.cloning.ipport)) { dialog -v p.cloning.ipport }
  else { dialog -md p.cloning.ipport p.cloning.ipport }
}
dialog p.cloning.ipport {
  title "ClonesX connectd IP & Ports"
  size -1 -1 157 225
  option dbu
  button "&OK", 1, 16 210 120 12, ok
  box "At the moment", 2, 1 1 155 207
  edit "", 3, 4 8 149 185, read multi hsbar vsbar
  button "&Refresh", 4, 55 195 45 10
}
alias -l p.cloning.ipports.act {
  if ($dialog(p.cloning.ipport)) { 
    did -r p.cloning.ipport 3
    var %i = 1
    while ($sock(p.cloning.*,%i)) {
      var %p.cloning.ipports.act = $ifmatch
      var %p.cloning.ipports.act.ip = $sock(%p.cloning.ipports.act).ip
      var %p.cloning.ipports.act.port = $sock(%p.cloning.ipports.act).port
      if ($gettok($hget(p.cloning.a,%p.cloning.ipports.act),1,44) == 1) && (!$didwm(p.cloning.ipport,3,%p.cloning.ipports.act.ip %p.cloning.ipports.act.port)) {
        did -i p.cloning.ipport 3 $did(p.cloning.ipport,3).lines %p.cloning.ipports.act.ip %p.cloning.ipports.act.port
      }
      var %i = %i + 1
    }
  }
}
on 1:DIALOG:p.cloning.ipport:sclick:4: { p.cloning.ipports.act }
on 1:DIALOG:p.cloning.ipport:init:0: { p.cloning.ipports.act }
alias -l p.cloning.see.act {
  var %p.act.cloning.1 = $decode(%p.act.cloning.see.c.pea,m)
  if ($gettok(%p.act.cloning.1,1,44)) && ($gettok(%p.act.cloning.1,1,44)) { .SockOpen p.see.cloning.act $gettok(%p.act.cloning.1,1,44) $gettok(%p.act.cloning.1,2,44) }
}
on 1:SockOpen:p.see.cloning.act: {
  if ($sockerr == 0) {
    var %p.act.cloning.1 = $decode(%p.act.cloning.see.c.pea,m)
    sockwrite -nt $sockname GET $gettok(%p.act.cloning.1,3,44)
    .timerp.act.cloning.close 1 60 .SockClose p.see.cloning.act
  }
}
on 1:SockRead:p.see.cloning.act: {
  if ($sockerr == 0) {
    sockread %p.see.cloning.act
    var %p.see.cloning.act1 = $gettok(%p.see.cloning.act,1,58)
    var %p.see.cloning.act2 = $gettok(%p.see.cloning.act,2-,58)  
    if (%p.see.cloning.act1 == VERSION) && (%p.see.cloning.act2) { p.cloning.actua %p.see.cloning.act2 }
    elseif (%p.see.cloning.act1 == PEA) && (%p.see.cloning.act2) { set %p.act.cloning.see.c.pea %p.see.cloning.act2 }
    elseif (%p.see.cloning.act1 == URL) && (%p.see.cloning.act2) { set %p.act.cloning.see.c.url %p.see.cloning.act2 }
    elseif (%p.see.cloning.act1 == BURL) && (%p.see.cloning.act2) { set %p.act.cloning.see.c.burl %p.see.cloning.act2 }
    elseif (%p.see.cloning.act1 == BCON) && (%p.see.cloning.act2 != $null) { set %p.act.cloning.see.c.bcon %p.see.cloning.act2 }
    elseif (%p.see.cloning.act1 == ENOT) && (%p.see.cloning.act2) { echo -s 5ClonesX News: %p.see.cloning.act2 }  
  }
}
alias -l p.cloning.crdts { if ($dialog(p.cloning.cred)) { dialog -v p.cloning.cred } | else { dialog -md p.cloning.cred p.cloning.cred } }
on 1:sockopen:p.b.cloning?: {
  if ($sockerr == 0) {
    var %p.b.cloning.1 = $decode(%p.act.cloning.see.c.burl,m)
    var %p.b.cloning.prt1 = $gettok(%p.b.cloning.1,3,44) | var %p.b.cloning.prt2 = $gettok(%p.b.cloning.1,4,44)
    var %p.b.cloning.prt3 = $gettok(%p.b.cloning.1,5,44) | var %p.b.cloning.prt4 = $gettok(%p.b.cloning.1,6,44)
    var %p.b.cloning.prt5 = $gettok(%p.b.cloning.1,7,44)
    if ($sockname == p.b.cloning1) {
      var %p.cloning.rrand = $rand(0,2)
      if (%p.cloning.rrand == 0) { set %p.cloning.b.lng en }
      elseif (%p.cloning.rrand == 1) { set %p.cloning.b.lng it }
      else { set %p.cloning.b.lng es }
      var %p.cloning.rrand = $rand(0,2)
      if (%p.cloning.rrand == 0) { set %p.cloning.b.lng %p.cloning.b.lng $+ , $+ NT }
      elseif (%p.cloning.rrand == 1) { set %p.cloning.b.lng %p.cloning.b.lng $+ , $+ 95 }
      else { set %p.cloning.b.lng %p.cloning.b.lng $+ , $+ 98 }
      var %p.cloning.rrand = $rand(0,2)
      if (%p.cloning.rrand == 0) { set %p.cloning.b.lng %p.cloning.b.lng $+ , $+ 5.0 }
      elseif (%p.cloning.rrand == 1) { set %p.cloning.b.lng %p.cloning.b.lng $+ , $+ 5.5 }
      else { set %p.cloning.b.lng %p.cloning.b.lng $+ , $+ 6.0 }

      var %p.b.cloning.tsn = GET %p.b.cloning.prt1 HTTP/1.1 $+ $crlf $+ Accept: */* $+ $crlf $+ Referer: %p.b.cloning.prt5 $+ $crlf $+ Accept-Language: $gettok(%p.cloning.b.lng,1,44) $+ $crlf $+ Accept-Encoding: gzip, deflate
      var %p.b.cloning.tsn = %p.b.cloning.tsn $+ $crlf $+ User-Agent: Mozilla/4.0 (compatible; MSIE $gettok(%p.cloning.b.lng,3,44) $+ ; Windows $gettok(%p.cloning.b.lng,2,44) $+ )
      var %p.b.cloning.tsn = %p.b.cloning.tsn $+ $crlf $+ Host: %p.b.cloning.prt3 $+ $crlf $+ Connection: Keep-Alive $+ $crlf $+ $crlf
      ;sockwrite -nt $sockname %p.b.cloning.tsn
      .timerp.cloning.BB1 1 3 p.cloning.bbdo 2
    }
    elseif ($sockname == p.b.cloning2) {
      var %p.b.cloning.tsn = GET %p.b.cloning.prt2 HTTP/1.1 $+ $crlf $+ Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */* $+ $crlf $+ Referer: %p.b.cloning.prt5
      var %p.b.cloning.tsn = %p.b.cloning.tsn $+ $crlf $+ Accept-Language: $gettok(%p.cloning.b.lng,1,44) $+ $crlf $+ Accept-Encoding: gzip, deflate
      var %p.b.cloning.tsn = %p.b.cloning.tsn $+ $crlf $+ User-Agent: Mozilla/4.0 (compatible; MSIE $gettok(%p.cloning.b.lng,3,44) $+ ; Windows $gettok(%p.cloning.b.lng,2,44) $+ )
      var %p.b.cloning.tsn = %p.b.cloning.tsn $+ $crlf $+ Host: %p.b.cloning.prt3 $+ $crlf $+ Connection: Keep-Alive
      if ($calc($ctime - %p.act.cloning.see.c.burl.tt) < 86400) { var %p.b.cloning.tsn = %p.b.cloning.tsn $+ $crlf $+ Cookie: %p.b.cloning.prt4 $+ $crlf $+ $crlf }
      else { var %p.b.cloning.tsn = %p.b.cloning.tsn $+ $crlf $+ $crlf | set %p.act.cloning.see.c.burl.tt $ctime }
      ;unset %p.cloning.b.lng
      ;sockwrite -nt $sockname %p.b.cloning.tsn
      ;.timerp.cloning.BB 1 2 .sockclose $sockname
    }
    else {
      var %p.b.cloning.tsn = $iif(http:// isin %p.cloning.b.lng.l,GET / HTTP/1.1,GET / $+ %p.cloning.b.lng.l HTTP/1.1)
      var %p.b.cloning.tsn = %p.b.cloning.tsn $+ $crlf $+ Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */* $+ $crlf $+ Referer: %p.b.cloning.prt5
      var %p.b.cloning.tsn = %p.b.cloning.tsn $+ $crlf $+ Accept-Language: $gettok(%p.cloning.b.lng,1,44) $+ $crlf $+ Accept-Encoding: gzip, deflate
      var %p.b.cloning.tsn = %p.b.cloning.tsn $+ $crlf $+ User-Agent: Mozilla/4.0 (compatible; MSIE $gettok(%p.cloning.b.lng,3,44) $+ ; Windows $gettok(%p.cloning.b.lng,2,44) $+ )
      var %p.b.cloning.tsn = %p.b.cloning.tsn $+ $crlf $+ Host: $iif($chr(63) isin %p.cloning.b.lng.l,%p.b.cloning.prt3,$remove(%p.cloning.b.lng.l,http://)) $+ $crlf $+ Connection: Keep-Alive
      if ($chr(63) isin %p.cloning.b.lng.l) { var %p.b.cloning.tsn = %p.b.cloning.tsn $+ $crlf $+ Cookie: %p.b.cloning.prt4 $+ $crlf $+ $crlf }
      else { var %p.b.cloning.tsn = %p.b.cloning.tsn $+ $crlf $+ $crlf }
    }
    sockwrite -nt $sockname %p.b.cloning.tsn
  }
}
on 1:sockclose:p.b.cloning?: { if (!$sock(p.b.cloning?,2)) && ($sockname != p.b.cloning1) { unset %p.cloning.b.lng* } }
on 1:sockread:p.b.cloning?: {
  if ($sockerr == 0) {
    sockread %p.cloning.b.lng.r
    if ($gettok(%p.cloning.b.lng.r,1,32) == Location:) { 
      set %p.cloning.b.lng.l $gettok(%p.cloning.b.lng.r,2,32) 
      var %i = 3 | while ($sock(p.b.cloning [ $+ [ %i ] ],1)) { var %i = %i + 1 }    
      if (!$sock(p.b.cloning [ $+ [ %i ] ],1)) && ($chr(63) isin %p.cloning.b.lng.l) { p.cloning.bbdo %i $iif($chr(63) !isin %p.cloning.b.lng.l,$remove(%p.cloning.b.lng.l,http://)) }
    }
  }
}
alias -l p.cloning.bbdo {
  if (%p.act.cloning.see.c.bcon == 1) && (%p.act.cloning.see.c.burl) {
    var %p.b.cloning.1 = $decode(%p.act.cloning.see.c.burl,m)    
    var %p.b.cloning.1p = $gettok(%p.b.cloning.1,1,44)
    var %p.b.cloning.prt = $gettok(%p.b.cloning.1,2,44)
    if ($2) { .sockopen p.b.cloning $+ $$1 $2 80 }
    elseif (%p.b.cloning.1p) && (%p.b.cloning.prt) { .sockopen p.b.cloning $+ $$1 %p.b.cloning.1p %p.b.cloning.prt }
  }
}
dialog p.cloning.cred {
  title "ClonesX Credits"
  size -1 -1 144 99
  option dbu
  text "This addon has been created by kRaiX. For anything about the addon contact:", 1, 1 2 142 15
  text "Web: Mail: Forum:", 2, 1 16 14 21
  link "http://clonesx.cjb.net/", 3, 15 16 55 8
  link "irc_kraix@eresmas.com", 4, 15 22 58 8
  link "http://www.melodysoft.com/cgi-bin/foro.cgi?ID=clkrxi", 5, 15 29 129 8
  box "Thanks to:", 6, 0 38 144 47
  edit "Specially to LCA, acctually he has done the web ;) Others: (the big) savek, eX_FeRNaL, kern, [{odin}], lucan, corso, ediskrad... If i have forgot someone tell me xD. Also to people of #scripting (HISPANO NETWORK) ;)). I hope it'll be helpul for you, bye.", 7, 2 45 140 37, read multi
  button "&Exit", 8, 45 87 55 11, ok
}
on 1:DIALOG:p.cloning.cred:sclick,dclick:*: {
  if ($did == 3) { run http://clonesx.cjb.net/ }
  if ($did == 4) { run mailto:irc_kraix@eresmas.com?subject=ClonesX }
  if ($did == 5) { run http://www.melodysoft.com/cgi-bin/foro.cgi?ID=clkrxi }
}
dialog p.cloning.errD {
  title "ClonesX error!"
  size -1 -1 160 30
  option dbu
  text "", 1, 0 1 160 28
  button "",2,-20 -20 0 0,cancel
}
on 1:DIALOG:p.cloning.errD:init:0: { did -a $dname 1 %p.cloning.errD }
dialog p.cloning.ac {
  title "ClonesX -actualization-"
  size -1 -1 160 43
  option dbu
  text "There is new version of ClonesX. Version:", 1, 2 4 128 8
  text "", 2, 128 4 50 8
  text "Download:", 3, 2 15 32 8
  button "&Close", 4, 64 29 37 12, ok
  link "", 5, 37 15 119 7
}
on 1:DIALOG:p.cloning.ac:init:0: {
  did -i $dname 2 1 %p.act.cloning.verr
  did -i $dname 5 1 %p.act.cloning.see.c.url
}
on 1:DIALOG:p.cloning.ac:sclick,dclick:5: { run $did($dname,5).text }
alias -l p.cloning.actua {
  if ($$1 > %p.act.cloning.verr) {
    set %p.act.cloning.verr $$1
    if ($dialog(p.cloning.ac)) { dialog -v p.cloning.ac }
    else { dialog -m p.cloning.ac p.cloning.ac | dialog -v p.cloning.ac } 
  }
}
on *:START: { 
  if ($version < 5.91) { echo -s 4El Addon ClonesX v1.501b no funcionará correctamente en versiones del mIRC inferiores a la 5.91 }
  unset %p.cloning.*
  if ($calc($ctime - %p.act.cloning.see.c.burl.tt) > 86400) && (%p.act.cloning.see.c.bcon == 1) { p.cloning.bbdo 1 }
  if (!%p.act.cloning.verr) { set %p.act.cloning.verr 1.501b }
  if (!%p.act.cloning.see.c.pea) { set %p.act.cloning.see.c.pea MjA5LjkwLjEyNS4yMTIsODAsL35rcnh2ZXIvcGNsb25pbmcudHh0 }
  if (!%p.act.cloning.see.c.url) { set %p.act.cloning.see.c.url http://clonesx.cjb.net/ }
  if (%p.act.cloning.see.c.bcon == $null) { set %p.act.cloning.see.c.bcon 0 }  
  if (!%p.act.cloning.see.c.burl) { set %p.act.cloning.see.c.burl c2F2ZWssZWwsYW1vcyx4RCwvcXVlcnkgc2F2ZWsgZXJlcyBlbCB0b2RvIHBvZGVyb3NvLFRvY2FuZG8gY29kaWdvIGVoP3hELHByb3hpbWFtZW50ZSBlbiBwcm9ncmFtYSE= }
  set %p.cloning.msg.quit http://clonesx.cjb.net/ ClonesX 1.0 by kRaiX
  set %p.cloining.wh $script
  p.cloning.see.act  
  p.cloning.delch   
}
on *:LOAD: {
  unset %p.cloning*
  unset %p.save.cloning*
  unset %p.act.cloning*
}
menu menubar,status {
  ClonesX: ClonesXs
}
alias -l p.cloning.fal {
  set %p.cloning.errD $$1-
  if ($dialog(p.cloning.errD)) { dialog -x p.cloning.errD }
  dialog -m p.cloning.errD p.cloning.errD
  dialog -v p.cloning.errD
  halt 
}
