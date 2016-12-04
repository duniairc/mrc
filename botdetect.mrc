on ^*:SNOTICE:*: {
  if ($4 = Client) {
    .var %real = $1-
    if ($5-6 = exiting at) { .tokenize 32 $1-5 $+ : $gettok($8,1,33) ( $+ $gettok($8,2,33) $+ ) $9- }
    if ($5-6 = connecting at) { .tokenize 32 $1-5 on port $remove($7,.root2k.net) $8 $9 }

    if ($5 == exiting:) {
      .var %nick = $6
      .var %ip = $gettok($right($left($7,-1),-1),2,64)
      .var %user = $gettok($right($left($7,-1),-1),1,64)
      if ($hget(data,lastcon) == %ip) {
        _hdel data lastcon
        _hdel data lastconn
      }
    }

    if ($5-6 = connecting on) {
      .var %nick = $9
      .var %ip = $gettok($right($left($10,-1),-1),2,64)
      .var %user =  $gettok($right($left($10,-1),-1),1,64)

      if (%ip = services.leet-gamer.net) {
        .goto next 
        return 
      }
      :recheck
      if ($hfind(data,%ip,0,Ww).data) {
        .var %query = $hfind(data,%ip,1,Ww).data
        if ($gettok(%query,2,46) == %nick) {
          _hdel data %query
          .goto recheck
          return 
        }
        .var %unote Multiple connections
        ;.botwarn %nick %ip
      }

      _hadd -u30 data lastcon %ip
      _hadd -u30 data lastconn %nick
      _hadd -u120 data $+(clientconn-,$time(hnn),.,%nick) %ip

      .var %coned = $hfind(data,$+(clientconn-,$time(hnn),*),0,wW)
      if (%coned >= 20) {
        if (%coned == 20) {
          echo -a $timestamp 12::ALERT::13Entering Massive connections mode12::ALERT::
        
          _rollback
          beep 2
          _hadd data cont $ctime
        }
        .var %uhtm = $true
        if ($calc($ctime - $hget(data,cont)) <= 60) && ($hget(data,cont) != $null) { 
          .var %uhtm = $true
        }
        if ($calc($ctime - $hget(data,cont)) >= 60) && ($hget(data,cont) != $null) { 
          _hdel data cont
          .unset %uhtm
        }
      }

      .var %n = $remove($lower($9),0,1,2,3,4,5,6,7,8,9)
      .var %n2 = $remove($9,_,^,$chr(91),$chr(93),$chr(124),$chr(47),$chr(92),-,`,$chr(123),$chr(125))

      if (%user == username) { .var %unote = Sub7 Bot }
    }
  }
  :next
  if (%uhtm) {
    ._wecho 4 -t @SNotice * %nick :: %ip
    .botwarn %nick %ip
    
    .return
  }
  if (%unote) {
    ._wecho 4 -t @SNotice ! $+ %unote $+ ! $1-
    
    .return
  }
  if (%ubot) {
    ._wecho $color(info) -t @SNotice $1-
    
    .return
  }
  if ($5 != exiting:) ._wecho $color(notice) -t @SNotice $1-
  if ($5 == exiting:) ._wecho 6 -t @SNotice $1- %unot
  
}
alias -l _wecho {
  if (!$window(@SNotice)) .window -hawn @SNotice
  .var %coned = $hfind(data,$+(clientconn-,$time(hnn),*),0,wW)
  .var %conned = $hfind(data,clientconn-*,0,wW)
  .var %unot = ( $+ %coned $+ \ $+ %conned $+ )
  ;.echo $replace($1-,***,%unot ***)
}
raw 302:*: {
  .uhst $1-
}
raw 352:*: {
  if (%dousr) {
    if (!$window(@UserCentral)) .window -lkC +l @UserCentral 0 0 385 338
    .aline @UserCentral $6
  }
}
alias uhst {
  if (!$1) return
  .var %i = 5 , %! = 1
  while (%i) {
    .var %u = $gettok($2-,%!,32)
    if (%u = $null) .break
    .var %mask = $gettok(%u,2,64)
    if (* !isin $gettok(%u,1,61)) && ($fline(@UserCentral,$+(*,%mask,*),0,1) == $null) || ($fline(@UserCentral,$+(*,%mask,*),0,1) == 0) {
      if (!$window(@UserCentral)) .window -lkC +l @UserCentral 0 0 385 338
      .aline @UserCentral $gettok(%u,1,61) *@ $+ %mask
    }
    .dec %i 1
    .inc %! 1
  }
}
alias _docmd {
  .var %a = $sline($active,0) , %d = 0
  if (%a = $null) || (%a = 0) return
  :next
  .var %c = %a , %e = 0
  while (%c) {
    .dec %c 1
    .inc %d 1
    if ($sline($active,%d) = $null) { .break }
    .var %e = $sline($active,%d)
    .var %nick = $gettok(%e,1,32)
    .var %host = $gettok(%e,2,32)
    .raw -q $replace($1-,&nick&,%nick,&host&,%host)
  }
}
alias -l _rollback {
  .var %i = $hfind(data,clientconn*,0,wW)
  while (%i) {
    .var %blm = $hfind(data,clientconn*,%i,wW)
    .var %n = $gettok(%blm,2,46)
    .var %ip = $hget(data,%blm)
    if (!$1) .botwarn %n %ip
    if ($1 = all) { .aline @UserCentral %n *@ %ip  }
    .dec %i
  }
}
alias _docmdrollback {
  .var %i = $hfind(data,clientconn*,0,wW)
  while (%i) {
    .var %blm = $hfind(data,clientconn*,%i,wW)
    .var %n = $gettok(%blm,2,46)
    .var %ip = $hget(data,%blm)
    .raw -q $replace($1-,&nick&,%n)
    .dec %i
  }
}
alias _selall {
  .var %a = $line($active,0)
  while (%a) {
    .sline -a $active %a
    .dec %a 1
  }
}
alias _rmline {
  .var %a = $sline($active,0)
  if (%a = $null) || (%a = 0) return
  .var %c = %a 
  while (%c) {
    .dec %c 1
    .dline $active $sline($active,$calc(%c - %c + 1)).ln
  }
}
alias botwarn {
  if (!$window(@UserCentral)) .window -lnkC +l @UserCentral 0 0 385 338
  if ($fline(@UserCentral,$+(*,$2,*),0,1) == $null) || ($fline(@UserCentral,$+(*,$2,*),0,1) == 0) {
    .aline @UserCentral $1 *@ $+ $2
  }
}
alias -l _hadd {
  if ($left($1,1) = $chr(45)) {
    .var %string = $1
    .tokenize 32 $2-
  }
  if ($hget($1) != $1) { .hmake $1 1000 }
  hadd %string $1-
}
alias -l _hdel {
  if ($left($1,1) = $chr(45)) {
    .var %string = $1
    .tokenize 32 $2-
  }
  if ($hget($1) != $1) { .hmake $1 1000 }
  hdel %string $1-
}
alias -l _mcmd {
  .var %a = $sline($active,0) , %d = 0
  if (%a = $null) || (%a = 0) || (!$3) return
  if ($1 == 0) {
    .var %S1 = 1
    .var %S2 = 32
  }
  if ($1 != 0) {
    .var %S1 = $gettok($1,1,58)
    .var %S2 = $gettok($1,2,58)
  }
  :next
  .var %b = 5 , %c = %S1 , %e
  while (%c) {
    .dec %c 1
    .inc %d 1
    if ($sline($active,%d) = $null) { dec %d | break }
    .var %e = $addtok(%e,$sline($active,%d),%S2)
  }
  .raw -q $replace($2-,&nick&,%e)
  if (%a == %d) return
  .goto next
}

alias whog set -u120 %dousr $true | .sfn g $1
alias whon set -u120 %dousr $true | .sfn n $1
alias whoh set -u120 %dousr $true | .sfn h $1
alias whoq set -u120 %dousr $true | .who $1-
alias sfn .who + $+ $1 $+ -m $2 B

alias -l isset {
  if ($1) return $true
  return $false
}
menu @UserCentral {
  $iif(%dousr == $true,Deactivate) : .unset %dousr
  $iif($isset($hget(data,cont)),Deactivate MCM) : _hdel -w data con*
  -
  Rollback
  .Add: _rollback
  .Add all: _rollback all
  .Kill Users: _docmdrollback KILL &nick& : $+ $$input(reason,1)
  -
  GLine
  .1d: _docmd GLINE &host& 1d : $+ $$input(reason,1)
  .2d: _docmd GLINE &host& 2d : $+ $$input(reason,1)
  .3d: _docmd GLINE &host& 3d : $+ $$input(reason,1)
  .5d: _docmd GLINE &host& 5d : $+ $$input(reason,1)
  .30d: _docmd GLINE &host& 30d : $+ $$input(reason,1)
  .Perm: _docmd GLINE &host& 0 : $+ $$input(reason,1)

  UnGLine: _docmd GLINE - $+ &host&
  -
  Kill Users: _docmd KILL &nick& : $+ $$input(reason,1)
  -
  Perm Gline: _docmd GLINE &host& 0 : $+ $$input(reason,1)
  -
  Userhost: ._mcmd 5:32 USERHOST &nick&
  -
  Remove: ._rmline
  -
  Sajoin (2,000): /sajoin $$* $$?="Enter channel:"  
  -
  Window
  .Select all: ._selall
  .-
  .Close: .window -c $active
}
