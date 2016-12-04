spwn {
if (!$2) || ($1 !isnum) || ($1 < 1) halt
var %i 1
while (%i <= $1) {
.sajoin $2 #wirc_owns_j00 $+ $r(1,99999) $+ ,#subz_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999)
.sajoin $2 #subz_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999) $+ ,#wirc_owns_j00 $+ $r(1,99999)
inc %i
}
}
;
;EOF