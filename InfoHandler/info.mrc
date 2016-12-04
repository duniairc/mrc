;  InfoHandler v4.01, 270302, TG02 by RaMoZ <ramoz@online.no>
on *:LOAD: {
  if ($version < 5.91) {  
    echo $colour(info2) -at [InfoHandler] mIRC32 Version 6.0 or higher required.
    echo $colour(info2) -at [InfoHandler] Unloading script...
    .timer.info.unload 1 3 unload -rs $script 
    halt
  }
  if ($bits != 32) {
    echo $colour(info2) -at [InfoHandler] mIRC32 Version 6.0 or higher required.
    echo $colour(info2) -at [InfoHandler] Unloading script...
    .timer.info.unload 1 3 unload -rs $script 
    halt
  }
  writeini $info.ini InfoHandler info.ticks $ticks 
  dialog -mraov info.findfile info.findfile
}
menu channel,menubar {
  Infohandler
  .Stat
  ..$iif($active != Status Window,&OS (/stat -os)):/stat -os
  ..$iif($active != Status Window,O&S Uptime (/stat -osu)):/stat -osu
  ..$iif($active != Status Window,&Uptime (/stat -upt)):/stat -upt
  ..$iif($active != Status Window,&Memory Info (/stat -mem)):/stat -ram
  ..$iif($active != Status Window,&CPU Info (/stat -cpu)):/stat -cpu
  ..$iif($active != Status Window,&Screen Info (/stat -gfx)):/stat -gfx
  ..$iif($active != Status Window,&Connection (/stat -con)):/stat -con
  ..$iif($active != Status Window,&Network Interface Card (/stat -nic)):/stat -nic
  ..$iif($active != Status Window,&Hard Drive Info (/stat -hdd)):/stat -hdd $?="Enter a drive letter"
  .-

  .$iif($dialog(info.list) == $null,&List (/stat -l)):/stat -l
  .$iif($dialog(info.colour) == $null, &Colour Setup (/stat -c)):/stat -c
  .-
  .$iif($dialog(info.stat) == $null,&Dialog (/stat -d)):/stat -d
  .$iif($active != Status Window,&Small (/stat -small)):/stat -small
  .-
  .$iif($dialog(info.about) == $null,&About (/stat -a)):/stat -a
}
alias stat {
  if (($dialog(info.stat) == $null) && ($1 == -d)) { dialog -mraov info.stat info.stat | halt }
  elseif (($dialog(info.about) == $null) && ($1 == -a)) { dialog -mraovrraov info.about info.about | halt }
  elseif (($dialog(info.colour) == $null) && ($1 == -c)) { dialog -m info.colour info.colour | halt }
  elseif (($dialog(info.list) == $null) && ($1 == -l)) { dialog -m info.list info.list }
  elseif ($active == Status Window) { echo $colour(info2) -at [InfoHandler] Stats can only be sad to a channel }
  elseif ($1 == -os) { msg $active Running $dll($info.moo.dll,osinfo,_) | halt }
  elseif ($1 == -osu) { msg $active $info.os.uptime | halt }
  elseif ($1 == -upt) { msg $active $info.uptime | halt }
  elseif ($1 == -ram) { msg $active $info.mem.phys $info.mem.virt | halt }
  elseif ($1 == -mem) { msg $active $info.mem.phys $info.mem.virt | halt }
  elseif ($1 == -cpu) { msg $active $info.cpu | halt }
  elseif ($1 == -gfx) { msg $active $info.gfx $info.screen | halt }
  elseif ($1 == -con) { msg $active $info.con | halt }
  elseif ($1 == -nic) { msg $active $info.nic | halt }
  elseif ($1 == -small) { msg $active $info.small | halt }
  elseif ($1 == -hdd) { 
    if (($2 != $null) && ($disk($2).type == fixed)) { 
      if ($disk($left($2,1)).label != $null) { var %info.disk.label = (Label: $disk($left($2,1)).label $+ ) }
      msg $active $info.colour $+ $upper($left($2,1)) $+ :\ %info.disk.label $+  Free/Used: $round($calc(($disk($left($2,1)).free)/1024^2),2) $+ MB/ $+ $round($calc(($disk($left($2,1)).size - $disk($left($2,1)).free) / 1024^2),2) $+ MB [Size: $round($calc(($disk($left($2,1)).size)/1024^2),2) $+ MB] (File System: $dll($info.fsmem.dll,GetVolumeInfo,fstype $left($2,1) $+ :\) $+ )
    }
    halt 
  }
  elseif ($dialog(info.list) == $null) { dialog -m info.list info.list }
}
alias -l info.disk.1 { 
  if (($disk($1).type == cdrom) || ($disk($1).type == $null)) { return | halt }
  if ($disk($1).label != $null) { var %info.disk.label = ( $+ $disk($1).label $+ ) }
  return Disk Info on $upper($1) $+ :\ %info.disk.label 
}
alias -l info.disk.2 { 
  if (($disk($1).type == cdrom) || ($disk($1).type == $null)) { return | halt }
  return Free/Used Space: $round($calc(($disk($1).free)/1024^2),2) $+ MB ( $+ $round($calc(($disk($1).free / $disk($1).size) * 100),2) $+ $chr(37) $+ ) / $round($calc(($disk($1).size - $disk($1).free) / 1024^2),2) $+ MB ( $+ $round($calc((($disk($1).size - $disk($1).free) / $disk($1).size) * 100),2) $+ $chr(37) $+ ) [Size: $round($calc(($disk($1).size)/1024^2),2) $+ MB $+ ]
}
alias -l info.disk.3 { 
  if (($disk($1).type == cdrom) || ($disk($1).type == $null)) { return | halt }
  return File System: $dll($info.fsmem.dll,GetVolumeInfo,fstype $1 $+ :\) - Serial Number: $dll($info.fsmem.dll,GetVolumeInfo,serial $1 $+ :\) - Maximum Filename length: $dll($info.fsmem.dll,GetVolumeInfo,maxfilelen $1 $+ :\)
}
alias -l info.disk.4 { 
  if (($disk($1).type == cdrom) || ($disk($1).type == $null)) { return | halt }
  var %info.disk.flags = $dll($info.fsmem.dll,GetVolumeInfo, flags $1 $+ :\)
  if (%info.disk.flags == $null) { return This disk is not compressed. | halt }
  return This disk $iif(a !isincs %info.disk.flags,$null,preserve and enforce ACLs $+ $chr(44) ) $iif(c !isincs %info.disk.flags,$null,preserve the case of filenames $+ $chr(44) ) $iif(C !isincs %info.disk.flags,$null,support case-sensitive filenames $+ $chr(44) ) $iif(e !isincs %info.disk.flags,$null,support encryption $+ $chr(44) ) $iif(f !isincs %info.disk.flags,$null,file-based compression $+ $chr(44) ) $iif(o !isincs %info.disk.flags,$null,support object IDs $+ $chr(44) ) $iif(q !isincs %info.disk.flags,$null,support disk quotas $+ $chr(44) ) $iif(r !isincs %info.disk.flags,$null,support reparse points $+ $chr(44) ) $iif(s !isincs %info.disk.flags,$null,support sparse files $+ $chr(44) ) $iif(u !isincs %info.disk.flags,$null,support Unicode in filenames $+ $chr(44) ) and the disk is $iif(v !isincs %info.disk.flags,not) compressed.
}
alias -l info.small { return $info.colour $+ Windows $+ $os uptime: $+  $uptime(system,1) $info.cpu $info.mem.phys }
alias -l info.uptime {
  if ($readini($info.ini,InfoHandler,info.ticks) < $ticks) { writeini $info.ini InfoHandler info.ticks $ticks }
  return $info.colour $+ OS Uptime: $+  $uptime(system,1) [[ $+ $info.colour $+ Started: $+  $asctime($calc($ctime - $uptime(system) / 1000),HH:nn:ss @ dddd mmmm dd/mm/yyyy) $+ ]] ( $+ $info.colour $+ Record: $+  $duration($calc($readini($info.ini,InfoHandler,info.ticks) / 1000)) $+ )
}
alias -l info.server {
  if ($server(1) == $null) { return $info.colour $+ Not connected to server. $+  | halt }
  if ($usermode == $null) { return $info.colour $+ Usermode: $+  None. - $info.colour $+ Server: $+  $server(1) $+ : $+ $port [Duration: $duration($calc($ctime - $readini($info.ini,InfoHandler,info.connected))) | halt }
  return $info.colour $+ Usermode: $+  $usermode - Server: $server(1) $+ : $+ $port [Duration: $duration($calc($ctime - $readini($info.ini,InfoHandler,info.connected))) $+ ]]
}
on *:CONNECT: {
  writeini $info.ini InfoHandler info.connected $ctime
  if ($readini($info.ini,InfoHandler,info.ticks) < $ticks) { writeini $info.ini InfoHandler info.ticks $ticks }
}
on *:EXIT: { if ($readini($info.ini,InfoHandler,info.ticks) < $ticks) { writeini $info.ini InfoHandler info.ticks $ticks } }
alias -l info.con { 
  if ($dll($info.moo.dll,connection,_) == -1) { return $info.colour $+ Connection: $+  Local Area Network (LAN). | halt }
  return $info.colour $+ Connection: $+  $dll($info.moo.dll,connection,_)
}
alias -l info.mem.phys {
  var  %info.rb.used,%info.rb.unused,%info.rb.usedstr,%info.rb.unusedstr
  set %info.rb.used $round($calc($dll($info.moo.dll,rambar,_) / 100 * 20),0) | set %info.rb.unused $round($calc(20 - %info.rb.used),0)
  set %info.rb.usedstr $str($info.colour $+ I $+ ,%info.rb.used) | set %info.rb.unusedstr $str(-,%info.rb.unused)
  return $info.colour $+ Physical Memory Used: $+  $round($calc(($dll($info.fsmem.dll,GetMemInfo,totalphys) - $dll($info.fsmem.dll,GetMemInfo,freephys)) / 1024^2),2) $+ / $+ $round($calc($dll($info.fsmem.dll,GetMemInfo,totalphys) / 1024^2),2) $+ MB [Free: $round($calc($dll($scriptdirdlls\fsmem.dll,GetMemInfo,freephys) / 1024^2),2) $+ MB] [[ $+ %info.rb.usedstr $+ %info.rb.unusedstr $+ ]] $right($dll($info.moo.dll,meminfo,_),8)
}
alias -l info.mem.virt { return $info.colour $+ Virtual Memory Used: $+  $round($calc(($dll($info.fsmem.dll,GetMemInfo,totalvirtual) - $dll($info.fsmem.dll,GetMemInfo,freevirtual)) / 1024^2),2) $+ / $+ $round($calc($dll($info.fsmem.dll,GetMemInfo,totalvirtual) / 1024^2),2) $+ MB [Free: $round($calc($dll($info.fsmem.dll,GetMemInfo,freevirtual) / 1024^2),2) $+ MB] }
alias -l info.nic {
  if ($dll($info.moo.dll,interfaceinfo,_) == $null) { return $info.colour $+ Network Card: $+  None Detected. | halt }
  return $info.colour $+ Network Card: $+  $dll($info.moo.dll,interfaceinfo,_) 
}
alias -l info.user { 
  if ($server == $null) { return $info.colour $+ User: Not connected to server. | halt }
  return $info.colour $+ User: $+  $address($me,5)
}
alias -l info.os.uptime {
  if (($readini($info.ini,InfoHandler,info.file) == $null) || ($isfile($readini($info.ini,InfoHandler,info.file)) == $false)) { return $info.colour $+ OS Installed for: $+  Unable to calculate. | halt } 
  return $info.colour $+ OS Installed for: $+  $duration($calc($ctime - $file($readini($info.ini,InfoHandler,info.file)).ctime)) ( $+ $asctime($file($readini($info.ini,InfoHandler,info.file)).ctime,HH:nn:ss @ dddd mmmm dd/mm/yyyy) $+ )
}
; MBM5 Info not used in script.
alias -l info.mbm {
  var %info.mbm = $dll($info.moo.dll,mbm5info,_)
  if (%info.mbm  == not_loaded) { return MBM Not Loaded }
  var = %info.mbm5 System: $gettok(%info.mbm,1,44) $+ °C, CPU: $gettok(%info.mbm,2,44) $+ °C
  return %info.mbm
}
alias -l info.cpu {
  if ($left($dll($info.moo.dll,cpuinfo,_),2) == 2-) { return $info.colour $+ CPU: $+  Dual $remove($gettok($dll($info.moo.dll,cpuinfo,_),1,46),2-) } 
  if ($left($dll($info.moo.dll,cpuinfo,_),2) == 1-) { return $info.colour $+ CPU: $+  Single $remove($gettok($dll($info.moo.dll,cpuinfo,_),1,46),1-) }
}
alias -l info.screen { return $info.colour $+ Resolution: $+  $gettok($dll($info.moo.dll,screeninfo,_),1,32) Pixels $gettok($dll($info.moo.dll,screeninfo,_),2,32) @ $gettok($dll($info.moo.dll,screeninfo,_),3,32) ( $+ $calc(($window(-1).w) * ($window(-1).h)) Pixels) }
alias -l info.gfx { return $info.colour $+ Graphic/Video Card: $dll($info.moo.dll,gfxinfo,_) $+  }
alias -l info.colour { 
  if ($readini($info.ini,InfoHandler,info.colour) == $null) { return $readini($info.ini,InfoHandler,info.bold) $+ $readini($info.ini,InfoHandler,info.underscore) }
  return $readini($info.ini,InfoHandler,info.colour) $+ $readini($info.ini,InfoHandler,info.colour.number) $+ $readini($info.ini,InfoHandler,info.bold) $+ $readini($info.ini,InfoHandler,info.underscore) 
}
alias -l info.ini { return $scriptdir $+ \info.ini } 
alias -l info.fsmem.dll { return $scriptdir $+ dlls\fsmem.dll }
alias -l info.moo.dll { return $scriptdir $+ dlls\moo.dll }
dialog info.stat {
  size -1 -1 463 390
  title "[InfoHandler] - System Statistic Script"
  button "&Ok", 1, 410 335 52 22, ok
  button "&Refresh", 3, 410 362 52 22
  button "&About", 4, 410 11 52 22
  edit "", 6, 9 15 391 364, multi, hsbar, vsbar, autohs, return
  box "", 2, 5 5 400 380
}
on *:DIALOG:info.stat:*:*: {
  if ($devent == init) {
    did -ft info.stat 1 
    did -m info.stat 6 
    did -o info.stat 6 1 [InfoHandler] System Info file written at $asctime(HH:nn:ss @ dddd mmmm dd/mm/yyyy)
    did -o info.stat 6 2
    did -o info.stat 6 3 -- Operating System --
    did -o info.stat 6 4 OS: $dll($info.moo.dll,osinfo,_)
    did -o info.stat 6 5 $strip($info.os.uptime)
    did -o info.stat 6 6 $strip($info.uptime)
    did -o info.stat 6 7 
    did -o info.stat 6 8  -- Hardware Info --
    did -o info.stat 6 9 $strip($info.cpu)
    did -o info.stat 6 10 $strip($info.mem.phys) 
    did -o info.stat 6 11 $strip($info.mem.virt)
    did -o info.stat 6 12
    did -o info.stat 6 13 -- Display Info -- 
    did -o info.stat 6 14 $strip($info.gfx)
    did -o info.stat 6 15 $strip($info.screen)
    did -o info.stat 6 16 
    did -o info.stat 6 17 -- Connection Info --
    did -o info.stat 6 18 $strip($info.con)
    did -o info.stat 6 19 $strip($info.nic)
    did -o info.stat 6 20 $strip($info.server)
    did -o info.stat 6 21 
    did -o info.stat 6 22 -- User Info --
    did -o info.stat 6 23 $strip($info.user)
    did -o info.stat 6 24 Running mIRC $+ $bits v $+ $version K.Mardam-Bey
    did -o info.stat 6 25 InfoHandler v4.0, 270302, TG02 by RaMoZ <ramoz@hotmail.com>
    did -o info.stat 6 26 
    did -o info.stat 6 27 -- Hard Disk Info --
    var %info.lines = 28
    var %info.drive = 67
    while (%info.drive < 90) {
      if ($disk($chr(%info.drive)).type != fixed) { inc %info.drive | inc %info.lines | return }
      if ($disk($chr(%info.drive)).type == fixed) { 
        did -o info.stat 6 %info.lines $strip($info.disk.1($chr(%info.drive))) | inc %info.lines 
        did -o info.stat 6 %info.lines $strip($info.disk.2($chr(%info.drive))) | inc %info.lines 
        did -o info.stat 6 %info.lines $strip($info.disk.3($chr(%info.drive))) | inc %info.lines 
        ;did -o info.stat 6 %info.lines $strip($info.disk.4($chr(%info.drive))) | inc %info.lines 
        did -o info.stat 6 %info.lines | inc %info.lines
      }
      inc %info.drive
    }
  } 
  if ($devent == sclick) { 
    if ($did == 3) { 
      did -o info.stat 6 5 $strip($info.os.uptime)
      did -o info.stat 6 6 $strip($info.uptime)
      did -o info.stat 6 9 $strip($info.cpu)
      did -o info.stat 6 10 $strip($info.mem.phys) 
      did -o info.stat 6 11 $strip($info.mem.virt)
      did -o info.stat 6 14 $strip($info.gfx)
      did -o info.stat 6 15 $strip($info.screen)
      did -o info.stat 6 18 $strip($info.con)
      did -o info.stat 6 19 $strip($info.nic)
      did -o info.stat 6 20 $strip($info.server)
      did -o info.stat 6 23 $strip($info.user)
      var %info.lines = 28
      var %info.drive = 67
      while (%info.drive < 90) {
        if ($disk($chr(%info.drive)).type != fixed) { inc %info.drive | inc %info.lines | return }
        if ($disk($chr(%info.drive)).type == fixed) { 
          did -o info.stat 6 %info.lines $strip($info.disk.1($chr(%info.drive))) | inc %info.lines 
          did -o info.stat 6 %info.lines $strip($info.disk.2($chr(%info.drive))) | inc %info.lines 
          did -o info.stat 6 %info.lines $strip($info.disk.3($chr(%info.drive))) | inc %info.lines 
          ;did -o info.stat 6 %info.lines $strip($info.disk.4($chr(%info.drive))) | inc %info.lines 
          did -o info.stat 6 %info.lines | inc %info.lines
        }
        inc %info.drive
      }
    }
    if ($did == 4) { if ($dialog(info.about) == $null) { dialog -m info.about info.about } 
    }
  }
}
dialog info.about {
  size -1 -1 182 152
  title "[InfoHandler] About"
  button "&Ok", 1, 5 125 172 22,cancel
  box "About InfoHandler", 2, 5 10 172 110
  text "Info Handler by", 3, 17 25 75 15
  text "Version 4.01, 270302, TG02", 4, 17 40 160 15
  text "moo.dll written by", 5, 17 55 87 15
  text "(Version 4.0.3.10)", 6, 17 70 160 15
  text "fsmem.dll written by", 7, 17 85 97 15
  text "(Version 1.02)", 8, 17 100 160 15
  link "RaMoZ", 9, 95 25 35 15
  link "marky", 10, 105 55 35 15
  link "DragonZap", 11, 116 85 55 15
}
on *:DIALOG:info.about:*:*: {
  if ($devent == init) { did -ft info.about 1 } 
  if ($devent == sclick) {
    if ($did == 9) { run mailto:ramoz@online.no?subject=InfoHandler 4.0 }
    if ($did == 10) { run http://www.influenced.net }
    if ($did == 11) { run http://DragonZaps.homepage }
  }
}
dialog info.list {
  size -1 -1 256 233
  title "[InfoHandler] - Command List"
  button "&Ok", 1, 3 207 250 22, cancel
  box "Syntax:", 2, 3 1 250 202
  text "/stat -d 			[Dialoged Info]", 3, 10 15 250 20
  text "/stat -a 		  	[About Dialog]", 4, 10 28 250 20
  text "/stat -c 		  	[Colour Setup]", 5, 10 41 250 20
  text "/stat -l 		  	[List Box]", 6, 10 54 250 20
  text "/stat -os 		[OS Info]", 7, 10 67 250 20
  text "/stat -osu 		[OS Installed for]", 8, 10 80 250 20
  text "/stat -upt 		[OS Uptime]", 9, 10 93 250 20
  text "/stat -mem 		[MEM Info]", 10, 10 106 250 20
  text "/stat -cpu 		[CPU Info]", 11, 10 119 250 20
  text "/stat -gfx 		[Screen Info]", 12, 10 132 250 20
  text "/stat -con 		[Connetion Info]", 13, 10 145 250 20
  text "/stat -nic 		[Network Interface Card]", 14, 10 158 250 20
  text "/stat -hdd <drive>	[Hard-Drive Info]", 15, 10 171 250 20
  text "/stat -small		[Small System Info]", 16, 10 184 250 20
}
on *:DIALOG:info.list:*:*: { if ($devent == init) { did -ft info.list 1 } }
dialog info.colour {
  size -1 -1 210 50
  title "[InfoHandler] - Colour Setup"
  button "&Ok", 1, 106 25 100 22, cancel
  check "&Bold", 2, 3 5 40 20
  check "&Underscore", 3, 50 5 75 20
  check "&Colour", 4, 130 5 55 20
  edit "12", 5, 185 1 22 22 ; colour number
  button "&Example", 6, 3 25 100 22
}
dialog info.findfile {
  size -1 -1 224 77
  title "[InfoHandler] - Load script"
  button "&Ok", 1, 5 47 210 25, ok
  box "", 2, 5 3 215 40
  text "InfoHandler will now try to find system.log", 3, 12 12 505 13
  text "on your computer. This may take a while.", 4, 12 25 505 13
}
on *:DIALOG:info.findfile:*:*: {
  if ($devent == init) { did -ft info.findfile 1 }
  if ($devent == sclick) { 
    if ($did == 1) { 
      dialog -t info.findfile [InfoHandler] - Finding file...
      var %info.found = $findfile($left($dll($info.fsmem.dll,GetWinDir,_),3),system.log,1)
      if (%info.found == $null) { writeini writeini $info.ini InfoHandler info.file $!null | echo $colour(info2) -at [InfoHandler] Unable to find system.log | dialog -x info.findfile info.findfile | halt }
      writeini $info.ini InfoHandler info.file %info.found
      echo $colour(info2) -at [InfoHandler] Successfully found $readini($info.ini,InfoHandler,info.file)
    }
  }
}
on *:DIALOG:info.colour:*:*: {
  if ($devent == init) { 
    did -ft info.colour 1 
    did -r info.colour 5
    if ($readini($info.ini,InfoHandler,info.bold) != $null) { did -c info.colour 2 } 
    if ($readini($info.ini,InfoHandler,info.underscore) != $null) { did -c info.colour 3 }
    if ($readini($info.ini,InfoHandler,info.colour) != $null) { did -c info.colour 4 | did -a info.colour 5 $readini($info.ini,InfoHandler,info.colour.number) }
    if ($readini($info.ini,InfoHandler,info.colour) == $null) { did -u info.colour 4 | did -m info.colour 5 | did -a info.colour 5 $readini($info.ini,InfoHandler,info.colour.number) }
  }
  if ($devent == sclick) { 
    if ($did == 1) { 
      if ($did(info.colour,2).state == 0) { writeini $info.ini InfoHandler info.bold $!null }
      if ($did(info.colour,2).state == 1) { writeini $info.ini InfoHandler info.bold $!chr(2) }
      if ($did(info.colour,3).state == 0) { writeini $info.ini InfoHandler info.underscore $!null }
      if ($did(info.colour,3).state == 1) { writeini $info.ini InfoHandler info.underscore $!chr(31) }
      if ($did(info.colour,4).state == 0) { writeini $info.ini InfoHandler info.colour $!null }
      if (($did(info.colour,4).state == 1) && ($did(info.colour,5).text == $null)) { writeini $info.ini InfoHandler info.colour $!null | writeini $info.ini InfoHandler info.colour.number $!null }
      if (($did(info.colour,4).state == 1) && ($did(info.colour,5).text != $null)) { writeini $info.ini InfoHandler info.colour $!chr(3) | writeini $info.ini InfoHandler info.colour.number $did(info.colour,5).text } 
      if ($window(@InfoHandler)) { window -c @InfoHandler }
    }
    if ($did == 4) {
      if ($did(info.colour,4).state == 1) { did -n info.colour 5 }
      if ($did(info.colour,4).state == 0) { did -m info.colour 5 }
    } 
    if ($did == 6) { 
      if ($did(info.colour,2).state == 0) { writeini $info.ini InfoHandler info.bold $!null }
      if ($did(info.colour,2).state == 1) { writeini $info.ini InfoHandler info.bold $!chr(2) }
      if ($did(info.colour,3).state == 0) { writeini $info.ini InfoHandler info.underscore $!null }
      if ($did(info.colour,3).state == 1) { writeini $info.ini InfoHandler info.underscore $!chr(31) }
      if ($did(info.colour,4).state == 0) { writeini $info.ini InfoHandler info.colour $!null }
      if (($did(info.colour,4).state == 1) && ($did(info.colour,5).text == $null)) { writeini $info.ini InfoHandler info.colour $!null | writeini $info.ini InfoHandler info.colour.number $null }
      if (($did(info.colour,4).state == 1) && ($did(info.colour,5).text != $null)) { writeini $info.ini InfoHandler info.colour $!chr(3) | writeini $info.ini InfoHandler info.colour.number $did(info.colour,5).text } 
      window @InfoHandler -1 -1 744 60 Fixedsys 9
      titlebar @InfoHandler Example view.
      aline @InfoHandler $info.cpu
      aline @InfoHandler $info.mem.phys
    }
  }
}
; EOF, 342 lines, 20.6k
