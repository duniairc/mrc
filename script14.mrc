;========
; google
;========
#google off
on *:LOAD: {
  if ($version < 6.03) {
    .unload -rs $+(",$script,")
    echo -ts Google Search be installed successfully, script auto-unloaded.
  }
  else { echo -ts Google Search v1.93, Successfully loaded - Type /_google to configure. }
}
on *:UNLOAD: {
  if ($timer(_google)) { .timer_google off }
  unset %queue._google.*
  hfree -w _google.*
  echo -ts Google Search, Successfully unloaded.
}
on *:TEXT:*:#: { if ($_ban($+($nick,!,$address))) && ($_trigger($1)) { _input $chan $cid $nick $2- } }
on *:INPUT:#: { if ($_trigger($1)) { _input $chan $cid $nick $2- } }
on *:SOCKOPEN:_google.*: {
  var %sn = $sockname
  tokenize 32 $sock(%sn).mark
  if ($sockerr) {
    _hadd %sn error Unable to open connection
    _parse %sn error $1-
    sockclose %sn
    return
  }
  sockwrite -nt %sn GET $+(/search?hl=en&q=,$_encode($6-),&num=,$4,&btnG=Search&meta=) HTTP/1.0
  sockwrite -nt %sn Accept-Language: en-us
  sockwrite -nt %sn User-Agent: mIRC Google Search/1.93
  sockwrite -nt %sn Referer: http://www.google.com
  sockwrite -nt %sn Host: www.google.com
  sockwrite -nt %sn Connection: close
  sockwrite -t %sn $str($crlf,2)
}
on *:SOCKREAD:_google.*: {
  var %sn = $sockname
  if ($sockerr > 0) return
  :nextread
  sockread &buffer
  if ($sockbr == 0) return
  if ($bvar(&buffer, 1, 7).text == HTTP/1.) {
    var %r = $bvar(&buffer, 1, $calc($bfind(&buffer, 1, $cr) - 1)).text
    if ($gettok(%r, 2, 32) != 200) && ($gettok(%r, 2, 32) != 302) {
      _hadd %sn error %r
      _parse %sn error $sock(%sn).mark
      sockclose %sn
      return
    }
  }
  hadd -mbu300 %sn $_item(%sn) &buffer
  goto nextread
}
on *:SOCKCLOSE:_google.*: { _main $sockname $sock($sockname).mark }

