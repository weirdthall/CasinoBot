; Source http://www.hawkee.com/snippet/8023/
; Modification for WeirdThall
; irc.geekshed.net #Script-Help
; 2013-10-03
; Corrected NICK and QUIT events
 
alias theme return 3
alias t.set {
  ;; 4 is time in seconds
  if ($1 == 1) return $+($theme,Your timer will now be run every7 15 minutes ,$theme, until you disconnect or leave.)
  elseif ($1 == 2) return $+($theme,,$nick,,$chr(44) you already have a timer running. Type +ad off to remove your timer.)
  elseif ($1 == 3) return $+($theme,[Ad] $3-)
  elseif ($1 == 4) return 900
  elseif ($1 == 5) return $+($theme,Your timer has been removed from the rotation.)
  elseif ($1 == 6) return $+($theme,$2 $+ 's timer has been removed from the rotation.)
 
}
on *:NICK:{
  var %ix $comchan($newnick,0)
  while (%ix) {
    var %chan $comchan($newnick,%ix)
    if ($timer($+(.,$nick.,%chan,.advert)).secs) {
      var %com $left($gettok($timer($+(.,$nick.,%chan,.advert)).com,3-,44),$calc($len($gettok($timer($+(.,$nick.,%chan,.advert)).com,3-,44)) - 1))
      .timer $+ $+(.,$newnick,.,%chan,.advert) 0 $v1 notice %nick $+($,t.set,$chr(40),3,$chr(44),$newnick,$chr(44),%com,$chr(41))
 
      .timer $+ $+(.,$nick,.,%chan,.advert) off
    }
    dec %ix
  }
}
 
on *:PART:#:{
  if ($timer($+(.,$nick.,$chan,.advert)).secs) {
    .timer $+ $+(.,$nick,.,$chan,.advert) off
  }
}
on *:QUIT:{
  var %ix $comchan($nick,0)
  while (%ix) {
    var %chan $comchan($nick,%ix)
    if ($timer($+(.,$nick.,%chan,.advert)).secs) {
      .timer $+ $+(.,$nick,.,%chan,.advert) off
    }
    dec %ix
  }
}
 
on *:TEXT:*:#:{
  if (!$nick($chan,$nick,@&~)) { return }
  if ($1 == +ad) {
    if ($2 == on) {
      if (!$timer($+(.,$nick.,$chan,.advert)).secs) {
        notice $nick $t.set(1)
        notice $nick $t.set(3,$nick,$3-)
        .timer $+ $+(.,$nick,.,$chan,.advert) 0 $t.set(4) msg $chan $+($,t.set,$chr(40),3,$chr(44),$nick,$chr(44),$3-,$chr(41))
      }
      else {
        notice $nick $t.set(2)
      }
    }
    elseif ($2 == off) {
      if (!$3) {
        notice $nick $t.set(5)
        .timer $+ $+(.,$nick,.,$chan,.advert) off
      }
      elseif ($3 && $nick($chan,$nick,@&~)) {
        notice $nick $t.set(6,$3)
        .timer $+ $+(.,$3,.,$chan,.advert) off
      }
    }
  }
}