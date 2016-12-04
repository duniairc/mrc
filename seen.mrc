#seen
On 1:TEXT:!seen:#:{
  msg $chan $nick $+ , yang kamu cari tidak ada..
}
On 1:TEXT:!cari *:#:{
  set %SugSeen102 * $+ $3 $+ *.*
  .timer 1 1 /notice $nick [egGoSeacrh] yang Saya lihat dengan initial yang Kamu masukkan diantaranya adalah :
  .timer 1 3 /notice $nick $remove($nopath($findfile($mircdir\seen,%SugSeen102,1)),.ini)
  .timer 1 5 /notice $nick $remove($nopath($findfile($mircdir\seen,%SugSeen102,2)),.ini)
  .timer 1 7 /notice $nick $remove($nopath($findfile($mircdir\seen,%SugSeen102,3)),.ini)
  .timer 1 9 /notice $nick $remove($nopath($findfile($mircdir\seen,%SugSeen102,4)),.ini)
  .timer 1 11 /notice $nick $remove($nopath($findfile($mircdir\seen,%SugSeen102,5)),.ini)
  .timer 1 13 /notice $nick Saea akan melihatkan hasil dari yang Kamu cari. Dengan Cara !seen <nick > ( contoh : !seen g0eZ )
}
On 1:TEXT:!seen *:#:{
  ; if the guy is looking for u
  if ($chr(42) isin $2) {
    set %Seen102 * $+ $2 $+ *.*
    msg $chan Begini lo tante $nick $+ , Setelah Saya buka buku, Saya  menemukan $findfile($mircdir\seen,%Seen102,0) orang dalam buku seen Saea. Mohon Perjelas pencarian Kamu, atau silahkan ketik : !cari $2 
  }
  elseif ($2 == $me) { 
    /msg $chan $2 itu kan gua, gila loe. 
    .goto end 
  }
  ; if the guy is so stupid that he looks after him self
  elseif ($2 == $nick) { 
    /msg $chan $nick $+ , jangan gila donKKKKK!
    .goto end 
  } 
  ; if the person he's looking for already is in the channel
  elseif ($2 ison $chan) { 
    /msg $chan Lho $nick $+ , $2- sekarang ada di $chan $+ .
    .goto end 
  }
  ; else u can allways check the ini files :D
  else { 
    if (($right($2,1) == ]) || ($left($2,1) == [)) { .set %seennick $replace($2,[,@) | .set %seennick $replace(%seennick,],~) }
    else { .set %seennick $2 }
    ; [ this are going to change @ and ] to ~
    :inifile {
      ; if he's not in the ini files
      .set -u5 %seenaction $readini seen\ $+ $2 $+ .ini %seennick Action
      if (%seenaction == $null) { /msg $chan Maaf juragan $nick $+ , Saya belum pernah lihat $2- . }
      ; if the latest thing he did was to join the channel
      if (%seenaction == join) { 
        .set -u5 %jointime $readini seen\ $+ $2 $+ .ini %seennick Time
        .set -u5 %joinchannel $readini seen\ $+ $2 $+ .ini %seennick Channel
        /msg $chan $nick Begini lo boZ, $+ , $2- tadi join %joinchannel $duration($calc($ctime - %jointime)) tadi.
      }
      ; om den sista saken va att parta kanalen...
      if (%seenaction == part) { 
        .set -u5 %parttime $readini seen\ $+ $2 $+ .ini %seennick Time
        .set -u5 %partchannel $readini seen\ $+ $2 $+ .ini %seennick Channel
        /msg $chan Begini lo juragan $nick  $+ , $2 telah tadi ternyata part dari %partchannel setelah $duration($calc($ctime - %parttime)) bersamaku.
      }
      ; if the latest thing he did was to quit...
      if (%seenaction == quit) { 
        .set -u5 %quittime $readini seen\ $+ $2 $+ .ini %seennick Time
        .set -u5 %quitmessage $readini seen\ $+ $2 $+ .ini %seennick Message
        /msg $chan Begini lo juragan $nick $+ , $2 ternyata tadi Dis Dis Diskonek dengan alasan ( %quitmessage ) setelah $duration($calc($ctime - %quittime)) bersamaku.
      }
      ; if the latest thing he did was to be kicked...
      if (%seenaction == kick) { 
        .set -u5 %kicktime $readini seen\ $+ $2 $+ .ini %seennick Time
        .set -u5 %kickchannel $readini seen\ $+ $2 $+ .ini %seennick Channel
        /msg $chan $nick $+ , $2 tadi di kick dari %kickchannel setelah $duration($calc($ctime - %kicktime)) bersamaku.
      }
      ; if the latest thing he did was to change nickname
      if (%seenaction == nick) { 
        .set -u5 %nicktime $readini seen\ $+ $2 $+ .ini %seennick Time
        .set -u5 %nicknew $readini seen\ $+ $2 $+ .ini %seennick Nick
        /msg $chan $nick $+ , $2 mengganti nicknya menjadi %nicknew $duration($calc($ctime - %nicktime)) tadi.
      }
      ; if the latest thing he did was to say something...
      if (%seenaction == text) { 
        .set -u5 %texttime $readini seen\ $+ $2 $+ .ini %seennick Time
        .set -u5 %textchannel $readini seen\ $+ $2 $+ .ini %seennick Channel
        /msg $chan $nick $+ , $2 telah hilang $duration($calc($ctime - %texttime)) setelah bersamaku.
      }
      ; if the latest thing he did was an action
      if (%seenaction == action) { 
        .set -u5 %actiontime $readini seen\ $+ $2 $+ .ini %seennick Time
        .set -u5 %actionchannel $readini seen\ $+ $2 $+ .ini %seennick Channel
        /msg $chan $nick $+ , $2 baru kelihatan di %actionchannel $duration($calc($ctime - %actiontime)) barusan.
      }
    }
  }
  :end
}

