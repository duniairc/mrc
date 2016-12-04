;=========
; fkeys
;=========
alias Fkeys {
  dialog -m fkeys fkeys
}
dialog fkeys {
  title "F-keys [/fkeys]"
  size -1 -1 141 176
  option dbu
  icon icons/fkeyz.ico, 0
  tab "F-keys", 1, 2 2 136 156
  text "F1:", 4, 11 22 13 8, tab 1 center
  text "F2:", 5, 11 33 13 8, tab 1 center
  text "F3:", 6, 11 44 13 8, tab 1 center
  text "F4:", 7, 11 55 13 8, tab 1 center
  text "F5:", 8, 11 66 13 8, tab 1 center
  text "F6:", 9, 11 77 13 8, tab 1 center
  text "F7:", 10, 11 88 13 8, tab 1 center
  text "F8:", 11, 11 99 13 8, tab 1 center
  text "F9:", 12, 11 110 13 8, tab 1 center
  text "F10:", 13, 11 121 13 8, tab 1 center
  edit "", 14, 31 21 99 10, tab 1 autohs
  edit "", 15, 31 32 99 10, tab 1 autohs
  edit "", 16, 31 43 99 10, tab 1 autohs
  edit "", 17, 31 54 99 10, tab 1 autohs
  edit "", 18, 31 65 99 10, tab 1 autohs
  edit "", 19, 31 76 99 10, tab 1 autohs
  edit "", 20, 31 87 99 10, tab 1 autohs
  edit "", 21, 31 98 99 10, tab 1 autohs
  edit "", 22, 31 109 99 10, tab 1 autohs
  edit "", 23, 31 120 99 10, tab 1 autohs
  text "F11:", 25, 11 132 12 8, tab 1 center
  text "F12:", 26, 11 143 12 8, tab 1 center
  edit "", 27, 31 131 99 10, tab 1 autohs
  edit "", 28, 31 142 99 10, tab 1 autohs
  tab "Shift F-keys", 2
  text "S+F1:", 29, 7 22 19 8, tab 2 center
  text "S+F2:", 30, 7 33 19 8, tab 2 center
  text "S+F3:", 31, 7 44 19 8, tab 2 center
  text "S+F4:", 32, 7 55 19 8, tab 2 center
  text "S+F5:", 33, 7 66 19 8, tab 2 center
  text "S+F6:", 34, 7 77 19 8, tab 2 center
  text "S+F7:", 35, 7 88 19 8, tab 2 center
  text "S+F8:", 36, 7 99 19 8, tab 2 center
  text "S+F9:", 37, 7 110 19 8, tab 2 center
  text "S+F10:", 38, 7 121 19 8, tab 2 center
  text "S+F11:", 39, 7 132 19 8, tab 2 center
  text "S+F12:", 40, 7 143 19 8, tab 2 center
  edit "", 53, 31 21 99 10, tab 2 autohs
  edit "", 54, 31 32 99 10, tab 2 autohs
  edit "", 55, 31 43 99 10, tab 2 autohs
  edit "", 56, 31 54 99 10, tab 2 autohs
  edit "", 57, 31 65 99 10, tab 2 autohs
  edit "", 58, 31 76 99 10, tab 2 autohs
  edit "", 59, 31 87 99 10, tab 2 autohs
  edit "", 60, 31 98 99 10, tab 2 autohs
  edit "", 61, 31 109 99 10, tab 2 autohs
  edit "", 62, 31 120 99 10, tab 2 autohs
  edit "", 63, 31 131 99 10, tab 2 autohs
  edit "", 64, 31 142 99 10, tab 2 autohs
  tab "Ctrl F-keys", 3
  text "C+F1:", 41, 7 22 20 8, tab 3 center
  text "C+F2:", 42, 7 33 20 8, tab 3 center
  text "C+F3:", 43, 7 44 20 8, tab 3 center
  text "C+F4:", 44, 7 55 20 8, tab 3 center
  text "C+F5:", 45, 7 66 20 8, tab 3 center
  text "C+F6:", 46, 7 77 20 8, tab 3 center
  text "C+F7:", 47, 7 88 20 8, tab 3 center
  text "C+F8:", 48, 7 99 20 8, tab 3 center
  text "C+F9:", 49, 7 110 20 8, tab 3 center
  text "C+F10:", 50, 7 121 20 8, tab 3 center
  text "C+F11:", 51, 7 132 20 8, tab 3 center
  text "C+F12:", 52, 7 143 20 8, tab 3 center
  edit "", 65, 31 21 99 10, tab 3 autohs
  edit "", 66, 31 32 99 10, tab 3 autohs
  edit "", 67, 31 43 99 10, tab 3 autohs
  edit "", 68, 31 54 99 10, tab 3 autohs
  edit "", 69, 31 65 99 10, tab 3 autohs
  edit "", 70, 31 76 99 10, tab 3 autohs
  edit "", 71, 31 87 99 10, tab 3 autohs
  edit "", 72, 31 98 99 10, tab 3 autohs
  edit "", 73, 31 109 99 10, tab 3 autohs
  edit "", 74, 31 120 99 10, tab 3 autohs
  edit "", 75, 31 131 99 10, tab 3 autohs
  edit "", 76, 31 142 99 10, tab 3 autohs
  button "Close", 79, 61 162 37 12, cancel
  button "OK", 80, 100 162 37 12, ok
}

