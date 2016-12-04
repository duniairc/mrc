+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
|#############################################|
[                                     º©º« RuŠuH Šc®ÏÞtŠ »º®º                                     ]
[                               -= Script editor by g0eZ egGo =-                                    ]
[                               -= Command on /sc full command =-                                  ]
[                                         -= special edition =-                                            ]
[                                         -= cannot for sale =-                                           ]
[                                          -= don't replace sc =-                                         ]
[                                     -= alice g0eZ @ 2009 =-                                          ]
[                                   -<( g0eZ!KoM@nDaN.RuSuH)>-                                    ]
|#############################################|
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#########
## on = off ##
#########
Add Own
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ g0eZ Rusuh \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#auto unban
on 1:ban:#: { if ($banmask iswm $address($me,5)) { mode # -b $banmask } { mode # +b $nick }
}
on 1:ban:#: { if ($banmask iswm $address($me,5)) { .chanserv unban # } }
#end auto undban
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ g0eZ Rusuh \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ g0eZ Rusuh \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#ping Reply
on 1:text:!ping me:#:/ctcp $nick Ping
on 1:CTCPREPLY:PING* {
  if ($2 == $null) { halt }
  else {
    %pt  = $ctime - $2
    if (%pt < 0) set %pt 0
    else { .notice $nick 4[5 $nick 4] 5Ping Reply 4± $+ %pt $+ 5 sec.  | unset %pt | halt }
  }
  halt
}