;
; Main HTML Parsing Alias
;
alias -l _main {
  var %sn = $sockname
  if ($_recompile(%sn, &data) == 0) {
    _hadd %sn error No data received on socket!
    _parse %sn error $2-
    sockclose %sn
    return
  }
  tokenize 32 $2-
  .echo -q $_extract(1, &data, &stats, <div id=ssb>)
  if (($5 == 1) && ($regex(stats, $bvar(&stats, 1, 800).text, /<b>(.[^<]*)</b>/ig))) {
    _hadd %sn results $_regexp($regml(stats, 4))
    _hadd %sn time $_regexp($regml(stats, 6))
    _parse %sn info $1-
  }
  var %p 1, %i 0, %m = $_ini(set, max)
  while ((%p > 0) && (%i < %m)) {
    inc %i
    var %pl = $bfind(&data, %p, <li class=g).text
    var %pd = $bfind(&data, %p, <div class=g>).text
    if ((%pl < %pd) || ((%pd == 0) && (%pl > 0))) { var %p = $_extract(%p, &data, &result, <li class=g, </ol>) }
    else { var %p = $_extract(%p, &data, &result, <div class=g>) }
    if (%p <= 0) {
      if ($v1 == -1) {
        if (%i == 1) _parse %sn none $1-
      }
      else {
        _hadd %sn error Parser error
        _parse %sn error $1-
      }
      break
    }
    if ($regex(url, $remove($bvar(&result, 1, 800).text, $cr, $lf), <a .*?href="(.[^"]*)"[^>]*class=l[^>]*>(.*?)</a>)) {
      if (http://news.google.*/news* iswm $regml(url, 1)) continue
      .echo -q $regex(desc, $bvar(&result, $bfind(&result, 1, </a>), 800).text, </[^>]*>(?:</h3>|<br>)<[^>]*>(.*?)<br>)
      .echo -q $regex(size, $bvar(&result, $bfind(&result, 1, <cite>), 800).text, <[^>]*>.*? - (.*?) -)
      _hadd %sn num %i
      _hadd %sn url $regml(url, 1)
      _hadd %sn title $_regexp($regml(url, 2))
      _hadd %sn desc $iif($_regexp($regml(desc, 1)),$ifmatch,n/a)
      _hadd %sn size $regml(size, 1)
      _parse %sn result $1-
    }
  }
}
alias -l _recompile {
  var %i 1
  while ($hget($1, %i).item) {
    .echo -q $hget($1, %i, &item)
    bcopy $2 $calc($bvar($2, 0) + 1) &item 1 $bvar(&item, 0)
    inc %i
  }
  bunset &item
  if ($hget($1)) hfree $1
  return $bvar($2, 0)
}
alias -l _extract {
  var %p $1, %_ih = $false
  if (!$2) return -3
  if ($3) bunset $3
  if (!$regex(extract, $4, <(\w+))) return -2
  var %_rs = $4, %_re = $+(</,$regml(extract, 1),>), %_rc = $+(<,$regml(extract, 1))
  var %_s = $bfind($2, %p, %_rs).text, %_p = %_s, %_e = %_s
  if (%_s == 0) return -1
  ; if there are no closing tags present, we've either got html not xml or invalid (x)html.
  if ($bfind($2, %p, %_re).text == 0) var %_ih = $true
  if ($5) var %_re = $5
  if ($6) var %_rc = $6
  while ($bfind($2, %_p, %_rc).text > 0) {
    var %_v1 = $v1, %_p = $calc(%_v1 + 1)
    if ((%_ih) && ($bfind($2, %_p, %_rc).text > 0)) {
      var %_e = $v1, %_et = %_e
      break
    }
    if ((%_v1 < %_e) || (%_e == %_s)) var %_e = $bfind($2, $calc(%_e + 1), %_re).text, %_et = $calc(%_e + $len(%_re))
    else break
  }
  if ($3) bcopy -c $3 1 $2 %_s $calc(%_et - %_s)
  return $iif(%_e > 0, %_et, 0)
}

;
; Main Input Alias
;
alias -l _input {
  if (!$_chan($1)) || (!$_ini(set, online)) { return }
  var %l 1, %i 1, %c 0
  while (%i <= $calc($0 - 3)) {
    var %m = $gettok($4-,%i,32)
    if (($left(%m,2) iswm -l) && ($right(%m,-2) > 0)) { var %l $right(%m,-2) }
    elseif (%m == -i) { var %c 1 }
    else { break }
    inc %i
  }
  var %t = $gettok($4-, $+(%i,-), 32)
  if (!%t) {
    _msg $1 $2 $3 3 $decode(Akdvb2dsZSBTZWFyY2ggdjEuOTMCIGJ5IE1laWogPG1laWppZUBnbWFpbC5jb20+,m)
    _msg $1 $2 $3 3 $eval($decode(AlVzYWdlAjogJF9pbmkoc2V0LCB0cmlnZ2VyKSBbb3B0aW9uc10gPHNlYXJjaD4=,m),2)
    _msg $1 $2 $3 3 $decode(Ak9wdGlvbnMCOg==,m)
    _msg $1 $2 $3 3 $decode(AiACIAIgAiACIAJMaW1pdCBSZXN1bHRzOiAtbE4gKHdoZXJlIE4gaXMgdGhlIG51bWJlciBvZiByZXN1bHRzIHRvIGxpc3Qp,m)
    _msg $1 $2 $3 3 $decode(AiACIAIgAiACIAJTZWFyY2ggSW5mbzogLWkgKGRpc3BsYXR5cyBzb21lIG1pc2Mgc2VhcmNoIGluZm8gd2l0aCByZXN1bHRzKQ==,m)
    _msg $1 $2 $3 3 $eval($decode(AkV4YW1wbGU6AiAkX2luaShzZXQsIHRyaWdnZXIpIC1pIC1sMTAgbUlSQw==,m),2)
    return
  }
  if ($_ini(set, max) < %l) { var %l $ifmatch }
  ; Format:
  ;  1 = channel the trigger was activated from
  ;  2 = network scid
  ;  3 = nickname of the person who activated it
  ;  4 = how many results to list (1, this is default)
  ;  5 = display misc search info (0 = off, 1 = on)
  ;  6 = search string
  sockmark $_open $1 $2 $3 %l %c %t
}

