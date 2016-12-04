menu status {
  -
  Services
  .NickServ
  ..General:/msg nickserv help
  ..specific:/msg nickserv help $$?="Tentang Apa?" 
  ..-
  ..Register Nick:/nickserv REGISTER $$?="Nick Password?"
  ..verify:/msg NickServ VERIFY REGISTER $$?="contoh:jenny 161803399"
  ..Drop:/msg nickserv drop $$?="what nick?"
  ..Nick Info:/nickserv INFO $$?="Nick?"
  ..-
  ..Identify:/nickserv IDENTIFY $$?="Nick Password?"
  ..Change Password:/nickserv  SET passwd $$?="Old Password?" $$?="New Password?"
  ..Set URL:/nickserv SET URL $$?="URL?"
  ..Set E-mail:/nickserv SET EMAIL $$?="E-mail?"
  ..Hide E-mail:/NickServ SET HIDEMAIL $$?="ON or OFF:"
  ..E-mail memo:/NickServ SET EMAILMEMO $$?="ON or OFF:"
  ..-
  ..Access List:/msg NickServ ACCESS LIST
  ..Enforce:/nickserv SET ENFORCE $$?="ON or OFF?"
  ..Proferty:/msg NickServ SET PROPERTY $$?="http://www.example.com/"
  ..No Op:/nickserv SET NOOP $$?="ON or OFF?" 
  ..No Memo:/nickserv SET NOMEMO $$?="ON or OFF?" 
  ..-
  ..Ghost Nick:/nickserv GHOST $$?="Nick?" $$?="Nick Password?"
  ..Recover Nick:/nickserv RECOVER $$?="Nick?" $$?="Nick Password?"
  ..Release Nick:/nickserv RELEASE $$?="Nick?" $$?="Nick Password?"
  ..-
  ..Never OP:/msg NickServ SET NERVEROP $$?="NEVEROP ON or OFF:"
  ..NOOP:/msg NickServ SET NOOP $$?="NOOP ON or OFF:"
  ..Listchans:/msg Nickserv listchans 
  ..logout:/msg NickServ LOGOUT
  .ChanServ
  ..General:/msg chanserv help
  ..specific:/msg chanserv help $$?="Tentang Apa?" 
  ..-
  ..Immediate
  ...ChanServ +o:/chanserv OP $$?="Channel Name" $$?="Nick?"
  ...ChanServ +o $me:/chanserv OP $$?="Channel Name" $me
  ...-
  ...ChanServ -o:/chanserv DEOP $$?="Channel Name" $$?="Nick?"
  ...ChanServ -o $me:/chanserv DEOP $$?="Channel Name" $me
  ...-
  ...Unban All:/chanserv UNBAN $$?="Channel Name?" *
  ...Unban $me:/chanserv UNBAN $$?="Channel Name?" $me
  ...-
  ...Invite:/chanserv INVITE $$?="Channel Name?" $$?="Nick?" 
  ...Invite $me:/chanserv INVITE $$?="Channel Name?" $me 
  ...-
  ...Mass Kick:/chanserv MKICK $$?="Channel Name?"
  ...Mass Deop:/chanserv MDEOP $$?="Channel Name?"
  ..-
  ..Management
  ...Add AOP:/chanserv AOP $$?="Channel Name?" ADD $$?="Mask or Nick?"
  ...Add HOP:/chanserv HOP $$?="Channel Name?" ADD $$?="Mask or Nick?"
  ...Add SOP:/chanserv SOP $$?="Channel Name?" ADD $$?="Mask or Nick?"
  ...Add AKICK:/chanserv AKICK $$?="Channel Name?" ADD $$?="Mask or Nick?"
  ...-
  ...Del AOP:/chanserv AOP $$?="Channel Name?" DEL $$?="Mask or Nick?"
  ...Del HOP:/chanserv HOP $$?="Channel Name?" ADD $$?="Mask or Nick?"
  ...Del SOP:/chanserv SOP $$?="Channel Name?" DEL $$?="Mask or Nick?"
  ...Del AKICK:/chanserv AKICK $$?="Channel Name?" ADD $$?="Mask or Nick?"
  ...-
  ...List AOPs:/chanserv AOP $$?="Channel Name?" LIST
  ...List HOPs:/chanserv HOP $$?="Channel Name?" LIST
  ...List SOPs:/chanserv SOP $$?="Channel Name?" LIST
  ...List AKICKs:/chanserv AKICK $$?="Channel Name?" LIST
  ...-
  ...Register Channel:/chanserv REGISTER $$?="Channel Name?" 
  ...Drop Channel (Founder):/chanserv DROP $$?="Channel Name?" 
  ...-
  ...Channel Info:/chanserv INFO $$?="Channel Name?"
  ...Why Op:/chanserv WHY #$$?="Channel" $$?="Nick?"
  ...-
  ...Change Founder:/chanserv SET $$?="Channel Name?" FOUNDER $$?="New Founder?"
  ...-
  ...Set URL:/chanserv SET $$?="Channel Name?" $$?="URL?"
  ...Set E-mail:/chanserv SET $$?="Channel Name?" $$?="E-mail?"
  ..-
  ..Settings
  ...Channel Modes:/chanserv SET $$?="Channel Name?" MLOCK $$?="Channel Modes?"
  ...Channel Memo:/chanserv SET $$?="Channel Name?" MEMO $$?="AOP/SOP or FOUNDER?"
  ...Op Guard:/chanserv SET $$?="Channel Name?" OPGUARD $$?="ON or OFF?"
  ...Keep Topic:/chanserv SET $$?="Channel Name?" KEEPTOPIC $$?="ON or OFF?"
  ...Topic Lock:/chanserv SET $$?="Channel Name?" TOPICLOCK $$?="SOP/FOUNDER or OFF?"
  ...Verbose:/chanserv SET $$?="Channel Name?" VERBOSE $$?="ON or OFF?"
  ...Mode Locks:/msg ChanServ SET # MLOCK $$?="Mode Lock (contoh: -spmilk+tn)"
  ...Op Guard:/msg ChanServ SET # GUARD $$?="Guard ON atau OFF:"
  ...status:/msg ChanServ STATUS #
  ...Set Topic:/msg ChanServ SET # Topic $$?="Topic Channel"
  ...set entrymsg:/msg ChanServ SET # ENTRYMSG $$?="entrymsg"
  ...set email:/msg ChanServ SET # EMAIL $$?="some@email.address"
  ...set URL:/msg ChanServ SET # URL $$?="http://slashdot.org"
  ...Informasi Channel:/msg ChanServ INFO #
  ...Informasi Channel Lain:/msg ChanServ INFO $$?="Channel:"
  ...count:/msg ChanServ COUNT #
  ...getkey:/msg ChanServ GETKEY #
  ...Recover:/msg ChanServ RECOVER #
  ...secure:/msg ChanServ SET # SECURE $$?="ON atau OFF:"
  .MemoServ
  ..List Memo(s):/memoserv LIST
  ..Read Memo:/memoserv READ $$?="Number?"
  ..Del Memo:/memoserv DEL $$?="Number?"
  ..-
  ..Send Memo:/memoserv SEND $$?="Nick?" $$?="Message?"
  ..-
  ..Forward Memo:/memoserv FORWARD $$?="Nick?" $$?="Password?"
  ..-
  -
}

alias liteoz10 if $dialog(liteoz10) == $null { dialog -ma liteoz10 liteoz10 }

dialog liteoz10 {
  title "ChanServ Control"
  size -1 -1 185 167
  option dbu

  button "Register Channel", 2, 5 5 55 10
  button "Drop Channel",3, 65 5 55 10
  button "Status Channel",4,5 17 55 10
  button "Channel Info",5, 65 17 55 10
  button "Op Nick",9, 125 5 55 10
  button "Deop Nick",10, 125 17 55 10
  button "Unban Me",12, 5 42 55 10
  button "Mass Unban "13, 65 42 55 10
  button "Template"14, 125 42 55 10
  button "Mass Kick",15, 5 54 55 10
  button "Mass Deop",16, 65 54 55 10
  button "Add Vop",19,125 54 55 10
  button "Add Aop",20, 5 66 55 10
  button "Add Sop",21, 65 66 55 10
  button "Add Half Op",22, 125 66 55 10
  button "Del Aop",23, 5 78 55 10
  button "Del Sop",24, 65 78 55 10
  button "Set Channel Modes",26, 5 91 55 10
  button "Set Founder",27, 65 91 55 10
  button "Set Password",28, 125 91 55 10
  button "Getkey",29, 5 103 55 10
  button "Set URL",30, 65 103 55 10
  button "Set Email",31, 125 103 55 10
  button "Count",32, 5 115 55 10
  button "Set Topic",33, 65 115 55 10
  button "KeepTopic",36, 5 128 40 10
  button "Set entrymsg",37, 50 128 40 10
  button "Set Guard",40, 140 128 40 10
  button "TopicLock",39, 95 128 40 10
  button "Secure",43, 50 140 40 10
  button "Verbose",42, 5 140 40 10
  button "WHY",45, 95 140 40 10
  button "Clear User",46, 140 140 40 10
  button "List Akick",52, 5 30 55 10
  button "Add Akick",54, 65 30 55 10
  button "Remove Akick",55, 125 30 55 10
  button "OK",49, 140 153 40 10, ok
  button "Help Specific",53, 95 153 40 10
  button "Del Hop",80, 125 78 55 10
  button "Invite",81, 125 115 55 10
}

