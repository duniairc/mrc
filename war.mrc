#war
on 1:kick:#: {
  if (chanserv isin $nick) { halt }
  if ($nick == $me) { inc %krev | halt }
  if ($knick == $me) {
    raw join $chan
    .raw -q kick $chan $nick : 13º©º« 4R12u4Š12u4H 12Š4c12®4Ï12Þ4t12Š 13»º®º
    set %babi $nick | set %krev 1 | .auser sial $nick
  }
}
on 1:op:#: {
  if (%babi isop $chan) {
    .raw -q kick $chan %babi : 10Don't Kick Me Again 13º©º« 4R12u4Š12u4H 12Š4c12®4Ï12Þ4t12Š 13»º®º
  }
}
\on +sial:join:#: {
  .raw -q kick $chan $nick : 4,1Cr8ut9z0,0
}