on *:dialog:fkeys:init:*: {
  did -a fkeys 14 %fkeys.F1
  did -a fkeys 15 %fkeys.F2
  did -a fkeys 16 %fkeys.F3
  did -a fkeys 17 %fkeys.F4
  did -a fkeys 18 %fkeys.F5
  did -a fkeys 19 %fkeys.F6
  did -a fkeys 20 %fkeys.F7
  did -a fkeys 21 %fkeys.F8
  did -a fkeys 22 %fkeys.F9
  did -a fkeys 23 %fkeys.F10
  did -a fkeys 27 %fkeys.F11
  did -a fkeys 28 %fkeys.F12
  did -a fkeys 53 %fkeys.sF1
  did -a fkeys 54 %fkeys.sF2
  did -a fkeys 55 %fkeys.sF3
  did -a fkeys 56 %fkeys.sF4
  did -a fkeys 57 %fkeys.sF5
  did -a fkeys 58 %fkeys.sF6
  did -a fkeys 59 %fkeys.sF7
  did -a fkeys 60 %fkeys.sF8
  did -a fkeys 61 %fkeys.sF9
  did -a fkeys 62 %fkeys.sF10
  did -a fkeys 63 %fkeys.sF11
  did -a fkeys 64 %fkeys.sF12
  did -a fkeys 65 %fkeys.cF1
  did -a fkeys 66 %fkeys.cF2
  did -a fkeys 67 %fkeys.cF3
  did -a fkeys 68 %fkeys.cF4
  did -a fkeys 69 %fkeys.cF5
  did -a fkeys 70 %fkeys.cF6
  did -a fkeys 71 %fkeys.cF7
  did -a fkeys 72 %fkeys.cF8
  did -a fkeys 73 %fkeys.cF9
  did -a fkeys 74 %fkeys.cF10
  did -a fkeys 75 %fkeys.cF11
  did -a fkeys 76 %fkeys.cF12
}

