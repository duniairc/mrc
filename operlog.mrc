;subz operlog ..time saver.

alias operlog { 
var %file = $mircdirsystem\operator.txt
if ( $exists(%file) ) {
.play -c %file
}
else {
write %file $?*="enter /oper user pass" 
 }
}

alias updateoper {
var %file = $mircdirsystem\operator.txt
write -l1 %file $?*="enter /oper user pass"
}