#end ping
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ g0eZ Rusuh \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#response
===================================================
on !*:JOIN:#indoforum: { if (Guest* iswm $nick) { mode # +b Guest* | kick # $nick 4C5hange 4Y5our'e 4N5ick } } 
==================================================
on !*:join:#ciutHelp: msg $chan Silahkan $nick Ada Yang Bisa Saya Bantu?
==================================================
#sHizuKa
ON !*:JOIN:#:{ if ($nick == sHizuKa) { msg $chan 7W08él04©07Ö03mé 10B13ä04©13k 4[15s14Hi12z15u14K15a4] | notice $nick 5Gak Boleh Lewat, 5MùâçH6 MùâçH78 MùâçH9 MùâçH10 }
}
==================================================
#false
on 1:text:!ping*:#:/notice $nick salah bro.. ketiknya 4!ping me
===================================================
#logo
on 1:text:`logo:#:/notice $nick 4(5-14g10003e15Z5-4)
===================================================
#sms
on 1:text:!sms*:#:/notice $nick Pengiriman Pesan 4GAGAL!!
===================================================
#staus
on 1:text:`status:#:/notice $nick $me Parkir Nick 4(5-14g10003e15Z5-4)
#help
on 1:text:!help*:#:/notice $nick 5join #help5 untuk bantuan.
===================================================
#fuck
on 1:text:fuck*:#:/kick $chan $nick 9,1 BadWord Detect 12fuck 4Get Out 
===================================================
#cok
on 1:text:*cok:#:/kick $chan $nick 9,1 BadWord 12*cok 4Ndak Pareng Nakal 
===================================================
#c0k
on 1:text:*c0k:#:/kick $chan $nick 9,1 BadWord 12*cok 4Rausah Misuh 
===================================================
#taek
on 1:text:taek*:#:/kick $chan $nick 9,1 BadWord 12taek 4Ndak Pareng 9Jorok 
===================================================
#taek
on 1:text:telek:#:/kick $chan $nick 9,1 BadWord 12telek 4Ndak Pareng 9Jorok 
===================================================
#kimpet
on 1:text:*kimpet*:#:/kick $chan $nick 9,1 BadWord 12<kimpet><tempik> 4Ngomong 9Diwolak Walik Anggite Gak Ruh 
===================================================
#kunam
on 1:text:*kunam*:#:/kick $chan $nick 9,1 BadWord 12<kunam><manuk> 4Ngomong 9Diwolak Walik Anggite Gak Ruh 
===================================================
#asu
on 1:text:asu:#:/kick $chan $nick 9,1 BadWord 12asu 4Metu Kono 
===================================================
#askum
on 1:text:*askum*:#:/msg $chan VValaikumSalam Vvr. vVb. 
===================================================
#matane
on 1:text:*matane*:#:/cs kick $chan $nick 6,1 $nick 9Ngomong 12Opo 4Seh8!!! 
===================================================
#ngaceng
on 1:text:*ngaceng*:#:/kick $chan $nick 6,1 $nick 9Ngomong 12Opo 4Seh8!!! 
===================================================
#raimu
on 1:text:*raimu*:#:/kick $chan $nick 6,1 $nick 9Ngomong 12Opo 4Seh8!!! 
===================================================
#tempek
on 1:text:tempek*:#:/kick $chan $nick 9,1 BaDWord 12*empek 4Edian 
===================================================
#kontol
on 1:text:*ontol*:#:/kick $chan $nick 9,1 BaDWord 12*kontol* 4Edian 
===================================================
#jembot
on 1:text:*embot*:#:/kick $chan $nick 9,1 BaDWord 12*embod 4Edian 
===================================================
#jemb0t
on 1:text:*emb0t*:#:/kick $chan $nick 9Ngomong 12Opo 4Seh8!!! 
===================================================
#ml
on 1:text:ML:#:/kick $chan $nick 9,1 Gak 8Boleh 4JoroK 
===================================================
#ciut
on 1:text:ciut:#:/say ciut? apanya?
===================================================
#seen on
on 1:text:tq g0eZ*:#:/msg $chan yeZ $nick :))
on 1:text:nta*:#:/msg $chan iya $nick ku sayang :))
===================================================
#wb
on 1:text:*assalam*:#:/msg $chan Wã`ã£ãíkùmsã£ãm Wãrãhmãtù££ãh Wãßãrãkãtùh
===================================================
#auth
on 1:text:*auth*:#:/notice $nick Password Salah Ndeng..
===================================================
#+v
on 1:text:.v:#:/v $nick
===================================================
#-v
on 1:text:.dv:#:/dv $nick
===================================================
#g0eZ
on 1:text:g0eZ:#:/msg $chan ya $nick
===================================================
#g0eZ
on 1:text:goeZ:#:/msg $chan bentar ya..
===================================================
#g0eZ
on 1:text:guZ:#:/msg $chan bentar..
===================================================
#g0eZ
on 1:text:goZ:#:/msg $chan uit..
===================================================
#g0eZ
on 1:text:mad*:#:/msg $chan oet
===================================================
#g0eZ
on 1:text:gos:#:/msg $chan opo?
===================================================
#g0eZ
on 1:text:guru:#:/notice $nick ya.. ada masalah? | /msg $chan siap!! | /msg $chan ada apa $nick ?
===================================================
#g0eZ
on 1:text:*hmmm*:#:/msg $chan 5:5,8P
===================================================
#tq
on 1:text:wb g0eZ:#:/msg $chan tq $nick
===================================================
#wb
on 1:text:webe:#:/msg $chan 7W08él04©07Ö03mé 10B13ä04©13k
===================================================
#met
on 1:text:*pamit*:#:/msg $chan ya..
===================================================
#met
on 1:action:*pamit*:#:/msg $chan ok de $nick
===================================================
#met
on 1:text:*pamet*:#:/msg $chan yow..
===================================================
#met
on 1:action:*pamet*:#:/msg $chan yow..
===================================================
#met
on 1:text:*pamid*:#:/msg $chan oyi..
===================================================
#met
on 1:action:*pamid*:#:/msg $chan oyi..
===================================================
#slaps
on 1:ACTION:*slaps*:#:/.timer 1 2 /msg $chan ewh
===================================================
\on 1:text:ew:#: {
  //set %tk $rand(1,4) 
  if ($2 == all) {
    msg $chan <all> ew
    halt 
  }
  if (%tk == 1) { 
    set %db.rand $rand(1,4)
    if (%db.rand == 1) { msg $chan 15Hmmmmmmm,,, | .timer 1 2 msg HoooRRRReeee!! }
    if (%db.rand == 2) { describe $chan :P | .timer 1 2 msg $chan HoOOoOoOamMzZZ }
    if (%db.rand == 3) { msg $chan Huaaaaaaa | .timer 1 2 describe $chan Ada Mantanku }
    if (%db.rand == 4) { msg $chan  | .timer 1 2 msg $chan au ah gelap }
  }
  if (%tk == 2) { msg $chan 15Hmmmmmmm,,, }
  if (%tk == 3) { msg $chan 15DuuuuaRRRR.. }
  if (%tk == 4) { msg $chan GubRaKKKKKKKKKKK }
  if ($2 == all) {
    msg $chan 
  }
}
;end of ew

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ g0eZ Rusuh \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#catHy
ON *:JOIN:#:{ if ($nick == catHy) { msg $chan 4[00,04w04,01][00,04ë04,01][00,04l04,01][00,04ç04,01][00,04ø04,01][00,04m04,01][00,04ë04,01] 4,1[00,04ç04,01][00,04ä04,01][00,04t04,01][00,04H04,01][00,04ÿ04,01] | notice $nick 5Vvb say, 5MùâçH6 MùâçH78 MùâçH9 MùâçH10 MùâçH12 MùùùùùùùùâââââççççH | notice $nick 5hehehehe.. pisS 8:P }
}
#autowb
\on !*:join:#ciut: /notice $nick Vvelcome $nick | /notice $nick untuk bicara silahkan ketik 4/msg chanserv voice #ciut
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ g0eZ Rusuh \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#CapsBanned
\on @*:TEXT:*:#: {
  if ( $me isop $chan ) && ($nick !isop $chan ) {
    var %text = $strip($remove($1-,$chr(32)))
    var %non.caps = $len($removecs(%text,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y   ,Z))
    var %full.line = $len($strip($remove(%text,$chr(32))))
    var %percent = $calc(1 - (%non.caps / %full.line))
    if (%percent >= 0.8) {
      ban -u180 # $nick 2
      kick # $nick 9,1 idih6 $nick 4Caps Lock 8nya kecantol tuh !! 
    }
  }
}
#Capskick
\on @*:TEXT:*:#: {
  if ( $me isop $chan ) && ($nick !isop $chan ) {
    var %text = $strip($remove($1-,$chr(32)))
    var %non.caps = $len($removecs(%text,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y   ,Z))
    var %full.line = $len($strip($remove(%text,$chr(32))))
    var %percent = $calc(1 - (%non.caps / %full.line))
    if (%percent >= 0.8) {
      kick # $nick 9,1 idih6 $nick 4Caps Lock 8nya kecantol tuh !! 
    }
  }
}
#capsnot

on @*:NOTICE:*:#: {
  if ( $me isop $chan ) && ($nick !isop $chan ) {
    var %text = $strip($remove($1-,$chr(32)))
    var %non.caps = $len($removecs(%text,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y   ,Z))
    var %full.line = $len($strip($remove(%text,$chr(32))))
    var %percent = $calc(1 - (%non.caps / %full.line))
    if (%percent >= 0.8) {
      ban -u180 # $nick 2
      kick # $nick 9,1 idih6 $nick 4Caps Lock 8nya kecantol tuh !! 
    }
  }
}
#end of Caps
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ g0eZ Rusuh \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ g0eZ Rusuh \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
ON 1:Kick:#: { if ( $knick == $me ) { join $chan } }
ON 1:Unban:#: { if ( $bnick == $me ) { msg $chan Makasih $nick Dah Di -b } }
Raw 474:*: { cs unban $2 $me | join $2 }
