\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ g0eZ Rusuh \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
================================================================================================================================================================================================================================================================================================================================================================================================
\on 1:CONNECT:{ reply | ignore -r | whois $me | if (%aping == on) { .timer $+ p $+ $cid 0 120 .ctcp $me PING } | if (%aidle == on) { set %idle $+ $cid 0 | .timer $+ i $+ $cid 0 15 idle } }
\on !@333:JOIN:#: { if ($me isop $chan) kick $chan $nick $km }
ON ^1:JOIN:#:{ if ($nick == $me) { .timer 1 3 cek # } | if ($query($nick)) { echo $nick $jam 10[3 g0eZ si $nick join $chan 10] } }
on ^1:QUIT: { if ($query($nick)) { echo $nick $jam 10[4 g0eZ,3 LAPOR!!!9 $nick 9Quit 10] | if ($1- != $null) echo $nick $jam 10[3 $1- 10] } }
on ^1:PART:#: { if ($query($nick)) { echo $nick $jam 10[3 Hmmm boz $nick part $chan 10] | if ($1- != $null) echo $nick $jam 10[3 $1- 10] } }
on ^1:KICK:#: { if ($query($knick)) { echo $knick $jam 10[3 wedew $knick di kick di $chan 10] | if ($1- != $null) echo $knick $jam 10[3 $1- 10] } }
\on 1:OP:#:{ if (%tt) { dop %tt | unset %tt } | if ($opnick == $me) && ($ulist(*!*@*,333,0) == 1) { echo mkick! | mk } | if ($opnick == $me) { var %x = $nick($chan,0) | while %x { if ($level($nick($chan,%x)) == 333) { MODE $chan -o $nick($chan,%x) | raw -q kick $chan $nick($chan,%x) $km } | dec %x } } }
on 1:DEOP:#:{ if ($opnick == $me) && ($nick != $me) && (services !isin $nick) { if ($nick != ChanServ) { cs deop $chan $nick } | cs op $chan $me | set -u60 %tt $nick } }
\on 1:UNBAN:#:{ if ($nick != $me) && ($ulist($banmask,333,0) != 0) mode # +b $banmask }
on 1:NICK:{ if ($nick == $me) { if (%aping == on) { .timer $+ p $+ $cid 0 120 .ctcp $newnick PING } } | if ($query($nick)) { echo $nick $jam 10[3 lapor boz!!, $nick jembot mau nyamar dadi $newnick 10] } | if ($query($newnick)) { echo $newnick $jam 10[3 Wow, $nick nyamar dadi $newnick 10] } }
on 1:NOTICE:*If this is*:?:{ if ($nick == nickserv) .timern 1 3 ident }
on 1:NOTICE:*seconds to identify*:?:{ if ($nick == nickserv) .timern 1 1 ident }
on 1:TEXT:*This nick*:?:{ if ($nick == nickserv) .timern 1 3 ident }
on 1:NOTICE:*any bans*:?:{ if ($nick == ChanServ) j $remove($6,) }
on 1:NOTICE:*no bans*:?:{ if ($nick == ChanServ) j $remove($8,) }
on 1:NOTICE:*being masskicked*:?:{ if ($nick == ChanServ) .timera 2 10 j $remove($3,) }
on 1:NOTICE:*unable to rejoin*:?:{ chanserv unban $1 $me }
on 1:TEXT:*unable to rejoin*:?:{ chanserv unban $1 $me }
alias cek { var %q.m = $query(0), %n.m = $nick($1,0), %n.l = 0, %q.l = 0 | :res | inc %n.l | %q.m = $query(0) | %q.l = 0 | :lo | inc %q.l | if ($query(%q.l) == $nick($1,%n.l)) && ($query(%q.l) != $null) { echo $query(%q.l) $jam 10[3 jancok $query(%q.l) spam boz neng $1 10] } | if (%q.l < %q.m) { goto lo } | if (%n.l < %n.m) { goto res } }
\on 1:START:{ .titlebar | clsawal | if (%aidle == $null) { %aidle = on } | if (%aclone == $null) { %aclone = on } | if (%aping == $null) { %aping = on } | if (%atulis == $null) { %atulis = on } | if (%akban = $null) { %akban = on } | if (%asalam = $null) { %asalam = on } }
\on 1:EXIT:{ unset %idle* %mmp3* %bla* %t* %b* %quiz* %game* %q* %XMP* %myt* %rain* %ctcp* %cer* %un* %paste* %cuaca* %greet* %fuck* %time* %alarm* %info* %add* %ardan* %family* %suno* %gbot* %sBot* %tm* %gbot* %mp* %ColorP* | .rlevel 333 }
================================================================================================================================================================================================================================================================================================================================================================================================
#alias
alias o { cs op # $me }
alias vm { cs voice # $me }
alias hom { cs halfop # $me }
alias dom { mode # -o+h-h+v $me $me $me $me }
alias do { mode # -o+v $me $me }
alias dvm { cs devoice # $me }
alias dhm { cs dehalfop # $me }
alias iden if $1 != $null { .identd on $1 | .emailaddr $1 $+ @ } | if $2 != $null .fullname $2- 
alias id { identify $$?="Nick:" $$?*="Password:" }
alias ident { var %i = $$?*="Password:" | identify %i }
alias mass { if ($1) { var %t.o = a | var %t.two = $2 } | else { var %t.o = $2 | var %t.two = r } | if ($3 == $null) { var %t.c = $active } | else { var %t.c = $3 } | if ($me !isop %t.c) { return } | var %i = 1, %z = 0 | :ml | if ($nick(%t.c,%i,%t.o,%t.two) != $null) { if ($nick(%t.c,%i,%t.o,%t.two) == $me) { inc %i 1 | goto ml } | var %t.dop = %t.dop $nick(%t.c,%i,%t.o,%t.two) | inc %i 1 | inc %z 1 | if (%z == 4) { .quote MODE %t.c $iif($1 == $true,+,-) $+ $2 $+ $2 $+ $2 $+ $2 %t.dop | unset %t.dop | var %z = 0 } | goto ml } | if (%t.dop != $null) { .quote MODE %t.c $iif($1 == $true,+,-) $+ $str($2,%z) %t.dop } }
alias md { mass $false o $1 }
alias mdv { mass $false v $1 }
alias mdop { mass $false o $1 }
alias mop { mass $true o $1 }
alias mh { mass $true h $1 }
alias mdh { mass $false h $1 }
alias mub { ub }
alias mv { mass $true v $1 }
alias mh { mass $true h $1 }
alias op { .quote MODE $active +o $1 }
alias dop { .quote MODE $active -o $1 }
alias v { .quote MODE $active +v $1 }
alias h { .quote MODE $active +h $1 }
alias dv { .quote MODE $active -v $1 }
alias dh { .quote MODE $active -h $1 }
alias j { .join #$$1 $2- }
alias w { whois $1 }
alias prot { mode # +eee $+($me,!*@*) $+(*!*,$right($remove($ial($me).user,~),9),@*) $+(*!*@,$$ial($$me).host) | mode # +III $+($me,!*@*) $+(*!*,$right($remove($ial($me).user,~),9),@*) $+(*!*@,$$ial($$me).host) }
alias deprot { mode # -eee $+($me,!*@*) $+(*!*,$right($remove($ial($me).user,~),9),@*) $+(*!*@,$$ial($$me).host) | mode # -III $+($me,!*@*) $+(*!*,$right($remove($ial($me).user,~),9),@*) $+(*!*@,$$ial($$me).host) }
alias prot1 { mode # +eee $+($$1-,!*@*) $+(*!*,$right($remove($ial($$1-).user,~),9),@*) $+(*!*@,$$ial($$1-).host) | mode # +III $+($$1-,!*@*) $+(*!*,$right($remove($ial($$1-).user,~),9),@*) $+(*!*@,$$ial($$1-).host) }
alias deprot1 { mode # -eee $+($$1-,!*@*) $+(*!*,$right($remove($ial($$1-).user,~),9),@*) $+(*!*@,$$ial($$1-).host) | mode # -III $+($$1-,!*@*) $+(*!*,$right($remove($ial($$1-).user,~),9),@*) $+(*!*@,$$ial($$1-).host) }
alias ub { if ($me !isop $active) { } | elseif ($1 != $null) { mode # -b $$1- } | elseif ($version < 5.71) || (($version > 5.7) && ($chan($active).banlist != $true)) { unset %t.r | set %t.r $addtok(%t.r,$active,44) | .quote MODE $active +b } | elseif ($chan($active).banlist == $true) { :b | inc %t.n | if ($ibl($active,%t.n) != $null) { mode $chan -b $ibl($active,%t.n) | goto b } | unset %t.n %t.r } }
alias kban { if ($1) { if ($me isop #) { mode # +bbb $+($1,!*@*) $+(*!*,$right($remove($ial($1).user,~),9),@*) $+(*!*@,$$ial($$1).host) | kick # $1 $iif($2,$2-,$km) } } }
alias banall { if ($me isop #) { mode # +b *!*@* } | else { cs # ban *!*@* } }
alias k { if $2 == $null { kick # $$1 [- 3 $km -] } | else { kick # $$1 12D4e12t4e12c4t 12!4S12h4i12f4t12! 4P12r04o12t04e12c04t 12b04y9 $me 12G4e12t 4 } }
alias csk { if $2 == $null { cs kick # $$1 $str($chr(3),250) } | else { cs kick # $$1 $2- $+ $str($chr(3),250) } }
alias cskb { if $2 == $null { cs kickban # $$1 $str($chr(3),250) } | else { cs kickban # $$1 $2- $+ $str($chr(3),250) } }
alias masskick { %i = 0 | :next1 | inc %i | if (%i > $nick(#,0)) { halt } | if ($me !isop #) { haltdef | %i = $nick(#,0) } | if ($nick(#,%i) != $me) { kick # $nick(#,%i) $km } | goto next1 | unset %i }
alias masskickban { %i = 0 | :next4 | inc %i | if (%i > $nick(#,0)) { halt } | if ($me !isop #) { halt } | if ($nick(#,%i) != $me) && ($me isop $chan) { ban # $nick(#,%i) 2 } { kick # $nick(#,%i) $km } | goto next4 | unset %i }
#alisa end
