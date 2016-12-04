dialog nick {
  title "Setup nicknames"
  size -1 -1 150 300

  combo 1,30 10 110 20,style{edit)
  combo 2,30 35 110 20,style{edit)
  combo 3,30 60 110 20,style{edit)
  combo 4,30 85 110 20,style{edit)
  combo 5,30 110 110 20,style{edit)
  combo 6,30 135 110 20,style{edit)
  combo 7,30 160 110 20,style{edit)
  combo 8,30 185 110 20,style{edit)
  combo 9,30 210 110 20,style{edit)
  combo 10,30 235 110 20,style{edit)

  text "1 :" ,11,10 12 15 20,style(right)
  text "2 :" ,12,10 37 15 20,style(right)
  text "3 :" ,13,10 62 15 20,style(right)
  text "4 :" ,14,10 87 15 20,style(right)
  text "5 :" ,15,10 112 15 20,style(right)
  text "6 :" ,16,10 137 15 20,style(right)
  text "7 :" ,17,10 162 15 20,style(right)
  text "8 :" ,18,10 187 15 20,style(right)
  text "9 :" ,19,10 212 15 20,style(right)
  text "10 :" ,20,5 237 20 20,style(right)

  button "OK",80,40 270 70 20,style(ok)
}

on 1:dialog:nick:*:80:{
  if ($did(nick,1).text != Your nickname ) { set %chgnick1 $did(nick,1).text }
  if ($did(nick,2).text != Your nickname ) { set %chgnick2 $did(nick,2).text }
  if ($did(nick,3).text != Your nickname ) { set %chgnick3 $did(nick,3).text }
  if ($did(nick,4).text != Your nickname ) { set %chgnick4 $did(nick,4).text }
  if ($did(nick,5).text != Your nickname ) { set %chgnick5 $did(nick,5).text }
  if ($did(nick,6).text != Your nickname ) { set %chgnick6 $did(nick,6).text }
  if ($did(nick,7).text != Your nickname ) { set %chgnick7 $did(nick,7).text }
  if ($did(nick,8).text != Your nickname ) { set %chgnick8 $did(nick,8).text }
  if ($did(nick,9).text != Your nickname ) { set %chgnick9 $did(nick,9).text }
  if ($did(nick,10).text != Your nickname ) { set %chgnick10 $did(nick,10).text }

  if ($did(nick,1).text == Your nickname) { unset %chgnick1 }
  if ($did(nick,2).text == Your nickname) { unset %chgnick2 }
  if ($did(nick,3).text == Your nickname) { unset %chgnick3 }
  if ($did(nick,4).text == Your nickname) { unset %chgnick4 }
  if ($did(nick,5).text == Your nickname) { unset %chgnick5 }
  if ($did(nick,6).text == Your nickname) { unset %chgnick6 }
  if ($did(nick,7).text == Your nickname) { unset %chgnick7 }
  if ($did(nick,8).text == Your nickname) { unset %chgnick8 }
  if ($did(nick,9).text == Your nickname) { unset %chgnick9 }
  if ($did(nick,10).text == Your nickname) { unset %chgnick10 }
}
