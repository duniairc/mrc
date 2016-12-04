menu channel {
  -
  !info : setinfo
  $iif($($+(%,info,$chan,$cid),2) == on && $($+(%,info,all,$cid),2) != on,!info for $chan ( on )) { unset $+(%,info,$chan,$cid) }
  $iif($($+(%,info,$chan,$cid),2) == $null && $($+(%,info,all,$cid),2) != on,!info for $chan ( off )) { set $+(%,info,$chan,$cid) on }
  -
}
menu menubar,status {
  -
  !info : setinfo  
  $iif(($server != $null) && $($+(%,info,all,$cid),2) == on,!info All Channel ( on )) { unset $+(%,info,all,$cid) }
  $iif(($server != $null) && $($+(%,info,all,$cid),2) == $null,!info All Channel ( off )) { set $+(%,info,all,$cid) on }
  -
}


alias nohtml { var %x, %i = $regsub($1-,/(^[^<]*>|<[^>]*>|<[^>]*$)/g,$null,%x), %x = $remove(%x,&nbsp;) | return %x }
alias nohtml1 { var %x, %i = $regsub($1-,/(^[^<]*>|<[^>]*>|<[^>]*$)/g,$null,%x), %x = $remove(%x,&nbsp;) | %x = $remove(%x,$chr(32)) | return %x }


