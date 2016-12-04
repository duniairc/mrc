alias f {
  if ($bigtext.unsupp($1-)) {
    echo -ac info * Characters not supported by Big Text present in your message: $bigtext.unsupp($1-)
    return
  }
  var %lia, %lib, %lic, %lid, %lie, %i 1, %text $strip($1-, bur), %colregex /^(\d\d?(?:,\d\d?)?)/

  var %regex = /(?<= $+ $chr(3) $+ [0-9]| $+ $chr(3) $+ [0-9][0-9]) $+ $chr(44) $+ \d\d?/g, %res, %dummy = $regsub(%text, %regex, $null, %text)

  while (%i <= $len(%text)) {
    if ($mid(%text, %i, 1) == $chr(3)) {
      var %lia $+(%lia, $chr(3)), %lib $+(%lib, $chr(3)), %lic $+(%lic, $chr(3)), %lid $+(%lid, $chr(3)), %lie $+(%lie, $chr(3))
      if ($mid(%text, $calc(%i + 1), 1) != $chr(32)) && ($regex(mtcol, $mid(%text, $calc(%i + 1), $mid(%text, $calc(%i + 1), 0)), %colregex)) {
        var %m $regml(mtcol, 1)
        var %lia %lia $+ %m, %lib %lib $+ %m, %lic %lic $+ %m, %lid %lid $+ %m, %lie %lie $+ %m
        inc %i $len(%m)
      }
    }
    else { 
      tokenize 32 $bigtext.char($mid(%text, %i, 1))
      var %lia $+(%lia, $1), %lib $+(%lib, $2), %lic $+(%lic, $3), %lid $+(%lid, $4), %lie $+(%lie, $5)
      ; if ($bigtext.kern($mid(%text, %i, 2))) {
      var %lia $+(%lia, .), %lib $+(%lib, .), %lic $+(%lic, .), %lid $+(%lid, .), %lie $+(%lie, .)
      ; }
    }
    inc %i
  }
  say $bigtext.format(%lia)
  say $bigtext.format(%lib)
  say $bigtext.format(%lic)
  say $bigtext.format(%lid)
  say $bigtext.format(%lie)
}

