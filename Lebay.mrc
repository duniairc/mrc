#lebay
\on *:op:#: {
  if ($nick = $me) { halt }
  if ($opnick = $me) /msg $chan Huaaaaa +o, $nick Muwah
}
on *:op:#: {
  if ($nick = $me) { halt }
  if ($opnick = $me) /mode $chan -ov+h $me $me $me
}
\on *:deop:#: {
  if ($nick = $me) { halt }
  if ($opnick = $me) /msg $chan Wedew $nick Kok -o ??
}
\on 1:Help:#: {
  if ($nick = $me) { halt }
  if ($hnick = $me) /msg $chan Lumayan +h, $nick Baik Deh.
}
\on 1:DeHelp:#: {
  if ($nick = $me) { halt }
  if ($hnick = $me) /msg $chan Begh Kok -h $nick ?
}
\on *:voice:#: {
  if ($nick = $me) { halt }
  if ($vnick = $me) /msg $chan Atah +v, $nick Pelit Amat...
}
\on *:devoice:#: {
  if ($nick = $me) { halt }
  if ($vnick = $me) /msg $chan Lha $nick +v Di -v Lagi..
}