on $*:text:/^[!](w|weather|f|forecast|c|cuaca|ym|zodiak|info|adzan|jam|time|tanggal|musik|nama|ip|jodoh)/Si:#: {
  if ($info.chan($chan) == 1) { halt }
  var %info.ask = $chan $nick $+ ! $+ $ial($nick).user $+ @ $+ $ial($nick).host $1-
  echoinfo mulai: %info.ask
  if ($($+(%,info,all,$cid),2) != on) { if ($($+(%,info,$chan,$cid),2) != on) { halt } } 
  if ($istok(!w !weather !cuaca !c,$1,32)) && ($info.cek(3) == 1) {
    if ($2 == $null) { notice $nick Perintah untuk $1 $+ : $1 [kota] contoh: $1 bandung  | halt }    
    if ($group(#wetget) == on) { notice $nick Server Sibuk, Cobalah beberapa saat lagi,,  }
    if ($group(#wetget) == off) && ($2- != $null) {
      unset %wet* | %wet.ask = %info.ask | %wet.search1 = $2- | %wet.search = $replace($2-,$chr(44) $+ $chr(32),$chr(37) $+ 2C $+ $chr(43)) | %wet.search = $replace(%wet.search,$chr(32),$chr(43)) | %wet.chan = $nick | .enable #wetget
      setupwet | sockopen getwet www.wunderground.com 80
    }
  }
  if ($istok(!ym,$1,32)) && ($info.cek(7) == 1) {
    if ($2 == $null) { notice $nick Perintah untuk ym: !ym [nick ym] contoh: !ym ce_jomblo  | halt  }
    if ($group(#ymget) == on) { notice $nick Server Sibuk, Cobalah beberapa saat lagi,,  }
    if ($group(#ymget) == off) && ($2- != $null) {
      unset %ym* | %ym.ask = %info.ask
      %ym.chan = $chan | .enable #ymget | cekym $2
    }  
  }
  if ($istok(!adzan,$1,32)) && ($info.cek(2) == 1) {
    if ($2 == $null) { notice $nick Perintah untuk adzan: !adzan [nama kota] contoh: !adzan jakarta  | halt  }
    if ($group(#adzanget) == on) { notice $nick Server Sibuk, Cobalah beberapa saat lagi,,  }
    if ($group(#adzanget) == off) && ($2- != $null) {
      unset %adzan* | %adzan.ask = %info.ask
      %adzan.chan = $chan | .enable #adzanget | cekadzan $2-
    }  
  }  

  if ($istok(!jodoh,$1,32)) && ($info.cek(6) == 1) {
    if ($1 == $null) || ($2 == $null) { notice $nick Perintah untuk ramalan jodoh: !jodoh [nick1] [nick2] contoh: !jodoh saya kamu  | halt }
    .timerjodoh  1 2 msg $chan 10Kecocokan antara4 $2 $3 10sebesar3 $cekjodoh($1,$2)  
  }  

  if ($istok(!jam !time !tanggal,$1,32)) && ($info.cek(9) == 1) {
    if ($group(#jamget) == on) { notice $nick Server Sibuk, Cobalah beberapa saat lagi,,  }
    if ($group(#jamget) == off) {
      unset %jam* | %jam.ask = %info.ask
      %jam.chan = $chan | .enable #jamget | cekjam
    }  
  }    
  if ($istok(!zodiak,$1,32)) && ($info.cek(8) == 1) {
    if ($2 == $null) { notice $nick Perintah untuk zodiak: !zodiak [Aquarius|Pisces|Aries|Taurus|Gemini|Cancer|Leo|Virgo|Libra|Scorpio|Sagitarius|Capricorn]  | halt }
    if ($group(#zodiakget) == on) { notice $nick Server Sibuk, Cobalah beberapa saat lagi,,  }
    if ($group(#zodiakget) == off) && ($2- != $null) {
      unset %zodiak* | %zodiak.ask = %info.ask
      %zodiak.chan = $chan | .enable #zodiakget | cekzodiak $2
    }  
  }  
  if ($istok(!musik,$1,32)) && ($info.cek(12) == 1) {
    if ($2 == $null) { notice $nick Perintah untuk musik: !musik [indie|indo|indo1|top|barat]  | halt  }  
    if ($group(#ardanget) == on) { notice $nick Server Sibuk, Cobalah beberapa saat lagi,,  }
    if ($group(#ardanget) == off) && ($2- != $null) {
      unset %ardan* | %ardan.ask = %info.ask 
      %ardan.chan = $chan | .enable #ardanget | cekardan $2
    }  
  }     

  if ($istok(!ip,$1,32)) && ($info.cek(11) == 1) {
    if ($2 == $null) { notice $nick Perintah untuk ip: !ip kode_ip  | halt  }    
    if ($group(#iplookupget) == on) { notice $nick Server Sibuk, Cobalah beberapa saat lagi,,   }
    if ($group(#iplookupget) == off) && ($2- != $null) {
      unset %iplookup* | %iplookup.ask = %info.ask 
      %iplookup.chan = $chan | .enable #iplookupget | cekiplookup  $2
    }  
  }    
  if ($istok(!nama,$1,32)) && ($info.cek(4) == 1) {
    if ($2 == $null) { notice $nick Perintah untuk nama: !nama nama_lengkap  | halt  }    
    if ($group(#artinamaget) == on) { notice $nick Server Sibuk, Cobalah beberapa saat lagi,,  }
    if ($group(#artinamaget) == off) && ($2- != $null) {
      unset %artinama* | %artinama.ask = %info.ask 
      %artinama.chan = $chan | .enable #artinamaget | cekartinama $2-
    }  
  } 

  if ($istok(!forecast,$1,32)) && ($info.cek(5) == 1) {  
    if ($2 == $null) { notice $nick Perintah untuk forecast: !forecast [nama kota] contoh: !forecast medan atau !forecast jakarta  | halt }
    if (%cuaca.hasil1 == $null) { ambilcuaca }
    if ($2 != $null) && (%cuaca.hasil1 != $null) { 
      var %cuaca.chan = $remove($2-,$chr(32))
      if $findtok(%cuaca.hasil1,%cuaca.chan,0,44) {
        var %cuaca.chan1 = $findtok(%cuaca.hasil1,%cuaca.chan,1,44)
        msg $chan Ramalan cuaca tgl %cuaca.tanggal untuk  $+ $gettok(%cuaca.hasil1,%cuaca.chan1,44) -- [cuaca]: $lower($gettok(%cuaca.hasil2,%cuaca.chan1,44)) [suhu]: $lower($gettok(%cuaca.hasil3,%cuaca.chan1,44)) [kelembaban]: $lower($gettok(%cuaca.hasil4,%cuaca.chan1,44)) 
        echoinfo beres: $chan $nick $+ ! $+ $ial($nick).user $+ @ $+ $ial($nick).host $1-
      }
    }  
  }
  if ($istok(!info,$1,32)) && ($info.cek(1) == 1) { 
    notice $nick Command yang dapat dipakai: !adzan, !ym, !cuaca, !forecast, !kamus, !english, !translate, !zodiak, !nama, !jodoh, !jam, !musik, !ip 
  }  
}

on $*:text:/^[!](translate|translang|kamus|indonesia|inggris|english)/Si:#: {
  if ($info.chan($chan) == 1) { halt }
  var %info.ask = $chan $nick $+ ! $+ $ial($nick).user $+ @ $+ $ial($nick).host $1-
  echoinfo mulai: %info.ask
  if ($($+(%,info,all,$cid),2) != on) { if ($($+(%,info,$chan,$cid),2) != on) { halt } } 
  if ($info.cek(10) != 1) { halt }
  if ($1 == !translate) { 
    if ($2 == $null) { notice $nick Perintah untuk translate: !translate kode bahasa asal|kode bahasa tujuan [kalimat yg ingin ditranslate] contoh: !translate en|da this is a test , untuk melihat bahasa yang disupport pergunakan perintah: !translang  | halt }
    if ($2 == $info) { notice $nick Perintah untuk translate: !translate kode bahasa asal|kode bahasa tujuan [kalimat yg ingin ditranslate] contoh: !translate en|da this is a test , untuk melihat bahasa yang disupport pergunakan perintah: !translang  | halt }
    %trans.ask = %info.ask | .remotetranslate $chan $nick $2- 
  }
  elseif ($1 == !translang) { 
    notice $nick Languages Supported: 1Autorecognize Language - AUTO 2Arabic - AR 1Bulgarian - BG 2Catalan - CA 1Tradiditonal 2Chinese - zh-TW 1Simplified Chinese - zh-CN 2Danish - DA 1German - DE 2English - EN 1Finnish - FI 2French - FR 1Greek - EL 2Hebrew - IW 1Hindi - HI 2Indonesian - ID 1Italian - IT 2Japanese - JA 1Korean - KO 2Croatian - HR 1Latvian - LV 2Croatian - LT 1Dutch - NL 2Norwegian - NO 1Ukrainian - UK 2Polish - PL 1Portuguese - PT 2Romanian - RO 1Russian - RU 2Serbian - SR 1Slovak - SK 2Slovene - SL 1Spanish - ES 2Tagalog - tl 1Czech - CS 2Vietnamese - VI 1Swedish - SV  
  }
  elseif ($1 == !kamus) || ($1 == !indonesia) { 
    if ($2- == $null) { notice $nick Perintah untuk kamus: !kamus [istilah inggris] contoh: !kamus brain atau !kamus hand (nb: untuk menterjemahkan kata indo ke inggris pergunakan perintah !english  | halt }
    %trans.ask = %info.ask | .remotetranslate $chan $nick EN|ID $2- 
  }
  elseif ($1 == !inggris) || ($1 == !english) { 
    if ($2- == $null) { notice $nick Perintah untuk kamus: !english [istilah indonesia] contoh: !english otak atau !english tangan (nb: untuk menterjemahkan kata inggris ke indo pergunakan perintah !kamus  | halt }
    %trans.ask = %info.ask | .remotetranslate $chan $nick ID|EN $2- 
  }  
}

alias ambilcuaca {
  unset %cuaca.hasil*
  set %cuaca.kota bandaaceh,medan,pekanbaru,batam,padang,jambi,palembang,pangkalpinang,bengkulu,bandarlampung,pontianak,samarinda,palangkaraya,banjarmasin,manado,gorontalo,palu,kendari,makasar,majene,ternate,ambon,jayapura,sorong,biak,manokwari,merauke,kupang,sumbawabesar,mataram,denpasar,jakarta,serang,bandung,semarang,yogyakarta,surabaya
  set %cuaca.mulai 0
  set %cuaca.search 0
  set %cuaca.hitung 0
  set %cuaca.hasil0 0  
  set %cuaca.tanggal
  ;echo -s 13,15Pengambilan Data Cuaca Mulai
  sockopen caweather www.bmg.go.id 80
}
on *:sockopen:caweather: { 
  sockwrite -n $sockname GET /cuaca-indo1.bmg?Jenis=URL&IDS=3356283939755564582 HTTP/1.1 
  sockwrite -n $sockname Host: www.bmg.go.id
  sockwrite -n $sockname Connection: close 
  sockwrite -n $sockname $crlf
}
on *:sockread:caweather: {
  if ($sockerr > 0) return 
  sockread %cawtemp 
  if ($sockbr == 0) return
  if (%cuaca.mulai == 1) {
    if (%cuaca.search == 0) {
      var %cuaca.isijum1 = $numtok(%cuaca.kota,44)
      var %cuaca.isijum2 = 1  
      while (%cuaca.isijum2 <= %cuaca.isijum1) {
        if ($nohtml1(%cawtemp) == $gettok(%cuaca.kota,%cuaca.isijum2,44)) {
          %cuaca.hitung = 0
          %cuaca.search = 1
          %cuaca.hasil1 = %cuaca.hasil1 $+ $iif(%cuaca.hasil0 > 0,$chr(44)) $+ $lower($nohtml1(%cawtemp))
          %cuaca.kota = $deltok(%cuaca.kota,%cuaca.isijum2,44)
          inc %cuaca.hasil0
          goto cuaca.endsearch
        }
        inc %cuaca.isijum2
      }
      :cuaca.endsearch
    }
    elseif (%cuaca.search == 1)  {
      inc %cuaca.hitung
      if (%cuaca.hitung == 1) { %cuaca.hasil2 = %cuaca.hasil2 $+ $iif(%cuaca.hasil0 > 1,$chr(44)) $+ $nohtml(%cawtemp) }
      if (%cuaca.hitung == 2) { %cuaca.hasil3 = %cuaca.hasil3 $+ $iif(%cuaca.hasil0 > 1,$chr(44)) $+ $nohtml(%cawtemp) }
      if (%cuaca.hitung == 3) { %cuaca.hasil4 = %cuaca.hasil4 $+ $iif(%cuaca.hasil0 > 1,$chr(44)) $+ $nohtml(%cawtemp) | %cuaca.search = 0 }
    }
  }
  if (mulai tanggal isin %cawtemp) { var %x = $findtok(%cawtemp,tanggal,1,32) | %cuaca.tanggal = $gettok(%cawtemp,$calc(%x + 1),32) $lower($gettok(%cawtemp,$calc(%x + 2),32)) $gettok(%cawtemp,$calc(%x + 3),32) }
  if (KOTA PROPINSI isin %cawtemp) { set %cuaca.mulai 1 }
}
on *:sockclose:caweather: { unset %cawtemp }

alias getwet {
  unset %wet*
  setupwet
  sockopen getwet www.wunderground.com 80
}

#wetget on
on *:sockopen:getwet: { 
  echoinfo ambil: %wet.ask
  sockwrite -n $sockname GET /cgi-bin/findweather/getForecast?query= $+ %wet.search HTTP/1.1
  ;sockwrite -n $sockname Connection: keep-alive
  ;sockwrite -n $sockname User-Agent: Lynx/2.8.5rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.7e
  sockwrite -n $sockname User-Agent: Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)  
  ;sockwrite -n $sockname Accept: */*
  ;sockwrite -n $sockname Range: bytes=0-  
  sockwrite -n $sockname Host: weather.aol.com
  sockwrite -n $sockname Connection: close
  sockwrite -n $sockname Authorization: Basic   
  sockwrite -n $sockname Connection: close 
  sockwrite -n $sockname $crlf
}
on *:sockread:getwet: {
  if ($sockerr > 0) return 
  sockread %wet.temp 
  if ($sockbr == 0) return
  if (%wet.tandan isin %wet.temp) { 
    %wet.cuacan1 = $remove($nohtml(%wet.temp),$chr(9))
    var %wet.isi, %wet.hit = 1, %wet.total = $calc($findtok(%wet.cuacan1,Forecast,1,32) - 1)
    while (%wet.hit <= %wet.total) {
      %wet.cuacan2 =  %wet.cuacan2 $+ $iif(%wet.hit > 1,$chr(32)) $+ $gettok(%wet.cuacan1,%wet.hit,32)
      inc %wet.hit
    } 
    set %wet.cuacan2 $remove(%wet.cuacan2,Conditions $+ $chr(32) $+ $chr(38) $+ amp $+ $chr(59))
  }
  if (%wet.tanda isin %wet.temp) { %wet.mulai = 1 | %wet.tipe = 1 }  
  if (%wet.tandam isin %wet.temp) { %wet.multi = 1 | %wet.tipe = 2 }    
  if (%wet.multi == 1) {
    if (%wet.tandam2 isin %wet.temp) { %wet.tmp1 = 0 | %wet.multi = 0 }   
    if (%wet.tandam1 isin %wet.temp) { %wet.multiisi = %wet.multiisi $+ $iif(%wet.multiisi != $null,$chr(42)) $+ $remove($nohtml(%wet.temp),$chr(9)) }        
    if (%wet.tandam3 isin %wet.temp) && (%wet.search1 isin %wet.temp) { %wet.multiisi = %wet.multiisi $+ $iif(%wet.multiisi != $null,$chr(42)) $+ $remove($nohtml(%wet.temp),$chr(9)) }
    %wet.multiisi = $removespasi(%wet.multiisi )
  }  
  if (%wet.mulai == 1) {
    if (%wet.tanda6a isin %wet.temp) { %wet.tmp1 = 0 }
    if (%wet.tanda7 isin %wet.temp) { %wet.tmp1 = 7 }     
    if (%wet.tanda8 isin %wet.temp) { %wet.tmp1 = 8 } 
    if (%wet.tanda9 isin %wet.temp) { %wet.tmp1 = 9 }    
    if (%wet.tanda10 isin %wet.temp) { %wet.tmp1 = 10 }  
    if (%wet.tanda10a isin %wet.temp) { %wet.tmp1 = 0 | %wet.mulai = 0 }    
    if (%wet.tandah isin %wet.temp) { %wet.cuacah = $remove($nohtml(%wet.temp),$chr(9)) }
    if (%wet.tanda1 isin %wet.temp) { %wet.cuaca1 = $remove($nohtml(%wet.temp),$chr(9)) }
    if (%wet.tanda3 isin %wet.temp) { %wet.cuaca3 = $remove($nohtml(%wet.temp),$chr(9)) }
    if (%wet.tmp1 == 4) { %wet.cuaca4 = $remove($nohtml(%wet.temp),$chr(9)) | %wet.tmp1 = 0 }
    if (%wet.tmp1 == 2) { %wet.cuaca2 = $remove($nohtml(%wet.temp),$chr(9)) | %wet.tmp1 = 0 }
    if (%wet.tmp1 == 5) { %wet.cuaca5 = %wet.cuaca5 $+ $chr(32) $+ $remove($nohtml(%wet.temp),$chr(9)) }   
    if (%wet.tmp1 == 6) { %wet.cuaca6 = %wet.cuaca6 $+ $chr(32) $+ $remove($nohtml(%wet.temp),$chr(9)) }   
    if (%wet.tmp1 == 7) { %wet.cuaca7 = %wet.cuaca7 $+ $chr(32) $+ $remove($nohtml(%wet.temp),$chr(9),%wet.tanda7) }        
    if (%wet.tmp1 == 8) { %wet.cuaca8 = %wet.cuaca8 $+ $chr(32) $+ $remove($nohtml(%wet.temp),$chr(9),%wet.tanda8) }        
    if (%wet.tmp1 == 9) { %wet.cuaca9 = %wet.cuaca9 $+ $chr(32) $+ $remove($nohtml(%wet.temp),$chr(9),%wet.tanda9) } 
    if (%wet.tmp1 == 10) { %wet.cuaca10 = %wet.cuaca10 $+ $chr(32) $+ $remove($nohtml(%wet.temp),$chr(9),%wet.tanda10) }         
    if (%wet.tanda2 isin %wet.temp) { %wet.tmp1 = 2 }    
    if (%wet.tanda4 isin %wet.temp) { %wet.tmp1 = 4 }    
    if (%wet.tanda5 isin %wet.temp) { %wet.tmp1 = 5 }     
    if (%wet.tanda5a isin %wet.temp) { %wet.tmp1 = 0 }
    if (%wet.tanda6 isin %wet.temp) { %wet.tmp1 = 6 }  
    %wet.cuaca5 = $removespasi(%wet.cuaca5) | %wet.cuaca6 = $removespasi(%wet.cuaca6) | %wet.cuaca7 = $removespasi(%wet.cuaca7)
    %wet.cuaca8 = $removespasi(%wet.cuaca8) | %wet.cuaca9 = $removespasi(%wet.cuaca9) | %wet.cuaca10 = $removespasi(%wet.cuaca10)
    set %wet.cuaca4 $replace(%wet.cuaca4,&deg;,$chr(176))
    set %wet.cuaca2 $replace(%wet.cuaca2,&#176;,$chr(176))
    set %wet.cuaca6 $replace(%wet.cuaca6,Steady,Stabil,Rising,Naik,Falling,Turun)
    set %wet.cuaca5 $remove(%wet.cuaca5,$chr(47) $+ $chr(32))
    set %wet.cuaca5 $replace(%wet.cuaca5,$chr(47) $+ h,$chr(47) $+ jam,$chr(47) $+ s,$chr(47) $+ det,from the,dari,North,Utara,South,Selatan,West,Barat,East,Timur)
    set %wet.cuaca5 $replace(%wet.cuaca5,NNW,Utara BL,WWM,Barat BL,SSW,Selatan BD,WSW,Barat BD)
    set %wet.cuaca5 $replace(%wet.cuaca5,NNE,Utara TL,ENE,Timur TL,SSE,Selatan Tenggara,ESE,Timur Tenggara,Calm,Tenang,SE $+ $chr(32),Tenggara $+ $chr(32),SW,Barat Daya,NE,Timur Laut,NW,Barat Laut)
  }
}
on *:sockclose:getwet: { 
  ;echo -s 13,15Pengambilan Data Cuaca Selesai 
  if (%wet.tipe == 0) { %wet.kirim = Maaf, Tidak Diketemukan Data Kota Tersebut }
  if (%wet.tipe == 1) { 
    ;%wet.cuacah = $remove(%wet.cuacah,on $+ $chr(32))
    set %wet.cuacah $replace(%wet.cuacah,$chr(32) $+ WIT,$chr(32) $+ WIB,$chr(32) $+ EIT,$chr(32) $+ WIT,$chr(32) $+ CIT,$chr(32) $+ WITA)
    set %wet.cuacah $replace(%wet.cuacah,on,$chr(45),January,Januari,February,Februari,March,Maret,April,April,May,Mei,June,Juni,July,Juli,August,Agustus,October,Oktober,December,Desember)
    var %wet.baris, %wet.isi, %wet.hit = 1, %wet.total = $lines(scripts\transwet.txt)
    while (%wet.hit <= %wet.total) {
      %wet.baris = $read -l %wet.hit scripts\transwet.txt    
      %wet.eng = $gettok(%wet.baris,1,42)
      if $lower(%wet.eng) == $lower(%wet.cuaca1) { %wet.cuaca1 = $gettok(%wet.baris,2,42) | goto endwet }
      if ($numtok(%wet.eng,32) == 1) && (%wet.eng isin %wet.cuaca1) { %wet.cuaca1 = $gettok(%wet.baris,2,42) | goto endwet }
      inc %wet.hit
    }
    :endwet
    %wet.search = $replace(%wet.search,$chr(37) $+ 2C $+ $chr(43),$chr(44) $+ $chr(32))
    %wet.search = $replace(%wet.search,$chr(43),$chr(32)) 
    %wet.kirim = Cuaca  $+ %wet.cuacan2 $+  %wet.cuacah :: %wet.cuaca1 suhu: %wet.cuaca2 Kelembaban: %wet.cuaca3 Angin: %wet.cuaca5 Tekanan: %wet.cuaca6
  }
  if (%wet.tipe == 2) { 
    %wet.kirim = Pilih kota yang lebih spesifik : 
    var %wet.isi, %wet.hit = 1, %wet.total = $numtok(%wet.multiisi,42)
    while (%wet.hit <= %wet.total) {
      %wet.kirim =  %wet.kirim $+ $chr(32) $+ $+  $+ $gettok(%wet.multiisi,%wet.hit,42) $+  $+ $chr(32) $+ $iif(%wet.hit < %wet.total,atau)
      inc %wet.hit
    }  
  }
  if (%wet.chan != $null) msg %wet.chan %wet.kirim 
  echoinfo beres: %wet.ask
  unset %wet.*
  .disable #wetget
}
#wetget end
alias removespasi { var %tmp.isi = $1-,%tmp.spasi = $1- | if $left(%tmp.isi,1) == $chr(32) { %tmp.spasi = $right(%tmp.isi,$calc($len(%tmp.isi) - 1)) } | return %tmp.spasi }
alias setupwet {
  %wet.tipe = 0
  set %wet.tanda id $+ $chr(61) $+ $chr(34) $+ curcondbox
  set %wet.tandah Updated $+ $chr(58) $+ $chr(32) $+ $chr(60)
  set %wet.tanda1 14px $+ $chr(59) $+ $chr(34) $+ $chr(62)
  set %wet.tanda2 tempf
  set %wet.tanda3 humidity $+ $chr(34)
  set %wet.tanda4 dewptf
  set %wet.tanda5 windspeedmph
  set %wet.tanda5a condboxWindDiv  
  set %wet.tanda6 baromin
  set %wet.tanda6a Heat Index $+ $chr(58)
  set %wet.tanda7 Visibility $+ $chr(58)
  set %wet.tanda8 UV $+ $chr(58)
  set %wet.tanda9 Clouds $+ $chr(58)
  set %wet.tanda10 Elevation $+ $chr(58)
  set %wet.tanda10a Rapid Fire Updates
  set %wet.tandam Search Results
  set %wet.tandam1 $chr(47) $+ global $+ $chr(47) $+ stations $+ $chr(47)
  set %wet.tandam2 Edit My Favorite Cities List
  set %wet.tandam3 $chr(34) $+ $chr(47) $+ US $+ $chr(47)
  set %wet.tandan Forecast $chr(58) Weather Underground
}

alias horoscope {
  var %x = $1, %y = $iif($prop = num,1), %c = $iif($isid,return,echo -at)
  if (03.21 <= %x) && (04.19 >= %x) %c $iif(%y,1,Aries)
  if (04.20 <= %x) && (05.20 >= %x) %c $iif(%y,2,Taurus)
  if (05.21 <= %x) && (06.21 >= %x) %c $iif(%y,3,Gemini)
  if (06.22 <= %x) && (07.22 >= %x) %c $iif(%y,4,Cancer)
  if (07.23 <= %x) && (08.22 >= %x) %c $iif(%y,5,Leo)
  if (08.23 <= %x) && (09.22 >= %x) %c $iif(%y,6,Virgo)
  if (09.23 <= %x) && (10.23 >= %x) %c $iif(%y,7,Libra)
  if (10.24 <= %x) && (11.21 >= %x) %c $iif(%y,8,Scorpio)
  if (11.22 <= %x) && (12.21 >= %x) %c $iif(%y,9,Sagittarius)
  if (12.22 <= %x) && (01.19 >= %x) %c $iif(%y,10,Capricorn)
  if (01.20 <= %x) && (02.18 >= %x) %c $iif(%y,11,Aquarius)
  if (02.19 <= %x) && (03.20 >= %x) %c $iif(%y,12,Pisces)
}


alias cutline {
  ;sample:: $cutline(100,$chr(43),%txt)
  if $isid {
    var %wet.cari, %wet.total = $len($3-)
    var %wet.isi = $3-    
    var %wet.hit = 1
    while (%wet.hit <= %wet.total) {
      %wet.cari = 0
      %wet.hit = $calc(%wet.hit + $1)
      if (%wet.hit <= %wet.total) {
        if $mid(%wet.isi,%wet.hit,1) == $chr(32) { 
          %wet.isi = $replace(%wet.isi,$left(%wet.isi,$calc(%wet.hit - 1)) $+ $chr(32),$left(%wet.isi,$calc(%wet.hit - 1)) $+ $2) 
        }
        else {
          while (%wet.cari != 1) {
            var %wet.cek = $mid(%wet.isi,$calc(%wet.hit - 1),1)
            if (%wet.cek == $chr(32)) {
              %wet.isi = $replace(%wet.isi,$left(%wet.isi,$calc(%wet.hit - 2)) $+ $chr(32),$left(%wet.isi,$calc(%wet.hit - 2)) $+ $2) 
              %wet.cari = 1
            }
            if (%wet.hit >= %wet.total) { %wet.cari = 1 }               
            inc %wet.hit
          } 
        }
      }
      inc %wet.hit
    }    
    return %wet.isi
  }
}

alias cekym {
  %ym.id = $1
  %ym.status = Tidak Terdeteksi
  sockopen getym yahootracer.com 80
}
#ymget on
on *:sockopen:getym: { 
  echoinfo ambil: %ym.ask
  sockwrite -n $sockname GET /backup/check.php?nick= $+ %ym.id HTTP/1.1
  sockwrite -n $sockname User-Agent: Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)
  sockwrite -n $sockname Host: yahootracer.com
  sockwrite -n $sockname Connection: close
  sockwrite -n $sockname Authorization: Basic   
  sockwrite -n $sockname Connection: close 
  sockwrite -n $sockname $crlf
}

on *:sockread:getym: {
  if ($sockerr > 0) return 
  sockread %ym.temp 
  if ($sockbr == 0) return
  if (Invisible isin %ym.temp) { %ym.status = Invisible }
  if (Online isin %ym.temp) { %ym.status = Online }
  if (Offline isin %ym.temp) { %ym.status = Offline }    
}
on *:sockclose:getym: { 
  msg %ym.chan YM Status untuk  $+ %ym.id $+ :  $+ %ym.status $+  
  echoinfo beres: %ym.ask
  unset %ym*  
  .disable #ymget
}
#ymget end

alias cekzodiak {
  %zodiak.nama = $1 
  %zodiak.status = Error  
  %zodiak.ambil = 0
  var %zodiak.all1 Aquarius*Pisces*Aries*Taurus*Gemini*Cancer*Leo*Virgo*Libra*Scorpio*Sagitarius*Capricorn
  var %zodiak.all2 20 Jan - 18 Feb*19 Feb - 20 Mar*21 Mar - 20 Apr*21 Apr - 20 Mei*21 Mei - 20 Jun*21 Jun - 20 Jul*21 Jul - 21 Agt*22 Agt - 22 Sep*23 Sep - 22 Okt*23 Okt 22 - Nov*23 Nov - 20 Des*21 Des - 19 Jan
  %zodiak.id = $findtok(%zodiak.all1,%zodiak.nama,1,42)
  %zodiak.nama = $gettok(%zodiak.all1,%zodiak.id,42)
  %zodiak.tanggal = $gettok(%zodiak.all2,%zodiak.id,42)
  if %zodiak.id != $null { sockopen getzodiak www.femina-online.com 80 } | else { msg %zodiak.chan Zodiak tersebut tidak ditemukan, cobalah zodiak lainnya!!  | unset %zodiak* | .disable #zodiakget }
}
#zodiakget off
on *:sockopen:getzodiak: { 
  echoinfo ambil: %zodiak.ask
  sockwrite -n $sockname GET /ramalan/zodiak.asp?id= $+ %zodiak.id HTTP/1.1
  sockwrite -n $sockname User-Agent: Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)
  sockwrite -n $sockname Host: www.femina-online.com
  sockwrite -n $sockname Connection: close
  sockwrite -n $sockname Authorization: Basic   
  sockwrite -n $sockname Connection: close 
  sockwrite -n $sockname $crlf
}

on *:sockread:getzodiak: {
  if ($sockerr > 0) return 
  sockread %zodiak.temp 
  if ($sockbr == 0) return
  if (table $+ $chr(62) isin %zodiak.temp) && (%zodiak.ambil == 1) { %zodiak.ambil = 0 }
  if (%zodiak.ambil == 1) { 
    %zodiak.isi = %zodiak.isi $+ $chr(32) $+ $remove($nohtml(%zodiak.temp),$chr(9))
    %zodiak.isi = $removespasi(%zodiak.isi)
  }    
  if (%zodiak.tanggal isin %zodiak.temp) { %zodiak.ambil = 1 }  
}
on *:sockclose:getzodiak: { 
  ;msg %ym.chan YM Status untuk  $+ %ym.id $+ :  $+ %ym.status $+  
  %zodiak.isi = $chr(91) $+  $+ %zodiak.nama : %zodiak.tanggal $+  $+ $chr(93) %zodiak.isi 
  %zodiak.isi = $cutline(200,$chr(160),%zodiak.isi)
  var %zodiak.time, %zodiak.baris, %zodiak.hit = 1, %zodiak.total = $numtok(%zodiak.isi,160)
  while (%zodiak.hit <= %zodiak.total) {
    %zodiak.time = $calc(%zodiak.hit * 2)
    .timerzodiak $+ %zodiak.hit 1 %zodiak.time msg %zodiak.chan $gettok(%zodiak.isi,%zodiak.hit,160)
    inc %zodiak.hit
  }   
  echoinfo beres: %zodiak.ask
  unset %zodiak*
  .disable #zodiakget
}
#zodiakget end

alias remotetranslate { 
  var %I = $ticks 
  set $+(%,trans.chan.,%I) $1 
  set $+(%,trans.nick.,%I) $2
  set $+(%,trans.lang.,%I) $3 
  set $+(%,trans.phrase.,%I) $remove($4-,$chr(42))
  sockopen $+(remotetrans.,%I) www.google.com 80  
} 
on *:SOCKOPEN:remotetrans.*: { 
  echoinfo ambil: %trans.ask
  sockwrite -n $sockname GET $+(/translate_t?langpair=,$($+(%,trans.lang.,$gettok($sockname,2,46)),2),&text=,$urlencode($($+(%,trans.phrase.,$gettok($sockname,2,46)),2))) HTTP/1.1 
  sockwrite -n $sockname Host: www.google.com 
  sockwrite -n $sockname User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9b4) Gecko/2008030714 Firefox/3.0b4 $+ $crlf $+ $crlf 
} 
on *:SOCKREAD:remotetrans.*: {
  var %I = $gettok($sockname,2,46)
  var %r 
  sockread %r
  if ($regex(%r,<div id=result_box dir="ltr">)) {
    .msg $($+(%,trans.chan.,%I),2) 4Translation from $($+(%,trans.nick.,%I),2) :2 $replace($regsubex(%r,/[^*]*<div id=result_box dir="ltr">|</div>[^*]*/g,$null),&#39;,') 
    .echo $($+(%,trans.chan.,%I),2) 4Translation from $($+(%,trans.nick.,%I),2) :2 $replace($regsubex(%r,/[^*]*<div id=result_box dir="ltr">|</div>[^*]*/g,$null),&#39;,') 
    unset %trans.*. [ $+ [ $gettok($sockname,2,46) ] ] | sockclose $sockname
  }
  elseif ($regex(%r,<div id=result_box dir="rtl">)) {
    .msg $($+(%,trans.chan.,%I),2) 4Translation from $($+(%,trans.nick.,%I),2) :2 $replace($regsubex(%r,/[^*]*<div id=result_box dir="rtl">|</div>[^*]*/g,$null),&#39;,') 
    .echo $($+(%,trans.chan.,%I),2) 4Translation from $($+(%,trans.nick.,%I),2) :2 $replace($regsubex(%r,/[^*]*<div id=result_box dir="rtl">|</div>[^*]*/g,$null),&#39;,') 
    unset %trans.*. [ $+ [ $gettok($sockname,2,46) ] ] | sockclose $sockname
  }
}
on *:SOCKCLOSE:remotetrans.*: {
  echoinfo beres: %trans.ask
  unset %trans.*
}
alias langfull { 
  if ($1 == Auto) { return Auto }
  elseif ($1 == ar) { return Arabic }
  elseif ($1 == bg) { return Bulgarian }
  elseif ($1 == ca) { return Catalan }
  elseif ($1 == zh-TW) { return Tradiditonal Chinese }
  elseif ($1 == zh-CN) { return Simplified Chinese }
  elseif ($1 == da) { return Danish }
  elseif ($1 == de) { return German }
  elseif ($1 == en) { return English }
  elseif ($1 == fi) { return Finnish }
  elseif ($1 == fr) { return French }
  elseif ($1 == el) { return Greek }
  elseif ($1 == iw) { return Hebrew }
  elseif ($1 == hi) { return Hindi }
  elseif ($1 == id) { return Indonesian }
  elseif ($1 == it) { return Italian }
  elseif ($1 == ja) { return Japanese }
  elseif ($1 == ko) { return Korean }
  elseif ($1 == hr) { return Croatian }
  elseif ($1 == lv) { return Latvian }
  elseif ($1 == lt) { return Croatian }
  elseif ($1 == nl) { return Dutch }
  elseif ($1 == no) { return Norwegian }
  elseif ($1 == uk) { return Ukrainian }
  elseif ($1 == pl) { return Polish }
  elseif ($1 == pt) { return Portuguese }
  elseif ($1 == ro) { return Romanian }
  elseif ($1 == ru) { return Russian }
  elseif ($1 == sr) { return Serbian }
  elseif ($1 == sk) { return Slovak }
  elseif ($1 == sl) { return Slovene }
  elseif ($1 == es) { return Spanish }
  elseif ($1 == tl) { return Tagalog }
  elseif ($1 == cs) { return Czech }
  elseif ($1 == vi) { return Vietnamese }
  elseif ($1 == sv) { return Swedish }
} 
alias b { return $+($chr(2),$1-,$chr(2)) } 
alias br { return $+($chr(40),$1-,$chr(41)) } 
alias urlencode { return $regsubex($1,/(\W)/gS,% $+ $base($asc(\1),10,16,2))) } 
alias antientities { return $regsubex($1,/&(.+?);/g,$entity2chr(\1)) } 
alias entity2chr { 
  if #* iswm $1 return $chr($mid($1,2)) 
  elseif $1 == nbps return $chr(32) 
  elseif $1 == quot return " 
  elseif $1 == apos return ' 
  elseif $1 == amp return & 
  elseif $1 == lt return < 
  elseif $1 == gt return > 
  elseif $1 == copy return © 
  elseif $1 == reg return ® 
  else return $1 
} 

;------------
alias cekadzan {
  %adzan.nama = $1-
  %adzan.status = Error  
  %adzan.ambil = 0
  %adzan.cek1 = 0
  var %adzan.baris, %adzan.hit = 1, %adzan.total = $lines(scripts\adzankota.txt)
  while (%adzan.hit <= %adzan.total) {
    %adzan.kota1 = $read -l %adzan.hit scripts\adzankota.txt
    if (%adzan.kota1 == %adzan.nama) { %adzan.id = %adzan.hit | %adzan.hit = %adzan.total  }
    inc %adzan.hit
  }   
  if (%adzan.id != $null) { sockopen getadzan www.inilah.com 80 } | else { msg %adzan.chan Kota tersebut tidak ditemukan, cobalah kota lainnya!!  | unset %adzan* | .disable #adzanget }
}
#adzanget on
on *:sockopen:getadzan: { 
  echoinfo ambil: %adzan.ask
  sockwrite -n $sockname GET /adzan3/?id= $+ %adzan.id HTTP/1.1
  sockwrite -n $sockname User-Agent: Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)
  sockwrite -n $sockname Host: www.inilah.com
  sockwrite -n $sockname Connection: close
  sockwrite -n $sockname Authorization: Basic   
  sockwrite -n $sockname Connection: close 
  sockwrite -n $sockname $crlf
}

on *:sockread:getadzan: {
  if ($sockerr > 0) return 
  sockread %adzan.temp 
  if ($sockbr == 0) return
  ;if (option value isin %adzan.temp) { %zodiak.isi = $remove($nohtml(%adzan.temp),$chr(9)) | %zodiak.isi = $removespasi(%zodiak.isi) | write scripts\adzankota.txt %zodiak.isi }
  if (%adzan.cek1 == 1) && (%adzan.kota1 isin %adzan.temp) { %adzan.cek1 = 0 }
  if (%adzan.cek1 == 1) { 
    %adzan.bulan = %adzan.bulan $+ $chr(32) $+ $remove($nohtml(%adzan.temp),$chr(9))
    %adzan.bulan = $removespasi(%adzan.bulan)
  }   
  if ($chr(58) $+ $chr(32) $+ JADWAL SHALAT isin %adzan.temp) { %adzan.cek1 = 1 }  
  if (table_title isin %adzan.temp) { %adzan.cek1 = 1 }
  if (table_highlight isin %adzan.temp) { 
    ;%adzan.isi $+ $chr(32) $+ 
    %adzan.isi = $remove($nohtml(%adzan.temp),$chr(9))
    %adzan.isi = $removespasi(%adzan.isi)
    var %adzan.baris, %adzan.hit = 1, %adzan.total = $numtok(%adzan.isi,58)
    while (%adzan.hit <= %adzan.total) {
      %adzan.isi2 = $gettok(%adzan.isi,%adzan.hit,58)
      if ($len(%adzan.isi2) == 4) { %adzan.isi2 = $left(%adzan.isi2,2) $+ $chr(42) $+ $right(%adzan.isi2,2) }
      %adzan.isi1 = %adzan.isi1 $+ $iif(%adzan.hit > 1,$chr(58)) $+ %adzan.isi2
      inc %adzan.hit
    }   

    %adzan.isi2 = $gettok(%adzan.isi1,2,42)
    %adzan.subuhjam = $gettok(%adzan.isi2,1,58)
    %adzan.subuhmenit = $calc($gettok(%adzan.isi2,2,58) + 10)
    %adzan.subuhdetik = $gettok(%adzan.isi2,3,58)
    if %adzan.subuhmenit > 60 {
      %adzan.subuhjam = $calc($gettok(%adzan.isi2,1,58) + 1)
      %adzan.subuhmenit = $calc(%adzan.subuhmenit - 60)
      if ($len(%adzan.subuhjam) == 1) { %adzan.subuhjam = $chr(48) $+ %adzan.subuhjam }    
      if ($len(%adzan.subuhmenit) == 1) { %adzan.subuhmenit = $chr(48) $+ %adzan.subuhmenit }
    }
    %adzan.isi1 = %adzan.isi1 $+ $chr(42) $+ %adzan.subuhjam $+ $chr(58) $+ %adzan.subuhmenit $+ $chr(58) $+ %adzan.subuhdetik


  }  
}
on *:sockclose:getadzan: { 
  set %adzan.bulan $replace(%adzan.bulan,January,Januari,February,Februari,March,Maret,April,April,May,Mei,June,Juni,July,Juli,August,Agustus,October,Oktober,December,Desember)
  msg %adzan.chan Jadwal Shalat  $+ %adzan.kota1 $+  $gettok(%adzan.isi1,1,42) %adzan.bulan :: [Subuh= $+ $gettok(%adzan.isi1,9,42) $+ $chr(93) [Dzuhur= $+ $gettok(%adzan.isi1,5,42) $+ $chr(93) [Ashar= $+ $gettok(%adzan.isi1,6,42) $+ $chr(93) [Maghrib= $+ $gettok(%adzan.isi1,7,42) $+ $chr(93) [Isya= $+ $gettok(%adzan.isi1,8,42) $+ $chr(93) 
  echoinfo beres: %adzan.ask
  unset %adzan*
  .disable #adzanget 

}
#adzanget end

alias cekjam {
  if ($version < 6.3) { .disable #jamget | halt }
  %jam.status = Error  
  sockopen getjam time-nw.nist.gov 37
  ;sockopen getjam ntps1-0.uni-erlangen.de 37
}
#jamget off
on *:sockopen:getjam: { 
  echoinfo ambil: %jam.ask
  if ($sockerr) { echo Error NTP Cannot connect!!! | .disable #jamget | unset %jam* | return }
}
on *:sockread:getjam: {
  if ($sockerr > 0) return 
  sockread -fn %jam.temp 
  ;if ($sockbr == 0) return
}
on *:sockclose:getjam: { 
  if (%jam.temp == $null) { unset %jam* | .disable #jamget | return }
  %jam.temp1 = $calc($asc($mid(%jam.temp,1,1)) * (256 ^ 3))
  %jam.temp2 = $calc($asc($mid(%jam.temp,2,1)) * (256 ^ 2))
  %jam.temp3 = $calc($asc($mid(%jam.temp,3,1)) * (256 ^ 1))
  %jam.temp4 = $asc($mid(%jam.temp,4,1))
  %jam.temp5 = $calc(%jam.temp1 + %jam.temp2 + %jam.temp3 + %jam.temp4 - 2840140800)
  %jam.temp6 = $calc(%jam.temp1 + %jam.temp2 + %jam.temp3 + %jam.temp4 )
  %jam.skrg1 = $asctime(%jam.temp5,dd mmmm)  
  %jam.skrg2 = $calc($asctime(%jam.temp5,yyyy) + 20)
  %jam.skrg3 = $asctime(%jam.temp5,HH:nn:ss)
  %jam.skrg4b = %jam.skrg1 $+ $chr(32) $+ %jam.skrg2
  %jam.skrg4 = $asctime($ctime(%jam.skrg4b),ddd)
  set %jam.skrg0 $replace(%jam.skrg4,Mon,Senin,Tue,Selasa,Wed,Rabu,Thu,Kamis,Fri,Jumat,Sat,Sabtu,Sun,Minggu)
  set %jam.skrg1 $replace(%jam.skrg1,January,Januari,February,Februari,March,Maret,April,April,May,Mei,June,Juni,July,Juli,August,Agustus,October,Oktober,December,Desember)
  msg %jam.chan Waktu Sekarang:  $+ %jam.skrg0 $+ , %jam.skrg1 %jam.skrg2 %jam.skrg3 $+ 
  echoinfo beres: %jam.ask
  unset %jam*  
  .disable #jamget 
}
#jamget end

;------------
alias cekardan {
  %ardan.data1 = indie*indo*indo1*top*barat
  %ardan.data3 = Ardan Indie 7*Ardan Persada 7*Ardan Persada 7 Lagi*Ardan Top Request*Ardan Flight 40
  %ardan.data2 = title-indie*title-persada*title-persadalagi*title-toprequest*title-flight*$chr(47) $+ table*
  %ardan.nama = $1-
  %ardan.status = Error  
  %ardan.ambil = 0
  %ardan.cek1 = 0
  %ardan.cek2 = 0
  var %ardan.baris, %ardan.hit = 1, %ardan.total = $numtok(%ardan.data1,42)
  while (%ardan.hit <= %ardan.total) {
    %ardan.ambil = $gettok(%ardan.data1,%ardan.hit,42)
    if (%ardan.ambil == %ardan.nama) { %ardan.id = %ardan.hit | %ardan.head = $gettok(%ardan.data3,%ardan.hit,42) | %ardan.atas = $gettok(%ardan.data2,%ardan.hit,42) | %ardan.bawah = $gettok(%ardan.data2,$calc(%ardan.hit + 1),42) | %ardan.hit = %ardan.total  }
    inc %ardan.hit
  }   
  if (%ardan.id != $null) { sockopen getardan www.ardanradio.com 80 | .enable #ardanget } | else { msg %ardan.chan syntax: !musik (indie , indo , indo1 , top , barat)  | unset %ardan* | .disable #ardanget }
}
#ardanget on
on *:sockopen:getardan: { 
  echoinfo ambil: %ardan.ask
  sockwrite -n $sockname GET /chart-scroller.html HTTP/1.1
  sockwrite -n $sockname User-Agent: Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)
  sockwrite -n $sockname Host: www.ardanradio.com
  sockwrite -n $sockname Connection: close
  sockwrite -n $sockname Authorization: Basic   
  sockwrite -n $sockname Connection: close 
  sockwrite -n $sockname $crlf
}

on *:sockread:getardan: {
  if ($sockerr > 0) return 
  sockread %ardan.temp 
  if ($sockbr == 0) return
  if (%ardan.atas isin %ardan.temp) { %ardan.cek1 = 1 }
  if (%ardan.bawah isin %ardan.temp) { %ardan.cek1 = 0 }  
  if ($+($chr(47),table) isin %ardan.temp) { %ardan.cek1 = 0 }
  if (%ardan.cek1 == 1) { 
    if ($version < 6.3) && ($len(%ardan.isi) > 700) { %ardan.cek1 = 0 }
    %ardan.isi = %ardan.isi $+ $chr(32) $+ $remove($nohtml(%ardan.temp),$chr(9))
    if (MYTABLE isin %ardan.temp) {
      if ($+($chr(60),$chr(47),td) isin %ardan.temp) { %ardan.isi = %ardan.isi $+ $chr(32) $+ $chr(160) $+ $chr(32) }
      else { %ardan.cek2 = 1 }
    }
    if (%ardan.cek2 == 1) && ($+($chr(60),$chr(47),td) isin %ardan.temp) { %ardan.isi = %ardan.isi $+ $chr(32) $+ $chr(160) $+ $chr(32) | %ardan.cek2 = 0 }
    %ardan.isi = $removespasi(%ardan.isi)
  }   
}
on *:sockclose:getardan: { 
  %ardan.isi = $replace(%ardan.isi,&amp;,&)
  var %ardan.ambil4, %ardan.baris, %ardan.hit = 1, %ardan.total = $numtok(%ardan.isi,160)
  while (%ardan.hit <= %ardan.total) {
    %ardan.ambil4 = $removespasi($gettok(%ardan.isi,%ardan.hit,160))
    %ardan.ambil = 0,1 $+ $chr(183) $+ %ardan.ambil4
    %ardan.isi = $removespasi(%ardan.isi)

    var %a.baris, %a.hit = 1, %a.total = $len(%ardan.ambil)
    while (%a.hit <= %a.total) {
      if ($mid(%ardan.ambil,%a.hit,1) == $chr(46)) {
        %ardan.ambil2 = $left(%ardan.ambil,$calc(%a.hit - 1)) $+ $chr(183) $+  $+ $right(%ardan.ambil,$calc(%a.total - %a.hit))
        %a.hit = %a.total
      }
      inc %a.hit
    }
    %ardan.ambil1 = %ardan.ambil1 $+ $chr(32) $+ %ardan.ambil2
    inc %ardan.hit
  }   
  ;echo -a %ardan.head :: %ardan.ambil1
  %ardan.ambil1 = %ardan.head :: %ardan.ambil1 
  %ardan.isi = $cutline(250,$chr(160),%ardan.ambil1)
  var %ardan.time, %ardan.baris, %ardan.hit = 1, %ardan.total = $numtok(%ardan.isi,160)
  while (%ardan.hit <= %ardan.total) {
    %ardan.time = $calc(%ardan.hit * 2)
    .timerardan $+ %ardan.hit 1 %ardan.time msg %ardan.chan $gettok(%ardan.isi,%ardan.hit,160)
    inc %ardan.hit
  }   
  echoinfo beres: %ardan.ask
  unset %ardan*
  .disable #ardanget 
}
#ardanget end

;----

alias cekiplookup {
  %iplookup.nama = $1
  %iplookup.desc1 = 0  
  if ($1 != $null) { .enable #iplookupget | sockopen getiplookup wq.apnic.net 80  } | else { msg %iplookup.chan syntax: !ip ip_address example: !ip 202.93.37.98  | unset %iplookup* | .disable #iplookupget }
}
#iplookupget on
on *:sockopen:getiplookup: { 
  var %uAgent = Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)
  var %remPage = /apnic-bin/whois.pl
  var %remURL = wq.apnic.net
  var %fData = searchtext= $+ %iplookup.nama $+ &form_type=advanced&full_query_string
  var %conStr = POST %remPage HTTP/1.1 $+ $crlf $+ Accept: */* $+ $crlf
  %conStr = %conStr $+ Host: %remURL $+ $crlf
  %conStr = %conStr $+ Content-type: application/x-www-form-urlencoded $+ $crlf
  %conStr = %conStr $+ Content-length: $len(%fData) $+ $crlf
  %conStr = %conStr $+ User-Agent: %uAgent $+ $crlf
  %conStr = %conStr $+ Connection: Close $+ $crlf $+ $crlf
  ;  if ($sockErr > 0) { notice $nick error in sock open | return }
  sockWrite $sockname %conStr
  sockWrite $sockname %fData
}

on *:sockread:getiplookup: {
  if ($sockerr > 0) return 
  sockread %iplookup.temp 
  ;echo %iplookup.temp
  if ($sockbr == 0) return
  if (netname: isin %iplookup.temp) { %iplookup.netname = $remove($nohtml(%iplookup.temp),$chr(9)) | tokenize 32 %iplookup.netname | %iplookup.netname = $2- }
  if (country: isin %iplookup.temp) { %iplookup.country = $remove($nohtml(%iplookup.temp),$chr(9)) | tokenize 32 %iplookup.country | %iplookup.country = $2- }
  if (inetnum</u> isin %iplookup.temp) { %iplookup.inetnum = $remove($nohtml(%iplookup.temp),$chr(9)) | tokenize 32 %iplookup.inetnum | %iplookup.inetnum = $2- }
  if (descr: isin %iplookup.temp) && (%iplookup.desc1 == 0) { %iplookup.desc = $remove($nohtml(%iplookup.temp),$chr(9)) | tokenize 32 %iplookup.desc | %iplookup.desc = $2- | %iplookup.desc1 = 1 }      
}

on *:sockclose:getiplookup: { 
  ;
  if %iplookup.netname != $null {
    msg %iplookup.chan IP %iplookup.nama NetName: %iplookup.netname Organization: %iplookup.desc Country: %iplookup.country 
  }
  echoinfo beres: %iplookup.ask
  unset %iplookup*  
  .disable #iplookupget
}
#iplookupget end



alias cekartinama {
  %artinama.nama = $1-
  if ($1 != $null) { sockopen getartinama indospiritual.com 80 | .enable #artinamaget } | else { msg %artinama.chan syntax: !nama nama_orang  | %artinama* | .disable #artinamaget }
}
#artinamaget off
on *:sockopen:getartinama: { 
  var %uAgent = Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)
  var %remPage = /index.php?p=19
  var %remURL = indospiritual.com
  var %fData = nama= $+ %artinama.nama $+ &Submit=Deteksi&cek=1
  var %conStr = POST %remPage HTTP/1.1 $+ $crlf $+ Accept: */* $+ $crlf
  %conStr = %conStr $+ Host: %remURL $+ $crlf
  %conStr = %conStr $+ Referer: http://indospiritual.com/index.php?p=19 $+ $crlf
  %conStr = %conStr $+ Content-type: application/x-www-form-urlencoded $+ $crlf
  %conStr = %conStr $+ Content-length: $len(%fData) $+ $crlf
  %conStr = %conStr $+ User-Agent: %uAgent $+ $crlf
  %conStr = %conStr $+ Connection: Close $+ $crlf
  %conStr = %conStr $+ Cache-Control: no-cache $+ $crlf $+ $crlf
  %conStr = %conStr $+ %fData  
  if ($sockErr > 0) { notice $nick error in sock open | %artinama* | .disable #artinamaget | return }
  sockWrite $sockname %conStr
}

on *:sockread:getartinama: {
  if ($sockerr > 0) return 
  sockread %artinama.temp 
  ;echo -a d %artinama.temp
  if ($sockbr == 0) return
  if (font color $+ $chr(61) $+ red isin %artinama.temp) { 
    %artinama.isi = %artinama.isi $+ $chr(32) $+ $remove($nohtml(%artinama.temp),$chr(9))
    %artinama.isi = $removespasi(%artinama.isi)
    %artinama.isi = $replace(%artinama.isi,$chr(45) $+ $chr(32),$chr(44) $+ $chr(32))    
    %artinama.isi = $remove(%artinama.isi,%artinama.nama,$chr(32) $+ $chr(44))    
  }   
}
on *:sockclose:getartinama: { 
  if %artinama.isi != $null {
    %artinama.isi =  Nama $upper(%artinama.nama) $+  %artinama.isi 
    %artinama.isi = $cutline(250,$chr(160),%artinama.isi)
    var %artinama.time, %artinama.baris, %artinama.hit = 1, %artinama.total = $numtok(%artinama.isi,160)
    while (%artinama.hit <= %artinama.total) {
      %artinama.time = $calc(%artinama.hit * 2)
      .timerartinama $+ %artinama.hit 1 %artinama.time msg %artinama.chan $gettok(%artinama.isi,%artinama.hit,160)
      inc %artinama.hit
    } 
  }
  echoinfo beres: %artinama.ask
  unset %artinama*  
  .disable #artinamaget
}
#artinamaget end


alias cekjodoh {
  var %love.jodoh
  if ($1 != $null) && ($2 != $null) {
    var %love.amount = 0
    var %love.count = $calc($cekjodoh1($1) + $cekjodoh1($2))
    var %love.len1 = $Len($1)
    var %love.len2 = $Len($2)
    var %love.len = $calc(%love.len1 + %love.len2)
    if (%love.count > 0) %love.amount = $calc(5 - (%love.len / 2))
    if (%love.count > 2) %love.amount = $calc(10 - (%love.len / 2))
    if (%love.count > 4) %love.amount = $calc(20 - (%love.len / 2))
    if (%love.count > 6) %love.amount = $calc(30 - (%love.len / 2))
    if (%love.count > 8) %love.amount = $calc(40 - (%love.len / 2))
    if (%love.count > 10) %love.amount = $calc(50 - (%love.len / 2))
    if (%love.count > 12) %love.amount = $calc(60 - (%love.len / 2))
    if (%love.count > 14) %love.amount = $calc(70 - (%love.len / 2))
    if (%love.count > 16) %love.amount = $calc(80 - (%love.len / 2))
    if (%love.count > 18) %love.amount = $calc(90 - (%love.len / 2))
    if (%love.count > 20) %love.amount = $calc(100 - (%love.len / 2))
    if (%love.count > 22) %love.amount = $calc(110 - (%love.len / 2))
    if (%love.amount < 0) { %love.amount = 0 }
    if (%love.amount > 100) { %love.amount = 100 }
    if %love.amount < 10 { %love.jodoh = Hasil yg mengecewakan }
    elseif %love.amount < 20 { %love.jodoh = Sepertinya Tidak Jodoh }
    elseif %love.amount < 30 { %love.jodoh = Coba cari yg lain }
    elseif %love.amount < 40 { %love.jodoh = Boleh percaya.. boleh tidak.. tapi kemungkinan anda berdua belum jodoh }
    elseif %love.amount < 50 { %love.jodoh = Perlu usaha lebih giat lagi }
    elseif %love.amount < 60 { %love.jodoh = Bisa Jadi Jodoh }
    elseif %love.amount < 70 { %love.jodoh = awal yang bagus.. mendekati jodoh.. }
    elseif %love.amount < 80 { %love.jodoh = mendekati jodoh.. lebih mesra lagi }
    elseif %love.amount < 90 { %love.jodoh = Jodoh semakin Stabil, Lakukan Pendekatan }
    else { %love.jodoh = Lanjutkan Kepelaminan (Jangan Lupa Undang-undang yah..) }
    return %love.amount $+ $chr(37) $chr(40) $+ %love.jodoh $+ $chr(41)
  }
}
alias cekjodoh1 {
  var %b.love = 0, %b.hit = 1, %b.jumlah = $len($1)
  while %b.hit <= %b.jumlah {
    %b.isi = $mid($1,%b.hit,1)
    if (%b.isi == L) %b.love = %b.love + 2
    if (%b.isi == O) %b.love = %b.love + 2
    if (%b.isi == V) %b.love = %b.love + 2
    if (%b.isi == E) %b.love = %b.love + 2
    if (%b.isi == Y) %b.love = %b.love + 3
    if (%b.isi == O) %b.love = %b.love + 1
    if (%b.isi == U) %b.love = %b.love + 3
    inc %b.hit
  }
  return %b.love
}

dialog infosetting {
  title "!Info Setting [/setinfo]"
  size -1 -1 225 113
  option dbu
  list 1, 115 24 104 50, size vsbar
  edit "", 2, 115 78 64 11
  button "Add", 3, 181 78 18 11
  button "Del", 4, 200 78 18 11
  text "Exclude this Channel :", 5, 117 16 86 8
  check "!Cuaca", 6, 11 25 40 10
  check "!Forecast", 7, 11 36 40 10
  check "!YM", 8, 11 47 40 10
  check "!Zodiak", 9, 61 47 35 10
  check "!Info", 10, 11 14 40 10
  check "!Adzan", 11, 61 14 37 10
  check "!Jam", 12, 11 58 40 10
  check "!Musik", 13, 61 69 38 10
  check "!Nama", 14, 61 25 37 10
  check "!IP", 15, 11 69 33 10
  check "!jodoh", 16, 61 36 37 10
  check "!Translate", 17, 61 58 38 10
  box "Channel Command", 22, 5 5 104 101
  button "Save Setting", 23, 116 93 50 12
  button "Close", 24, 169 93 50 12, ok
  check "Save Log to File", 25, 115 5 57 9
  button "Repair", 26, 181 5 37 9
}

alias setinfo { $dialog(infosetting,infosetting) }
alias setinfo1 { if (!$dialog(infosetting)) { dialog -md infosetting infosetting } }
on 1:dialog:infosetting:*:*:{
  if ($devent == init) { 
    info.ceksetting
    var %fset.ini = $readini(mirc.ini,agent,infosetting)
    if $mid(%fset.ini,1,1) == 1 { did -c $dname 10 1 }
    if $mid(%fset.ini,2,1) == 1 { did -c $dname 11 1 }   
    if $mid(%fset.ini,3,1) == 1 { did -c $dname 6 1 }     
    if $mid(%fset.ini,4,1) == 1 { did -c $dname 14 1 }    
    if $mid(%fset.ini,5,1) == 1 { did -c $dname 7 1 }    
    if $mid(%fset.ini,6,1) == 1 { did -c $dname 16 1 }    
    if $mid(%fset.ini,7,1) == 1 { did -c $dname 8 1 }    
    if $mid(%fset.ini,8,1) == 1 { did -c $dname 9 1 } 
    if $mid(%fset.ini,9,1) == 1 { did -c $dname 12 1 }    
    if $mid(%fset.ini,10,1) == 1 { did -c $dname 17 1 }         
    if $mid(%fset.ini,11,1) == 1 { did -c $dname 15 1 }
    if $mid(%fset.ini,12,1) == 1 { did -c $dname 13 1 }          
    if $mid(%fset.ini,17,1) == 1 { did -c $dname 25 1 }    
    var %fset.chan = $gettok(%fset.ini,2,160)
    if %fset.chan != $null {
      var %txt.isi, %txt.hit = 1, %txt.total = $numtok(%fset.chan,44) 
      while (%txt.hit <= %txt.total) {
        did $iif(%txt.hit == 1,-ra,-a) $dname 1 $gettok(%fset.chan,%txt.hit,44)
        inc %txt.hit 
      }      
    }
  }
  if ($devent == sclick) {
    if ($did == 23) { 
      var %info.save
      %info.save = $did(10).state $+ $did(11).state
      %info.save = %info.save $+ $did(6).state $+ $did(14).state
      %info.save = %info.save $+ $did(7).state $+ $did(16).state      
      %info.save = %info.save $+ $did(8).state $+ $did(9).state            
      %info.save = %info.save $+ $did(12).state $+ $did(17).state                  
      %info.save = %info.save $+ $did(15).state $+ $did(13).state           
      %info.save = %info.save $+ $did(25).state        
      var %txt.isi, %txt.hit = 1, %txt.total = $did(1).lines 
      while (%txt.hit <= %txt.total) {
        %txt.isi = %txt.isi $+ $iif(%txt.hit != 1,$chr(44)) $+ $did(1,%txt.hit).text
        inc %txt.hit 
      }
      .writeini $shortfn($mircdir) $+ mIRC.ini agent infosetting $+(%info.save,$chr(160),%txt.isi)
    }
    if ($did == 3) {
      var %txt.isi, %txt.hit = 1, %txt.total = $did(1).lines 
      while (%txt.hit <= %txt.total) {
        if $did(1,%txt.hit).text == $chanstrip($did(2)) { halt }
        inc %txt.hit 
      }
      did -a $dname 1 $chanstrip($did(2))
    }
    if ($did == 4) {   
      if $did(1).sel != 0 {  
        did -d $dname 1 $did(1).sel
      }
    }  
    if ($did == 26) { 
      info.repair
    }      
  }  
}
alias -l info.ceksetting {
  if ($readini(mirc.ini,agent,infosetting) == $null) || ($readini(mirc.ini,agent,infosetting) == none)  { 
    .writeini $shortfn($mircdir) $+ mIRC.ini agent infosetting $+(11111111111111111,$chr(160),#unknown) 
  }  
}
alias info.repair {
  .disable #wetget
  .disable #ymget
  .disable #zodiakget
  .disable #adzanget
  .disable #jamget
  .disable #ardanget
  .disable #iplookupget
  .disable #artinamaget
}
alias info.cek {
  info.ceksetting
  var %fset.ini = $readini(mirc.ini,agent,infosetting)
  var %fset.isi = $mid(%fset.ini,$1,1)
  return %fset.isi
}
alias info.chan {
  var %fset.ada = 0
  var %fset.ini = $readini(mirc.ini,agent,infosetting)
  var %fset.isi = $mid(%fset.ini,$1,1)  
  var %fset.chan = $gettok(%fset.ini,2,160)
  if %fset.chan != $null {
    var %txt.isi, %txt.hit = 1, %txt.total = $numtok(%fset.chan,44) 
    while (%txt.hit <= %txt.total) {
      if ($1 == $gettok(%fset.chan,%txt.hit,44)) { %fset.ada = 1 | %txt.hit = %txt.total }
      inc %txt.hit 
    }      
  }  
  return %fset.ada
}
alias -l chanreg { var %n, %tmp = $lower($strip($1-)) | %n = $regsub(%tmp,/[^-^+^_a-z0-9_^]/g,$chr(32),%tmp) | return %tmp }
alias -l chanstrip { var %tmp1 = $chanreg($1) | %tmp1 = $chr(35) $+ $replace(%tmp1,$chr(32),$chr(44) $+ $chr(35)) | return %tmp1 }
alias -l echoinfo { if $info.cek(17) == 1 { if ($window(@Info,0) == 0) { window -eknl0 @Info tahoma } | .aline -p @Info $jam $1- | if ($1 == mulai $+ $chr(58)) { write $shortfn($mircdir) $+ scripts\chaninfo.txt $date(yyyy-mm-dd) $time(hh:nn:ss) $2- } } }