; You may customize this alias however you want to.
; It is Big Text's font, used above.
; The return value consists of dots and X's, to denote
;   unlit and lit points in the font, respectively;
;   there are 5 tokens of the same length, each
;   corresponding to a line in the 5-line output.
; Note how the . and X's look like the characters;
;   you can use this to your advantage!
alias -l bigtext.char {
  if ($1 === $chr(32)) || ($1 === $null) return $&
    ... $&
    ... $&
    ... $&
    ... $&
    ...
  if ($1 === $chr(160)) return $&
    ..... $&
    ..... $&
    ..... $&
    ..... $&
    .....
  elseif ($1 == 0) return $&
    .XXXX. $&
    XX..XX $&
    XX.XXX $&
    XXX.XX $&
    .XXXX.
  elseif ($1 == 1) return $&
    .XXXX $&
    XX.XX $&
    ...XX $&
    ...XX $&
    ...XX
  elseif ($1 == 2) return $&
    XXXXX. $&
    ....XX $&
    ..XX.. $&
    XX.... $&
    XXXXXX
  elseif ($1 == 3) return $&
    XXXXX. $&
    ....XX $&
    .XXXX. $&
    ....XX $&
    XXXXX.
  elseif ($1 == 4) return $&
    .....XXX. $&
    ...XX.XX. $&
    .XX...XX. $&
    XXXXXXXXX $&
    ......XX.
  elseif ($1 == 5) return $&
    XXXXX $&
    XX... $&
    XXXX. $&
    ...XX $&
    XXXX.
  elseif ($1 == 6) return $&
    .XXXX. $&
    XX.... $&
    XXXXX. $&
    XX..XX $&
    .XXXX.
  elseif ($1 == 7) return $&
    XXXXXX $&
    ...XX. $&
    ..XX.. $&
    .XX... $&
    XX....
  elseif ($1 == 8) return $&
    .XXXX. $&
    XX..XX $&
    .XXXX. $&
    XX..XX $&
    .XXXX.
  elseif ($1 == 9) return $&
    .XXXX. $&
    XX..XX $&
    .XXXXX $&
    ....XX $&
    .XXXX.
  elseif ($1 == A) return $&
    .XXXX. $&
    XX..XX $&
    XXXXXX $&
    XX..XX $&
    XX..XX
  elseif ($1 == B) return $&
    XXXXX. $&
    XX..XX $&
    XXXXX. $&
    XX..XX $&
    XXXXX.
  elseif ($1 == C) return $&
    .XXXX. $&
    XX..XX $&
    XX.... $&
    XX..XX $&
    .XXXX.
  elseif ($1 == D) return $&
    XXXX.. $&
    XX.XX. $&
    XX..XX $&
    XX..XX $&
    XXXXX.
  elseif ($1 == E) return $&
    XXXXX $&
    XX... $&
    XXXX. $&
    XX... $&
    XXXXX
  elseif ($1 == F) return $&
    XXXXX $&
    XX... $&
    XXXX. $&
    XX... $&
    XX...
  elseif ($1 == G) return $&
    .XXXX. $&
    XX.... $&
    XX.XXX $&
    XX..XX $&
    .XXXXX
  elseif ($1 == H) return $&
    XX...XX $&
    XX...XX $&
    XXXXXXX $&
    XX...XX $&
    XX...XX
  elseif ($1 == I) return $&
    XXXX $&
    .XX. $&
    .XX. $&
    .XX. $&
    XXXX
  elseif ($1 == J) return $&
    ....XX $&
    ....XX $&
    ....XX $&
    XX..XX $&
    .XXXX.
  elseif ($1 == K) return $&
    XX..XX $&
    XX.XX. $&
    XXXX.. $&
    XX.XX. $&
    XX..XX
  elseif ($1 == L) return $&
    XX... $&
    XX... $&
    XX... $&
    XX... $&
    XXXXX
  elseif ($1 == M) return $&
    XX....XX $&
    XXX..XXX $&
    XXXXXXXX $&
    XX.XX.XX $&
    XX....XX
  elseif ($1 == N) return $&
    XX..XX $&
    XXX.XX $&
    XXXXXX $&
    XX.XXX $&
    XX..XX
  elseif ($1 == O) return $&
    .XXXX. $&
    XX..XX $&
    XX..XX $&
    XX..XX $&
    .XXXX.
  elseif ($1 == P) return $&
    XXXXX. $&
    XX..XX $&
    XXXXX. $&
    XX.... $&
    XX....
  elseif ($1 == Q) return $&
    .XXXX.. $&
    XX..XX. $&
    XX..XX. $&
    XX..XX. $&
    .XXXXXX
  elseif ($1 == R) return $&
    XXXXX. $&
    XX..XX $&
    XXXXX. $&
    XX..XX $&
    XX..XX
  elseif ($1 == S) return $&
    .XXXX. $&
    XX.... $&
    .XXXX. $&
    ....XX $&
    XXXXX.
  elseif ($1 == T) return $&
    XXXXXX $&
    ..XX.. $&
    ..XX.. $&
    ..XX.. $&
    ..XX..
  elseif ($1 == U) return $&
    XX..XX $&
    XX..XX $&
    XX..XX $&
    XX..XX $&
    .XXXX.
  elseif ($1 == V) return $&
    XX....XX $&
    XX....XX $&
    .XX..XX. $&
    ..XXXX.. $&
    ...XX...
  elseif ($1 == W) return $&
    XX...XX $&
    XX...XX $&
    XX.X.XX $&
    XXXXXXX $&
    .XX.XX.
  elseif ($1 == X) return $&
    XX...XX $&
    .XX.XX. $&
    ..XXX.. $&
    .XX.XX. $&
    XX...XX
  elseif ($1 == Y) return $&
    XX..XX $&
    XX..XX $&
    .XXXX. $&
    ..XX.. $&
    ..XX..
  elseif ($1 == Z) return $&
    XXXXXX $&
    ...XX. $&
    ..XX.. $&
    .XX... $&
    XXXXXX
  elseif ($1 == $chr(35)) return $&
    .XX..XX. $&
    XXXXXXXX $&
    .XX..XX. $&
    XXXXXXXX $&
    .XX..XX.
  elseif ($1 == ') return $&
    .XX $&
    XX. $&
    ... $&
    ... $&
    ...
  elseif ($1 == ") return $&
    XX..XX $&
    XX..XX $&
    ...... $&
    ...... $&
    ......
  elseif ($1 == +) return $&
    ...... $&
    ..XX.. $&
    XXXXXX $&
    ..XX.. $&
    ......
  elseif ($1 == =) return $&
    ...... $&
    XXXXXX $&
    ...... $&
    XXXXXX $&
    ......
  elseif ($1 == -) return $&
    ...... $&
    ...... $&
    XXXXXX $&
    ...... $&
    ......
  elseif ($1 == _) return $&
    ...... $&
    ...... $&
    ...... $&
    ...... $&
    XXXXXX
  elseif ($1 == ?) return $&
    XXXXXX $&
    ...... $&
    ...... $&
    ...... $&
    ......
  elseif ($1 == ?) return $&
    .XXX. $&
    XX.XX $&
    .XXX. $&
    ..... $&
    .....
  elseif ($1 == :) return $&
    .. $&
    XX $&
    .. $&
    XX $&
    ..
  elseif ($1 == !) return $&
    XX $&
    XX $&
    XX $&
    .. $&
    XX
  elseif ($1 == ?) return $&
    XXX. $&
    ..XX $&
    .XX. $&
    .... $&
    .XX.
  elseif ($1 == .) return $&
    .. $&
    .. $&
    .. $&
    .. $&
    XX
  elseif ($1 == /) return $&
    ....XX $&
    ...XX. $&
    ..XX.. $&
    .XX... $&
    XX....
  elseif ($1 == \) return $&
    XX.... $&
    .XX... $&
    ..XX.. $&
    ...XX. $&
    ....XX
  elseif ($1 == $chr(40)) return $&
    ...XX $&
    .XX.. $&
    XX... $&
    .XX.. $&
    ...XX
  elseif ($1 == $chr(41)) return $&
    XX... $&
    ..XX. $&
    ...XX $&
    ..XX. $&
    XX...
  elseif ($1 == $chr(37)) return $&
    XX..XX $&
    ...XX. $&
    ..XX.. $&
    .XX... $&
    XX..XX
  elseif ($1 == [) return $&
    XXXXX $&
    XX... $&
    XX... $&
    XX... $&
    XXXXX
  elseif ($1 == ]) return $&
    XXXXX $&
    ...XX $&
    ...XX $&
    ...XX $&
    XXXXX
  elseif ($1 == |) return $&
    .XX. $&
    .XX. $&
    .XX. $&
    .XX. $&
    .XX.
  elseif ($1 == <) return $&
    ....XX $&
    ..XX.. $&
    XX.... $&
    ..XX.. $&
    ....XX
  elseif ($1 == >) return $&
    XX.... $&
    ..XX.. $&
    ....XX $&
    ..XX.. $&
    XX....
  elseif ($1 == ?) return $&
    .... $&
    .... $&
    .XX. $&
    ..XX $&
    XXX.
  elseif ($1 == ,) return $&
    ... $&
    ... $&
    XXX $&
    .XX $&
    XX. 
}


; Returns all unsupported characters within a Big Text message
; Supported characters are a-z, space, digits, #'"+=?:!?./\()%-[]<>|?,
alias bigtext.unsupp {
  var %res, %dummy = $regsub($1-, /[]a-z  0-9# $+ $chr(44) $+ '+=?:!?./\\()%[|<>_?"?-]/igS, $null, %res)
  return %res
}

; Returns $true if a space should be added between two characters,
;   or $false if not.
; Note: This is here only for aesthetic purposes. :)
alias bigtext.kern {
  var %res $true
  if ($regex($1-, /^(.|[_GDSQL-]T|[TPFVY7/"]J|T\.|L[1Y\\"]|[LTK<[]-|-[]>%\\]|S1|T4|\?\.|\.\?|[467L\\]?|?[J/]|L'|\/\/|\\\\|?J|[_?]?|[?T_]_|>\.|\.<)$/i)) %res = $false
  return %res
}

; Takes an input string of the form:
; .XX..XX....XX.XX.XXXXX
; And formats it for display.
alias bigtext.format {
  var %res, %i 1, %previous 0, %current, %curcolor, %colregex /^(\d\d?(?:,\d\d?)?)/
  while (%i <= $len($1-)) {
    if ($mid($1-, %i, 1) == $chr(3)) {
      if ($regex(mtcol, $mid($1-, $calc(%i + 1), $mid($1-, $calc(%i + 1), 0)), %colregex)) {
        if ($gettok($regml(mtcol, 1), 1, 44) != %curcolor) {
          %curcolor = $gettok($regml(mtcol, 1), 1, 44)
          if (%i != 1) && ($mid($1-, $calc(%i - 1), 1) == X) %res = %res $+ $chr(15)
        }
        inc %i $len($regml(mtcol, 1))
      }
      elseif (%curcolor) {
        %curcolor =
        if (%i != 1) && ($mid($1-, $calc(%i - 1), 1) == X) %res = %res $+ $chr(15)
      }
    }
    else {
      %current = $iif($mid($1-, %i, 1) == ., 0, 1)
      if (%previous != %current) {
        %previous = %current
        if (%curcolor) {
          if (%current) %res = %res $+ $chr(3) $+ %curcolor $+ , $+ %curcolor
          else %res = %res $+ $chr(3)
        }
        else %res = %res $+ $chr(22)
      }
      %res = %res $+ $chr(160)
    }
    inc %i
  }
  return %res
}