;
; Queue Aliases
;
alias -l _msg {
  set %queue._google. [ $+ [ $calc($_info(0) + 1) ] ] $1-
  if (!$timer(_google)) { .timer_google -m 0 2000 _say }
}
alias -l _info {
  if ($1 isnum) {
    if (%queue._google. [ $+ [ $1 ] ]) && ($1 > 0) { return %queue._google. [ $+ [ $1 ] ] }
    elseif ($1 == 0) { return $var(%queue._google.*) }
  }
}
alias -l _say {
  var %i 1
  if (%queue._google. [ $+ [ %i ] ]) {
    tokenize 32 %queue._google. [ $+ [ %i ] ]
    scid $2
    if ($3 ison $1) && ($me ison $1) && ($5) {
      if ($4 == 1) { msg $1 $5- }
      elseif ($4 == 2) { .msg $3 $5- }
      else { .notice $3 $5- }
    }
    unset %queue._google. [ $+ [ %i ] ] | var %h $calc(%i + 1)
    while (%queue._google. [ $+ [ %h ] ]) { set %queue._google. [ $+ [ $calc(%h - 1) ] ] %queue._google. [ $+ [ %h ] ] | unset %queue._google. [ $+ [ %h ] ] | inc %h }
  }
  else { .timer_google off }
}

;
; Socket Aliases
;
alias -l _open {
  :name
  var %s = $+(_google.,$md5($ticks))
  if ($sock(%s)) { goto name }
  if ($_ini(set, proxy)) {
    if ($_ini(set, host)) && ($_ini(set, port)) { sockopen %s $_ini(set, host) $_ini(set, port) }
    else { echo -ta [Google] Error: please specify a hostname and port number in the proxy settings }
  }
  else { sockopen %s www.google.com 80 }
  return %s
}

