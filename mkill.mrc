//*Mass kill command*//

alias masskill {
  if (# isin $active) {
    var %reason $$?="Reason:"
    var %num 0
   while (%num < $nick($chan,0,r)) {
      inc %num
     if ($nick($chan,%num) != $me) { kill $nick($chan,%num,r) %reason }
    }
  }
}
