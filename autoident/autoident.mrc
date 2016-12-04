
alias -l pop tokenize 32 $dll($pdll.ident,Popup,$1-) | if ($isid) return $1- | $iif($4- != did not select a menu item,$4-)
alias -l popup return $shortfn($scriptdirdll\popups.dll)
alias -l pdll.ident { return $+(",$scriptdirdll\popups.dll,") }
alias -l ident.error { dialog -m ident.error ident.error | did -f ident.error 2 | did -ra ident.error 1 $1- }
alias -l `b.i.f { if ($isfile($+(",$scriptdirsettings.ini,"))) return $readini $+(",$scriptdirsettings.ini,") $1 $2- }
alias -l `t.i.f { writeini $+(",$scriptdirsettings.ini,") $$1- }
alias -l views.ident { return $scriptdirdll\views.mdx }
alias -l data_txt { return $+(",$scriptdirdata.txt,") }
alias -l mdx.ident { return $+(",$scriptdirdll\mdx.dll,") }
alias -l ident.clear { write -c $+(",$scriptdirdata.txt,") | auto_load }
alias -l ident.edit { $iif(!$dialog(ident.edit),dialog -m ident.edit ident.edit) }
alias -l aboutident { $iif(!$dialog(aboutident),dialog -m aboutident aboutident) }
alias -l auto_ident_dialog_option { $iif(!$dialog(auto_ident_dialog_option),dialog -m auto_ident_dialog_option auto_ident_dialog_option) }
alias -l ident.unset { 
  unset %addnick.2 %addnet.2 %addcom.2 %addpass.2 %identify*
}
alias -l auto_load {
  did -r auto_ident_dialog 1
  var %a = 1
  while (%a <= $lines($data_txt)) {
    did -a auto_ident_dialog 1 $gettok($read($data_txt,%a),1,149) $chr(9) $gettok($read($data_txt,%a),2,149) $chr(9) $gettok($read($data_txt,%a),3,149) $chr(9) $str(*,$len($gettok($read($data_txt,%a),4,149)))
    inc %a
  }
}
alias -l auto_load2 {
  did -r auto_ident_dialog 1
  var %a = 1
  while (%a <= $lines($data_txt)) {
    did -a auto_ident_dialog 1 $gettok($read($data_txt,%a),1,149) $chr(9) $gettok($read($data_txt,%a),2,149) $chr(9) $gettok($read($data_txt,%a),3,149) $chr(9) $gettok($read($data_txt,%a),4,149)
    inc %a
  }
}
alias -l auto_add {
  var %addnick = $?="Nick? (example: SubZ)",%addnet = $?="Network? (example: Rizon)"
  var %addcom = $?="Identify Command? (example: /ns identify)",%addpass = $?="Password?"
  if (*#* iswm %addnet) || (*;* iswm %addnet) || (*$* iswm %addnet) || (*^* iswm %addnet) || (*&* iswm %addnet) { 
    ident.error Can't add simbols in network name. $chr(40) $+ %addnet $+ $chr(41) | halt 
  }
  elseif (*#* iswm %addcom) || (*;* iswm %addcom) || (*$* iswm %addcom) || (*^* iswm %addcom) || (*&* iswm %addcom) { 
    ident.error Can't add simbols in identify commands. $chr(40) $+ %addcom $+ $chr(41) | halt 
  }
  else { 
    if (%addnick) && (%addnet) && (%addcom) && (%addpass) {
      write $data_txt $+(%addnick,$chr(149),%addnet,$chr(149),%addcom,$chr(149),%addpass)
    }
  }
  $iif($`b.i.f(ident,hide),auto_load)
  $iif(!$`b.i.f(ident,hide),auto_load2)
}
alias aident { $iif(!$dialog(auto_ident_dialog),dialog -m auto_ident_dialog auto_ident_dialog) }
alias auto_ident {
  if ($`b.i.f(ident,on)) {
    var %a = 1
    while (%a <= $lines($data_txt)) {
      set %identify-command $gettok($read($data_txt,%a),3,149)
      set %identify-pass $gettok($read($data_txt,%a),4,149)
      set %identify-me $gettok($read($data_txt,%a),1,149)
      set %identify-network $gettok($read($data_txt,%a),2,149)
      if ($network == %identify-network) if ($me == %identify-me) $chr(47) $+ %identify-command %identify-pass
      inc %a
      unset %identify*
    }
  }
}
alias -l ident.edit2 { 
  if (!$did(1).sel) {
    ident.error You did not select a line to edit | halt 
  }
  elseif ($did(1).sel) {
    set %identify.edit $calc($did(1).sel - 1) | ident.edit 
  } 
}
alias -l ident.del {
  if (!$did(1).sel) {
    ident.error You did not select a line to delete | halt 
  }
  elseif ($did(1).sel) {
    write -dl $calc($did(1).sel - 1) $data_txt 
    $iif($`b.i.f(ident,hide),auto_load)
    $iif(!$`b.i.f(ident,hide),auto_load2)
  }
}
dialog ident.error {
  title "Error"
  size -1 -1 107 45
  option dbu
  icon $scriptdiricons\error.ico
  icon 2, 3 5 32 32, " $+ $scriptdiricons\error.ico $+ "
  text "null", 1, 20 8 85 20, center
  button "&Ok", 4, 75 30 30 12, ok
}
dialog ident.edit {
  title "Edit"
  size -1 -1 150 93
  option dbu
  icon $scriptdiricons\ai.ico
  button "&Ok",1, 115 80 30 12, default ok
  button "&Cancel",11, 85 80 30 12, cancel
  box "Edit", 2, 3 3 144 75
  edit "", 3, 42 12 100 11, autohs
  edit "", 4, 42 28 100 11, autohs
  edit "", 5, 42 45 100 11, autohs
  edit "", 6, 42 61 100 11, autohs
  text "Nick ", 7, 10 14 30 11
  text "Network ", 8, 10 30 30 11
  text "Command ", 9, 10 47 30 11
  text "Password ", 10, 10 63 30 11
}
dialog auto_ident_dialog_option {
  title "Auto Identify Options"
  size -1 -1 150 99
  option dbu
  icon $scriptdiricons\ai.ico
  box "Nick Recover", 12, 5 5 140 60, 
  check "&Enable" 9, 15 12 30 12,
  text "Nick to recover:", 10, 20 27 70 12,
  edit " ", 11, 60 25 70 11, autohs 
  text "Enter a nick to change back to, when nickserv is down, and you are a guest nick", 13, 15 40 100 25, disable
  check "E&nable", 18, 15 71 30 12
  text "Identify delay", 14, 45 73 40 12, 
  edit " " , 15, 80 72 12 10, 
  text "sec", 16, 95 73 20 12, autohs 
  button "&Ok", 17, 117 85 30 12, default cancel 
}
dialog aboutident {
  title "Auto Identify"
  size -1 -1 250 128
  icon $scriptdiricons\ai.ico
  button Ok,1, 170 95 75 25,ok default
  box About Auto Identify,2, 5 5 290 8
  box "",3, 5 170 240 8
  text Author:,7, 10 25 50 20
  text Version:,8, 10 45 50 20
  text URL:,9, 10 65 50 20
  text AutoIdent,12, 60 45 50 20
  link SubZ,10, 60 25 70 20
  link www.warirc.com,11, 60 65 80 20
}
dialog auto_ident_dialog {
  title "Auto Identify [ /aident ]"
  size -1 -1 199 95
  option dbu
  icon $scriptdiricons\ai.ico, 0
  list 1, 5 5 157 75, size 
  button "&Add", 2, 165 5 30 12, 
  button "&Delete", 3, 165 20 30 12, 
  button "&Edit", 8, 165 35 30 12, 
  button "&Ok", 4, 165 68 30 12, default ok 
  check "E&nable", 5, 5 82 49 12,
  text "__________", 6, 166 47 127 12, disable 
  text "wIRC 6.0 by SubZ", 7, 80 84 60 12, disable
  menu "&File" 100
  item "E&nable", 101 100
  item "&Hide Pass", 104 100
  item "&Clear All", 203 100
  item "break", 102 100
  item "&Exit", 103 100
  menu "O&ptions" 200
  item "&Add", 201 200
  item "break", 206 200
  item "O&ptions", 204 200
  item "Break", 302 300
  item "&About", 303 300
}

on *:dialog:auto_ident_dialog_option:init:*: {
  dll $mdx.ident SetMircVersion $version 
  dll $mdx.ident MarkDialog $dname
  dll $mdx.ident SetFont $dname 12 +a 15 900 verdana
  did $iif($`b.i.f(ident,recover),-c,-u) auto_ident_dialog_option 9
  did $iif($`b.i.f(ident,timer),-c,-u) auto_ident_dialog_option 18
  if ($`b.i.f(ident,recover)) did -e auto_ident_dialog_option 11
  if (!$`b.i.f(ident,recover)) did -b auto_ident_dialog_option 11
  if ($`b.i.f(ident,timer)) did -e auto_ident_dialog_option 15
  if (!$`b.i.f(ident,timer)) did -b auto_ident_dialog_option 15
  did -a $dname 11 $`b.i.f(edit,nick)
  did -a $dname 15 $`b.i.f(edit,timer)
}
on *:dialog:auto_ident_dialog:menu:*: {
  if ($did == 101) {
    $iif($`b.i.f(ident,on),`t.i.f ident on 0,`t.i.f ident on 1) 
    if ($`b.i.f(ident,on)) { did -c auto_ident_dialog 101 | did -c auto_ident_dialog 5 }
    if (!$`b.i.f(ident,on)) { did -u auto_ident_dialog 101 | did -u auto_ident_dialog 5 }
  }
  if ($did == 103) dialog -x auto_ident_dialog auto_ident_dialog
  if ($did == 104) {
    $iif($`b.i.f(ident,hide),`t.i.f ident hide 0,`t.i.f ident hide 1) 
    if ($`b.i.f(ident,hide)) { did -c auto_ident_dialog 104 | auto_load }
    if (!$`b.i.f(ident,hide)) { did -u auto_ident_dialog 104 | auto_load2 }
  }
  if ($did == 201) auto_add
  if ($did == 203) ident.clear
  if ($did == 204) auto_ident_dialog_option
  if ($did == 301) run $+(",$scriptdirreadme.html,")
  if ($did == 303) aboutident
}

on *:dialog:ident.error:init:*: {
  dll $mdx.ident SetMircVersion $version 
  dll $mdx.ident MarkDialog $dname
  dll $mdx.ident SetFont $dname 1 +a 12 900 verdana
}
on *:dialog:auto_ident_dialog:init:*: {
  dll $mdx.ident SetMircVersion $version 
  dll $mdx.ident MarkDialog $dname
  dll $mdx.ident SetControlMDX $dname 1 ListView headerdrag report rowselect showsel nosortheader single > $views.ident
  did -i $dname 1 1 headerdims 80 80 130 100
  did -i $dname 1 1 headertext Nick $chr(9) Network $chr(9) Command $chr(9) Password
  $iif($`b.i.f(ident,on),did -c auto_ident_dialog 5)
  $iif($`b.i.f(ident,on),did -c auto_ident_dialog 101)
  $iif(!$`b.i.f(ident,on),did -u auto_ident_dialog 101)
  $iif($`b.i.f(ident,hide),did -c auto_ident_dialog 104)
  $iif(!$`b.i.f(ident,hide),did -u auto_ident_dialog 104)
  $iif($`b.i.f(ident,hide),auto_load)
  $iif(!$`b.i.f(ident,hide),auto_load2)
}
on *:dialog:aboutident:sclick:*:{
  if ($did == 5) || ($did == 11) url -n http://www.warirc.com
  if ($did == 10) run mailto:subz@warirc.com?subject=wIRC Identify.
}
on *:dialog:auto_ident_dialog:sclick:*: {
  if ($did == 1) {
    if ($gettok($did($dname,1,1),1,32) != rclick) halt
    dll $popup New ident 16 16
    dll $popup LoadImg ident icon small $scriptdir/icons/add.ico
    dll $popup LoadImg ident icon small $scriptdir/icons/del.ico
    dll $popup LoadImg ident icon small $scriptdir/icons/edit.ico
    dll $popup LoadImg ident icon small $scriptdir/icons/options.ico
    dll $popup LoadImg ident icon small $scriptdir/icons/clear.ico
    dll $popup LoadImg ident icon small $scriptdir/icons/ai.ico
    dll $popup AddItem ident end 1 1 &Add $cr auto_add
    dll $popup AddItem ident end $iif($did(1).sel != $null,+,+d) 2 2 &Del $cr ident.del
    dll $popup AddItem ident end
    dll $popup AddItem ident end $iif($did(1).sel != $null,+,+d) 3 3 &Edit $cr ident.edit2
    dll $popup AddItem ident end 4 4 &Options $cr auto_ident_dialog_option
    dll $popup AddItem ident end 5 5 &Clear All $cr ident.clear
    dll $popup AddItem ident end 
    dll $popup AddItem ident end 6 6 A&bout $cr aboutident
    pop ident $mouse.dx $mouse.dy
  }
  if ($did == 2) auto_add 
  if ($did == 3) ident.del
  if ($did == 5) { 
    $iif($`b.i.f(ident,on),`t.i.f ident on 0,`t.i.f ident on 1) 
    if ($`b.i.f(ident,on)) { did -c auto_ident_dialog 101 | did -c auto_ident_dialog 5 }
    if (!$`b.i.f(ident,on)) { did -u auto_ident_dialog 101 | did -u auto_ident_dialog 5 }
  }
  if ($did == 8) ident.edit2
}
on *:dialog:ident.edit:init:*: {
  dll $mdx.ident SetMircVersion $version 
  dll $mdx.ident MarkDialog $dname
  dll $mdx.ident SetFont $dname 2 +a 15 900 verdana
  set %addnick.2 $gettok($read($data_txt,%identify.edit),1,149)
  set %addnet.2 $gettok($read($data_txt,%identify.edit),2,149)
  set %addcom.2 $gettok($read($data_txt,%identify.edit),3,149)
  set %addpass.2 $gettok($read($data_txt,%identify.edit),4,149)
  did -a $dname 2 Edit info for %addnick.2
  did -a $dname 3 %addnick.2
  did -a $dname 4 %addnet.2
  did -a $dname 5 %addcom.2
  did -a $dname 6 %addpass.2
}
on *:dialog:ident.edit:edit:*: {
  set %addnick.2 $did(3).text
  set %addnet.2 $did(4).text
  set %addcom.2 $did(5).text
  set %addpass.2 $did(6).text
}
on *:dialog:auto_ident_dialog_option:close:*: {
  if (!$did(15).text) { ident.error You left a field empty. | halt }
  elseif (*#* iswm %identify.timer) || (*;* iswm %identify.timer) || (*$* iswm %identify.timer) || (*^* iswm %identify.timer) || (*&* iswm %identify.timer) { 
    ident.error Can't add simbols in timer. $chr(40) $+ %identify.timer $+ $chr(41) | halt 
  }
  elseif (%identify.timer) { `t.i.f edit timer %identify.timer }
  elseif (!$did(11).text) { ident.error You left a field empty. | halt }
  elseif (%identify.nick) { `t.i.f edit nick %identify.nick }
  ident.unset
}
on *:dialog:ident.edit:close:*: ident.unset
on *:dialog:auto_ident_dialog_option:sclick:*: {
  if ($did == 9) { 
    $iif($`b.i.f(ident,recover),`t.i.f ident recover 0,`t.i.f ident recover 1) 
    if ($`b.i.f(ident,recover)) did -e auto_ident_dialog_option 11
    if (!$`b.i.f(ident,recover)) did -b auto_ident_dialog_option 11
  }
  if ($did == 18) { 
    $iif($`b.i.f(ident,timer),`t.i.f ident timer 0,`t.i.f ident timer 1) 
    if ($`b.i.f(ident,timer)) did -e auto_ident_dialog_option 15
    if (!$`b.i.f(ident,timer)) did -b auto_ident_dialog_option 15
  }
}
on *:dialog:ident.edit:sclick:1: {
  if (!%addnick.2) || (!%addnet.2) || (!%addcom.2) || (!%addpass.2) { 
    ident.error You left a field empty. | halt 
  }
  elseif (*#* iswm %addnet.2) || (*;* iswm %addnet.2) || (*$* iswm %addnet.2) || (*^* iswm %addnet.2) || (*&* iswm %addnet.2) { 
    ident.error Can't add simbols in network name. $chr(40) $+ %addnet.2 $+ $chr(41) | halt 
  }
  elseif (*#* iswm %addcom.2) || (*;* iswm %addcom.2) || (*$* iswm %addcom.2) || (*^* iswm %addcom.2) || (*&* iswm %addcom.2) { 
    ident.error Can't add simbols in identify commands. $chr(40) $+ %addcom.2 $+ $chr(41) | halt 
  }
  else { 
    write -l %identify.edit $data_txt %addnick.2 $+ $chr(149) $+ %addnet.2 $chr(149) $+ %addcom.2 $chr(149) $+ %addpass.2
    ident.unset
  }
  if ($dialog(auto_ident_dialog)) {
    $iif($`b.i.f(ident,hide),auto_load)
    $iif(!$`b.i.f(ident,hide),auto_load2)
  }
}
on *:dialog:auto_ident_dialog_option:edit:*: {
  if ($did == 11) set %identify.nick $did(11).text
  if ($did == 15) set %identify.timer $did(15).text
}
on *:dialog:aboutident:init:*: {
  dll $mdx.ident SetMircVersion $version 
  dll $mdx.ident MarkDialog $dname
  dll $mdx.ident SetFont $dname 2 +a 15 900 verdana
}
on *:load: { 
  if ($version >= 6.0) { echo -s Welcome to 4wIRC Identify by SubZ | echo -s contact: subz@warirc.com | echo -s website: http://www.warirc.com | aident
  }
  else { echo -a Sorry, you can't use This Script with version $version of mIRC, get the latest version at http://www.mirc.com/ | .unload -rs autoident\autoident.mrc }
}
on *:dialog:auto_ident_dialog:close:*: ident.unset
on *:NOTICE:*:*: {
  if (Nickserv!*service* iswm $fulladdress) && (*owned by* iswm $1-) { 
    if ($`b.i.f(ident,timer)) .timerident2 1 $`b.i.f(edit,timer) auto_ident
    else auto_ident
  }
}
on *:CONNECT: { 
  if (webchat isin $server) umode -M
  if ($`b.i.f(ident,timer)) .timerident 1 $`b.i.f(edit,timer) auto_ident
  else auto_ident
}
on *:NICK:{
  if ($nick == $me) && (Guest* iswm $newnick) && ($`b.i.f(ident,recover)) {
    if ($`b.i.f(edit,nick) !iswm enter-nick) .timernick 1 4 nick $`b.i.f(edit,nick) 
  }
}
