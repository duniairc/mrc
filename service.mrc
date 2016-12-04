dialog webserv {
  title "Services Commands [/services]"
  size -1 -1 168 117
  icon icons\multi.ico
  option dbu
  tab "Chanserv" ,2,2 0 163 90
  tab "Nickserv" ,3
  tab "Memoserv" ,4 
  box "Chanserv Related Commands" ,5,7 16 155 70,tab 2
  button "Info"6,10 25 35 10,tab 2
  button "Uop"7,10 37 35 10,tab 2
  button "Vop"8,10 49 35 10,tab 2
  button "Aop"9,10 61 35 10,tab 2
  button "Sop"10,10 73 35 10,tab 2
  button "Register"11,48 25 35 10,tab 2
  button "Identify"12,48 37 35 10,tab 2
  button "Drop"13,48 49 35 10,tab 2
  button "Acc"14,48 61 35 10,tab 2
  button "Akick"15,48 73 35 10,tab 2
  button "Op"16,86 25 35 10,tab 2
  button "Deop"17,86 37 35 10,tab 2
  button "Voice"18,86 49 35 10,tab 2
  button "Devoice"19,86 61 35 10,tab 2
  button "Invite"20,86 73 35 10,tab 2
  button "Mdeop"21,124 25 35 10,tab 2
  button "Mkick"22,124 37 35 10,tab 2
  button "Unban"23,124 49 35 10,tab 2
  button "Count"24,124 61 35 10,tab 2
  button "Why"25,124 73 35 10,tab 2
  box "Nickserv Related Commands" ,26,7 16 155 70,tab 3
  button "Register"27,10 30 35 12,tab 3
  button "Identify"28,10 45 35 12,tab 3
  button "Access"29,10 60 35 12,tab 3
  button "Recover"32,48 30 35 12,tab 3
  button "Ghost"33,48 45 35 12,tab 3
  button "Drop"34,48 60 35 12,tab 3
  button "Watch"37,85 30 35 12,tab 3
  button "Buddy"38,85 45 35 12,tab 3
  button "Release"39,85 60 35 12,tab 3
  button "Info"42,123 30 35 12,tab 3
  button "Auth"43,123 45 35 12,tab 3
  button "Listchans"44,123 60 35 12,tab 3
  box "Memoserv Related Commands" ,47,7 16 155 70,tab 4
  button "Send"48,10 27 35 11,tab 4
  button "Sendto"49,10 40 35 11,tab 4
  button "List"50,10 53 35 11,tab 4
  button "Read"51,10 66 35 11,tab 4
  button "Del"53,48 27 35 11,tab 4
  button "Forward"54,48 40 35 11,tab 4
  button "Expunge"55,48 53 35 11,tab 4
  button "Close"56,48 66 35 11,tab 4
  button "Stat"58,85 27 35 11,tab 4
  button "Create"59,85 40 35 11,tab 4
  button "Undel"60,85 53 35 11,tab 4
  button "Select"61,85 66 35 11,tab 4
  button "Move"63,123 27 35 11,tab 4
  button "Ignore"64,123 40 35 11,tab 4
  button "Keep"65,123 53 35 11,tab 4
  box "Services Setting Commands" ,70, 5 93 111 22
  button "NickServ Setting" ,71, 10 101 50 10
  button "ChanServ Setting" ,72,62 101 50 10
  button "&OK" ,200, 123 99 39 13  ,ok
  box "",73,120 93 46 22
} 
dialog nset {
  title "NickServ Setting..."
  icon icons\multi.ico
  size 229 430 336 82
  box ""1, 3 -1 331 81
  button "Passwd"2,9 12 50 20
  button "Protect"3,61 12 50 20
  button "NoMemo"4,113 12 55 20
  button "Url"5,170 12 52 20
  button "Noop"6,9 33 50 20
  button "Email"7,61 33 50 20
  button "ShowMail"8,113 33 55 20
  button "Mlock"9,170 33 52 20
  button "Secure"10,224 12 50 20
  button "Kill"11,9 54 50 20
  button "Authorize"12,61 54 50 20
  button "Mforward"13,113 54 55 20
  button "Mreceipts"14,170 54 52 20
  button "Field"15,224 33 50 20
  icon 16,285 30 34 34,$icon icons\multi.ico
  button "OK"100,224 54 50 20,ok
}
dialog cset {
  title "ChanServ Settings..."
  icon icons\multi.ico
  size 229 430 336 82
  box ""1, 3 -1 331 81
  button "Mlock"2,9 12 50 20
  button "Ident"3,61 12 50 20
  button "Opguard"4,113 12 55 20
  button "Url"5,170 12 52 20
  button "Desc"6,9 33 50 20
  button "Email"7,61 33 50 20
  button "Topiclock"8,113 33 55 20
  button "AutoVop"9,170 33 52 20
  button "Founder"10,224 12 56 20
  button "M.Level"11,9 54 50 20
  button "K.Topic"18,61 54 50 20
  button "Ristrict"13,113 54 55 20
  button "LeaveOp"14,170 54 52 20
  button "Passwd"15,224 33 56 20
  icon 16,285 15 34 34,$icon icons\multi.ico
  button "OK"100,224 54 56 20,ok
}
dialog uop {
  icon icons\multi.ico
  size 229 430 336 45
  title "Set Uop"
  box ""1, 3 0 331 40
  button "Add"2,10 13 50 20
  button "Del"3,62 13 50 20
  button "List"4,114 13 50 20
  button "Wipe"5,166 13 50 20
  icon 6,285 7 34 34,$icon icons\multi.ico
  button "Close"100,220 13 50 20,ok
}
dialog vop {
  size 229 430 336 45
  icon icons\multi.ico
  title "Set Vop"
  box ""1, 3 0 331 40
  button "Add"2,10 13 50 20
  button "Del"3,62 13 50 20
  button "List"4,114 13 50 20
  button "Wipe"5,166 13 50 20
  icon 6,285 7 34 34,$icon icons\multi.ico
  button "Close"100,220 13 50 20,ok
}
dialog aop2 {
  size 229 430 336 45
  icon icons\multi.ico
  title "Set Aop"
  box ""1, 3 0 331 40
  button "Add"2,10 13 50 20
  button "Del"3,62 13 50 20
  button "List"4,114 13 50 20
  button "Wipe"5,166 13 50 20
  icon 6,285 7 34 34,$icon icons\multi.ico
  button "Close"100,220 13 50 20,ok
}
dialog sop {
  size 229 430 336 45 
  icon icons\multi.ico
  title "Set Sop"
  box ""1, 3 0 331 40
  button "Add"2,10 13 50 20
  button "Del"3,62 13 50 20
  button "List"4,114 13 50 20
  button "Wipe"5,166 13 50 20
  icon 6,285 7 34 34,$icon icons\multi.ico
  button "Close"100,220 13 50 20,ok
}
dialog akick {
  size 229 430 336 45
  icon icons\multi.ico
  title "Set Akick"
  box ""1, 3 0 331 40
  button "Add"2,10 13 50 20
  button "Del"3,62 13 50 20
  button "List"4,114 13 50 20
  button "Wipe"5,166 13 50 20
  icon 6,285 7 34 34,$icon icons\multi.ico
  button "Close"100,220 13 50 20,ok
}
alias auth2 dialog -ma auth2 auth2
dialog auth2 {
  title "Frozen® Set Auth"
  icon icons\multi.ico
  size 229 430 336 62
  box ""1, 3 0 331 58
  button "List"2,10 12 50 20
  button "View"3,62 12 50 20
  button "Read"4,114 12 50 20
  button "Approve"5,166 12 50 20
  button "Accept"6,10 33 50 20
  button "Decline"7,62 33 50 20
  button "Reject"8,114 33 50 20
  button "Delete"9,166 33 50 20
  button "Refuse"10,218 12 50 20
  icon 11,285 15 34 34,$icon icons\multi.ico
  button "OK"100,218 33 50 20,ok
}
alias webserv dialog -m webserv webserv
alias nset dialog -ma nset nset
alias cset dialog -ma cset cset
alias uop dialog -ma uop uop
alias vop dialog -ma vop vop
alias aop2 dialog -ma aop2 aop2
alias sop dialog -ma sop sop
alias akick dialog -ma akick akick
on 1:dialog:webserv:sclick:*:{
  if ($did == 6) { chanserv info $$?="What Channel To Info?" }
  if ($did == 7) { uop }
  if ($did == 8) { vop }
  if ($did == 9) { aop2 }
  if ($did == 10) { sop }
  if ($did == 11) { chanserv register $$?="Specified channel to register?" $?*="Specified password?" $$?="Specified Channel description?" }
  if ($did == 12) { chanserv identify $$?="Specified channel to identify?" $?*="Specified password?" }
  if ($did == 13) { chanserv drop $$?="Specified channel that you wish to drop?" }
  if ($did == 14) { chanserv acc $$?="Specified channel that you wish to acc?" $$?="Specified nickname you wish to acc?" }
  if ($did == 15) { akick }
  if ($did == 16) { chanserv op $$?="Specified channel that you wish to get Op?" $$?="Specified nickname you wish to give Op?" }
  if ($did == 17) { chanserv deop $$?="Specified channel that you wish to DeOp?" $$?="Specified nickname you wish to DeOp?" }
  if ($did == 18) { chanserv voice $$?="Specified channel that you wish to Voice?" $$?="Specified nickname you wish to give Voice?" }
  if ($did == 19) { chanserv devoice $$?="Specified channel that you wish to DeVoice?" $$?="Specified nickname you wish to  DeVoice?" }
  if ($did == 20) { chanserv invite $$?="Specified channel that you wish to Invite?" $$?="Specified nickname you wish to used?" }
  if ($did == 21) { chanserv mdeop $$?="Specified channel that you wish to Mdeop?" all }
  if ($did == 22) { chanserv mkick $$?="Specified channel that you wish to Mkick?" }
  if ($did == 23) { chanserv unban $$?="Specified channel that you wish to Unban?" * }
  if ($did == 24) { chanserv count $$?="Specified channel that you wish to Count?" }
  if ($did == 25) { chanserv why $$?="Specified channel that you wish to Why?" $$?="Specified nickname you wish to Why?" }
  if ($did == 27) { nickserv register $$?="Specified nickname that you wish to Register?" $?*="Specified password you wish to use and please remember it" $$?="Specified correct email address that you wish to Use!" }
  if ($did == 28) { nickserv identify $$?="Specified nickname that you wish to Identify?" $?*="Specified correct password for that nickname!" }
  if ($did == 29) { nickserv access $$?="Specified Access switch <Add/Del><user@host mask> or </List/Wipe>?" }
  if ($did == 32) { nickserv recover $$?="Specified nickname that you wish to Recover?" $?*="Specified correct password for that nickname!" }
  if ($did == 33) { nickserv ghost $$?="Specified nickname that you wish to Ghost?" $?*="Specified correct password for that nickname!" }
  if ($did == 34) { nickserv drop $$?="Specified nickname that you wish to Drop?" }
  if ($did == 37) { nickserv watch $$?="Specified command that you wish to use <Add/Del/List>?" $$?="Specified nickname/channel?" }
  if ($did == 38) { nickserv buddy $$?="Specified command that you wish to use <Add/Del/List>?" $$?="Specified nickname/channel?" }
  if ($did == 39) { nickserv release $$?="Specified nickname that you wish to Release?" $?*="Specified correct password for that nickname!" }
  if ($did == 42) { nickserv info $$?="Specified nickname that you wish to Info?" }
  if ($did == 43) { auth2 }
  if ($did == 44) { nickserv listchans $$?="Specified nickname that you wish to Listchans?" }
  if ($did == 48) { memoserv send $$?="Specified nickname that you wish to Send memo?" $$?="Specified what message that you wish to send?" }
  if ($did == 49) { memoserv sendto $$?="Specified what channel to use Sendto?" $$?="Specified access level that you wish to Sendto memo? $crlf $+ [Aop|Sop|Vop|Uop]?" $$?="Specified what message that you wish to send?" }
  if ($did == 50) { memoserv list }
  if ($did == 51) { memoserv read $$?="Specified memo's number that you wish to Read?" }
  if ($did == 53) { memoserv del $$?="Specified memo's number to Delete or * to delete all memo's" }
  if ($did == 54) { memoserv forward $$?="Specified Forward commands. $crlf $+ Syntax: <on/off> <nickname>" }
  if ($did == 55) { memoserv expunge * }
  if ($did == 56) { memoserv close }
  if ($did == 58) { memoserv stat }
  if ($did == 59) { memoserv create $$?="Specified Create commands. $crlf $+ Syntax: <folder name> <description>" }
  if ($did == 60) { memoserv undel $$?="Specified Undel commands. $crlf $+ Syntax: <memo number> <folder name>" }
  if ($did == 61) { memoserv select $$?="Specified which folder you wish to Select?" } 
  if ($did == 63) { memoserv move $$?="Specified Move commands. $crlf $+ Syntax: <memo number> <memo folder>" }
  if ($did == 64) { memoserv ignore $$?="Specified Ignore commands. $crlf $+ Syntax: [Add/Del/List/Wipe] <nickname>" }
  if ($did == 65) { memoserv keep $$?="Specified Keep commands. $crlf $+ Syntax: <memo number>" } 
  if ($did == 71) { nset }
  if ($did == 72) { cset }
}  
on 1:dialog:nset:sclick:*:{
  if ($did == 2) { nickserv set passwd $?*="Specified Passwd that you wish to change?" }
  if ($did == 3) { nickserv set protect $$?="Specified Protect switch <on|off>?" }
  if ($did == 4) { nickserv set nomemo $$?="Specified NoMemo switch <on|off>?" }
  if ($did == 5) { nickserv set url $$?="Specified URL that you wish to add?" }
  if ($did == 6) { nickserv set noop $$?="Specified Noop switch <on|off>?" }
  if ($did == 7) { nickserv set email $$?="Specified Email that you wish to add or change?" }
  if ($did == 8) { nickserv set showemail $$?="Specified ShowEmail switch <on|off>?" }
  if ($did == 9) { nickserv set mlock $$?="Specified Mlock switch <on|off>?" }
  if ($did == 10) { nickserv set secure $$?="Specified Secure switch <on|off>?" }
  if ($did == 11) { nickserv set kill $$?="Specified Kill switch <on|off>?" }
  if ($did == 12) { nickserv set authorize $$?="Syntax: $crlf $+ Buddy <on|off> $crlf $+ Chanlists <on|off>?" }
  if ($did == 13) { nickserv set mforward $$?="Specified Mforward switch <on|off> [<nickname>]?" } 
  if ($did == 14) { nickserv set mreceipts $$?="Specified Mreceipts switch <on|off>?" }
}
on 1:dialog:cset:sclick:*:{
  if ($did == 2) { chanserv set $$?="Specified channel to set Mlock?" mlock $$?="Specified channel <+|-> mode's?" }
  if ($did == 3) { chanserv set $$?="Specified channel to set Ident?" ident $$?="Specified Ident switch <on|off>?" }
  if ($did == 4) { chanserv set $$?="Specified channel to set Opguard?" opguard $$?="Specified Opguard switch <on|off>?" }
  if ($did == 5) { chanserv set $$?="Specified channel to set Url?" url $$?="Specified your Url ?" }
  if ($did == 6) { chanserv set $$?="Specified channel to set Description?" desc $$?="Specified your Description?" }
  if ($did == 7) { chanserv set $$?="Specified channel to set Email?" email $$?="Specified your Email?" }
  if ($did == 8) { chanserv set $$?="Specified channel to set Topiclock?" topiclock $$?="Specified Topiclock switch <off|founder|aop|sop>?" }
  if ($did == 9) { chanserv set autovop $$?="Specified AutoVop switch <channel> <on|off>?" }
  if ($did == 10) { chanserv set $$?="Specified channel to set Founder?" founder }
  if ($did == 11) { chanserv set $$?="Specified channel to set Memolevel?" memolevel $$?="Specified Memolevel switch <uop|vop|aop|sop|founder>?" }
  if ($did == 13) { chanserv set $$?="Specified channel to set Restrict?" restrict $$?="Specified Restrict switch <on|off>?" }
  if ($did == 14) { chanserv set $$?="Specified channel to set LeaveOp?" leaveop $$?="Specified LeaveOps switch <on|off>?" }
  if ($did == 15) { chanserv set $$?="Specified channel to set Passwd?" passwd $?*="Specified new Passwd?" }
  if ($did == 18) { chanserv set $$?="Specified channel to set KeepTopic?" keeptopic $$?="Specified Keeptopic switch <on|off>?" }
}
on 1:dialog:uop:sclick:*: {
  if ($did == 2) { chanserv uop $$?="Specified Channel name" add $$?="Specified nick that you wish to add as UOP" }
  if ($did == 3) { chanserv uop $$?="Specified Channel name" del $$?="Specified nick that you wish to add as UOP" }
  if ($did == 4) { chanserv uop $$?="Specified Channel name" list }
  if ($did == 5) { chanserv uop $$?="Specified Channel name" wipe * }
}
on 1:dialog:vop:sclick:*: {
  if ($did == 2) { chanserv vop $$?="Specified Channel name" add $$?="Specified nick that you wish to add as VOP" }
  if ($did == 3) { chanserv vop $$?="Specified Channel name" del $$?="Specified nick that you wish to add as VOP" }
  if ($did == 4) { chanserv vop $$?="Specified Channel name" list }
  if ($did == 5) { chanserv vop $$?="Specified Channel name" wipe * }
}
on 1:dialog:aop2:sclick:*: {
  if ($did == 2) { chanserv aop $$?="Specified Channel name" add $$?="Specified nick that you wish to add as AOP" }
  if ($did == 3) { chanserv aop $$?="Specified Channel name" del $$?="Specified nick that you wish to add as AOP" }
  if ($did == 4) { chanserv aop $$?="Specified Channel name" list }
  if ($did == 5) { chanserv aop $$?="Specified Channel name" wipe * }
}
on 1:dialog:sop:sclick:*: {
  if ($did == 2) { chanserv sop $$?="Specified Channel name" add $$?="Specified nick that you wish to add as SOP" }
  if ($did == 3) { chanserv sop $$?="Specified Channel name" del $$?="Specified nick that you wish to add as SOP" }
  if ($did == 4) { chanserv sop $$?="Specified Channel name" list }
  if ($did == 5) { chanserv sop $$?="Specified Channel name" wipe * }
}
on 1:dialog:akick:sclick:*: {
  if ($did == 2) { chanserv akick $$?="Specified Channel name" add $$?="Specified [nick!*@*] or [*!*@domain.com] that you wish to add as AKICK" }
  if ($did == 3) { chanserv akick $$?="Specified Channel name" del $$?="Specified [nick!*@*] or [*!*@domain.com] that you wish to del the AKICK" }
  if ($did == 4) { chanserv akick $$?="Specified Channel name" list }
  if ($did == 5) { chanserv akick $$?="Specified Channel name" wipe * }
}
on 1:dialog:auth2:sclick:*: {
  if ($did == 2) { nickserv auth list }
  if ($did == 3) { nickserv view $$?="Specified View commands. $crlf $+ Syntax: <view> <ID>" }
  if ($did == 4) { nickserv read $$?="Specified Read commands. $crlf $+ Syntax: <number>?" }
  if ($did == 5) { nickserv approve $$?="Specified Approve commands. $crlf $+ Syntax: <approve> <ID>" }
  if ($did == 6) { nickserv accept $$?="Specified Accept commands. $crlf $+ Syntax: <accept> <ID>" }
  if ($did == 7) { nickserv decline $$?="Specified Decline commands. $crlf $+ Syntax: <decline> <ID>" }
  if ($did == 8) { nickserv reject $$?="Specified Reject commands. $crlf $+ Syntax: <reject> <ID>" }
  if ($did == 9) { nickserv delete $$?="Specified Delete commands. $crlf $+ Syntax: <delete> <ID>" }
  if ($did == 10) { nickserv refuse $$?="Specified Refuse commands. $crlf $+ Syntax: <refuse> <ID>" }
}