; when someone joins...
On 1:JOIN:#:{
  if (($right($nick,1) == ]) || ($left($nick,1) == [)) { .set %seennick $replace($nick,[,@) | .set %seennick $replace(%seennick,],~) }
  else { .set %seennick $nick }
  ; [ are going to change @ and ] to ~
  .remini seen\ $+ $nick $+ .ini %seennick
  .writeini seen\ $+ $nick $+ .ini %seennick Action join
  .writeini seen\ $+ $nick $+ .ini %seennick Channel $chan 
  .writeini seen\ $+ $nick $+ .ini %seennick Time $ctime
}

; when someone parts the channel
On 1:PART:#:{
  if (($right($nick,1) == ]) || ($left($nick,1) == [)) { .set %seennick $replace($nick,[,@) | .set %seennick $replace(%seennick,],~) }
  else { .set %seennick $nick }
  .remini seen\ $+ $nick $+ .ini %seennick
  .writeini seen\ $+ $nick $+ .ini %seennick Action part
  .writeini seen\ $+ $nick $+ .ini %seennick Channel $chan
  .writeini seen\ $+ $nick $+ .ini %seennick Time $ctime
}

; when someone quits the channel
On 1:QUIT:{
  if (($right($nick,1) == ]) || ($left($nick,1) == [)) { .set %seennick $replace($nick,[,@) | .set %seennick $replace(%seennick,],~) }
  else { .set %seennick $nick }
  .remini seen\ $+ $nick $+ .ini %seennick
  .writeini seen\ $+ $nick $+ .ini %seennick Action quit
  .writeini seen\ $+ $nick $+ .ini %seennick Time $ctime
  .writeini seen\ $+ $nick $+ .ini %seennick Message $1-
}

; when some moron gets kicked
On 1:KICK:#:{
  if (($right($nick,1) == ]) || ($left($nick,1) == [)) { .set %seennick $replace($nick,[,@) | .set %seennick $replace(%seennick,],~) }
  else { .set %seennick $nick }
  .remini seen\ $+ $nick $+ .ini %seennick
  .writeini seen\ $+ $nick $+ .ini %seennick Action kick
  .writeini seen\ $+ $nick $+ .ini %seennick Channel $chan
  .writeini seen\ $+ $nick $+ .ini %seennick Time $ctime
}

; when someone changes nick
On 1:NICK:{
  if (($right($nick,1) == ]) || ($left($nick,1) == [)) { .set %seennick $replace($nick,[,@) | .set %seennick $replace(%seennick,],~) }
  else { .set %seennick $nick }
  .remini seen\ $+ $nick $+ .ini %seennick
  .writeini seen\ $+ $nick $+ .ini %seennick Action nick
  .writeini seen\ $+ $nick $+ .ini %seennick Time $ctime
  .writeini seen\ $+ $nick $+ .ini %seennick Nick $newnick 
}

; when someone say something in the channel
On 1:TEXT:*:#:{
  if (($right($nick,1) == ]) || ($left($nick,1) == [)) { .set %seennick $replace($nick,[,@) | .set %seennick $replace(%seennick,],~) }
  else { .set %seennick $nick }
  .remini seen\ $+ $nick $+ .ini %seennick
  .writeini seen\ $+ $nick $+ .ini %seennick Action text
  .writeini seen\ $+ $nick $+ .ini %seennick Time $ctime
  .writeini seen\ $+ $nick $+ .ini %seennick Channel $chan
  .writeini seen\ $+ $nick $+ .ini %seennick text $1-
}

; when someone makes an action
On 1:ACTION:*:#:{
  if (($right($nick,1) == ]) || ($left($nick,1) == [)) { .set %seennick $replace($nick,[,@) | .set %seennick $replace(%seennick,],~) }
  else { .set %seennick $nick }
  .remini seen\ $+ $nick $+ .ini %seennick
  .writeini seen\ $+ $nick $+ .ini %seennick Action action
  .writeini seen\ $+ $nick $+ .ini %seennick Time $ctime
  .writeini seen\ $+ $nick $+ .ini %seennick Channel $chan
}