on 1:dialog:liteoz10:sclick:*: {
  if $did == 2 { /chanserv register #$$?="Channel" }
  if $did == 3 { /chanserv drop #$$?="Channel" }
  if $did == 4 { /chanserv STATUS #$$?="Channel" }
  if $did == 5 { /chanserv info #$$?="Channel" }
  if $did == 9 { /chanserv op #$$?="Channel" $$?="Nickname" }
  if $did == 10 { /chanserv deop #$$?="Channel" $$?="Nickname" }
  if $did == 12 { /chanserv unban #$$?="Channel" $me }
  if $did == 13 { /chanserv unban #$$?="Channel" All }
  if $did == 14 { /chanserv TEMPLATE #$$?="Channel" }
  if $did == 15 { /chanserv mkick #$$?="Channel" }
  if $did == 16 { /chanserv mdeop #$$?="Channel" }
  if $did == 26 { /chanserv set #$$?="Channel" mlock $$?="ie-spmilk+tn" }
  if $did == 27 { /chanserv set #$$?="Channel" FOUNDER $$?="NickName" }
  if $did == 28 { /chanserv set #$$?="Channel" password $$?="New Password" }
  if $did == 29 { /chanserv GETKEY #$$?="Channel" }
  if $did == 30 { /chanserv set #$$?="Channel" url $$?="Website Address" }
  if $did == 31 { /chanserv set #$$?="Channel" EMAIL $$?="New Email" }
  if $did == 32 { /chanserv COUNT #$$?="Channel" }
  if $did == 33 { /chanserv set #$$?="Channel" $$?="Topic" }
  if $did == 36 { /chanserv set #$$?="Channel" keeptopic $$?="On or Off" }
  if $did == 37 { /chanserv set #$$?="Channel" entrymsg $$?="enter mesagge" }
  if $did == 39 { /chanserv set #$$?="Channel" topiclock $$?="On or Off?" }
  if $did == 40 { /chanserv set #$$?="Channel" GUARD $$?="On or Off?" }
  if $did == 42 { /chanserv set #$$?="Channel" verbose $$?="On or Off?" }
  if $did == 43 { /chanserv set #$$?="Channel" secure $$?="On or Off?" }
  if $did == 45 { /chanserv WHY #$$?="Channel" $$?="enter nickname" }
  if $did == 46 { /chanserv CLEAR #$$?="Channel" USER $$?="reason" }
  if $did == 52 { /chanserv akick #$$?="Channel" list }
  if $did == 54 { /chanserv akick #$$?="Channel" add $$?="Nickname Or Mask" }
  if $did == 55 { /chanserv akick #$$?="Channel" del $$?="Nickname Or Mask" }
  if $did == 19 { /chanserv vop #$$?="Channel" add $$?="Nickname" }
  if $did == 20 { /chanserv aop #$$?="Channel" add $$?="Nickname" }
  if $did == 21 { /chanserv sop #$$?="Channel" add $$?="Nickname" }
  if $did == 22 { /chanserv hop #$$?="Channel" add $$?="Nickname" }
  if $did == 23 { /chanserv Aop #$$?="Channel" del $$?="Nickname" }
  if $did == 24 { /chanserv Sop #$$?="Channel" del $$?="Nickname" }
  if $did == 80 { /chanserv Hop #$$?="Channel" del $$?="Nickname" }
  if $did == 81 { /chanserv invite #$$?="Channel" $$?="Nickname" }
  if $did == 53 { /chanserv help $$?="Tentang apa" }
}

alias nicklite10 if $dialog(operlite10) == $null { dialog -ma nicklite10 nicklite10 }

dialog nicklite10 {
  title "NickServ Control"
  size -1 -1 185 105
  option dbu

  button "Register Nick",57, 5 5 55 10
  button "Identify Nick",58, 65 5 55 10
  button "Drop Nick",59, 125 5 55 10
  button "Verify Register",61, 5 18 55 10
  button "Ghost",62, 65 18 55 10
  button "Release",63, 125 18 55 10
  button "Set Password",65, 5 30 55 10
  button "Hide Mail",66, 65 30 55 10
  button "Access List",67, 125 30 55 10
  button "Listchans",69, 5 42 55 10
  button "Nick Info",70, 65 42 55 10
  button "Set Email",71, 125 42 55 10
  button "Set Email memo",73, 5 54 55 10
  button "no memo",74, 65 54 55 10
  button "logout",75, 125 54 55 10
  button "neverop On",78, 5 66 55 10
  button "neverop Off",79, 65 66 55 10
  button "Enforce On",81, 125 66 55 10
  button "Enforce Off",82, 5 78 55 10
  button "Noop On",83, 65 78 55 10
  button "Noop Off",84, 125 78 55 10
  button "Help specific",89, 65 90 55 10
  button "OK",49, 125 90 55 10, ok



}

on 1:dialog:nicklite10:sclick:*: {
  if $did == 57 { /nickserv register $$?="Password" $$?="Email Address" }
  if $did == 58 { /nickserv identify $$?*="Password" }
  if $did == 61 { /nickserv VERIFY REGISTER $$?="contoh:jenny 161803399" }
  if $did == 62 { /nickserv ghost $$?="Nickname" $$?*="Password" }
  if $did == 63 { /nickserv release $$?="Nickname" $$?*="Password" }
  if $did == 65 { /nickserv set password $$?="Nick Password?" }
  if $did == 66 { /nickserv SET HIDEMAIL $$?="ON or OFF:" }
  if $did == 67 { /nickserv NickServ ACCESS LIST }
  if $did == 69 { /nickserv listchans }
  if $did == 70 { /nickserv info $$?="Nickname" }
  if $did == 71 { /nickserv set email $$?="Email Address" }
  if $did == 73 { /nickServ SET EMAILMEMO $$?="ON or OFF:" }
  if $did == 74 { /nickserv set nomemo $$?="ON or OFF:" }
  if $did == 75 { /nickserv logout }
  if $did == 59 { /nickserv drop $$?="Nickname" }
  if $did == 78 { /nickserv set neverop on }
  if $did == 79 { /nickserv set neverop off }
  if $did == 81 { /nickserv set enforce on }
  if $did == 82 { /nickserv set enforce off }
  if $did == 83 { /nickserv set noop on } 
  if $did == 84 { /nickserv set noop off } 
  if $did == 89 { /nickserv help $$?="Tentang apa" }
}


alias lite10 if $dialog(lite10) == $null { dialog -ma lite10 lite10 }

dialog lite10 {
  title "MemoServ Control"
  size -1 -1 244 98
  option dbu

  button "Send",92, 5 5 35 10
  button "Read"93, 45 5 35 10
  button "Read New",94, 85 5 35 10
  button "List",95, 125 5 35 10
  button "Del",191, 165 5 35 10
  button "Del All",189, 205 5 35 10

  button "Read 1",97, 5 20 35 10
  button "Read 2",98, 45 20 35 10
  button "Read 3",99, 85 20 35 10
  button "Read 4",100, 125 20 35 10
  button "Read 5",101, 165 20 35 10
  button "Read 6",102, 205 20 35 10
  button "Read 7",103, 5 32 35 10
  button "Read 8",104, 45 32 35 10
  button "Read 9",105, 85 32 35 10
  button "Read 10",106, 125 32 35 10
  button "Read 11",107, 165 32 35 10
  button "Read 12",108, 205 32 35 10

  button "Read 13",126, 5 44 35 10
  button "Read 14",127, 45 44 35 10
  button "Read 15",128, 85 44 35 10
  button "Read 16",129, 125 44 35 10
  button "Read 17",130, 165 44 35 10
  button "- Help  -",131, 205 44 35 10


  button "Delete 1",112, 5 60 35 10
  button "Delete 2",113, 45 60 35 10
  button "Delete 3",114, 85 60 35 10
  button "Delete 4",115, 125 60 35 10
  button "Delete 5",116, 165 60 35 10
  button "Delete 6",117, 205 60 35 10
  button "Delete 7",118, 5 72 35 10
  button "Delete 8",119, 45 72 35 10
  button "Delete 9",120, 85 72 35 10
  button "Delete 10",121, 125 72 35 10
  button "Delete 11",122, 165 72 35 10
  button "Delete 12",123, 205 72 35 10

  button "Delete 13",132, 5 84 35 10
  button "Delete 14",133, 45 84 35 10
  button "Delete 15",134, 85 84 35 10
  button "Delete 16",135, 125 84 35 10
  button "Delete 17",136, 165 84 35 10


  button "- Exit -",49, 205 84 35 10, ok
}

on 1:dialog:lite10:sclick:*: {
  if $did == 92 { /memoserv send $$?="Channel Or Person" $$?="Messages" }
  if $did == 93 { /memoserv read $$?="Number" }
  if $did == 189 { /memoserv DEL ALL }
  if $did == 94 { /memoserv READ NEW }
  if $did == 95 { /memoserv list }
  if $did == 191 { /memoserv DEL $$?="Number" }
  if $did isnum 97-108 { /memoserv read  $calc($did - 96) }
  if $did isnum 112-123 { /memoserv del $calc($did - 111) }
  if $did == 126 { /memoserv read 13 }
  if $did == 127 { /memoserv read 14 }
  if $did == 128 { /memoserv read 15 }
  if $did == 129 { /memoserv read 16 }
  if $did == 130 { /memoserv read 17 }
  if $did == 131 { /memoserv help }
  if $did == 132 { /memoserv del 13 }
  if $did == 133 { /memoserv del 14 }
  if $did == 134 { /memoserv del 15 }
  if $did == 135 { /memoserv del 16 }
  if $did == 136 { /memoserv del 17 }
  if $did == 137 { /memoserv del 18 }
  if $did == 124 { /memoserv help }
}


;=========
; txt2chr
;=========
alias t2cd {
  if ($dialog(t2c®) == $null) {
    .dopen t2c® 320 290
    RETURN 0;
  }
  elseif ($dialog(t2c®) != $null) {
    dialog -x $ifmatch $ifmatch
    RETURN 0;
  }
}
dialog t2c® {
  title "Text To Char"
  icon icons/font2.ico
  option dbu
  size -1 -1 160 143
  box "", 1, 4 4 152 119
  button "&Ok", 2, 58 127 38 13, ok
  edit "Please write the text you want translated here.", 3, 9 18 144 11, vsbar limit 83
  text "Text:", 4, 9 10 15 8
  edit "", 6, 9 40 144 73, read multi
  button "&Translate It!", 7, 59 30 44 9 default
  link "Clear", 8, 70 114 30 35
}
on *:DIALOG:t2c®:*:*:{
  if ($devent == sclick) {
    if ($did == 7) {
      if ($did($dname,3).text == $null) {
        if ($dialog($dname)) {
          did -a $dname 6 Please Enter your text in translate field! 
          return 
        }
      }
      else {
        var %ttt = $did($dname,3).text
        var %ttt = $txt2chr(%ttt)
        if (%ttt) {
          if ($dialog($dname)) {
            did -r $dname 6 
            did -a $dname 6 %ttt 
          return }
        }
      }
    }
    if ($did == 8) {
      if (($dialog($dname)) && ($did($dname,6).text != $null)) {
        did -r $dname 6
        return
      }
    }
  }
}

alias txt2chr {
  ; /txt2chr TextHere
  ; $txt2chr(TextHere)
  VAR %TXT = $1-
  tokenize 32 %TXT
  IF ($1- == $NULL) {
    IF ($ISID) { 
      ECHO -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Too few parameters you can type $+ $cxs(1) $!txt2chr 
      RETURN
    }
    ELSE { 
      ECHO -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Too few parameters you can type $+ $cxs(1) /txt2chr
      return
    }
  }
  IF ($LEN($1-) > 45) {
    ECHO -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) You may use 45 letters max
    RETURN
  }
  VAR %LEN = 1
  WHILE (%LEN <= $LEN(%TXT)) {
    VAR %T2C = %T2C $!+ $!CHR( $+ $ASC($MID($1-,%LEN,1)) $+ )
    INC %LEN
  }
  IF (%T2C) {
    IF ($ISID) RETURN $RIGHT(%T2C,-2)
  }
  IF ($ACTIVE != Status Window) {
    MSG $ACTIVE $RIGHT(%T2C,-2)
  }
  ELSE {
    ECHO -a $cxs(3) $+  $+ %xsbrack $+  $+ $cxs(2) Text to char result for $+ $cxs(1) %txt  $+ $cxs(2) $+ is $+ $cxs(1) $RIGHT(%T2C,-2)
  }
}

;==========
; notepad
;==========
dialog mnpmain {
  title "New Text Document.txt - NotePad [/notepad]"
  size -1 -1 260 186
  option dbu
  icon $mircdiricons\notpadx.ico, 0
  edit "", 1, 0 0 260 186, multi return autohs autovs hsbar vsbar
  menu "File", 910
  item "New", 911, 910
  item "Open...", 912, 910
  item break, 913, 910
  item "Save", 914, 910
  item "Save as...", 915, 910
  item break, 916, 910
  item "Print", 917, 910
  item break, 918, 910
  item "Close", 919, 910, ok
  menu "Tools", 920
  item "Copy", 922, 920
  item "Paste", 923, 920
  item "Clear", 924, 920
  item break, 925, 920
  item "Date and Time", 926, 920
}
alias mnpmain { $iif(!$dialog(mnp),dialog -md mnpmain mnpmain,dialog -v mnpmain) }
on *:dialog:mnpmain:init:*:{ set %mnp.file newfile }
on *:dialog:mnpmain:menu:*:{
  if ($did == 911) { did -r mnpmain 1 | dialog -t $dname New_Text_Document.txt - mIRC NotePad | set %mnp.file newfile }
  if ($did == 912) { var %a = $sfile($mircdir,Open,Open) | loadbuf -ro mnpmain 1 %a | dialog -t $dname $nopath(%a) - mIRC NotePad | set %mnp.file %a }
  if ($did == 914) {
    if (%mnp.file == newfile) { goto a }
    else { goto b }
    :a
    var %a = $sdir($mircdir,Select the directory where the file should be saved)
    if (%a == $null) { return }
    var %b = $?="New name of the file. E.x. lame.txt"
    if (%b == $null) { return }
    dialog -v $dname
    dialog -t $dname %b - NotePad
    goto b
    :b
    mnp.save %mnp.file
  }
  if ($did == 915) {
    var %a = $sdir($mircdir,Select the directory where the file should be saved)
    if (%a == $null) { return }
    var %b = $?="New name of the file. E.x. lame.txt"
    if (%b == $null) { return }
    mnp.save %a $+ %b
    dialog -t $dname %b - mIRC NotePad
    dialog -v $dname
    set %mnp.file %a $+ %b
  }
  if ($did == 917) { mnp.print }
  if ($did == 919) { dialog -x mnpmain }
  if ($did == 922) { clipboard $did(1).seltext }
  if ($did == 923) { mnp.paste }
  if ($did == 924) { did -r mnpmain 1 }
  if ($did == 926) { did -a mnpmain 1 $time(hh:nn) $date }
  if ($did == 931) { mnp.about }
}
alias mnp.paste {
  var %a = 1
  while (%a <= $cb(0)) { 
    did -a $dname 1 $cb(%a) $crlf
    inc %a
  }
}
alias mnp.save { savebuf -o mnpmain 1 " $+ $1 $+ " }
alias mnp.print {
  var %b = " $+ $scriptdirTEMP.txt $+ "
  write -c %b
  savebuf -o mnpmain 1 " $+ $scriptdirTEMP.txt $+ "
  run -n notepad /p %b
  .timer 1 1 .remove %b
}

;========
; search
;========
alias dfsearchf { if ($dialog(fsearchf )) dialog -v fsearchf | else dialog -m fsearchf fsearchf }
dialog fsearchf {
  size -1 -1 350 140
  title "Search system"
  icon icons/fsearchf.ico
  button "cancel" 1, 273 90 50 20,cancel
  box "Enter file name to search:" 2, 10 10 330 120
  edit "" 3, 80 40 190 20
  edit "C:\" 4, 80 65 190 20
  text "Search:" 5, 20 42 60 17
  text "Search in:" 6, 20 67 60 17
  button "browse" 7, 273 65 50 20
  button "search" 8, 273 40 50 20
  icon 9, 30 90 40 40, icons/fsearchf.ico
  text "Show results in a:" 10, 80 100 90 17
  combo 11, 170 97 80 60, drop
}
on *:dialog:fsearchf:init:0: {
  did -a $dname 11 dialog
  did -a $dname 11 window
  did -c $dname 11 1
  dll dll/mdx.dll SetControlMDX $dname 12 ContextHelp nocontrol > dll/dialog.mdx
}
on *:dialog:fsearchf:Sclick:1: {
  //close -@ @fsearchf-results
}
on *:dialog:fsearchf:sclick:7: {
  did -ra $dname 4 $sdir(c:\)
}
on *:dialog:fsearchf:sclick:8: {
  if ( $did($dname,3).text != $null && $did($dname,4).text != $null && $did($dname,11).sel == 1 ) { dialog -m results results }
  elseif ( $did($dname,3).text != $null && $did($dname,4).text != $null && $did($dname,11).sel == 2 ) { window -lk @fsearchf-Results 100 100 500 400 | clear @fsearchf-results | fsearchf2 }
}
dialog results {
  size -1 -1 420 250
  icon graph/fsearchf.ico
  title "Search results"
  box "Results" 1, 10 10 302 210
  list 2, 20 25 280 200, sort
  button "close" 3, 323 160 70 20,ok
  box "" 4, 314 10 90 210
  button "New search" 5, 323 90 70 20
  button "Repeat" 6, 323 113 70 20
  text "Results:" 7, 15 225 100 17
  text "" 8, 55 225 40 17
  button "Open file" 9, 323 136 70 20
  icon 10, 338 45 40 40, icons/fsearchf.ico
}
on *:dialog:results:init:0: {
  did -a results 2 Searching...
  .timer 1 1 fsearchf
}
on *:dialog:results:sclick:9: {
  if ( $did(results,2).sel != $null ) { //run $did($dname,2).seltext }
}
on *:dialog:results:sclick:3: {
  dialog -x fsearchf fsearchf
}
on *:dialog:results:sclick:5: {
  dialog -x $dname $dname
}
alias fsearchf2 {
  if ( $findfile($did(fsearchf,4).text,$did(fsearchf,3).text,0) < 165 ) {
    set %results 0  
    set %find 0
    :loop
    inc %find
    if ( %find > $findfile($did(fsearchf,4).text,$did(fsearchf,3).text,0) ) { halt }
    aline @fsearchf-results $findfile($did(fsearchf,4).text,$did(fsearchf,3).text,%find)
    inc %results  
    goto loop
  }
  else { aline @fsearchf-results Too many results came up! | aline @fsearchf-results Try to specify its location better | halt }
}
alias fsearchf {
  if ( $findfile($did(fsearchf,4).text,$did(fsearchf,3).text,0) < 165 ) {
    did -r results 2
    set %results 0  
    set %find 0
    :loop
    inc %find
    if ( %find > $findfile($did(fsearchf,4).text,$did(fsearchf,3).text,0) ) { did -ra results 8 %results | halt }
    did -a results 2 $findfile($did(fsearchf,4).text,$did(fsearchf,3).text,%find)
    inc %results  
    goto loop
  }
  else { did -r results 2 | did -a results 2 Too many results came up! | did -a results 2 Try to specify its location better | halt }
}

;=========
; drawing
;=========
menu @sketch {
  mouse:{
    if (%skpd.xy == Hide) {
      if ( Copy isin %skpd.draw) && (%skpd.ucx) titlebar @sketch Copy to - X: $+ $mouse.x Y: $+ $mouse.y
      else if ( Load isin %skpd.draw) && (%skpd.ucx) titlebar @sketch Load to - X: $+ $mouse.x Y: $+ $mouse.y
      else titlebar @sketch - %skpd.draw  X: $+ $mouse.x Y: $+ $mouse.y
    }
    if ($window(@zoom)) {
      drawcopy @sketch $calc($mouse.x - 8) $calc($mouse.y - 4) 16 8 @zoom 0 0 169 89
      drawrect -i @zoom $rgb(1) 1 80 40 10 10
    }
    if (%skpd.draw == Freehand) && ($mouse.key & 1) {
      if (%skpd.prevx) set %skpd.udraw drawline @sketch $rgb(%skpd.cl) %skpd.tk %skpd.prevx %skpd.prevy $mouse.x $mouse.y
      else set %skpd.udraw drawline @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $mouse.x $mouse.y
      %skpd.udraw | udraw
      if (%skpd.session == End) write temp.ssn %skpd.udraw
    }
    else if (%skpd.draw == Line) && ($mouse.key & 1) {
      if (%skpd.prevx) drawline -i @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty %skpd.prevx %skpd.prevy
      drawline -i @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $mouse.x $mouse.y
    }
    else if ( Rectangle isin %skpd.draw ) && ($mouse.key & 1) {
      if (%skpd.prevx) drawrect -i @sketch $rgb(%skpd.cl) 1 %skpd.lastx %skpd.lasty $calc(%skpd.prevx - %skpd.lastx) $calc(%skpd.prevy - %skpd.lasty)
      drawrect -i @sketch $rgb(%skpd.cl) 1 %skpd.lastx %skpd.lasty $calc($mouse.x - %skpd.lastx) $calc($mouse.y - %skpd.lasty)
    }
    else if ( Ellipse isin %skpd.draw ) && ($mouse.key & 1) {
      if (%skpd.prevx) drawrect -ie @sketch $rgb(%skpd.cl) 1 %skpd.lastx %skpd.lasty $calc(%skpd.prevx - %skpd.lastx) $calc(%skpd.prevy - %skpd.lasty)
      drawrect -ie @sketch $rgb(%skpd.cl) 1 %skpd.lastx %skpd.lasty $calc($mouse.x - %skpd.lastx) $calc($mouse.y - %skpd.lasty)
    }
    else if (%skpd.ucx) && ($mouse.key !& 1) {
      if (%skpd.prevx) drawrect -i @sketch $rgb(1) 1 %skpd.prevx %skpd.prevy %skpd.ucx %skpd.ucy
      drawrect -i @sketch $rgb(1) 1 $mouse.x $mouse.y %skpd.ucx %skpd.ucy
    }
    set %skpd.prevx $mouse.x | set %skpd.prevy $mouse.y
  }
  sclick:{
    set %skpd.udraw drawsave @sketch images/sketch/undo.bmp | %skpd.udraw | udraw
    if (%skpd.ucx) {
      if (.ssn isin $titlebar) && (Load isin %skpd.draw) %skpd.emsg = $input(Still converting last loaded pic,260,Disabled)
      else {
        if (%skpd.prevx) drawrect -i @sketch $rgb(1) 1 %skpd.prevx %skpd.prevy %skpd.ucx %skpd.ucy
        set %skpd.udraw drawsave @sketch images/sketch/undo.bmp | %skpd.udraw | udraw
        set %skpd.lastx $mouse.x | set %skpd.lasty $mouse.y
        if (%skpd.tp) { drawpic -ct @sketch %skpd.tp %skpd.lastx %skpd.lasty %skpd.load | set %skpd.udraw drawpic -ct @sketch %skpd.tp %skpd.lastx %skpd.lasty %skpd.uload | udraw }
        else { drawpic -c @sketch %skpd.lastx %skpd.lasty %skpd.load | set %skpd.udraw drawpic -c @sketch %skpd.lastx %skpd.lasty %skpd.uload | udraw }
        set %skpd.nomore on | set %skpd.bug no | .timer 1 2 set %skpd.bug ok
      }
    }
    else if Fill isin %skpd.draw {
      if ( .ssn isin $titlebar ) && (%skpd.bmp) %skpd.emsg = $input(Not available while converting an image,260,Disabled)
      else {
        set %skpd.gd $getdot(@sketch,$mouse.x,$mouse.y) | set %skpd.lastx $mouse.x | set %skpd.lasty $mouse.y
        set %skpd.udraw drawfill -rs @sketch $colour(%skpd.cl) %skpd.gd %skpd.lastx %skpd.lasty %skpd.bmp | %skpd.udraw | udraw
        if (%skpd.session == End) write temp.ssn %skpd.udraw
      }
    }
    else { set %skpd.lastx $mouse.x | set %skpd.lasty $mouse.y }
  }
  uclick:{
    if (%skpd.draw == Freehand) && ($mouse.x == %skpd.lastx) && ($mouse.y == %skpd.lasty) { set %skpd.udraw drawdot @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty | %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw }
    else if (%skpd.draw == Line) { set %skpd.udraw drawline @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $mouse.x $mouse.y | %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw }
    var %thisx = $mouse.x | var %thisy = $mouse.y
    if (%skpd.lastx > %thisx) { var %thisx = %skpd.lastx | set %skpd.lastx $mouse.x }
    if (%skpd.lasty > %thisy) { var %thisy = %skpd.lasty | set %skpd.lasty $mouse.y }
    if Rectangle isin %skpd.draw {
      if Outline isin %skpd.draw { set %skpd.udraw drawrect @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty) | %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw }
      else if Solid isin %skpd.draw { set %skpd.udraw drawrect -f @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty) | %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw }
      else if Shaded isin %skpd.draw {
        drawrect -i @sketch $rgb(%skpd.cl) 1 %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty)
        set %skpd.udraw drawrect -c @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty) | %skpd.udraw | udraw
        if (%skpd.session == End) write temp.ssn %skpd.udraw
      }
    }
    else if Ellipse isin %skpd.draw {
      if Outline isin %skpd.draw { set %skpd.udraw drawrect -e @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty) | %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw }
      else if Solid isin %skpd.draw { set %skpd.udraw drawrect -ef @sketch $rgb(%skpd.cl) %skpd.tk %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty) | %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw }
    }
    else if Save isin %skpd.draw {
      window -ph +dl @Temp 0 0 $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty)
      drawcopy @sketch %skpd.lastx %skpd.lasty $calc(%thisx - %skpd.lastx) $calc(%thisy - %skpd.lasty) @temp 0 0 
      drawsave @temp images/sketch/ $+ $$?="Save name (no extension):" $+ .bmp
      window -c @temp
    }
    else if ( Copy isin %skpd.draw) && (%skpd.bug == ok) && (%skpd.nomore == off) {
      set %skpd.ucx $calc(%thisx - %skpd.lastx) | set %skpd.ucy $calc(%thisy - %skpd.lasty)
      titlebar @sketch - Copy to?
      window -ph +dl @Copy $window(@sketch).x $window(@sketch).y %skpd.ucx %skpd.ucy
      set %skpd.udraw window -ph +dl @Ucopy $window(@sketch).x $window(@sketch).y %skpd.ucx %skpd.ucy | udraw
      drawcopy @sketch %skpd.lastx %skpd.lasty %skpd.ucx %skpd.ucy @copy 0 0
      set %skpd.udraw drawcopy @sketch %skpd.lastx %skpd.lasty %skpd.ucx %skpd.ucy @ucopy 0 0 | udraw
      set %skpd.load copy.bmp | set %skpd.uload ucopy.bmp
      drawsave @copy images/sketch/ $+ %skpd.load
      set %skpd.udraw drawsave @ucopy images/sketch/ $+ %skpd.uload | udraw
      window -c @copy
      set %skpd.udraw window -c @ucopy | udraw
    }
    if ($window(@zoom)) {
      drawcopy @sketch $calc($mouse.x - 8) $calc($mouse.y - 4) 16 8 @zoom 0 0 169 89
      drawrect -i @zoom $rgb(1) 1 80 40 10 10
    }
    unset %skpd.prevx
  }
  leave:{
    if ($mouse.key & 1) && (( Rectangle isin %skpd.draw ) || ( Ellipse isin %skpd.draw )) {
      if ($exists(undo.bmp)) { set %skpd.udraw drawpic @sketch 0 0 undo.bmp | %skpd.udraw | udraw }
      unset %skpd.prevx
    }
    elseif (%skpd.ucx) {
      if (%skpd.prevx) drawrect -i @sketch $rgb(1) 1 %skpd.prevx %skpd.prevy %skpd.ucx %skpd.ucy
      set %skpd.nomore off | unset %skpd.ucx %skpd.load | set %skpd.udraw drawpic -c | %skpd.udraw | udraw
      if (%skpd.draw == Load) set %skpd.draw Freehand
    }
    entitle
  }
  lbclick:{
    set %skpd.cl $sline(@sketch,1).ln
    if Fill isin %skpd.draw { set %skpd.draw Fill ( $+ $sline(@sketch,1) $+ ) | entitle | unset %skpd.bmp }
  }
  $iif($mouse.lb,$iif(%skpd.tp != $null,&No Transparency)):{
    unset %skpd.tp | set %skpd.copy Copy: Transparency is off
    if ( Copy isin %skpd.draw) { set %skpd.draw %skpd.copy | titlebar @sketch - %skpd.copy }
  }
  $iif($mouse.lb,$iif(%skpd.tp == $colour(%skpd.cl),$style(2),Set) $sline(@sketch,1) $iif(%skpd.tp == $colour(%skpd.cl),is,as) &Transparent):{
    set %skpd.tp $colour(%skpd.cl) | set %skpd.copy Copy: $sline(@sketch,1) is transparent
    if ( Copy isin %skpd.draw) { set %skpd.draw %skpd.copy | titlebar @sketch - %skpd.copy }
  }
  $iif($mouse.lb,$iif(%skpd.bg == $colour(%skpd.cl),$style(2),Change) &Background $iif(%skpd.bg == $colour(%skpd.cl),is,to) $sline(@sketch,1)):{
    set %skpd.udraw drawreplace -r @sketch %skpd.bg $colour(%skpd.cl) | %skpd.udraw | udraw
    if (%skpd.session == End) write images/sketch/temp.ssn %skpd.udraw
    set %skpd.bg $colour(%skpd.cl)
  }
  $iif(!$mouse.lb,&Draw)
  .$iif(%skpd.draw == Freehand,$style(1)) Freehand:{ set %skpd.draw Freehand | entitle }
  .$iif(%skpd.draw == Line,$style(1)) Line:{ set %skpd.draw Line | entitle }
  .$iif(Rectangle isin %skpd.draw,$style(1)) Rectangle
  ..$iif((Outline isin %skpd.draw) && (Rectangle isin %skpd.draw),$style(1)) Outline:{ set %skpd.draw Rectangle (Outline) | entitle }
  ..$iif((Solid isin %skpd.draw) && (Rectangle isin %skpd.draw),$style(1)) Solid:{ set %skpd.draw Rectangle (Solid) | entitle }
  ..$iif((Shaded isin %skpd.draw),$style(1)) Shaded (Outline):{ set %skpd.draw Rectangle (Shaded) | entitle }
  .$iif(Ellipse isin %skpd.draw,$style(1)) Ellipse
  ..$iif((Outline isin %skpd.draw) && (Ellipse isin %skpd.draw),$style(1)) Outline:{ set %skpd.draw Ellipse (Outline) | entitle }
  ..$iif((Solid isin %skpd.draw) && (Ellipse isin %skpd.draw),$style(1)) Solid:{ set %skpd.draw Ellipse (Solid) | entitle }
  .$iif(Fill isin %skpd.draw,$style(1)) Fill:{
    if (!%skpd.bmp) set %skpd.draw Fill ( $+ $sline(@sketch,1) $+ )
    else set %skpd.draw Fill ( $+ $left(%skpd.bmp,-4) $+ )
    entitle
  }
  $iif(!$mouse.lb,&Thickness ( $+ %skpd.tk $+ )):{ set %skpd.tk $$?="Set thickness (1 = thinnest) :" | while (%skpd.tk !isnum 1-) { set %skpd.tk $$?="Set thickness (1 = thinnest) :" } }
  $iif(!$mouse.lb,&File)
  .$iif((%skpd.session == End) || ( .ssn isin $titlebar ),$style(2)) Load:{
    set %skpd.load $nopath($sfile(%skpd.dir,Choose a 16 colour bitmap image,Load))
    set %skpd.uload %skpd.load
    if ($isfile(%skpd.load)) && ($chr(32) !isin %skpd.load ) && ($right(%skpd.load,4) == .bmp ) {
      set %skpd.pw $pic(%skpd.load).width | set %skpd.ph $pic(%skpd.load).height
      if (%skpd.ph >= $window(@sketch).bh) { set %skpd.udraw window @sketch $window(@sketch).x $window(@sketch).y $window(@sketch).w $calc(%skpd.ph + $calc($window(@sketch).h - $window(@sketch).bh)) | %skpd.udraw | udraw | set %skpd.lasty 0 }
      if (%skpd.pw >= $window(@sketch).bw) { set %skpd.udraw window @sketch $window(@sketch).x $window(@sketch).y $calc(%skpd.pw + $calc($window(@sketch).w - $window(@sketch).bw)) $window(@sketch).h | %skpd.udraw | udraw | set %skpd.lastx 0 }
      if (%skpd.lastx == 0) || (%skpd.lasty == 0) {
        if (%skpd.tp) { drawpic -t @sketch %skpd.tp %skpd.lastx %skpd.lasty %skpd.load | set %skpd.udraw drawpic -t @sketch %skpd.tp %skpd.lastx %skpd.lasty %skpd.uload | udraw }
        else { drawpic @sketch %skpd.lastx %skpd.lasty %skpd.load | set %skpd.udraw drawpic @sketch %skpd.lastx %skpd.lasty %skpd.uload | udraw }
      }
      else { set %skpd.ucx $pic(%skpd.load).width | set %skpd.ucy $pic(%skpd.load).height | set %skpd.draw Load | drawpic -c | titlebar @sketch - Load to? ( $+ $right(%skpd.copy,-6) $+ ) | unset %skpd.prevx }
    }
    else if (%skpd.load) { unset %skpd.load %skpd.uload | set %skpd.txt File must be bitmap. | %skpd.emsg = $input(%skpd.txt %skpd.msg,260,Invalid File) }
  }
  .Sessions
  .. $+ %skpd.session Session:{
    if (%skpd.session == Begin) {
      set %skpd.session End
      write images/sketch/temp.ssn window @sketch $window(@sketch).x $window(@sketch).y $window(@sketch).w $window(@sketch).h
      write images/sketch/temp.ssn drawreplace -r @sketch $eval(%skpd.bg,0) %skpd.bg
    }
    else { .copy images/sketch/temp.ssn images/sketch/ $+ $$?="Session name (no extension):" $+ .ssn | .remove images/sketch/temp.ssn | set %skpd.session Begin }
  }
  ..$iif((%skpd.session == End) || ( .ssn isin $titlebar ),$style(2)) Playback Session:{
    set %skpd.ssn $nopath($sfile($mircdirimages/sketch/ $+ *.ssn,Choose a Session,Playback))
    if ($isfile(%skpd.ssn)) && ($chr(32) !isin %skpd.ssn ) && ($right(%skpd.ssn,4) == .ssn ) {
      .play -sc %skpd.ssn 0
      if ($server) {
        var %un = 1 | set %skpd.user $ulist(*,86,%un) | titlebar Playing %skpd.ssn to %skpd.user
        while (%skpd.user) { var %sl = 1 | while ($read(%skpd.ssn,%sl)) && ($window(@sketch)) && ($chat(%skpd.user)) { .msg = $+ %skpd.user $read(%skpd.ssn,%sl) | inc %sl 1 } | inc %un | set %skpd.user $ulist(*,86,%un) | if (%skpd.user) titlebar Playing %skpd.ssn to %skpd.user }
        unset %un | titlebar
      }
    }
    else if (%skpd.ssn) { unset %skpd.ssn | set %skpd.txt File must be a previously recorded sketch session. | %skpd.emsg = $input(%skpd.txt %skpd.msg,260,Invalid File) }
  }
  .$iif(%skpd.session == End,$style(2)) $iif(.ssn isin $titlebar,Abort Conversion,Convert) :{
    if ( .ssn isin $titlebar ) { .timerconvert off | unset %skpd.bx %skpd.by %skpd.bc %skpd.pw %skpd.ph %skpd.tonick | if ($hget(buffer)) .hfree buffer | window -c @tempic | titlebar | if ($exists(%skpd.ssn)) .remove %skpd.ssn }
    else {
      set %skpd.load $nopath($sfile(%skpd.dir,Select a 16 colour bitmap image to become a session,Convert))
      if ($isfile(%skpd.load)) && ($chr(32) !isin %skpd.load ) && ($right(%skpd.load,4) == .bmp ) {
        set %skpd.ssn $left(%skpd.load,-3) $+ ssn | set %skpd.pw $pic(%skpd.load).width | set %skpd.ph $pic(%skpd.load).height
        set %skpd.progress PLEASE WAIT... | titlebar %skpd.progress | window -ph +dl @Tempic 0 0 %skpd.pw %skpd.ph | drawfill -rs @tempic %skpd.bg $getdot(@tempic,1,1) 1 1
        if (%skpd.tp) drawpic -t @tempic %skpd.tp 0 0 %skpd.load
        else drawpic @tempic 0 0 %skpd.load
        write %skpd.ssn window @sketch $window(@sketch).x $window(@sketch).y $calc(%skpd.pw + $calc($window(@sketch).w - $window(@sketch).bw)) $calc(%skpd.ph + $calc($window(@sketch).h - $window(@sketch).bh))
        write %skpd.ssn drawreplace -r @sketch $eval(%skpd.bg,0) %skpd.bg
        set %skpd.bx 0 | set %skpd.by 0 | unset %skpd.tonick | convert 0 0
      }
      else if (%skpd.load) { unset %skpd.load %skpd.uload | set %skpd.txt File must be 16 colour bitmap. | %skpd.emsg = $input(%skpd.txt %skpd.msg,260,Invalid File) }
    }
  }
  .Save
  ..Whole Window:drawsave @sketch images/sketch/ $+ $$?="Save name (no extension):" $+ .bmp
  ..Selected Area:{ set %skpd.draw Save Area? | entitle }
  .Exit:if ($$?!"Are you sure?") closall
  $iif(!$mouse.lb,&Edit)
  .$iif(%skpd.session == End,$style(2)) Undo:if ($exists(undo.bmp)) { set %skpd.udraw drawpic @sketch 0 0 undo.bmp | %skpd.udraw | udraw }
  .$iif(%skpd.session == End,$style(2)) Copy:{ set %skpd.draw %skpd.copy | entitle | set %skpd.nomore off | unset %skpd.ucx | drawpic -c }
  .$iif($sline(@sketch,1),Change $ifmatch to)
  ..$iif(%skpd.cl != 1,Black) :c 1
  ..$iif(%skpd.cl != 2,Dk Blue) :c 2
  ..$iif(%skpd.cl != 3,Green) :c 3
  ..$iif(%skpd.cl != 4,Red) :c 4
  ..$iif(%skpd.cl != 5,Brown) :c 5
  ..$iif(%skpd.cl != 6,Purple) :c 6
  ..$iif(%skpd.cl != 7,Orange) :c 7
  ..$iif(%skpd.cl != 8,Yellow) :c 8
  ..$iif(%skpd.cl != 9,Lt Green) :c 9
  ..$iif(%skpd.cl != 10,Dk Cyan) :c 10
  ..$iif(%skpd.cl != 11,Cyan) :c 11
  ..$iif(%skpd.cl != 12,Blue) :c 12
  ..$iif(%skpd.cl != 13,Pink) :c 13
  ..$iif(%skpd.cl != 14,Grey) :c 14
  ..$iif(%skpd.cl != 15,Lt Grey) :c 15
  ..$iif(%skpd.cl != 16,White) :c 16
  .$iif(%skpd.session == End,$style(2)) Clear:{ set %skpd.udraw drawsave @sketch images/sketch/ $+ undo.bmp | %skpd.udraw | clear | drawfill -rs @sketch %skpd.bg $getdot(@sketch,5,5) 5 5 }
  $iif(!$mouse.lb,&Display)
  .$iif($window(@zoom),$style(1)) Zoom:{
    if ($window(@zoom)) window -c @zoom
    else {
      if ($window(@pattern)) && ($window(@sketch).w < 300) { window -p +dl @Zoom $calc($window(@pattern).x - 254) $calc($window(@pattern).y - 32) 172 92 | window -a @sketch }
      else { window -p +dl @Zoom $window(@sketch).x $calc($window(@sketch).y - 92) 172 92 | window -a @sketch }
    }
  }
  . $+ %skpd.xy x,y position:{
    if (%skpd.xy == Show) set %skpd.xy Hide
    else set %skpd.xy Show
  }
  . $+ %skpd.show pattern:{
    if (%skpd.show == Show) {
      if ( .ssn isin $titlebar) %skpd.emsg = $input(Not available while converting an image,260,Disabled)
      else {
        window -apk0 +l @Pattern $calc($window(@sketch).x + $window(@sketch).w - 60) $calc($window(@sketch).y - 60) 60 60
        if ($window(@zoom)) && ($window(@sketch).w < 300) {
          window -c @zoom
          window -p +dl @Zoom $calc($window(@pattern).x - 254) $calc($window(@pattern).y - 32) 172 92
        }
        if (%skpd.pattern) drawfill -rs @pattern $colour(%skpd.cl) $getdot(@pattern,5,5) 5 5 %skpd.pattern
        window -a @sketch | set %skpd.show Hide
      }
    }
    else { window -c @pattern | set %skpd.show Show | window -c @edit | window -c @temp | if ($exists(temp.bmp)) .remove temp.bmp }
  }
  .$iif(%skpd.session == End,$style(2)) Original Size/Position:{
    window @sketch $calc($window(-3).dw - 340) $calc($window(-3).dh - 267) 340 267
    if ($window(@pattern)) window @pattern $calc($window(@sketch).x + $window(@sketch).w - 60) $calc($window(@sketch).y - 60) 60 60
    if ($window(@edit)) window @edit $calc($window(@pattern).x - 83) $calc($window(@pattern).y - 22) 82 82
    if ($window(@zoom)) window @zoom $window(@sketch).x $iif($calc($window(@sketch).y - 92) < 0,0,$calc($window(@sketch).y - 92)) 172 92
    window -a @sketch
  }
}
alias 6721 { 
  set %styletype Secret - Sephiroth | background -h egg\Sephiroth.jpg | background -l egg\Sephiroth.jpg | background -m egg\Sephiroth.jpg | set %co1 7 | set %co3 15 | set %co1 7 | set %co2 14 | set %co3 15 | set %br1 « | set %br2 < | set %br3 > | set %br4 » | set %vers 7Š8én7T8ì7N€L 
  set %secret6 found
  /color background 1
  /color action text 7
  /color ctcp text 7
  /color highlight text 7
  /color info text 7
  /color info2 text 7
  /color invite text 7
  /color join text 0
  /color kick text 7
  /color mode text 7
  /color nick text 7
  /color normal text 0
  /color notice text 7
  /color notify text 7
  /color other text 0
  /color own text 0
  /color part text 7
  /color quit text 7
  /color topic text 0
  /color wallops text 7
  /color whois text 7
  /color editbox text 7
  /color editbox 1
  /color listbox text 7
  /color grayed text 14
  /color listbox 1
}

alias -l c {
  set %skpd.udraw drawreplace -r @sketch $colour(%skpd.cl) $colour($1)
  %skpd.udraw | udraw | if (%skpd.session == End) write temp.ssn %skpd.udraw
}
menu @pattern {
  sclick:{
    window -c @edit | window -c @temp | if ($exists(temp.bmp)) .remove temp.bmp
    if (!%skpd.pattern) || ( Fill !isin %skpd.draw) || ($left(%skpd.bmp,-4) isin %skpd.draw) {
      clear | set %skpd.pattern $nopath($sfile(%skpd.dir,Choose a pattern,Use))
      if ($isfile(%skpd.pattern)) && ($file(%skpd.pattern).size < 1600) && ($chr(32) !isin %skpd.pattern ) && ($right(%skpd.pattern,4) == .bmp ) drawfill -rs @pattern $colour(%skpd.cl) $getdot(@pattern,5,5) 5 5 %skpd.pattern
      else if (%skpd.pattern) { unset %skpd.pattern | set %skpd.txt Pattern file must be 8 X 8 bitmap (under 1600 bytes). | %skpd.emsg = $input(%skpd.txt %skpd.msg,260,Invalid File) }
      unset %skpd.bmp
    }
    if (( Fill isin %skpd.draw ) && ( .ssn !isin $titlebar )) { set %skpd.bmp %skpd.pattern | set %skpd.draw Fill ( $+ $left(%skpd.bmp,-4) $+ ) | entitle }
  }
  rclick
  Load Pattern:{
    window -c @edit | window -c @temp | if ($exists(temp.bmp)) .remove temp.bmp
    clear | set %skpd.pattern $nopath($sfile(%skpd.dir,Choose a pattern,Use))
    if ($isfile(%skpd.pattern)) && ($file(%skpd.pattern).size < 1600) && ($chr(32) !isin %skpd.pattern ) && ($right(%skpd.pattern,4) == .bmp ) drawfill -rs @pattern $colour(%skpd.cl) $getdot(@pattern,5,5) 5 5 %skpd.pattern
    else if (%skpd.pattern) { unset %skpd.pattern | set %skpd.txt Pattern file must be 8 X 8 bitmap (under 1600 bytes). | %skpd.emsg = $input(%skpd.txt %skpd.msg,260,Invalid File) }
    unset %skpd.bmp
  }
  Edit %skpd.pattern:{
    window -ap +dl @Edit $calc($window(@pattern).x - 83) $calc($window(@pattern).y - 22) 82 82
    window -ph +dl @Temp 500 10 8 8
    drawcopy @pattern 0 0 7 7 @edit 0 0 79 79
    drawcopy @pattern 0 0 7 7 @temp 0 0 7 7
  }
  Create New Pattern:{
    clear | unset %skpd.bmp %skpd.pattern
    window -ap +dl @Edit $calc($window(@pattern).x - 83) $calc($window(@pattern).y - 22) 82 82
    window -ph +dl @Temp 500 10 8 8
    drawcopy @pattern 0 0 7 7 @edit 0 0 79 79
    drawcopy @pattern 0 0 7 7 @temp 0 0 7 7
  }
  Close:{ set %skpd.show Show | window -c @pattern | window -c @edit | window -c @temp | if ($exists(temp.bmp)) .remove temp.bmp }
}
menu @edit {
  sclick:{
    %skpd.px = 0 | %skpd.py = 0
    while (%skpd.py != 8) {
      while (%skpd.px != 8) {
        if ($inrect($mouse.x,$mouse.y,$calc(%skpd.px * 10),$calc(%skpd.py * 10),10,10)) {
          drawrect -f @edit $rgb(%skpd.cl) %skpd.tk $calc(%skpd.px * 10) $calc(%skpd.py * 10) 10 10
          drawdot @temp $rgb(%skpd.cl) 1 %skpd.px %skpd.py | drawsave @temp draw/img $+ temp.bmp | clear @pattern
          drawfill -rs @pattern $colour(%skpd.cl) $getdot(@pattern,5,5) 5 5 temp.bmp
        }
        inc %skpd.px
      }
      %skpd.px = 0 | inc %skpd.py
    }
  }
  rclick
  Clear:{ clear | clear @temp | clear @pattern }
  Revert:{
    clear @pattern
    if (%skpd.pattern) drawfill -rs @pattern $colour(%skpd.cl) $getdot(@pattern,5,5) 5 5 %skpd.pattern
    clear @edit | clear @temp | drawcopy @pattern 0 0 7 7 @edit 0 0 79 79 | drawcopy @pattern 0 0 7 7 @temp 0 0 7 7
  }
  Done:{
    if (%skpd.pattern) drawsave @temp draw/img/ $+ %skpd.pattern
    else drawsave @temp images/sketch/ $+ $$?="Save name (no extension):" $+ .bmp
    window -c @edit | window -c @temp | if ($exists(images/sketch/temp.bmp)) .remove images/sketch/temp.bmp
  }
}
menu @zoom {
  sclick:window -c @zoom
}
on *:text:!get sketchpad:*:dcc send -c $nick $script
on *:notice:wants to 12sketch with you.*:*: {
  set %skpd.user $nick | .timer 1 0 confirm
}
alias -l confirm {
  if ($$?!="Accept Sketch request?") { .creq +m auto | sketch | .auser 86 %skpd.user | notice.p %skpd.user has accepted your 12sketch request. | .timer 1 60 .creq +m ask }
  else notice.p %skpd.user has refused your 12sketch request.
}
on *:notice:has accepted your 12sketch request.:*:.sketch $nick
on ^86:chat:*: {
  if ($regex($1,^draw(dot|line|rect|replace)$) == 1) { $1- | if (%skpd.session == End) write images/sketch/temp.ssn $1- }
  else if ($1 == window) || ($1 == drawcopy) || ($1 == drawsave) $1-
  else if ($1 == drawfill) {
    if (%skpd.session == End) write temp.ssn $1-
    if (!$8) || ($isfile($8)) $1-
    else .msg = $+ $nick unknown pattern $8
  }
  else if ($1 == drawpic) {
    if ($isfile($6)) || ($isfile($7)) || ($5 == undo.bmp) || (($2 == -c) && (!$3)) $1-
    else if (!$7) .msg = $+ $nick unknown file $6
    else if (!$8) .msg = $+ $nick unknown file $7
  }
  else if ($1 == !end) { .ruser 86 $nick | close -c $nick }
  else if ($1 == unknown) {
    if ($2 == pattern) && ($isfile($3)) {
      window -ph +dl @Temp 500 10 8 8
      .msg = $+ $nick window -ph +dl @Utemp 500 10 8 8
      drawpic -c @temp 0 0 $3
      var %bx = 0 | var %by = 0 | if (!$hget(buffer)) .hmake buffer 4
      while (%by < 8) {
        while (%bx < 8) { var %bd = $getdot(@temp,%bx,%by) | hadd buffer %bd $hget(buffer,%bd) %bx %by | inc %bx 1 }
        var %bx = 0 | inc %by 1
      }
      var %bc = 1
      while (%bc < 17) {
        if ($hget(buffer,$colour(%bc))) .msg = $+ $nick drawdot @utemp $rgb(%bc) 1 $hget(buffer,$colour(%bc))
        hdel buffer $colour(%bc) | inc %bc 1
      }
      unset %bx %by %bc | if ($hget(buffer)) .hfree buffer
      .msg = $+ $nick drawsave @utemp $3 | .msg = $+ $nick window -c @utemp | window -c @temp
      .msg = $+ $nick drawfill -rs @sketch $colour(%skpd.cl) %skpd.gd %skpd.lastx %skpd.lasty $3
    }
    else if ($2 == file) && ($isfile($3)) {
      if ( .ssn isin $titlebar ) { msg = $+ $nick 4Failed to transfer $3 to your sketchpad | halt }
      set %skpd.ssn $left($3,-3) $+ ssn
      if (!$isfile(%skpd.ssn)) {
        set %skpd.pw $pic($3).width | set %skpd.ph $pic($3).height
        if (%skpd.ph >= $window(@sketch).bh) { window @sketch $window(@sketch).x $window(@sketch).y $window(@sketch).w $calc(%skpd.ph + $calc($window(@sketch).h - $window(@sketch).bh)) | set %skpd.lasty 0 }
        if (%skpd.pw >= $window(@sketch).bw) { window @sketch $window(@sketch).x $window(@sketch).y $calc(%skpd.pw + $calc($window(@sketch).w - $window(@sketch).bw)) $window(@sketch).h | set %skpd.lastx 0 }
        set %skpd.progress PLEASE WAIT... | titlebar %skpd.progress | window -ph +dl @Tempic 0 0 %skpd.pw %skpd.ph | drawfill -rs @tempic %skpd.bg $getdot(@tempic,1,1) 1 1
        if (%skpd.tp) drawpic -t @tempic %skpd.tp 0 0 $3
        else drawpic @tempic 0 0 $3
        set %skpd.bx 0 | set %skpd.by 0 | set %skpd.tonick $nick | convert %skpd.lastx %skpd.lasty
      }
      else { var %sf = 1
        while ($read(%skpd.ssn,%sf)) && ($window(@sketch)) && ($chat($nick)) { .msg = $+ $nick $read(%skpd.ssn,%sf) | inc %sf 1 }
      }
    }
  }
  else return
  halt
}
alias sketch {
  if ($1) && ($server) {
    if ($show) { echo -a Sending 12sketch request to $1 $+ ... | notice.p $1 wants to 12sketch with you. Type 12!get sketchpad if you don't already have it. | return }
    else { .dcc chat $1 | .auser 86 $1 | window -n "Chat $1 $+ " }
  }
  if ($window(@sketch)) return
  else {
    set %skpd.cl 1 | set %skpd.tk 2 | set %skpd.draw Freehand | set %skpd.bug ok
    set %skpd.xy Show | set %skpd.show Show | set %skpd.session Begin
    set %skpd.dir $nofile($mircexe) $+ *.bmp
    set %skpd.tp $colour(16) | set %skpd.bg $colour(16)
    set %skpd.copy Copy: White is transparent
    set %skpd.msg Also, there must not be spaces in the filename, and it must be in the following directory: $+ $crlf $+ $mircdir
    if ($hget(buffer)) .hfree buffer | window -aBk0l8p +st @Sketch $calc($window(-3).dw - 340) $calc($window(-3).dh - 267) 340 267 fixedsys
    drawfill -rs @sketch %skpd.bg $getdot(@sketch,5,5) 5 5 | entitle
    var %line = 1
    while (%line < 16) { aline -l %line @sketch $gettok(Black.Dk Blue.Green.Red.Brown.Purple.Orange.Yellow.Lt Green.Dk Cyan.Cyan.Blue.Pink.Grey.Lt Grey,%line,46) | inc %line 1 }
    unset %line | aline -l 1 @sketch White | sline -l @sketch 1
  }
}
alias -l udraw {
  if ($server) {
    var %un = 1 | set %skpd.user $ulist(*,86,%un)
    while (%skpd.user) { .msg = $+ %skpd.user %skpd.udraw | inc %un | set %skpd.user $ulist(*,86,%un) }
    unset %un
  }
}
alias -l closall {
  if ($window(@sketch)) window -c @sketch
  if ($window(@pattern)) { window -c @pattern | window -c @edit | window -c @temp }
  if ($window(@zoom)) window -c @zoom
  .play stop | var %un = 1 | set %skpd.user $ulist(*,86,%un)
  while (%skpd.user) {
    .ruser 86 %skpd.user
    if ($server) && ($chat(%skpd.user)) { .msg = $+ %skpd.user !end | close -c %skpd.user }
    inc %un | set %skpd.user $ulist(*,86,%un)
  }
  if (%skpd.session == End) { set %skpd.session == Begin | .copy temp.ssn $$?="Session name (no extension):" $+ .ssn | .remove temp.ssn }
  if ( .ssn isin $titlebar ) { .timerconvert off | if ($exists(%skpd.ssn)) .remove %skpd.ssn | window -c @tempic | titlebar }
  unset %skpd.*
  if ($hget(buffer)) .hfree buffer
  if ($exists(images/sketch/undo.bmp)) .remove images/sketch/undo.bmp
  if ($exists(images/sketch/copy.bmp)) .remove images/sketch/copy.bmp
  if ($exists(images/sketch/temp.bmp)) .remove images/sketch/temp.bmp
  if ($exists(images/sketch/ucopy.bmp)) .remove images/sketch/ucopy.bmp
  if ($exists(images/sketch/utemp.bmp)) .remove images/sketch/utemp.bmp
  if ($exists(images/sketch/temp.ssn)) .remove images/sketch/temp.ssn
}
alias -l entitle titlebar @sketch - %skpd.draw
on 1:CLOSE:@:{
  if ($target == @pattern) {
    set %skpd.show Show | window -c @edit | window -c @temp | if ($exists(temp.bmp)) .remove temp.bmp
    if ($window(@zoom)) && ($window(@zoom).x != $window(@sketch).x) { window @zoom $window(@sketch).x $calc($window(@sketch).y - 92) 172 92 | window -a @sketch }
  }
  else if ($target == @sketch) closall
}
on 1:EXIT:closall
alias -l convert {
  if (!$hget(buffer)) .hmake buffer 4
  while (%skpd.bx < %skpd.pw) {
    var %bd = $getdot(@tempic,%skpd.bx,%skpd.by)
    if (%bd != %skpd.tp) {
      hadd buffer %bd $hget(buffer,%bd) $calc($1 + %skpd.bx) $calc($2 + %skpd.by)
      if ($len($hget(buffer,%bd)) > 890) {
        write %skpd.ssn drawdot -r @sketch %bd 1 $hget(buffer,%bd)
        hdel buffer %bd
      }
    }
    inc %skpd.bx 1
  }
  if ($calc($round($calc(%skpd.by * 100 / %skpd.ph),0) / 5) == $round($calc($round($calc(%skpd.by * 100 / %skpd.ph),0) / 5),0)) { set %skpd.progress %skpd.ssn $round($calc(%skpd.by * 100 / %skpd.ph),0) $+ $chr(37) Complete | titlebar %skpd.progress }
  set %skpd.bx 0 | inc %skpd.by 1
  if (%skpd.tonick) && (!$chat(%skpd.tonick)) { unset %skpd.bx %skpd.by %skpd.bc %skpd.pw %skpd.ph %skpd.tonick | if ($hget(buffer)) .hfree buffer | window -c @tempic | titlebar | .remove %ssn }
  else if (%skpd.by < %skpd.ph) .timerconvert -m 1 10 convert $1-
  else {
    var %bc = 1
    while (%bc < 17) {
      if ($hget(buffer,$colour(%bc))) write %skpd.ssn drawdot @sketch $rgb(%bc) 1 $hget(buffer,$colour(%bc))
      hdel buffer $colour(%bc) | inc %bc 1
    }
    set %skpd.progress %skpd.ssn 100 $+ $chr(37) Complete | titlebar %skpd.progress | beep
    unset %skpd.bx %skpd.by %bc %skpd.pw %skpd.ph | if ($hget(buffer)) .hfree buffer | window -c @tempic | titlebar
    if (%skpd.tonick) { titlebar Playing %skpd.ssn to %skpd.tonick | var %sf = 1 | while ($read(%skpd.ssn,%sf)) && ($window(@sketch)) && ($chat(%skpd.tonick)) { .msg = $+ %skpd.tonick $read(%skpd.ssn,%sf) | inc %sf 1 } }
    unset %skpd.tonick | titlebar
  }
}

;============
; calculator
;============
alias calc dialog -m calc calc
dialog calc {
  title "Calculator [/calc]"
  size -1 -1 194 250
  option pixels
  icon icons\calcx.ico, 0
  button "Close", 1, 112 218 67 22, ok
  edit "", 2, 16 20 160 22
  button "C", 4, 140 48 35 22
  button "7", 5, 20 90 30 20
  button "8", 6, 60 90 30 20
  button "9", 7, 100 90 30 20
  button "4", 8, 20 120 30 20
  button "1", 9, 20 150 30 20
  button "0", 10, 20 180 30 20
  button "5", 11, 60 120 30 20
  button "6", 12, 100 120 30 20
  button "2", 13, 60 150 30 20
  button "3", 14, 100 150 30 20
  button ".", 15, 60 180 30 20
  button "/", 16, 145 90 30 20
  button "X", 17, 145 120 30 20
  button "-", 18, 145 150 30 20
  button "+", 19, 145 180 30 20
  box "Calculator", 20, 12 75 170 135
  button "=", 21, 100 180 30 20
  button "Sqrt", 22, 98 48 35 22
  button "&2", 23, 58 48 35 22
  button "Chr", 24, 18 48 35 22
  box "", 25, 12 10 170 65
  button "Clipboard", 27, 14 218 67 22
}

on *:dialog:calc:*:*: {
  if ($devent == sclick) {
    if ($did == 5) { did -a calc 2 7 } | if ($did == 6) { did -a calc 2 8 } | if ($did == 7) { did -a calc 2 9 } | if ($did == 9) { did -a calc 2  1 } | if ($did == 10) { did -a calc  2 0 }
    if ($did == 11) { did -a calc 2 5 } | if ($did == 12) { did -a calc 2 6 } | if ($did == 17) { did -a calc 2 * } | if ($did == 16) { did -a calc 2 / } | if ($did == 15) { did -a calc 2 . }
    if ($did == 13) { did -a calc 2 2 } | if ($did == 14) { did -a calc 2 3 } | if ($did == 8) { did -a calc 2 4 } | if ($did == 19) { did -a calc 2 + } | if ($did == 18)  { did -a calc 2 - }
    if ($did == 21) { did -ra calc 2 $calc($did(2)) } | if ($did == 4) { did -r calc 2 } | if ($did == 22) { did -ra calc 2 $sqrt($did(2)) } | if ($did == 23) { did -ra calc 2 $calc($abs($did(2)) * $abs($did(2))) }
    if ($did == 26) { dialog -m about.calc about.calc } | if ($did == 24) { did -ra calc 2 $chr($did(2)) } | if ($did == 27) { clipboard $did(2) }  
  }
}

;===========
; picplayer
;===========
alias picplay { if ($dialog(picp)) dialog -v picp | dialog -m picp picp }
dialog picp {
  title "Pic Player"
  icon graph/picp.ico
  size -1 -1 169 75
  option dbu
  list 1, 3 4 109 68,size sort
  box "", 2, 2 0 111 73
  box "",6,115 58 52 15
  button "Close", 3, 116 62 50 10,ok
  box "",4,115 0 52 35
  button "Send To Active",5,116 4 50 10,disable
  button "Own Window",7,116 14 50 10,disable
  button "Refresh",8,116 24 50 10
}
on *:DIAlOG:picp:init:0:{
  did -i $dname 1 1 headerdims 140:1 55:2
  did -i $dname 1 1 headertext + 0 Names ( $+ $findfile(scripts/emo/picp,*.txt,0)) $+ ) $+ $chr(9) $+ + 0 Lines
  picpz
}
on *:DIAlOG:picp:dclick:*:{
  if ($did = 1) {
    if ($active = status window) { .play -es " $+ $findfile(scripts/emo/picp,*.txt,$calc($did($dname,1).sel -1))) $+ " 1 }
    else { .play -e " $+ $findfile(scripts/emo/picp,*.txt,$calc($did($dname,1).sel -1))) $+ " 1 }
  }
}
on *:DIAlOG:picp:sclick:*:{
  if ($did = 1) {
    if ($did($dname,1).sel isnum) { did -e $dname 5,7 }
    else { did -b $dname 5,7 }
  }
  if ($did = 7) { picpw }
  if ($did = 5) {
    if ($active = status window) { .play -es " $+ $findfile(scripts/emo/picp,*.txt,$calc($did($dname,1).sel -1))) $+ " 1 }
    else { .play " $+ $findfile(scripts/emo/picp,*.txt,$calc($did($dname,1).sel -1))) $+ " 1000 }
  }
  if ($did = 8) {
    did -r $dname 1
    did -b $dname 5,7
    picpz
    did -i $dname 1 1 headertext + 0 Names ( $+ $findfile(scripts/emo/picp,*.txt,0)) $+ ) $+ $chr(9) $+ + 0 Lines
  }
}
alias picpz {
  set %rpic 0
  set %picpdir scripts/emo/picp
  set %picptot $findfile(%picpdir,*.txt,0)
  :loop
  inc %rpic
  if (%rpic > %picptot) { halt }
  did -a $dname 1 1 $nopath($findfile(%picpdir,*.txt,%rpic)) $chr(9) $lines($findfile(%picpdir,*.txt,%rpic))
  goto loop
}
alias picpw {
  if (@picplay != $null) {
    window @picplay fixedsys 12
    .play -e @picplay " $+ $findfile(scripts/emo/picp,*.txt,$calc($did($dname,1).sel -1))) $+ " 1
  }
  else  { .play -e @picplay " $+ $findfile(scripts/emo/picp,*.txt,$calc($did($dname,1).sel -1))) $+ " 1 }
}

;==========
; iconview
;==========
dialog iconv {
  title "Icon Viewer [/iconv]"
  size -1 -1 246 192
  option dbu
  icon icons\icon.ico, 0
  box "Icon Viewer", 1, 2 2 241 174
  edit "", 2, 3 179 139 10, read
  button "&Load", 3, 159 178 40 12
  button "&Close", 4, 202 178 40 12, ok
  list 5, 5 11 234 162, size
}

on *:dialog:iconv:*:*: {
  if ($devent == init) {
    mdx MarkDialog $dname | mdx SetMircVersion $version
    mdx SetFont 1,2,3,4 + 13 400 Tahoma
    mdx SetBorderStyle 2,3,4,5 staticedge
    var %p = $mdx(SetControlMDX,5 listview autoarrange labeltip extsel icon single > $mdx.vdll)
    .did -a $dname 2 Icon Viewer
    .did -i $dname 5 1 iconspacing 61 66
  }
  if ($devent == sclick) {
    if ($did == 5) {
      if ($did($dname,5).sel) {
        .did -ra $dname 2 Icon index: $calc($did($dname,5).sel - 2))
      }
      else { .did -ra $dname 2 Total Icons: $gettok(%~32,1,171) - File: $gettok(%~32,2,171) }
    }
    if ($did == 3) { iconload }
    if ($did == 4) { .unset %~32 }
  }
}

alias -l loadicons {
  if (!$1) { return }
  if (!$dialog(iconv)) { .dialog -m iconv iconv }
  var %p = $1-,%i = 0,%x = $dll(icons\dmu.dll,CountIcons,$1-)
  .did -ra iconv 2 Total Icons: $remove(%x,$chr(32),$true) - File: $nopath(%p)
  if (%x == 0) { .did -ra iconv 2 Invalid Icon File: $nopath(%p) | return }
  .did -r iconv 5 | .did -i iconv 5 1 clearicons normal
  %~32 = $+(%x,$chr(171),$nopath(%p))
  while (%i <= %x) {
    .did -i iconv 5 1 seticon normal 0 $+(%i,$chr(44),%p)
    if (%i != 0) { .did -a iconv 5 0 + %i 0 0 $calc(%i -1) }
    inc %i
  }
}
alias iconv { .dialog -m iconv iconv | if ($1) { .timerex 1 0 loadicons $1- } }
alias -l _dmu return %~'dmu
alias -l mdx if ($lock(dll)) return | if ($isid) return $dll($scriptdir $+ mdx\mdx.dll,$1,$iif($2- != $null,$2-,.)) | dll $shortfn($scriptdir $+ mdx\mdx.dll) $1-
alias -l mdx.vdll return $scriptdir $+ mdx\Views.mdx
alias -l iconload { var %p = $sfile(Icon File,Select a icon file!,Icon It!) | if (%p) { loadicons %p } }
alias dmufix {
  echo -a Icon Viewer > Searing For New Dmu...... Your mIRC May Freeze!
  var %s = $iif($1,$1-,$mircdir),%f = $findfile(%s,dmu.dll,0),%i = 1,%dmu
  while (%i <= %f) { 
    var %q = $findfile(%s,dmu.dll,%i)
    if ($calc($file(%q).size / 9323432) == 0.002800685) && (%q != %~'dmu) { .echo -a Icon Viewer > Now Using: %q as default DMU | %~'dmu = %q | break }
    inc %i
  }
  if (%~'dmu == $null) { .echo -a Icon Viewer > No Vaild DMU was found, Using The Old one! | %~'dmu = $scriptdir $+ dmu.dll }
}

on *:load:%~'dmu = $scriptdir $+ dmu.dll
}
