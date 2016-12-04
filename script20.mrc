alias wcc {
  set %c $right($1-,4) | if (%c == .com) { unset %c | return commercial } | if (%c == .net) { unset %c | return network }
  if (%c == .org) { unset %c | return organization } | if (%c == .edu) { unset %c | return educational }
  if (%c == .gov) { unset %c | return government } | if (%c == .mil) { unset %c | return military }
  if (%c == .int) { unset %c | return international } | if (%c == .rpa) { unset %c | return arpanet }
  if (%c == .ato) { unset %c | return nato field } | set %c $right($1-,3)
  if (%c == .ad) { unset %c | return andorra } | if (%c == .ae) { unset %c | return united arab emirates }
  if (%c == .af) { unset %c | return afghanistan } | if (%c == .ag) { unset %c | return antigua and barbuda }
  if (%c == .ai) { unset %c | return anguilla } | if (%c == .al) { unset %c | return albania }
  if (%c == .am) { unset %c | return armenia } | if (%c == .an) { unset %c | return netherlands antilles }
  if (%c == .ao) { unset %c | return angola } | if (%c == .aq) { unset %c | return antarctica }
  if (%c == .ar) { unset %c | return argentina } | if (%c == .as) { unset %c | return american samoa }
  if (%c == .at) { unset %c | return austria } | if (%c == .au) { unset %c | return australia }
  if (%c == .aw) { unset %c | return aruba } | if (%c == .az) { unset %c | return azerbaijan }
  if (%c == .ba) { unset %c | return bosnia/herzegovina } | if (%c == .bb) { unset %c | return barbados }
  if (%c == .bd) { unset %c | return bangladesh } | if (%c == .be) { unset %c | return belgium }
  if (%c == .bf) { unset %c | return burkina faso } | if (%c == .bg) { unset %c | return bulgaria }
  if (%c == .bh) { unset %c | return bahrain } | if (%c == .bi) { unset %c | return burundi }
  if (%c == .bj) { unset %c | return benin } | if (%c == .bm) { unset %c | return bermuda }
  if (%c == .bn) { unset %c | return brunei darussalam } | if (%c == .bo) { unset %c | return bolivia }
  if (%c == .br) { unset %c | return brazil } | if (%c == .bs) { unset %c | return bahamas }
  if (%c == .bt) { unset %c | return bhutan } | if (%c == .bv) { unset %c | return bouvet island }
  if (%c == .bw) { unset %c | return botswana } | if (%c == .by) { unset %c | return belarus }
  if (%c == .bz) { unset %c | return belize } | if (%c == .ca) { unset %c | return canada }
  if (%c == .cc) { unset %c | return cocos islands } | if (%c == .cf) { unset %c | return central african republic }
  if (%c == .cg) { unset %c | return congo } | if (%c == .ch) { unset %c | return switzerland }
  if (%c == .ci) { unset %c | return cote d'ivoire } | if (%c == .ck) { unset %c | return cook islands }
  if (%c == .cl) { unset %c | return chile } | if (%c == .cm) { unset %c | return cameroon }
  if (%c == .cn) { unset %c | return china } | if (%c == .co) { unset %c | return colombia }
  if (%c == .cr) { unset %c | return costa rica } | if (%c == .cs) { unset %c | return former czechoslovakia }
  if (%c == .cu) { unset %c | return cuba } | if (%c == .cv) { unset %c | return cape verde }
  if (%c == .cx) { unset %c | return christmas island } | if (%c == .cy) { unset %c | return cyprus }
  if (%c == .cz) { unset %c | return czech republic } | if (%c == .de) { unset %c | return germany }
  if (%c == .dj) { unset %c | return djibouti } | if (%c == .dk) { unset %c | return denmark }
  if (%c == .dm) { unset %c | return dominica } | if (%c == .do) { unset %c | return dominican republic }
  if (%c == .dz) { unset %c | return algeria } | if (%c == .ec) { unset %c | return ecuador }
  if (%c == .ee) { unset %c | return estonia } | if (%c == .eg) { unset %c | return egypt }
  if (%c == .eh) { unset %c | return western sahara } | if (%c == .er) { unset %c | return eritrea }
  if (%c == .es) { unset %c | return spain } | if (%c == .et) { unset %c | return ethiopia }
  if (%c == .fi) { unset %c | return finland } | if (%c == .fj) { unset %c | return fiji }
  if (%c == .fk) { unset %c | return falkland islands } | if (%c == .fm) { unset %c | return micronesia }
  if (%c == .fo) { unset %c | return faroe islands } | if (%c == .fr) { unset %c | return france }
  if (%c == .fx) { unset %c | return metropolitan france } | if (%c == .ga) { unset %c | return gabon }
  if (%c == .gb) { unset %c | return great britain } | if (%c == .gd) { unset %c | return grenada }
  if (%c == .ge) { unset %c | return georgia } | if (%c == .gf) { unset %c | return french guiana }
  if (%c == .gh) { unset %c | return ghana } | if (%c == .gi) { unset %c | return gibraltar }
  if (%c == .gl) { unset %c | return greenland } | if (%c == .gm) { unset %c | return gambia }
  if (%c == .gn) { unset %c | return guinea } | if (%c == .gp) { unset %c | return guadeloupe }
  if (%c == .gq) { unset %c | return equatorial guinea } | if (%c == .gr) { unset %c | return greece }
  if (%c == .gs) { unset %c | return s. georgia & s. sandwich isls. } | if (%c == .gt) { unset %c | return guatemala }
  if (%c == .gu) { unset %c | return guam } | if (%c == .gw) { unset %c | return guinea-bissau }
  if (%c == .gy) { unset %c | return guyana } | if (%c == .hk) { unset %c | return hong kong }
  if (%c == .hm) { unset %c | return heard & mcdonald islands } | if (%c == .hn) { unset %c | return honduras }
  if (%c == .hr) { unset %c | return croatia } | if (%c == .ht) { unset %c | return haiti }
  if (%c == .hu) { unset %c | return hungary } | if (%c == .id) { unset %c | return indonesia }
  if (%c == .ie) { unset %c | return ireland } | if (%c == .il) { unset %c | return Israel }
  if (%c == .in) { unset %c | return india } | if (%c == .io) { unset %c | return british indian ocean territory }
  if (%c == .iq) { unset %c | return iraq } | if (%c == .ir) { unset %c | return iran }
  if (%c == .is) { unset %c | return iceland } | if (%c == .it) { unset %c | return italy }
  if (%c == .jm) { unset %c | return jamaica } | if (%c == .jp) { unset %c | return japan }
  if (%c == .ke) { unset %c | return kenya } | if (%c == .kg) { unset %c | return kyrgyzstan }
  if (%c == .kh) { unset %c | return cambodia } | if (%c == .ki) { unset %c | return kiribati }
  if (%c == .km) { unset %c | return comoros } | if (%c == .kn) { unset %c | return st kitts and nevis }
  if (%c == .kp) { unset %c | return north korea } | if (%c == .kr) { unset %c | return south korea }
  if (%c == .kw) { unset %c | return kuwait } | if (%c == .ky) { unset %c | return cayman islands }
  if (%c == .kz) { unset %c | return kazakhstan } | if (%c == .la) { unset %c | return laos }
  if (%c == .lb) { unset %c | return lebanon } | if (%c == .lc) { unset %c | return saint lucia }
  if (%c == .li) { unset %c | return liechtenstein } | if (%c == .lk) { unset %c | return sri lanka }
  if (%c == .lr) { unset %c | return liberia } | if (%c == .ls) { unset %c | return lesotho }
  if (%c == .lt) { unset %c | return lithuania } | if (%c == .lu) { unset %c | return luxembourg }
  if (%c == .lv) { unset %c | return latvia } | if (%c == .ly) { unset %c | return libya }
  if (%c == .ma) { unset %c | return morocco } | if (%c == .mc) { unset %c | return monaco }
  if (%c == .md) { unset %c | return moldova } | if (%c == .mg) { unset %c | return madagascar }
  if (%c == .mh) { unset %c | return marshall islands } | if (%c == .mk) { unset %c | return macedonia }
  if (%c == .ml) { unset %c | return mali } | if (%c == .mm) { unset %c | return myanmar }
  if (%c == .mn) { unset %c | return mongolia } | if (%c == .mo) { unset %c | return macau }
  if (%c == .mp) { unset %c | return northern mariana islands } | if (%c == .mq) { unset %c | return martinique }
  if (%c == .mr) { unset %c | return mauritania } | if (%c == .ms) { unset %c | return montserrat }
  if (%c == .mt) { unset %c | return malta } | if (%c == .mu) { unset %c | return mauritius }
  if (%c == .mv) { unset %c | return maldives } | if (%c == .mw) { unset %c | return malawi }
  if (%c == .mx) { unset %c | return mexico } | if (%c == .my) { unset %c | return malaysia }
  if (%c == .mz) { unset %c | return mozambique } | if (%c == .na) { unset %c | return namibia }
  if (%c == .nc) { unset %c | return new caledonia } | if (%c == .ne) { unset %c | return niger }
  if (%c == .nf) { unset %c | return norfolk island } | if (%c == .ng) { unset %c | return nigeria }
  if (%c == .ni) { unset %c | return nicaragua } | if (%c == .nl) { unset %c | return netherlands }
  if (%c == .no) { unset %c | return norway } | if (%c == .np) { unset %c | return nepal }
  if (%c == .nr) { unset %c | return nauru } | if (%c == .nt) { unset %c | return neutral zone }
  if (%c == .nu) { unset %c | return niue } | if (%c == .nz) { unset %c | return new zealand }
  if (%c == .om) { unset %c | return oman } | if (%c == .pa) { unset %c | return panama }
  if (%c == .pe) { unset %c | return peru } | if (%c == .pf) { unset %c | return french polynesia }
  if (%c == .pg) { unset %c | return papua new guinea } | if (%c == .ph) { unset %c | return philippines }
  if (%c == .pk) { unset %c | return pakistan } | if (%c == .pl) { unset %c | return poland }
  if (%c == .pm) { unset %c | return st. pierre & miquelon } | if (%c == .pn) { unset %c | return pitcairn }
  if (%c == .pt) { unset %c | return portugal } | if (%c == .pw) { unset %c | return palau }
  if (%c == .py) { unset %c | return paraguay } | if (%c == .qa) { unset %c | return qatar }
  if (%c == .re) { unset %c | return reunion } | if (%c == .ro) { unset %c | return romania }
  if (%c == .ru) { unset %c | return russian federation } | if (%c == .rw) { unset %c | return rwanda }
  if (%c == .sa) { unset %c | return saudi arabia } | if (%c == .sb) { unset %c | return solomon islands }
  if (%c == .sc) { unset %c | return seychelles } | if (%c == .sd) { unset %c | return sudan }
  if (%c == .se) { unset %c | return sweden } | if (%c == .sg) { unset %c | return singapore }
  if (%c == .sh) { unset %c | return st. helena } | if (%c == .si) { unset %c | return slovenia }
  if (%c == .sj) { unset %c | return svalbard & jan mayen islands } | if (%c == .sk) { unset %c | return slovak republic }
  if (%c == .sl) { unset %c | return sierra leone } | if (%c == .sm) { unset %c | return san marino }
  if (%c == .sn) { unset %c | return senegal } | if (%c == .so) { unset %c | return somalia }
  if (%c == .sr) { unset %c | return suriname } | if (%c == .st) { unset %c | return sao tome & principe }
  if (%c == .su) { unset %c | return former ussr } | if (%c == .sv) { unset %c | return el salvador }
  if (%c == .sy) { unset %c | return syria } | if (%c == .sz) { unset %c | return swaziland }
  if (%c == .tc) { unset %c | return turks & caicos islands } | if (%c == .td) { unset %c | return chad }
  if (%c == .tf) { unset %c | return french southern territories } | if (%c == .tg) { unset %c | return togo }
  if (%c == .th) { unset %c | return thailand } | if (%c == .tj) { unset %c | return tajikistan }
  if (%c == .tk) { unset %c | return tokelau } | if (%c == .tm) { unset %c | return turkmenistan }
  if (%c == .tn) { unset %c | return tunisia } | if (%c == .to) { unset %c | return tonga }
  if (%c == .tp) { unset %c | return east timor } | if (%c == .tr) { unset %c | return turkey }
  if (%c == .tt) { unset %c | return trinidad & tobago } | if (%c == .tv) { unset %c | return tuvalu }
  if (%c == .tw) { unset %c | return taiwan } | if (%c == .tz) { unset %c | return tanzania }
  if (%c == .ua) { unset %c | return ukraine } | if (%c == .ug) { unset %c | return uganda }
  if (%c == .uk) { unset %c | return united kingdom } | if (%c == .um) { unset %c | return us minor outlying islands }
  if (%c == .us) { unset %c | return united states } | if (%c == .uy) { unset %c | return uruguay }
  if (%c == .uz) { unset %c | return uzbekistan } | if (%c == .va) { unset %c | return vatican city state }
  if (%c == .vc) { unset %c | return st, vincent & the grenadines } | if (%c == .ve) { unset %c | return venezuela }
  if (%c == .vg) { unset %c | return british virgin islands } | if (%c == .vi) { unset %c | return us virgin islands }
  if (%c == .vn) { unset %c | return vietnam } | if (%c == .vu) { unset %c | return vanuatu }
  if (%c == .wf) { unset %c | return wallis & futuna islands } | if (%c == .ws) { unset %c | return samoa }
  if (%c == .ye) { unset %c | return yemen } | if (%c == .yt) { unset %c | return mayotte }
  if (%c == .yu) { unset %c | return yugoslavia } | if (%c == .za) { unset %c | return south africa }
  if (%c == .zm) { unset %c | return zambia } | if (%c == .zr) { unset %c | return zaire }
  if (%c == .zw) { unset %c | return zimbabwe } | else { unset %c | return unknown }
}
raw 311:*:{
  var %user.address = $3 $+ @ $+ $4
  var %country = $country(%user.address)
  if %country { echo $ob.s 2 $+ $2 $+ 6 is 2 $+ $3 $+ @ $+ $4 $+ 3[4 $+ %country $+ 3] | echo -s $ob.s 2 $+ $2 $+ 6 is 2 $6-  }
  else { echo -s $ob.s 2 $+ $2 6[ Start Whois ] | echo -s $ob.s 2 $+ $2 $+ 6 is 2 $+ $3 $+ @ $+ $4 $+ 4 ( $+ $+ $wcc($3 $+ @ $+ $4) $+ 4) | echo -s $ob.s 2 $+ $2 $+ 6 is2 $6- }
  halt
}
raw 301:*:echo -s $ob.s 2 $+ $2 $+ 6 is away:2 $3-  | halt
raw 312:*:echo -s $ob.s 2 $+ $2 $+ 6 is using: 2 $+ $3 - $4-  | echo -s $ob.s 2 $+ $2 $+ 6 on network:2 $network  | halt
raw 313:*:echo -s $ob.s 2 $+ $2 6 Status $5- | halt
raw 319:*:echo -s $ob.s 2 $+ $2 $+ 6 in comchans:1 $wcomchans($2) | echo -s $ob.s 2 $+ $2 $+ 6 in channels:1 $replace($3-,+,4+,@,4@,%,4%) | halt
raw 307:*:echo -s $ob.s 2 $+ $2 $+ 6 is a registered nick | halt
raw 325:*:echo -s $ob.s 2 $+ $2 $+ 6 is identified on nickserv | halt
raw 308:*:echo -s $ob.s 2 $+ $2 $+ 6 is an administrator of $7 | halt
raw 310:*:echo -s $ob.s 2 $+ $2 $+ 6 is very helpful | halt
raw 317:*:echo -s $ob.s 2 $+ $2 $+ 6 connected in2 $asctime($4)) 6 idle:2 $duration($3) |  halt
raw 318:*:{
  if ($ial($address($2,2),0) > 1) echo -s $ob.s 2 $+ $2 $+ 6 is same address with: 4 $+ $gettok($ial($address($2,2),1),1,33) $+ 4 4  $+ $gettok($ial($address($2,2),2),1,33) $+ 4 4  $+ $gettok($ial($address($2,2),3),1,33) $+
  /echo -s $ob.s 2 $+ $2 6[ End Of Whois ] | halt
}

alias wcomchans { var %nick = $1 | %wc = $comchan(%nick,0) | while (%wc > 0) { var %comc = $addtok(%comc,$comchan(%nick,%wc),32) | dec %wc } | return $iif(%comc,%comc,None) }
alias helpful { set %helpful $rand(1,6) | if (%helpful == 1) { return like a person who think's they know something | halt } }
;
;
}
