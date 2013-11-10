;Casino Script
;Bar & Casino v3 Mirc addon by CHeF-TeCH, edited by WeirdThall
;v3.01.1 - All Bar parts of the script have been removed.  References to dollars are now satoshi inline with BTC theme
;v3.01.2 - All !slots references changed to +slots and characters replaced to more suit channel theme
;
;Balance checking
on *:TEXT:+bal*:#: {
  if ($2 != $null) {
    if ($readini( casino.ini, $2, Money ) == $null) {
      /notice $nick $2 has not registered with the ATM service yet.
      halt
    }
    else /notice $nick 7 $$2 has $readini(casino.ini, $$2, Money) satoshi.
  }
  if ($2 == $null) /notice $nick 7 You have $readini(casino.ini, $nick, Money) satoshi.
}

;DEPOSIT FROM TIPJAR
on *:TEXT:+deposit*#:{
  /notice $nick To deposit funds to TipJar, please type the following: +tip fapomatic <amount> DEPOSIT <NAME>
  /notice $nick where <amount> is the amount in satoshi like 0.00005 and where <NAME> is your username exactly as it shows in your IRC client.
  /notice $nick An example would be +tip fapomatic 0.00002 DEPOSIT WeirdThall
  }

;DEPOSIT FROM BRIDGET
on *:TEXT:*tips fapomatic*#:{
; syntax is * titsorgtfo tips BridgetTheMidget 0.00001000 BTC! 
  /msg $chan %1 has tipped me $4. $5 has been added to their account.
  }
  
;Funds withdrawal
on *:TEXT:+withdraw*:#: {
  if ($readini( casino.ini, Money ) >= $3) {
    /set %money.give $calc( $readini( casino.ini, Money ) - $3 ) 
    /msg TipJar +tip $nick (Money) Casino Transaction
    /set %money.given $calc( $readini( casino.ini, $2, Money ) + $3 ) 
    /writeini casino.ini $nick Money %money.give
    /writeini casino.ini $2 Money %money.given
    /unset %money.give
    /unset %money.given
  }
}
;Tipping another player via casino funds NOT TipJar
;GIVE
on *:TEXT:+give*:#:{
  if ($readini( casino.ini, $nick, Money ) == $null) {
    /notice $nick $+ , You have not registered yet. Please have some complimentary satoshi. Type: +atm
    halt
  }
  if ($2 == $null) {
    /notice $nick 10Please use a nickname. ex: +give nick 100
    halt
  }
  if ($3 == $null) {
    /notice $nick 10Please use a type a satoshi amount. ex: +give nick 100
    halt
  }
  if ($$3 < 1) {
    /notice $nick 10Please give more than 1 satoshi.
    halt
  }
  if ($readini( casino.ini, $nick, Money ) < $3) {
    /msg $chan 10Sorry $nick doesn't have $3 satoshi to give $$2 
    halt
  }
  if ($2 == $nick) {
    /notice $nick 10You can't give money to yourself, weirdo!
    halt
  }
  if ($readini( casino.ini, $nick, Money ) >= $3) {
    /set %money.give $calc( $readini( casino.ini, $nick, Money ) - $3 ) 
    /msg $chan 10 $nick has given $$2 $3 satoshi. 
    /set %money.given $calc( $readini( casino.ini, $2, Money ) + $3 ) 
    /writeini casino.ini $nick Money %money.give
    /writeini casino.ini $2 Money %money.given
    /unset %money.give
    /unset %money.given
  }
}
;Checking balance
on *:ACTION:money*:#:{
  if ($readini( casino.ini, $nick, Money ) == $null) {
    /notice $nick $+ , You have not registered yet. Please have some complimentary satoshi. Type: +atm
    halt
  }
  if ($2 != $null) {
    if ($readini( casino.ini, $2, Money ) == $null) {
      /notice $nick $2 has not registered with the ATM service yet.
      halt
    }
    else /notice $nick 7 $$2 has $readini(casino.ini, $$2, Money) satoshi.
  }
  if ($2 == $null) /notice $nick 7 You have $readini(casino.ini, $nick, Money) satoshi.
}

