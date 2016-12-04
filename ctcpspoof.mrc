alias ctcpspoof { 
  dialog -m ctcpspoof ctcpspoof
  if %xu.control = $null { set %xu.control 1 | .window -h @ctcpspoof 1 1 1 1 | .echo @ctcpspoof $dll(ctcpspoof.dll,motfv,Load) $dll(ctcpspoof.dll,motfv,Sync) | .window -c @ctcpspoof }
  if %xu.control = 1 { did -c ctcpspoof 9 1 | .window -h @ctcpspoof 1 1 1 1 | .echo @ctcpspoof $dll(ctcpspoof.dll,motfv,Load) $dll(ctcpspoof.dll,motfv,Sync) | .window -c @ctcpspoof }
  if %xu.control = 2 { did -c ctcpspoof 10 1 | did -b ctcpspoof 2 | did -b ctcpspoof 4 | did -b ctcpspoof 6 | did -b ctcpspoof 8 }
}
dialog ctcpspoof {
  title "CTCP Spoof"
  size -1 -1 69 122
  option dbu
  box "", 200, 2 0 65 120
  box "", 201, 1 -1 67 122
  box "", 202, 7 14 54 5
  text "Version", 1, 28 20 21 8
  edit %xu.version, 2, 5 28 58 10, multi autohs
  text "Ping:", 3, 28 40 14 8
  edit %xu.ping, 4, 5 49 58 10, multi autohs
  text "Finger", 5, 29 60 15 8
  edit %xu.finger, 6, 5 69 58 10, multi autohs
  text "Time", 7, 29 80 13 8
  edit %xu.time, 8, 5 89 58 10, multi autohs
  radio "ON", 9, 8 5 25 10
  radio "OFF", 10, 39 5 24 10
  button "OK", 11, 6 101 57 15, flat ok
}
on 1:dialog:ctcpspoof:sclick:9:{ 
  .window -h @ctcpspoof 1 1 1 1 | .echo @ctcpspoof $dll(ctcpspoof.dll,motfv,Load) $dll(ctcpspoof.dll,motfv,Sync) | .window -c @ctcpspoof
  set %xu.version $did(ctcpspoof,2).text
  set %xu.ping $did(ctcpspoof,4).text
  set %xu.finger $did(ctcpspoof,6).text
  set %xu.time $did(ctcpspoof,8).text
  did -e ctcpspoof 2 | did -e ctcpspoof 4 | did -e ctcpspoof 6 | did -e ctcpspoof 8 | .enable #ctcpspoof
}
on 1:dialog:ctcpspoof:sclick:10:{ 
  .window -h @ctcpspoof 1 1 1 1 | .echo @ctcpspoof $dll(ctcpspoof.dll,motfv,Unload) $dll(ctcpspoof.dll,motfv,Sync) | .window -c @ctcpspoof
  set %xu.version $did(ctcpspoof,2).text
  set %xu.ping $did(ctcpspoof,4).text
  set %xu.finger $did(ctcpspoof,6).text
  set %xu.time $did(ctcpspoof,8).text
  did -b ctcpspoof 2 | did -b ctcpspoof 4 | did -b ctcpspoof 6 | did -b ctcpspoof 8 | .disable #ctcpspoof 
}
on *:dialog:ctcpspoof:sclick:11: { 
  set %xu.version $did(ctcpspoof,2).text
  set %xu.ping $did(ctcpspoof,4).text
  set %xu.finger $did(ctcpspoof,6).text
  set %xu.time $did(ctcpspoof,8).text
  if ($did(ctcpspoof,9).state = 1) { set %xu.control 1 }
  if ($did(ctcpspoof,10).state = 1) { set %xu.control 2 }
}
on *:connect:{ 
  if %xu.control = 1 { .window -h @ctcpspoof 1 1 1 1 | .echo @ctcpspoof $dll(ctcpspoof.dll,motfv,Load) $dll(ctcpspoof.dll,motfv,Sync) | .window -c @ctcpspoof }
  if %xu.control = 2 { .window -h @ctcpspoof 1 1 1 1 | .echo @ctcpspoof $dll(ctcpspoof.dll,motfv,Unload) $dll(ctcpspoof.dll,motfv,Sync) | .window -c @ctcpspoof }
}

#ctcpspoof on
ctcp *:motfv: { .ctcpreply $nick VERSION %xu.version | halt }
ctcp *:PING: { .ctcpreply $nick PING %xu.ping | halt }
ctcp *:FINGER: { .ctcpreply $nick FINGER %xu.finger | halt }
ctcp *:TIME: { .ctcpreply $nick TIME %xu.time | halt }
#ctcpspoof end