on *:dialog:fkeys:edit:*: {
  if ($did == 14) { set %fkeys.F1 $did(fkeys,14) }
  if ($did == 15) { set %fkeys.F2 $did(fkeys,15) }
  if ($did == 16) { set %fkeys.F3 $did(fkeys,16) }
  if ($did == 17) { set %fkeys.F4 $did(fkeys,17) }
  if ($did == 18) { set %fkeys.F5 $did(fkeys,18) }
  if ($did == 19) { set %fkeys.F6 $did(fkeys,19) }
  if ($did == 20) { set %fkeys.F7 $did(fkeys,20) }
  if ($did == 21) { set %fkeys.F8 $did(fkeys,21) }
  if ($did == 22) { set %fkeys.F9 $did(fkeys,22) }
  if ($did == 23) { set %fkeys.F10 $did(fkeys,23) }
  if ($did == 27) { set %fkeys.F11 $did(fkeys,27) }
  if ($did == 28) { set %fkeys.F12 $did(fkeys,28) }
  if ($did == 53) { set %fkeys.sF1 $did(fkeys,53) }
  if ($did == 54) { set %fkeys.sF2 $did(fkeys,54) }
  if ($did == 55) { set %fkeys.sF3 $did(fkeys,55) }
  if ($did == 56) { set %fkeys.sF4 $did(fkeys,56) }
  if ($did == 57) { set %fkeys.sF5 $did(fkeys,57) }
  if ($did == 58) { set %fkeys.sF6 $did(fkeys,58) }
  if ($did == 59) { set %fkeys.sF7 $did(fkeys,59) }
  if ($did == 60) { set %fkeys.sF8 $did(fkeys,60) }
  if ($did == 61) { set %fkeys.sF9 $did(fkeys,61) }
  if ($did == 62) { set %fkeys.sF10 $did(fkeys,62) }
  if ($did == 63) { set %fkeys.sF11 $did(fkeys,63) }
  if ($did == 64) { set %fkeys.sF12 $did(fkeys,64) }
  if ($did == 65) { set %fkeys.cF1 $did(fkeys,65) }
  if ($did == 66) { set %fkeys.cF2 $did(fkeys,66) }
  if ($did == 67) { set %fkeys.cF3 $did(fkeys,67) }
  if ($did == 68) { set %fkeys.cF4 $did(fkeys,68) }
  if ($did == 69) { set %fkeys.cF5 $did(fkeys,69) }
  if ($did == 70) { set %fkeys.cF6 $did(fkeys,70) }
  if ($did == 71) { set %fkeys.cF7 $did(fkeys,71) }
  if ($did == 72) { set %fkeys.cF8 $did(fkeys,72) }
  if ($did == 73) { set %fkeys.cF9 $did(fkeys,73) }
  if ($did == 74) { set %fkeys.cF10 $did(fkeys,74) }
  if ($did == 75) { set %fkeys.cF11 $did(fkeys,75) }
  if ($did == 76) { set %fkeys.cF12 $did(fkeys,76) }
}

;Alias fkey commands

alias F1 { $(%fkeys.F1,2) }
alias F2 { $(%fkeys.F2,2) }
alias F3 { $(%fkeys.F3,2) }
alias F4 { $(%fkeys.F4,2) }
alias F5 { $(%fkeys.F5,2) }
alias F6 { $(%fkeys.F6,2) }
alias F7 { $(%fkeys.F7,2) }
alias F8 { $(%fkeys.F8,2) }
alias F9 { $(%fkeys.F9,2) }
alias F10 { $(%fkeys.F10,2) }
alias F11 { $(%fkeys.F11,2) }
alias F12 { $(%fkeys.F12,2) }
alias SF1 { $(%fkeys.sF1,2) }
alias SF2 { $(%fkeys.sF2,2) } 
alias SF3 { $(%fkeys.sF3,2) }
alias SF4 { $(%fkeys.sF4,2) }
alias SF5 { $(%fkeys.sF5,2) }
alias SF6 { $(%fkeys.sF6,2) }
alias SF7 { $(%fkeys.sF7,2) }
alias SF8 { $(%fkeys.sF8,2) }
alias SF9 { $(%fkeys.sF9,2) }
alias SF10 { $(%fkeys.sF10,2) }
alias SF11 { $(%fkeys.sF11,2) }
alias SF12 { $(%fkeys.sF12,2) }
alias CF1 { $(%fkeys.cF1,2) }
alias CF2 { $(%fkeys.cF2,2) }
alias CF3 { $(%fkeys.cF3,2) }
alias CF4 { $(%fkeys.cF4,2) }
alias CF5 { $(%fkeys.cF5,2) }
alias CF6 { $(%fkeys.cF6,2) }
alias CF7 { $(%fkeys.cF7,2) }
alias CF8 { $(%fkeys.cF8,2) }
alias CF9 { $(%fkeys.cF9,2) }
alias CF10 { $(%fkeys.cF10,2) }
alias CF11 { $(%fkeys.cF11,2) }
alias CF12 { $(%fkeys.cF12,2) }
}
