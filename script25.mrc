dialog chanop {
  title "Protections"
  size -1 -1 230 143
  option dbu
  icon %aria
  tab "Channel 1" , 100, 5 0 220 138
  tab "Channel 2" 103
  tab "Channel Options" 104
  tab "Personal" 102
  tab "Set Kick Messages" 101
  menu "Protection" 630
  item "ON" 631
  item "OFF" 632
  menu "View" 600
  item "Channel 1" 601
  item "Channel 2" 602
  item "Chan options" 605
  item "Personal" 604
  item "Kick Msg" 603
  menu "Help" 610
  item "Contents" 611
  item "Search..." 612
  item break, 614
  item "Read Me" 613
  menu "Close" 620
  item "_   Mini." 621
  item "[]   Max." 622
  item "X   Close" 623
  button "OK", 1000, 150 125 30 10, ok , default
  button "Help" 1001, 183 125 30 10
  check "bad Word " 1, 20 35 35 10, tab 100
  check "Repeat" 3, 20 49 35 10, tab 100
  check "Flood " 4, 20 63 35 10, tab 100
  check "Big Msg" 5, 20 77 35 10, tab 100
  check "Advertise" 8, 20 91 35 10, tab 100
  check "Server" 18, 60 93 25 6, tab 100
  check "Channel" 28, 85 93 30 6, tab 100
  check "Site" 38, 115 93 18 6, tab 100
  check "Join/part or Join/quit on:" 900, 20 105 68 10, tab 100
  button "Add or delet bad words" 11, 60 35 70 10 , tab 100
  edit "" 13, 72 49 12 9 , center , tab 100
  edit "" 23, 105 49 12 9, center , tab 100
  edit "" 14, 72 63 12 9 , center , tab 100
  edit "" 24, 105 63 12 9 , center , tab 100
  edit "" 15, 72 77 17 9 , center , tab 100
  edit "" 904, 88 105 12 9, center , tab 100
  combo 41, 135 35 35 50, drop , tab 100
  combo 43, 135 49 35 50, drop , tab 100
  combo 44, 135 63 35 50, drop , tab 100
  combo 45, 135 77 35 50, drop , tab 100
  combo 48, 135 91 35 50, drop , tab 100
  combo 901, 135 105 35 50, drop , tab 100
  edit "" 51, 174 35 22 10, center, tab 100
  edit "" 53, 174 49 22 10, center, tab 100
  edit "" 54, 174 63 22 10, center, tab 100
  edit "" 55, 174 77 22 10, center, tab 100
  edit "" 58, 174 91 22 10, center, tab 100
  edit "" 902, 174 105 22 10, center, tab 100
  text "Max:" 500, 60 51 11 10, tab 100
  text "Times in " 501, 85 51 20 10, tab 100
  text "Sec." 502, 118 51 11 10 , tab 100
  text "Max:" 503, 60 65 11 10, tab 100
  text "Lines in " 504, 85 65 20 10, tab 100
  text "Sec." 505, 118 65 11 10 , tab 100
  text "Max:" 506, 60 79 11 10, tab 100
  text "lletters" 507, 90 79 17 10, tab 100
  text "Ban time:" 516, 174 28 25 7, tab 100
  text "Sec." 521, 197 37 15 10, tab 100
  text "Sec." 523, 197 51 15 10, tab 100
  text "Sec." 524, 197 65 15 10, tab 100
  text "Sec." 525, 197 79 15 10, tab 100
  text "Sec." 528, 197 93 15 10, tab 100
  text "Sec." 903, 197 107 15 10, tab 100
  text "Sec." 905, 101 107 15 10, tab 100
  box "Text and Flood:" 200, 15 20 200 101, tab 100

  box "Nicks:" 204, 15 20 200 50, tab 103
  box "" 205, 115 20 100 50, tab 103
  box "Joins:" 206, 15 70 200 51, tab 103
  box "" 207, 115 70 100 51, tab 103
  check "Bad nick " 2, 20 30 35 10, tab 103
  radio "kick and ban nick*!*@*" 22 , 30 42 65 8 , tab 103
  button "Add or delet bad nicks" 12, 30 54 70 9 , tab 103
  check "Nick Flood" 6, 120 30 35 10, tab 103
  edit "" 16, 142 42 12 9 , center , tab 103
  edit "" 26, 175 42 13 9, center , tab 103
  edit "" 56, 166 54 22 9, center, tab 103
  check "Clone" 9, 20 80 30 10, tab 103
  edit "" 19, 42 90 12 9, center , tab 103
  combo 49, 30 104 66 50, drop , tab 103
  check "Join Flood" 7, 120 80 35 10, tab 103
  edit "" 17, 142 92 12 9 , center , tab 103
  edit "" 27, 175 92 13 9, center , tab 103
  combo 47, 130 104 35 50, drop , tab 103
  edit "" 57, 166 104 22 10, center, tab 103
  text "Max:" 508, 130 44 11 10, tab 103
  text "Nicks in" 509, 155 44 20 10, tab 103
  text "Sec." 510, 189 44 15 10 , tab 103
  text "Ban nick*!*@*" 558, 130 56 36 10 , tab 103
  text "Sec." 526, 189 56 15 10, tab 103
  text "Max:" 511, 130 94 11 10, tab 103
  text "Joins in " 512, 155 94 20 10, tab 103
  text "Sec." 513, 189 94 11 10 , tab 103
  text "Sec." 527, 189 106 15 10, tab 103
  text "Max:" 514, 30 92 11 10, tab 103
  text "nicks with 1 host" 515, 55 92 50 10, tab 103

  box "Edit Kick Messages:" 201, 15 17 200 104, tab 101
  text "Bad word:" 531, 25 29 30 8, tab 101
  text "Bad Nick:" 532, 25 39 30 8, tab 101
  text "Repeat:" 533, 25 49 30 8, tab 101
  text "Flood:" 534, 25 59 30 8, tab 101
  text "Big Msg:" 535, 25 69 30 8, tab 101
  text "Nick Flood:" 536, 25 79 30 8, tab 101
  text "Join Flood:" 537, 25 89 30 8, tab 101
  text "Advertise:" 538, 25 99 30 8, tab 101
  text "Clone:" 539, 25 109 30 8, tab 101
  edit "" 61, 55 27 140 10, autohs , tab 101
  edit "" 62, 55 37 140 10, autohs , tab 101
  edit "" 63, 55 47 140 10, autohs , tab 101
  edit "" 64, 55 57 140 10, autohs , tab 101
  edit "" 65, 55 67 140 10, autohs , tab 101
  edit "" 66, 55 77 140 10, autohs , tab 101
  edit "" 67, 55 87 140 10, autohs , tab 101
  edit "" 68, 55 97 140 10, autohs , tab 101
  edit "" 69, 55 107 140 10, autohs , tab 101

  box "in query:" 202, 15 18 200 45 , tab 102
  box "in Channel:" 203, 15 65 200 50, tab 102
  check "Query Flood" 71, 20 28 38 10 , tab 102
  check "Notice Flood" 72, 20 38 40 10 , tab 102
  check "CTCP Flood" 73, 20 48 38 10 , tab 102
  edit "" 711, 77 28 14 9,center,  tab 102
  edit "" 712, 112 28 14 9,center, tab 102
  edit "" 713, 174 28 16 9,center, tab 102
  edit "" 721, 77 38 14 9,center,  tab 102
  edit "" 722, 112 38 14 9,center, tab 102
  edit "" 723, 174 38 16 9,center, tab 102
  edit "" 731, 77 48 14 9,center,  tab 102
  edit "" 732, 112 48 14 9,center, tab 102
  edit "" 733, 174 48 16 9,center, tab 102
  text "Max:" 540, 65 29 11 8 , tab 102
  text "Max:" 541, 65 39 11 8 , tab 102
  text "Max:" 542, 65 49 11 8 , tab 102
  text "Lines in" 543, 92 29 18 8 , tab 102
  text "Lines in" 544, 92 39 18 8 , tab 102
  text "CTCP in" 545, 92 49 20 8 , tab 102
  text "Sec." 546, 128 29 11 8 , tab 102
  text "Sec." 547, 128 39 11 8 , tab 102
  text "Sec." 548, 128 49 11 8 , tab 102
  text "Ignore For:" 549 , 146 29 28 8, tab 102
  text "Ignore For:" 550 , 146 39 28 8, tab 102
  text "Ignore For:" 551 , 146 49 28 8, tab 102
  text "Sec." 552, 192 29 11 8, tab 102
  text "Sec." 553, 192 39 11 8, tab 102
  text "Sec." 554, 192 49 11 8, tab 102
  check "Anti deop" 81, 20 75 33 10 , tab 102
  check "Anti kick" 82, 20 87 31 10 , tab 102
  check "Anti ban" 83, 20 99 30 10 , tab 102
  radio "kick" 811, 55 75 20 10 , group 1 , tab 102
  radio "deop" 812, 76 75 22 10 , tab 102
  radio "kick-deop" 813, 99 75 33 10 , tab 102
  radio "kick-ban" 814, 134 75 30 10 , tab 102
  radio "kick" 821, 55 87 20 10 , group 2 , tab 102
  radio "deop" 822, 76 87 22 10 , tab 102
  radio "kick-deop" 823, 99 87 33 10 , tab 102
  radio "kick-ban" 824, 134 87 30 10 , tab 102
  radio "kick" 831, 55 99 20 10 , group 3 , tab 102
  radio "deop" 832, 76 99 22 10 , tab 102
  radio "kick-deop" 833, 99 99 33 10 , tab 102
  radio "kick-ban" 834, 134 99 30 10 , tab 102
  combo 815, 178 74 32 50 , drop , tab 102
  combo 825, 178 86 32 50 , drop , tab 102
  combo 835, 178 98 32 50 , drop , tab 102
  text "on:" 555, 168 76 7 10 , tab 102
  text "on:" 556, 168 88 7 10 , tab 102
  text "on:" 557, 168 100 7 10 , tab 102

  check "IF Banned Send Kick MSG:" 70, 20 30 74 10 , tab 104
  radio "Msg to Channel" 701, 40 41 48 10 , tab 104
  radio "Notice to Nick" 702, 40 50 44 10 , tab 104
  check "IF Banned Show Me Reason" 705 , 20 62 78 10 , tab 104
  check "Don't Kick Ban Ops" 703, 20 74 56 10 , tab 104
  check "Don't Kick Ban Voices" 704, 20 86 62 10 , tab 104
  box "" 210, 15 20 200 101, tab 104
  box "Set options:" 211, 15 20 85 101, tab 104
  box "Ban Type:" 212, 99 20 116 101, tab 104
  box "" 213, 99 43 116 78, tab 104
  text "Select Ban Type:" 559, 108 33 45 10 , tab 104
  text "Don't Ban This Nicks Or Hosts:" 560, 108 50 75 8 , tab 104
  list 561, 105 58 105 31 , sort , size , tab 104
  edit "" 562, 105 100 105 10 , autohs , tab 104 
  text "For delete, select and prees =>" 563,108 92 75 8 , tab 104
  button "Delete" 564,184 91 25 8 , tab 104
  text "For add, enter host or nick" 565,108 111 75 8 , tab 104
  button "Add" 566,184 111 25 8 , tab 104
  combo 850 , 150 30 58 50 , drop , tab 104
}
on 1:dialog:chanop:*:*:{
  if ($devent == init) {
    if (%swear == ON) did -c  $dname 1
    if (%swear == OFF) { did -b  $dname 11 }
    if (%badnick == ON) { did -c  $dname 2 | did -c  $dname 22 }
    if (%badnick == OFF) { did -b $dname 12 | did -b  $dname 22 }
    if (%repeat == ON) did -c  $dname 3
    if (%repeat == OFF) { did -b $dname 13 | did -b $dname 23 }
    if (%Flood == ON) did -c  $dname 4
    if (%Flood  == OFF) { did -b $dname 14 | did -b $dname 24 }
    if (%Bigmsg == ON) did -c $dname 5
    if (%Bigmsg == OFF) { did -b $dname 15 }
    if (%nickfloodkick == ON) did -c  $dname 6
    if (%nickfloodkick == OFF) { did -b $dname 16 | did -b $dname 26 | did -b $dname 56 }
    if (%joinflood == ON) did -c  $dname 7
    if (%joinflood == OFF) { did -b $dname 17 | did -b $dname 27 | did -b $dname 47 | did -b $dname 57 }
    if (%Advertise == ON) did -c  $dname 8
    if (%Advertise == OFF) { did -b $dname 18 | did -b $dname 28 | did -b $dname 38 }
    if (%AdvertiseServer == ON) did -c  $dname 18
    if (%joinpartban == ON) did -c $dname 900
    if (%joinpartban == OFF) did -b $dname 904
    if (%AdvertiseChan == ON) did -c  $dname 28
    if (%AdvertiseSite == ON) did -c  $dname 38
    if (%clonekick == ON) did -c  $dname 9
    if (%clonekick == OFF) { did -b $dname 19 | did -b $dname 49 }
    if (%swear.kb == 1) did -b $dname 51
    if (%repeat.kb == 1) did -b $dname 53
    if (%flood.kb == 1) did -b $dname 54
    if (%bigmsg.kb == 1) did -b $dname 55
    if (%Advertise.kb == 1) did -b $dname 58
    if (%sendnotice.kmsg == ON) did -c $dname 70
    if (%sendnotice.kmsg == OFF) { did -b $dname 701 | did -b $dname 702 }
    if (%sendnoticeto.kmsg == chan) did -c $dname 701
    if (%sendnoticeto.kmsg == nick) did -c $dname 702
    if (%dontkbops == ON) did -c $dname 703
    if (%dontkbvoices == ON) did -c $dname 704
    if (%showmereason == ON) did -c $dname 705
    if (%pmflood == ON) did -c $dname 71
    if (%pmflood == OFF) { did -b $dname 711 | did -b $dname 712 | did -b $dname 713 }
    if (%pnoticeflood == ON) did -c $dname 72
    if (%pnoticeflood == OFF) { did -b $dname 721 | did -b $dname 722 | did -b $dname 723 }
    if (%pctcpflood == ON) did -c $dname 73
    if (%pctcpflood == OFF) { did -b $dname 731 | did -b $dname 732 | did -b $dname 733 }
    if (%antideop == ON) { did -c $dname 81 }
    if (%antideop == OFF) { did -b $dname 811 | did -b $dname 812 | did -b $dname 813 | did -b $dname 814 | did -b $dname 815 }
    if (%antikick == ON) { did -c $dname 82 }
    if (%antikick == OFF) { did -b $dname 821 | did -b $dname 822 | did -b $dname 823 | did -b $dname 824 | did -b $dname 825 }
    if (%antiban == ON) { did -c $dname 83 }
    if (%antiban == OFF) { did -b $dname 831 | did -b $dname 832 | did -b $dname 833 | did -b $dname 834 | did -b $dname 835 }
    if (%antideopdo == 1) { did -c $dname 811 }
    if (%antideopdo == 2) { did -c $dname 812 }
    if (%antideopdo == 3) { did -c $dname 813 }
    if (%antideopdo == 4) { did -c $dname 814 }
    if (%antikickdo == 1) { did -c $dname 821 }
    if (%antikickdo == 2) { did -c $dname 822 }
    if (%antikickdo == 3) { did -c $dname 823 }
    if (%antikickdo == 4) { did -c $dname 824 }
    if (%antibando == 1) { did -c $dname 831 }
    if (%antibando == 2) { did -c $dname 832 }
    if (%antibando == 3) { did -c $dname 833 }
    if (%antibando == 4) { did -c $dname 834 }
    if (%protection == ON) did -c $dname 631
    if (%protection == OFF) did -c $dname 632
    did -a $dname 13 %repeattimes
    did -a $dname 23 %repeatseconds
    did -a $dname 14 %floodlines
    did -a $dname 24 %floodseconds
    did -a $dname 15 %bgmsglletters
    did -a $dname 16 %nickfloodtimes
    did -a $dname 26 %nickfloodseconds
    did -a $dname 17 %joinfloodtimes
    did -a $dname 27 %joinfloodseconds
    did -a $dname 19 %CloneMax
    did -a $dname 51 %Swearbantime
    did -a $dname 53 %repeatbantime
    did -a $dname 54 %floodbantime
    did -a $dname 55 %bigmsgbantime
    did -a $dname 56 %nickfloodbantime
    did -a $dname 57 %joinfloodbantime
    did -a $dname 58 %Advertisebantime
    did -a $dname 902 %joinpartbantime
    did -a $dname 904 %joinpartbanon
    did -a $dname 61 %swearkickmsg
    did -a $dname 62 %badnickkickmsg
    did -a $dname 63 %repeatkickmsg
    did -a $dname 64 %floodkickmsg
    did -a $dname 65 %bigmsgkickmsg
    did -a $dname 66 %nickfloodkickmsg
    did -a $dname 67 %joinfloodkickmsg
    did -a $dname 68 %Advertisekickmsg
    did -a $dname 69 %Clonekickmsg
    did -a $dname 711 %pmfloodlines
    did -a $dname 721 %pnoticefloodlines
    did -a $dname 731 %pctcpfloodlines
    did -a $dname 712 %pmfloodsec
    did -a $dname 722 %pnoticefloodsec
    did -a $dname 732 %pctcpfloodsec
    did -a $dname 713 %pmfloodignoresec
    did -a $dname 723 %pnoticefloodignoresec
    did -a $dname 733 %pctcpfloodignoresec
    did -b $dname 621
    did -b $dname 622
    kickchanneldo
    personalopon
    bantypes
    nobanlist
  }
  if ($devent == menu) {
    if  ($did == 601) { did -f $dname 100 }
    if ($did == 602) { did -f $dname 103 }
    if ($did == 603) { did -f $dname 101 }
    if ($did == 604) { did -f $dname 102 }
    if ($did == 605) { did -f $dname 104 }
    if ($did == 611) { help }
    if ($did == 612) { help - Enter Reply }
    if ($did == 613) { run $mircdirRead Me.txt }
    if ($did == 623) { dialog -c chanop chanop }
    if ($did == 631) { set %protection ON | did -u $dname 632 | did -c $dname 631 }
    if ($did == 632) { set %protection OFF | did -u $dname 631 | did -c $dname 632 }
  }
  if ($devent == sclick) {
    if ($did == 1001) { help }
    if ($did == 11) { run $mircdirscripts/Swear.txt }
    if ($did == 12) { run $mircdirscripts/Badnicks.txt }
    if ($did == 1) {
      if (%swear == ON) { set %swear OFF | .disable #Swear | did -b  $dname 11 | halt }
      if (%swear == OFF) { set %swear ON | .enable #Swear | did -e  $dname 11 | halt }
    }
    if ($did == 2) {
      if (%badnick == ON) { set %badnick OFF | did -b $dname 12 | did -ub  $dname 22 | halt }
      if (%badnick == OFF) { set %badnick ON | did -e $dname 12 | did -ec  $dname 22 | halt }
    }
    if ($did == 3) {
      if (%repeat == ON) { set %repeat OFF | did -b $dname 13 | did -b $dname 23 | halt }
      if (%repeat == OFF) { set %repeat ON | did -e $dname 13 | did -e $dname 23 | halt }
    }
    if ($did == 4) {
      if (%Flood == ON) { set %Flood OFF | did -b $dname 14 | did -b $dname 24 | halt }
      if (%Flood == OFF) { set %Flood ON | did -e $dname 14 | did -e $dname 24 | halt }
    }
    if ($did == 5) {
      if (%Bigmsg == ON) { set %Bigmsg OFF | did -b $dname 15 | halt }
      if (%Bigmsg == OFF) { set %Bigmsg ON | did -e $dname 15 | halt }
    }
    if ($did == 6) {
      if (%nickfloodkick == ON) { set %nickfloodkick OFF | did -b $dname 16 | did -b $dname 26 | did -b $dname 56 | halt }
      if (%nickfloodkick == OFF) { set %nickfloodkick ON | did -e $dname 16 | did -e $dname 26 | did -e $dname 56 | halt }
    }
    if ($did == 7) {
      if (%joinflood == ON) { set %joinflood OFF | did -b $dname 17 | did -b $dname 27 | did -b $dname 47 | did -b $dname 57 | halt }
      if (%joinflood == OFF) { set %joinflood ON | did -e $dname 17 | did -e $dname 27 | did -e $dname 47 | did -e $dname 57 | halt }
    }
    if ($did == 8) {
      if (%Advertise == ON) { set %Advertise OFF | did -b $dname 18 | did -b $dname 28 | did -b $dname 38 | halt }
      if (%Advertise == OFF) { set %Advertise ON | did -e $dname 18 | did -e $dname 28 | did -e $dname 38 | halt }
    }
    if ($did == 18) {
      if (%AdvertiseServer == ON) { set %AdvertiseServer OFF | halt }
      if (%AdvertiseServer == OFF) { set %AdvertiseServer ON | halt }
    }
    if ($did == 28) {
      if (%AdvertiseChan == ON) { set %AdvertiseChan OFF | halt }
      if (%AdvertiseChan == OFF) { set %AdvertiseChan ON | halt }
    }
    if ($did == 38) {
      if (%AdvertiseSite == ON) { set %AdvertiseSite OFF | halt }
      if (%AdvertiseSite == OFF) { set %AdvertiseSite ON | halt }
    }
    if ($did == 9) {
      if (%clonekick == ON) { set %clonekick OFF | did -b $dname 19 | did -b $dname 49 | halt }
      if (%clonekick == OFF) { set %clonekick ON | did -e $dname 19 | did -e $dname 49 | halt }
    }
    if ($did == 41) {
      set %swear.kb $did(41).sel
      if ($did(41).sel == 1) { did -b $dname 51 }
      else { did -e $dname 51 }
    }
    if ($did == 43) {
      set %repeat.kb $did(43).sel
      if ($did(43).sel == 1) { did -b $dname 53 }
      else { did -e $dname 53 }
    }
    if ($did == 44) {
      set %flood.kb $did(44).sel
      if ($did(44).sel == 1) { did -b $dname 54 }
      else { did -e $dname 54 }
    }
    if ($did == 45) {
      set %bigmsg.kb $did(45).sel
      if ($did(45).sel == 1) { did -b $dname 55 }
      else { did -e $dname 55 }
    }
    if ($did == 47) {
      set %joinflood.kb $did(47).sel
    }
    if ($did == 48) {
      set %Advertise.kb $did(48).sel
      if ($did(48).sel == 1) { did -b $dname 58 }
      else { did -e $dname 58 }
    }
    if ($did == 49) { set %Clone.kb $did(49).sel }
    if ($did = 71) {
      if (%pmflood == ON) { set %pmflood OFF | did -b $dname 711 | did -b $dname 712 | did -b $dname 713 | halt }
      if (%pmflood == OFF) { set %pmflood ON | did -e $dname 711 | did -e $dname 712 | did -e $dname 713 | halt }
    }
    if ($did == 900) {
      if (%joinpartban == ON) { set %joinpartban OFF | did -b $dname 904 }
      else { set %joinpartban ON | did -e $dname 904 }
    }
    if ($did = 72) {
      if (%pnoticeflood == ON) { set %pnoticeflood OFF | did -b $dname 721 | did -b $dname 722 | did -b $dname 723 | halt }
      if (%pnoticeflood == OFF) { set %pnoticeflood ON | did -e $dname 721 | did -e $dname 722 | did -e $dname 723 | halt }
    }
    if ($did = 73) {
      if (%pctcpflood == ON) { set %pctcpflood OFF | did -b $dname 731 | did -b $dname 732 | did -b $dname 733 | halt }
      if (%pctcpflood == OFF) { set %pctcpflood ON | did -e $dname 731 | did -e $dname 732 | did -e $dname 733 | halt }
    }
    if ($did == 81) {
      if (%antideop == ON) { set %antideop OFF | did -b $dname 811 | did -b $dname 812 | did -b $dname 813 | did -b $dname 814 | did -b $dname 815 | halt }
      if (%antideop == OFF) { set %antideop ON | did -e $dname 811 | did -e $dname 812 | did -e $dname 813 | did -e $dname 814 | did -e $dname 815 | halt }
    }
    if ($did == 82) {
      if (%antikick == ON) { set %antikick OFF | did -b $dname 821 | did -b $dname 822 | did -b $dname 823 | did -b $dname 824 | did -b $dname 825 | halt }
      if (%antikick == OFF) { set %antikick ON | did -e $dname 821 | did -e $dname 822 | did -e $dname 823 | did -e $dname 824 | did -e $dname 825 | halt }
    }
    if ($did == 83) {
      if (%antiban == ON) { set %antiban OFF | did -b $dname 831 | did -b $dname 832 | did -b $dname 833 | did -b $dname 834 | did -b $dname 835 | halt }
      if (%antiban == OFF) { set %antiban ON | did -e $dname 831 | did -e $dname 832 | did -e $dname 833 | did -e $dname 834 | did -e $dname 835 | halt }
    }
    if ($did == 811) { set %antideopdo 1 }
    if ($did == 812) { set %antideopdo 2 }
    if ($did == 813) { set %antideopdo 3 }
    if ($did == 814) { set %antideopdo 4 }
    if ($did == 821) { set %antikickdo 1 }
    if ($did == 822) { set %antikickdo 2 }
    if ($did == 823) { set %antikickdo 3 }
    if ($did == 824) { set %antikickdo 4 }
    if ($did == 831) { set %antibando 1 }
    if ($did == 832) { set %antibando 2 }
    if ($did == 833) { set %antibando 3 }
    if ($did == 834) { set %antibando 4 }
    if ($did == 815) { set %antideopon $did(815).sel }
    if ($did == 825) { set %antikickon $did(825).sel }
    if ($did == 835) { set %antibanon $did(835).sel }
    if ($did == 70) {
      if (%sendnotice.kmsg == ON) { set %sendnotice.kmsg OFF | did -b $dname 701 | did -b $dname 702 | halt }
      if (%sendnotice.kmsg == OFF) { set %sendnotice.kmsg ON | did -e $dname 701 | did -e $dname 702 | halt }
    }
    if ($did == 701) { set %sendnoticeto.kmsg chan }
    if ($did == 702) { set %sendnoticeto.kmsg nick }
    if ($did == 703) {
      if (%dontkbops == ON) { set %dontkbops OFF | halt }
      else { set %dontkbops ON | halt }
    }
    if ($did == 704) {
      if (%dontkbvoices == ON) { set %dontkbvoices OFF | halt }
      else { set %dontkbvoices ON | halt }
    }
    if ($did == 705) {
      if (%showmereason == ON) { set %showmereason OFF | halt }
      else { set %showmereason ON | halt }
    }
    if ($did == 564) && ($did(561).sel != $null) { set %§nobanlist $did(561).seltext | nobandel }
    if ($did == 566) {
      if (* * iswm $did(562)) { set %errorinadd Don't Leave Empty Char! | errorinadd }
      elseif ($did(562) != $null) { set %§nobanlist $did(562) | nobanadd }
    }
    if ($did == 850) { set %bantype $did(850).sel }
    if ($did == 100) { dialog -t $dname Protections:     $did(100) }
    if ($did == 101) { dialog -t $dname Protections:     $did(101) }
    if ($did == 102) { dialog -t $dname Protections:     $did(102) }
    if ($did == 103) { dialog -t $dname Protections:     $did(103) }
    if ($did == 104) { dialog -t $dname Protections:     $did(104) }
  }
  if ($devent == edit) {
    if ($did == 13) { set %repeattimes $did(13) }
    if ($did == 23) { set %repeatseconds $did(23) }
    if ($did == 14) { set %floodlines $did(14) }
    if ($did == 24) { set %floodseconds $did(24) }
    if ($did == 15) { set %bgmsglletters $did(15) }
    if ($did == 16) { set %nickfloodtimes $did(16) | nickfloodbetween }
    if ($did == 26) { set %nickfloodseconds $did(26) | nickfloodbetween }
    if ($did == 17) { set %joinfloodtimes $did(17) }
    if ($did == 27) { set %joinfloodseconds $did(27) }
    if ($did == 19) { set %CloneMax $did(19) }
    if ($did == 51) { set %swearbantime $did(51) }
    if ($did == 53) { set %repeatbantime $did(53) }
    if ($did == 54) { set %floodbantime $did(54) }
    if ($did == 55) { set %bigmsgbantime $did(55) }
    if ($did == 56) { set %nickfloodbantime $did(56) }
    if ($did == 57) { set %joinfloodbantime $did(57) }
    if ($did == 58) { set %Advertisebantime $did(58) }
    if ($did == 61) { set %swearkickmsg $did(61) }
    if ($did == 62) { set %badnickkickmsg $did(62) }
    if ($did == 63) { set %repeatkickmsg $did(63) }
    if ($did == 64) { set %floodkickmsg $did(64) }
    if ($did == 65) { set %bigmsgkickmsg $did(65) }
    if ($did == 66) { set %nickfloodkickmsg $did(66) }
    if ($did == 67) { set %joinfloodkickmsg $did(67) }
    if ($did == 68) { set %Advertisekickmsg $did(68) }
    if ($did == 69) { set %Clonekickmsg $did(69) }
    if ($did == 711) { set  %pmfloodlines $did(711) }
    if ($did == 712) { set  %pmfloodsec $did(712) }
    if ($did == 713) { set  %pmfloodignoresec $did(713) }
    if ($did == 721) { set  %pnoticefloodlines $did(721) }
    if ($did == 722) { set  %pnoticefloodsec $did(722) }
    if ($did == 723) { set  %pnoticefloodignoresec $did(723) }
    if ($did == 731) { set  %pctcpfloodlines $did(731) }
    if ($did == 732) { set  %pctcpfloodsec $did(732) }
    if ($did == 733) { set  %pctcpfloodignoresec $did(733) }
    if ($did == 902) { set %joinpartbantime $did(902) }
    if ($did == 904) { set %joinpartbanon $did(904) }
  }
}
alias kickchanneldo {
  did -a chanop 41 Kick
  did -a chanop 41 Ban
  did -a chanop 41 Kick Ban
  did -c chanop 41 %swear.kb
  did -a chanop 43 Kick
  did -a chanop 43 Ban
  did -a chanop 43 Kick Ban
  did -c chanop 43 %repeat.kb
  did -a chanop 44 Kick
  did -a chanop 44 Ban
  did -a chanop 44 Kick Ban
  did -c chanop 44 %flood.kb
  did -a chanop 45 Kick
  did -a chanop 45 Ban
  did -a chanop 45 Kick Ban
  did -c chanop 45 %bigmsg.kb
  did -a chanop 47 Ban
  did -a chanop 47 Kick Ban
  did -c chanop 47 %joinflood.kb
  did -a chanop 48 Kick
  did -a chanop 48 Ban
  did -a chanop 48 Kick Ban
  did -c chanop 48 %Advertise.kb
  did -a chanop 49 Ban IP Address
  did -a chanop 49 Kick Ban Last Nick
  did -a chanop 49 Kick Ban All Nicks
  did -c chanop 49 %Clone.kb
  did -a chanop 901 Ban
  did -c chanop 901 1
}
alias personalopon {
  did -a chanop 815 1st time
  did -a chanop 815 2nd time
  did -a chanop 815 3rd time
  did -a chanop 815 4th time
  did -c chanop 815 %antideopon
  did -a chanop 825 1st time
  did -a chanop 825 2nd time
  did -a chanop 825 3rd time
  did -a chanop 825 4th time
  did -c chanop 825 %antikickon
  did -a chanop 835 1st time
  did -a chanop 835 2nd time
  did -a chanop 835 3rd time
  did -a chanop 835 4th time
  did -c chanop 835 %antibanon
}
alias bantypes {
  did -a chanop 850 *!*user@host
  did -a chanop 850 *!*@host
  did -a chanop 850 *!*user@*domain*
  did -a chanop 850 *!*@*domain*
  did -a chanop 850 nick!user@host
  did -a chanop 850 nick!*user@host
  did -a chanop 850 nick!*@host
  did -a chanop 850 nick!*user@*domain*
  did -a chanop 850 nick!*@*domain*
  did -a chanop 850 *!user@host
  did -c chanop 850 %bantype
}

alias nobanlist {
  did -r chanop 561
  did -r chanop 562
  set %§no 0
  :noban
  inc %§no
  if (%§no > 200) { goto end }
  if (%nobanlist- [ $+ [ %§no ] ]) {
    did -a chanop 561 %nobanlist- [ $+ [ %§no ] ]
  }
  goto noban  
  :end
  unset %§no %§nobanlist
}
alias nobanadd {
  .auser noban %§nobanlist
  set %§no 0
  :noban
  inc %§no
  if (%§no > 200) { goto end }
  if (%nobanlist- [ $+ [ %§no ] ] == $null) {
    set %nobanlist- [ $+ [ %§no ] ] %§nobanlist
    goto end
  }
  goto noban
  :end
  unset %§no %§nobanlist
  nobanlist
}
alias nobandel {
  .ruser noban %§nobanlist
  set %§no 0
  :noban
  inc %§no
  if (%§no > 200) { goto end }
  if (%§nobanlist == %nobanlist- [ $+ [ %§no ] ]) {
    unset %nobanlist- [ $+ [ %§no ] ] %§nobanlist
    goto end
  }
  goto noban
  :end
  unset %§no %§nobanlist
  nobanlist
}