;
; Misc Aliases
;
alias -l _ban {
  var %i 1
  while (%i <= $ini($scriptdirgoogle.set, ban, 0)) {
    var %x = $readini($scriptdirgoogle.set, n, ban, $ini($scriptdirgoogle.set, ban, %i))
    if ($1 isnum) && ($1 == %i) { return %x }
    elseif (%x iswm $1) { return 0 }
    inc %i
  }
  return $iif($1 == 0,$calc(%i - 1), 1)
}
alias -l _item {
  var %i 1
  while ($hget($1,%i).item) { inc %i }
  return %i
}
alias -l _regexp {
  var %i 1, %l quot 34|lt 60|lg 62|amp 38|nbsp 32, %m $1
  while ($regex(regexp, %m, /(&#(\d{1,3});)/s)) { var %m = $replace(%m, $regml(regexp, 1), $chr($regml(regexp, 2))) }
  .echo -q $regsub(%m, /<[^>]+>/g,, %m)
  while (%i <= $gettok(%l,0,124)) {
    var %t = $gettok(%l,%i,124)
    .echo -q $regsub(%m, $+(/&,$gettok(%t,1,32),;/g), $chr($gettok(%t,2,32)), %m)
    inc %i
  }
  .echo -q $regsub(%m, /&[^;]+;/g,, %m)
  return %m
}
alias -l _mode { return $iif($_ini(set, msgmode), $ifmatch, 1) }
alias -l _encode {
  var %s, %p = $len($1-)
  while (%p) {
    if ($mid($1-,%p,1) isalnum) { %s = $+($ifmatch,%s) }
    else { %s = $+(%,$base($asc($mid($1-,%p,1)),10,16),%s) }
    dec %p
  }
  return %s
}
alias -l _ini {
  if ($isid) { return $readini($scriptdirgoogle.set, n, $1, $$2) }
  elseif ($3) { writeini $+(",$scriptdir,google.set,") $1 $2 $$3- }
  else { remini $+(",$scriptdir,google.set,") $$1 $2 }
}
alias -l _trigger {
  if ($1 == $_ini(set, trigger)) { return 1 }
  return 0
}
alias -l _chan {
  if ($_ini(set, all)) { return 1 }
  var %i 1, %l $_ini(set, networks)
  while (%i <= $gettok(%l, 0, 44)) {
    var %n = $gettok(%l, %i, 44)
    if (%n == $network) {
      var %j 1
      while (%j <= $gettok($_ini(set, $+(.,%n)), 0, 44)) {
        var %c = $gettok($_ini(set, $+(.,%n)), %j, 44)
        if (%c == $1) { return 1 }
        inc %j
      }
    }
    inc %i
  }
}

;
; Output Parsing Aliases
;
alias -l _mini {
  var %i 1, %l
  while (%i <= $ini($scriptdirgoogle.set, $1, 0)) {
    var %m = $ini($scriptdirgoogle.set, $1, %i)
    if ($iif($3,$3-,*) iswm %m) { var %l = $addtok(%l, %m, 44) }
    inc %i
  }
  var %l = $sorttok(%l, 44)
  return $iif($2 == 0, $gettok(%l, 0, 44), $gettok(%l, $2, 44))
}
alias -l _hadd { hadd -mcu300 $1 $$2 $3- }
alias -l _codes {
  var %i 1, %o $$1-, %r = $+(/&b\^/g 2|/&u\^/g 31|/&o\^/g 15|/&k\^/g 3|/&r\^/g 22)
  while (%i <= $gettok(%r, 0, 124)) {
    var %t = $gettok(%r, %i, 124)
    .echo -q $regsub(%o, $gettok(%t, 1, 32), $iif($gettok(%t, 2, 32) isnum, $chr($ifmatch), $ifmatch), %o)
    inc %i
  }
  return %o
}
alias -l _parse {
  var %i 1, %m $+($2,_*), %s $3-
  _hadd $1 chan $gettok(%s, 1, 32)
  _hadd $1 nick $gettok(%s, 3, 32)
  _hadd $1 limit $gettok(%s, 4, 32)
  _hadd $1 search $gettok(%s, 6-, 32)
  while (%i <= $_mini(outp, 0, %m)) {
    var %e = $_mini(outp, %i, %m), %l = $_codes($_ini(outp, %e)), %j 1, %o %l
    while (%j <= $hget($1, 0).item) {
      .echo -q $regsub(%o, $+(/&,$hget($1, %j).item,\^/g), $hget($1, $hget($1, %j).item), %o)
      inc %j
    }
    inc %i
    if ($regex(%l, /&[^&]*?\^/g) != $regex(%o, /&[^&]*?\^/g)) {
      .echo -q $regsub(%o,/&[^&]*?\^/g,n/a, %o)
      _msg $gettok(%s, 1, 32) $gettok(%s, 2, 32) $gettok(%s, 3, 32) $_mode %o
    }
  }
  if ($hget($1)) { hfree $1 }
}

;
; Dialog Stuff
;
alias _google { if (!$dialog(_google)) { dialog -m _google _google } }
alias -l _cmbload {
  var %i 1
  while (%i <= $gettok($_ini($3, $4),0,44)) {
    did -a $1 $2 $gettok($_ini($3, $4),%i,44)
    inc %i
  }
}
alias -l _cmbsave {
  var %i 1, %j
  while ($did($1,$2,%i).text) {
    var %j = $+($iif(%j,$+(%j,$chr(44))),$did($1,$2,%i).text)
    inc %i
  }
  return %j
}
alias -l _replace { return $replace($$1-, $chr(2), &b^, $chr(31), &u^, $chr(15), &o^, $chr(3), &k^, $chr(22), &r^)) }
dialog _google {
  title "Google Search - Settings [/_google]"
  size -1 -1 190 102
  option dbu
  combo 5, 0 9 60 72, sort size
  combo 1, 61 9 61 72, sort size
  button "Done", 2, 74 93 37 9, ok cancel
  edit "", 3, 127 37 60 10
  text "Trigger:", 4, 127 30 20 7
  text "Channels", 6, 80 1 23 7
  text "Networks", 7, 18 1 24 7
  button "Add", 8, 61 81 16 9
  button "Rem", 9, 78 81 16 9
  button "Add", 10, 0 81 16 9
  button "Rem", 11, 17 81 16 9
  check "All", 16, 106 81 17 10
  check "Enable Script", 15, 128 48 46 9
  combo 12, 127 19 60 43, size drop
  box "Options", 13, 124 6 66 85
  text "Message Mode", 14, 127 12 37 7
  button "Ban List", 20, 127 59 60 9
  button "Proxy Settings", 17, 127 69 60 9
  button "Configure Output", 18, 127 79 60 9
}
dialog _google.proxy {
  title "Google Search - Proxy Settings"
  size -1 -1 164 19
  option dbu
  button "Done", 1, 62 10 37 9, ok cancel
  text "Host:", 2, 0 1 14 8, right
  edit "", 3, 15 0 102 10
  text "Port:", 4, 118 1 13 8, right
  edit "", 5, 132 0 31 10
  check "Enabled", 6, 133 10 30 9
}
dialog _google.ban {
  title "Google Search - Ban List"
  size -1 -1 190 102
  option dbu
  combo 1, 1 1 188 92, size
  button "Done", 2, 74 93 37 9, ok cancel
  button "Add", 3, 0 93 16 9, default
  button "Rem", 4, 17 93 16 9
}
dialog _google.output {
  title "Google Search - Configure Output"
  size -1 -1 190 102
  option dbu
  edit "", 1, 0 12 190 80, multi return autohs autovs vsbar
  combo 2, 1 1 60 50, size drop
  text "", 3, 136 3 51 8, hide
  button "Done", 4, 74 93 37 9, ok cancel
}
on *:DIALOG:_google:*:*: {
  if ($devent == init) {
    if ($_ini(set, online)) { did -c $dname 15 }
    did -a $dname 12 Channel
    did -a $dname 12 Private
    did -a $dname 12 Notice
    did -c $dname 12 $iif($_ini(set, msgmode),$ifmatch,1)
    did -ra $dname 3 $_ini(set, trigger)
    _cmbload $dname 5 set networks
    if ($_ini(set, all)) { did -c $dname 16 | did -b $dname 1,5,8,9,10,11 }
    else { did -c $dname 5 1 }
    if ($did($dname,5,1).text) {
      _cmbload $dname 1 set . $+ $did($dname,5,1)
    }
  }
  if ($devent == sclick) {
    if ($did == 19) { run $did($dname,19).text }
    if ($did == 17) { if (!$dialog(_google.proxy)) { dialog -ma _google.proxy _google.proxy } }
    if ($did == 20) { if (!$dialog(_google.ban)) { dialog -ma _google.ban _google.ban } }
    if ($did == 18) { if (!$dialog(_google.output)) { dialog -ma _google.output _google.output } }
    if ($did == 12) { _ini set msgmode $did($dname,12).sel }
    if ($did == 15) { _ini set online $did($dname,15).state }
    if ($did == 16) {
      _ini set all $did($dname,16).state
      if ($did($dname,16).state == 1) {
        did -u $dname 5
        did -b $dname 1,5,8,9,10,11
      }
      else {
        did -e $dname 1,5,8,9,10,11
        if ($did($dname,5,1).text) {
          did -c $dname 5 1
          did -r $dname 1
          _cmbload $dname 1 set . $+ $did($dname,5,1)
        }
        did -f $dname 5
      }
    }
    if ($did == 5) && ($did($dname,5).sel isnum) {
      did -r $dname 1
      _cmbload $dname 1 set . $+ $did($dname,5,$did($dname,5).sel)
    }
    if ($did == 10) && (!$did($dname,5).sel) && ($did($dname,5).text) {
      did -a $dname 5 $did($dname,5).text
      did -c $dname 5 $did($dname,5).lines
      _ini set networks $_cmbsave($dname,5)
      did -r $dname 1
      _cmbload $dname 1 set . $+ $did($dname,5).text
      did -f $dname 5
    }
    if ($did == 11) && ($did($dname,5).sel isnum) {
      var %s $did($dname,5).sel
      did -d $dname 5 %s
      _ini set networks $_cmbsave($dname,5)
      did -r $dname 1
      while (%s > 0) {
        if ($did($dname,5,%s).text) {
          did -c $dname 5 %s
          _cmbload $dname 1 set . $+ $did($dname,5,%s)
          break
        }
        dec %s
      }
      did -f $dname 5
    }
    if ($did == 8) && (!$did($dname,1).sel) && ($did($dname,1).text) && ($did($dname,5).seltext) {
      var %t $did($dname,1).text
      did -a $dname 1 $iif($left(%t,1) != $chr(35),$+($chr(35),%t),%t)
      did -c $dname 1 $did($dname,1).lines
      _ini set $+(.,$did($dname,5).seltext) $_cmbsave($dname,1)
      did -f $dname 1
    }
    if ($did == 9) && ($did($dname,1).sel isnum) {
      var %s $did($dname,1).sel
      did -d $dname 1 %s
      _ini set $+(.,$did($dname,5).seltext) $_cmbsave($dname,1)
      while (%s > 0) {
        if ($did($dname,1,%s).text) {
          did -c $dname 1 %s
          break
        }
        dec %s
      }
      did -f $dname 1
    }
  }
  if ($devent == close) {
    if ($did($dname,3).text) { _ini set trigger $iif($gettok($did($dname,3).text, 1, 32),$ifmatch,!google) }
  }
}
on *:DIALOG:_google.proxy:*:*: {
  if ($devent == init) {
    did -a $dname 3 $_ini(set, host)
    did -a $dname 5 $_ini(set, port)
    if (!$_ini(set, proxy)) || (!$_ini(set, host)) || (!$_ini(set, port)) { did -b $dname 3,5 }
    else { did -c $dname 6 }
  }
  elseif ($devent == sclick) {
    if ($did == 6) {
      _ini set proxy $did($dname,6).state
      if ($did($dname,6).state == 1) { did -e $dname 3,5 }
      else { did -b $dname 3,5 }
    }
  }
  elseif ($devent == close) {
    _ini set host $did($dname,3).text
    _ini set port $did($dname,5).text
  }
}
on *:DIALOG:_google.ban:*:*: {
  if ($devent == init) {
    var %i 1
    while (%i <= $_ban(0)) {
      did -a $dname 1 $_ban(%i)
      inc %i
    }
  }
  elseif ($devent == sclick) {
    if ($did == 3) && ($did($dname, 1).text) {
      did -a $dname 1 $did($dname, 1).text
      did -c $dname 1 $did($dname,1).lines
      did -f $dname 1
    }
    if ($did == 4) && ($did($dname, 1).sel) {
      var %s $did($dname, 1).sel
      did -d $dname 1 %s
      while (%s > 0) {
        if ($did($dname,1,%s).text) {
          did -c $dname 1 %s
          break
        }
        dec %s
      }
      did -f $dname 1
    }
    else { did -f $dname 1 }
  }
  elseif ($devent == close) {
    _ini ban
    var %i 1
    while (%i <= $did($dname, 1).lines) {
      _ini ban %i $did($dname, 1, %i)
      inc %i
    }
  }
}
on *:DIALOG:_google.output:*:*: {
  if ($devent == init) {
    did -r $dname 1,2,3
    did -a $dname 2 Result
    did -a $dname 2 Info
    did -a $dname 2 None
    did -a $dname 2 Error
    did -c $dname 2 1
    var %i 1, %n $_mini(outp, 0, result_*)
    while (%i <= %n) {
      var %s = $_mini(outp, %i, result_*)
      var %o = $+(%o,$_ini(outp, %s),$iif(%i != %n,$crlf))
      inc %i
    }
    did -a $dname 1 %o
    did -j $dname 1
    did -c $dname 1 1
    did -a $dname 3 $did($dname, 2).text
  }
  if (($devent == sclick) && ($did == 2) && ($did($dname, 1).edited)) || (($devent == close) && ($did($dname, 1).edited)) {
    var %m = $+($lower($did($dname, 3).text),_*)
    var %i 1
    while (%i <= $_mini(outp, 0, %m)) {
      _ini outp $_mini(outp, %i, %m)
      inc %i
    }
    var %i 1
    while (%i <= $did($dname, 1).lines) {
      var %m = $+($lower($did($dname, 3).text),_,%i)
      var %t = $did($dname, 1, %i).text
      if (%t) {
        _ini outp %m $_replace(%t)
        inc %i
      }
      else { did -d $dname 1 %i }
    }
  }
  if ($devent == sclick) {
    if ($did == 2) {
      did -ra $dname 3 $did($dname, 2).text
      did -r $dname 1
      var %i 1, %n $_mini(outp, 0, $+($did($dname,2).seltext,_*))
      while (%i <= %n) {
        var %s = $_mini(outp, %i, $+($did($dname,2).seltext,_*))
        var %o = $+(%o,$_ini(outp, %s),$iif(%i != %n,$crlf))
        inc %i
      }
      did -a $dname 1 %o
      did -j $dname 1
      did -c $dname 1 1
    }
  }
}

#google end


on *:text:*:#: { 
  if  (!ping isin $strip($1-)  || *ping*plz* iswm $strip($1-) || *ping*please* iswm $strip($1-)) && ( %ping == on ) {
    ctcp $nick ping | set -u60 %ping. [ $+ [ $nick ] ] $ticks
  }
}
on *:ctcpreply:ping*: {
  if ( $2 isnum && %ping. [ $+ [ $nick ] ] ) && ( %ping == on ) {
    var %xtick = $calc( ( $ticks - %ping. [ $+ [ $nick ] ] ) / 1000)
    notice $nick 15(1pong04!15) 1Lag Reply7 $nick 1is4 %xtick 1second(s) | .splay -a sounds/ping.wav 
    unset %ping. [ $+ [ $nick ] ] 
  }
}


on 1:quit: {
  if ($2 != $null) && ($3 == $null) {
    if (. isin $1) && (. isin $2) {
      if ($1 == %split.1) && ($2  == %split.2) goto next
      set %split.1 $1
      set %split.2 $2
      timer 1 15 unset %split.*      
      if (%nsalert = on) { echo -s (Netsplit Detector) Netsplit between $1 and $2 | .splay -a sounds/netsplitx.wav }
      :next
    }
  }
}
#slapanswear off
on *:ACTION:*:#:{ if ($me isin $1-) { inc %aksi | if (%aksi < 3 ) { describe $chan $replace($1-,$me,$nick) | .timeraksi 1 20 unset %aksi | .splay -a sounds/slap.wav } } }
#slapanswear end
}
