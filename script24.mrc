#Swear off
on @1:text:*:#: {
  if (%nickbanned [ $+ [ $nick ] ] == $null) {
    set %i 0
    :checking
    inc %i 1
    set %currentsword $read -l $+ %i $mircdirscripts/Swear.txt
    if (%currentsword == $null) { .unset %i %currentsword | goto end }
    else {
      if (%currentsword isin $1-) { goto offense }
      else { goto checking }
    }
    :offense
    if ($nick isop $chan) && (%dontkbops == ON) { goto end }
    elseif ($nick isvoice $chan) && (%dontkbvoices == ON) { goto end }
    else { set -u5 %nickbanned [ $+ [ $nick ] ] YES | sweartxtdo }
    .goto end  
  }
  :end
}
on @1:action:*:#: {
  if (%nickbanned [ $+ [ $nick ] ] == $null) {
    set %i 0
    :checking
    inc %i 1
    set %currentsword $read -l $+ %i $mircdirscripts/Swear.txt
    if (%currentsword == $null) { .unset %i %currentsword | goto end }
    else {
      if (%currentsword isin $1-) { goto offense }
      else { goto checking }
    }
    :offense
    if ($nick isop $chan) && (%dontkbops == ON) { goto end }
    elseif ($nick isvoice $chan) && (%dontkbvoices == ON) { goto end }
    else { set -u5 %nickbanned [ $+ [ $nick ] ] YES | sweartxtdo }
    .goto end 
  }
  :end
}
on @1:notice:*:#: {
  if (%nickbanned [ $+ [ $nick ] ] == $null) {
    set %i 0
    :checking
    inc %i 1
    set %currentsword $read -l $+ %i $mircdirscripts/Swear.txt
    if (%currentsword == $null) { .unset %i %currentsword | goto end }
    else {
      if (%currentsword isin $1-) { goto offense }
      else { goto checking }
    }
    :offense
    if ($nick isop $chan) && (%dontkbops == ON) { goto end }
    elseif ($nick isvoice $chan) && (%dontkbvoices == ON) { goto end }
    else { set -u5 %nickbanned [ $+ [ $nick ] ] YES | sweartxtdo }
    .goto end  
  }
  :end
}
#Swear end
