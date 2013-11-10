;Casino Script
;Bar & Casino v3 Mirc addon by CHeF-TeCH, edited by WeirdThall
;v3.01.1 - All Bar parts of the script have been removed.  References to dollars are now satoshi inline with BTC theme
;v3.01.2 - All !slots references changed to +slots and characters replaced to more suit channel theme
;

;VERSION
on *:TEXT:+version:#:{
   /notice $nick $+ , I am version 3.01.2.  I am owned and operated by WeirdThall.  My admins are:  WeirdThall, PirateKitteh and pussyfreak.
   halt
   }
;SLOTS
on *:TEXT:+slots:#:{
  if ($readini( casino.ini, $nick, Money ) == $null) {
    /notice $nick $+ , You have not registered yet. Please have some complimentary chips. Type: !atm
    halt
  }
  if ($readini( casino.ini, $nick, Money ) < 5) {
    /notice $nick 7Sorry, but you don't have enough money. Ask someone for a loan.
    halt
  }
  if ($rand(1,6) == 1) /set %srand1 1
  if ($rand(1,6) == 2) /set %srand1 2
  if ($rand(1,6) == 3) /set %srand1 3
  if ($rand(1,6) == 4) /set %srand1 7
  if ($rand(1,6) == 5) /set %srand1 Ø
  if ($rand(1,6) == 6) /set %srand1 ☠
  ; 
  if ($rand(1,6) == 1) /set %srand2 1
  if ($rand(1,6) == 2) /set %srand2 2
  if ($rand(1,6) == 3) /set %srand2 3
  if ($rand(1,6) == 4) /set %srand2 7
  if ($rand(1,6) == 5) /set %srand2 Ø
  if ($rand(1,6) == 6) /set %srand2 ☠
  ; 
  if ($rand(1,6) == 1) /set %srand3 1
  if ($rand(1,6) == 2) /set %srand3 2
  if ($rand(1,6) == 3) /set %srand3 3
  if ($rand(1,6) == 4) /set %srand3 7
  if ($rand(1,6) == 5) /set %srand3 Ø
  if ($rand(1,6) == 6) /set %srand3 ☠
  /set %money.temp $calc( $readini( casino.ini, $nick, Money ) -5 )
  /writeini casino.ini $nick Money %money.temp
  /unset %money.temp
  /notice $nick 5 $+ You pop in 5 satoshi and pull the handle...the slots spin....  %srand1  ~  %srand2  ~  %srand3  
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 1) /notice $nick 10Congrats $nick $+ !!! You have won 25 satoshi!!!
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 1) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +25 )
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 1) /writeini casino.ini $nick Money %money.won
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 1) /unset %money.won
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 2) /notice $nick 10Congrats $nick $+ !!! You have won 25 satoshi!!!
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 2) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +25 )
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 2) /writeini casino.ini $nick Money %money.won
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 2) /unset %money.won
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 3) /notice $nick 10Congrats $nick $+ !!! You have won 25 satoshi!!!
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 3) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +25 )
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 3) /writeini casino.ini $nick Money %money.won
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 3) /unset %money.won
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 7) /notice $nick 10Congrats $nick $+ !!! You have won 37 satoshi!!!
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 7) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +37 )
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 7) /writeini casino.ini $nick Money %money.won
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == 7) /unset %money.won  
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == ☠) /notice $nick 10Congrats $nick $+ !!! You have won 37 satoshi!!!
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == ☠) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +37 )
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == ☠) /writeini casino.ini $nick Money %money.won
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == ☠) /unset %money.won  
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == Ø) /notice $nick 10Congrats $nick $+ !!! You have won 100 satoshi!!!
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == Ø) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +100 )
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == Ø) /writeini casino.ini $nick Money %money.won
  if (%srand1 == Ø) if (%srand2 == Ø) if (%srand3 == Ø) /unset %money.won
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == ☠) /msg $chan 10MINI_JACKPOT!!! $nick $+ !!! You have won 500 satoshi!!!
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == ☠) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +500 )
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == ☠) /writeini casino.ini $nick Money %money.won
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == ☠) /unset %money.won
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 1) /msg $chan 10Congrats $nick $+ !!! You have won 75 satoshi!!!
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 1) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +75 )
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 1) /writeini casino.ini $nick Money %money.won
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 1) /unset %money.won
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 2) /msg $chan 10Congrats $nick $+ !!! You have won 75 satoshi!!!
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 2) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +75 )
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 2) /writeini casino.ini $nick Money %money.won
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 2) /unset %money.won
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 3) /msg $chan 10Congrats $nick $+ !!! You have won 85 satoshi!!!
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 3) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +85 )
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 3) /writeini casino.ini $nick Money %money.won
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 3) /unset %money.won
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 7) /msg $chan 10Congrats $nick $+ !!! You have won 85 satoshi!!!
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 7) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +85 )
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 7) /writeini casino.ini $nick Money %money.won
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == 7) /unset %money.won
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == Ø) /msg $chan 10Congrats $nick $+ !!! You have won 85 satoshi!!!
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == Ø) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +85 )
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == Ø) /writeini casino.ini $nick Money %money.won
  if (%srand1 == ☠) if (%srand2 == ☠) if (%srand3 == Ø) /unset %money.won
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 7) /msg $chan 10JACKPOT!!!! You have won 1,000 satoshi $nick $+ !!!
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 7) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +1000 )
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 7) /writeini casino.ini $nick Money %money.won
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 7) /unset %money.won
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 1) /msg $chan 10Congrats $nick $+ !!! You have won 125 satoshi!!!
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 1) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +125 )
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 1) /writeini casino.ini $nick Money %money.won
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 1) /unset %money.won 
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 2) /msg $chan 10Congrats $nick $+ !!! You have won 125 satoshi!!!
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 2) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +125 )
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 2) /writeini casino.ini $nick Money %money.won
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 2) /unset %money.won 
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 3) /msg $chan 10Congrats $nick $+ !!! You have won 125 satoshi!!!
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 3) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +125 )
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 3) /writeini casino.ini $nick Money %money.won
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == 3) /unset %money.won 
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == Ø) /msg $chan 10Congrats $nick $+ !!! You have won 125 satoshi!!!
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == Ø) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +125 )
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == Ø) /writeini casino.ini $nick Money %money.won
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == Ø) /unset %money.won 
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == ☠) /msg $chan 10Congrats $nick $+ !!! You have won 125 satoshi!!!
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == ☠) /set %money.won $calc( $readini( casino.ini, $nick, Money ) +125 )
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == ☠) /writeini casino.ini $nick Money %money.won
  if (%srand1 == 7) if (%srand2 == 7) if (%srand3 == ☠) /unset %money.won 
}
;MONEY MANAGEMENT
;moved to casinotx.mrc

;PICK3
on *:TEXT:+three*:#:{
  if ($readini( casino.ini, $nick, Money ) == $null) {
    /notice $nick $+ , You have not registered yet. Please have some complimentary satoshi. Type: +atm
    halt
  }
  if ($2 == $null) {
    /notice $nick 10Please pick three numbers 0-9. ex: +three 1 2 3
    halt
  }
  if ($3 == $null) {
    /notice $nick 10Please pick three numbers 0-9. ex: +three 1 2 3
    halt
  }
  if ($4 == $null) {
    /notice $nick 10Please pick three numbers 0-9. ex: +three 1 2 3
    halt
  }
  if ($readini( casino.ini, $nick, Money ) < 5) {
    /notice $nick 10Sorry but you don't have enough money. Ask someone for a loan.
    halt
  }
  if ($readini( casino.ini, $nick, Money ) >= 5) {
    /set %lotto.nick $2 $3 $4
    %lotto.nick = $sorttok(%lotto.nick,32,n)
    /set %lotto.winner $rand(0,9) $rand(0,9) $rand(0,9)
    %lotto.winner = $sorttok(%lotto.winner,32,n)
    if (%lotto.nick == %lotto.winner) {
      /notice $nick 9Congratulations!!! The numbers were -----> %lotto.winner <------ You have just won 0.1mBTC satoshi!!!!
      /set %money.won $calc( $readini( casino.ini, $nick, Money ) + 10000)
      /writeini casino.ini $nick Money %money.won
      /unset %money.won
      /unset %lotto.nick
      /unset %lotto.winner
    }
    if (%lotto.nick != %lotto.winner) {
      /notice $nick 10Sorry, but you have lost 5 satoshi. The numbers were -----> %lotto.winner <------ Try again. Remember if you win you get 0.1m฿ satoshi.
      /set %money.temp $calc( $readini( casino.ini, $nick, Money ) - 50)
      /writeini casino.ini $nick Money %money.temp
      /unset %money.temp
      /unset %lotto.nick
      /unset %lotto.winner
    }
  } 
}
;LOTTO
on *:TEXT:+lotto*:#:{
  if ($readini( casino.ini, $nick, Money ) == $null) {
    /notice $nick $+ , You have not registered yet. Please have some complimentary satoshi. Type: +atm
    halt
  }
  if ($2 == $null) {
    /notice $nick 10Please enter a number 1-9. ex: +lotto 5
    halt
  }
  if ($readini( casino.ini, $nick, Money ) < 10) {
    /notice $nick 10Sorry but you don't have enough money. Ask someone for a loan.
    halt
  }
  if ($readini( casino.ini, $nick, Money ) >= 10) {
    /set %lotto.user $2
    /set %lotto.number $rand(1,9)
    if (%lotto.user == %lotto.number) {
      /notice $nick 10Congratulations!!! You have just won 100 satoshi!!!!
      /set %money.won $calc( $readini( casino.ini, $nick, Money ) + 100)
      /writeini casino.ini $nick Money %money.won
      /unset %money.won
    }
    if (%lotto.user != %lotto.number) {
      /notice $nick 10Sorry, but you lost 10 satoshi. The number was ---> %lotto.number <---- Try again. Jackpot is 100 satoshi!!
    }
    /set %money.temp $calc( $readini( casino.ini, $nick, Money ) - 10)
    /writeini casino.ini $nick Money %money.temp
    /unset %money.temp
    /unset %lotto.user
    /unset %lotto.number
  }
}
;COINTOSS
on *:TEXT:+cointoss*:#:{
  if ($readini( casino.ini, $nick, Money ) == $null) {
    /notice $nick $+ , You have not registered yet. Please have some complimentary satoshi. Type: +atm
    halt
  }
  if ($readini( casino.ini, $nick, Money ) < $2) {
    /notice $nick 10Sorry but you don't have $2 satoshi to spend.
    halt
  }
  if ($2 == $null) {
    /notice $nick 10Please type a satoshi amount. ex: +cointoss (satoshi) (heads/tails)
    halt
  }
  if ($3 == $null) { 
    /notice $nick 10Please indicate whether you are betting on heads or tails. ex: +cointoss (satoshi) (heads/tails)
    halt
  }
  if ($2 < 1) {
    /notice $nick 10Please bet with 1 satoshi or more.
    halt
  } 
  if ($readini( casino.ini, $nick, Money ) >= $2) {
    /set %coinflip $rand(1,2)
    if ((%coinflip == 1) && ($3 == heads)) {
      /notice $nick 10Congratulations!!! You have won $2 satoshi. The coin landed on 4HEADS.
      /set %money.temp $calc( $readini( casino.ini, $nick, Money ) + $2)
    }
    if ((%coinflip == 2) && ($3 == tails)) {
      /notice $nick 10Congratulations!!! You have won $2 satoshi. The coin landed on 4TAILS.
      /set %money.temp $calc( $readini( casino.ini, $nick, Money ) + $2)
    }
    if ((%coinflip != 2) && ($3 == tails)) {
      /notice $nick 10Sorry but you lost your bet of $2 satoshi. The coin landed on HEADS.
      /set %money.temp $calc( $readini( casino.ini, $nick, Money ) - $2) 
    }
    if ((%coinflip == 2) && ($3 != tails)) {
      /notice $nick 10Sorry but you lost your bet of $2 satoshi. The coin landed on TAILS.
      /set %money.temp $calc( $readini( casino.ini, $nick, Money ) - $2)
    }
    /writeini casino.ini $nick Money %money.temp
    /unset %money.temp
    /unset %coinflip
  }
}
;ATM
on *:TEXT:+atm:#:{
  if ($readini( casino.ini, $nick, Money ) != $null) {
    /notice $nick $+ , You still have funds left or you have already used the ATM. Better ask a friend for a loan.
    halt
  }
  /notice $nick Welcome to $chan $+ 's Casino ATM. Here's 100 satoshi. Have Fun! For help type: +casino
  /writeini casino.ini $nick Money 100
}
on *:TEXT:+tip*:#:{
  if ($readini( casino.ini, $nick, Money ) == $null) {
    /notice $nick $+ , You have not registered yet. Please have some complimentary satoshi. Type: +atm
    halt
  }
  if ($2 == $null) {
    /notice $nick 10Please type a number. Ex. !tip 10
    halt
  }
  if ($2 < 1) {
    /notice $nick 10Please tip with 1 satoshi or more.
    halt
  }
  else  {
    /notice $nick 13Thank you, here's your tip:13,11 $read casinotip.txt
    /set %money.temp $calc( $readini( casino.ini, $nick, Money ) - $2 )
    /set %money.tip $calc( $readini( casino.ini, $me, Money ) + $2 )
    /writeini casino.ini $nick Money %money.temp
    /writeini casino.ini $me Money %money.tip
    /unset %money.temp
    /unset %money.tip
  }
}
;CASINO HELP
on *:TEXT:+casino:#:{
  /notice $nick 10+atm register your nick and recieve 100 satoshi for free (ONCE only).
  /notice $nick 10+money check to see your winnings
  /notice $nick 10+atmdeposit How to deposit funds here using TipJar bot.  4NON-FUNCTIONAL
  /notice $nick 10+atmwithdraw How to withdraw from the casino to TipJar bot.  4NON-FUNCTIONAL
  /notice $nick 10+give <nick> <money> [help someone down on their luck]
  /notice $nick 10+slots [Plays the game, costs 5 satoshi a try]
  /notice $nick 10+cointoss <heads or tails> <money> [50/50 bet on the toss of a coin]
  /notice $nick 10+lotto <number> [10 satoshi a tickets, wins 100]
  /notice $nick 10+three <number> <number> <number> [50 satoshi a ticket. wins 0.1mBTC]
  /notice $nick 10+blackjack <money> [play 21]  4BETA
  /notice $nick 10+vphelp [shows VideoPoker rules]
  /notice $nick 10+craps <money> [try to hit 7 (5 x Bet) or 11 (16 x Bet)]
  /notice $nick 10+dice <money> [only 1:1 game]
}
;CRAPS
on *:TEXT:+craps*:#: {
  if ($readini( casino.ini, $nick, Money ) == $null) {
    /notice $nick $+ , You have not registered yet. Please have some complimentary satoshi. Type: +atm
    halt
  }
  if ($2 == $null) {
    /notice $nick 10Please type a satoshi ammount. ex: +craps (amount)
    halt
  }
  if ($readini( casino.ini, $nick, Money ) < $2) {
    /notice $nick 10Sorry but you don't have $2 satoshi to spend.
    halt
  }
  if ($2 < 1) {
    /notice $nick 10Please bet with 1 satoshi or more.
    halt
  }
  var %R = $rand(1,6) | var %C = $rand(1,6)
  var %T = $Calc(%R + %C)
  /notice $nick 10 $+ You roll the dice......... %R & %C
  /notice $nick 10 Dice Total= %T
  if (%T = 7) {
    var %M = $calc($2 * 5)
    /notice $nick 10 $+ YOU GOT SEVENS!! You Win %m satoshi!
    /set %money.temp $calc( $readini( casino.ini, $nick, Money ) + %m)
    /writeini casino.ini $nick Money %money.temp
    /unset %money.temp
    /unset %R
    /unset %C
    /unset %T
    /unset %M  
    /halt
  }
  if  (%T = 11) {
    var %M = $calc($2 * 16)
    /notice $nick 10 $+ YOU GOT ELEVENS!! You Win %m satoshi!!!
    /set %money.temp $calc( $readini( casino.ini, $nick, Money ) + %m)
    /writeini casino.ini $nick Money %money.temp
    /unset %money.temp
    /unset %R
    /unset %C
    /unset %T
    /unset %M
    /halt
  }
  else {
    /notice $nick 10 $+ You crapped out! You ose $2 satoshi.  
    /set %money.temp $calc( $readini( casino.ini, $nick, Money ) - $2)
    /writeini casino.ini $nick Money %money.temp
    /unset %money.temp
    /unset %R
    /unset %C
    /unset %T
    /unset %M
  }
  else return
  set -eu60 $+(%,flood.,$network,.,$chan,.,action) ON
}
;DICE
on *:TEXT:+dice*:#:{
  if ($readini( casino.ini, $nick, Money ) == $null) {
    /notice $nick $+ , You have not registered yet. Please have some complimentary satoshi. Type: +atm
    halt
  }
  if (%dice == on) {
    /notice $nick 10Game already in progress. Please type: +djoin
    halt
  }
  if ($2 == $null) {
    /notice $nick 10Please enter a bet ammount. ex: +dice 10
    halt
  }
  if ($2 > $readini( casino.ini, $nick, Money )) {
    /notice $nick 10 $+ You do not have $2 satoshi to play
    halt
  }
  if ($2 < 1) {
    /notice $nick 10Please give more than 1 satoshi
    halt
  }
  /set %dicedplayer1 $nick
  /set %dice on
  /set %dicedmoney $2
  /msg $chan 10DICE game has been started. One more player required, you have 60 seconds to join, type: +djoin.
  /timer72 1 60 /msg $chan 10Sorry %dicedplayer1 nobody joined the DICE game.
  /timer73 1 60 /unset %dice*
}
on *:TEXT:+djoin:#:{
  if ($readini( casino.ini, $nick, Money ) == $null) {
    /notice $nick $+ , You have not registered yet. Please have some complimentary satoshi. Type: +atm
    halt
  }
  if ($nick == %dicedplayer1) {
    /notice $nick 10You cannot play yourself!
    halt
  }
  if (%dice == $null) {
    /notice $nick 10Sorry DICE has not yet started. To start type +dice <money>
    halt
  }
  if (%dicedmoney > $readini( casino.ini, $nick, Money )) {
    /notice $nick 10Sorry $nick, you cannot join. You don't have %dicedmoney satoshi.
    halt
  }
  /timer72 off
  /timer73 off
  goto next 
  :next
  /set %dicedplayer2 $nick
  /set %diceplayer1num $rand(1,6)
  /set %diceplayer2num $rand(1,6)
  /notice %dicedplayer1 The dice have been thrown, bet is set at %dicedmoney satoshi.
  /notice %dicedplayer2 The dice have been thrown, bet is set at %dicedmoney satoshi.
  /notice %dicedplayer1 Your number was --> %dicedplayer1num <--
  /notice %dicedplayer2 Your number was --> %dicedplayer2num <--
  if (%diceplayer1num > %diceplayer2num) {
    /notice %dicedplayer1 You have won %dicedmoney satoshi!!!
    /set %dicewinner $calc( $readini( casino.ini, %dicedplayer1, Money ) + %dicedmoney)
    /set %diceloser $calc( $readini( casino.ini, %dicedplayer2, Money ) - %dicedmoney)
    /writeini casino.ini %dicedplayer1 Money %dicewinner
    /writeini casino.ini %dicedplayer2 Money %diceloser 
    /unset %dice*
    halt
  }
  if (%diceplayer1num < %diceplayer2num) {
    /notice %dicedplayer2 You have won %dicedmoney satoshi!!!
    /set %dicewinner $calc( $readini( casino.ini, %dicedplayer2, Money ) + %dicedmoney)
    /set %diceloser $calc( $readini( casino.ini, %dicedplayer1, Money ) - %dicedmoney)
    /writeini casino.ini %dicedplayer2 Money %dicewinner
    /writeini casino.ini %dicedplayer1 Money %diceloser 
    /unset %dice*
    halt
  }
  if (%diceplayer1num == %diceplayer2num) {
    /msg $chan 10It was a tie. Nobody won. Please roll again.
    goto next
  }
}
;BLACKJACK
on *:TEXT:+blackjack*:#:{
  if (%bj == on) {
    /notice $nick 10Blackjack is already in progress. Please wait your turn.
    halt
  }
  if ( %hs [ $+ [ $nick ] ] != $null ) /notice $nick 10 $+ $nick $+ , you have a game in progress!!!
  if ( %hs [ $+ [ $nick ] ] == $null ) {
    if ( $2 == $null ) /notice $nick 10Please enter amount you want to bet. ex. +blackjack 20
    if ($readini( casino.ini, $nick, Money ) == $null ) /notice $nick 10 $+ $nick is not yet registered.  Type +atm
    if ( $readini( casino.ini, $nick, Money ) < $2 ) /notice $nick 10You don't have that much money...try something lower!
    if ( $readini( casino.ini, $nick, Money ) >= $2 ) {
      if ( $2 < 1 ) {
        /notice $nick 10Please bet more than 1 satoshi.
        halt
      }
      if ( $2 > 0 ) {
        /set %bj on
        /set %bet [ $+ [ $nick ] ] $2
        /bjdeal
        /msg $chan 10 $+ $nick bet $2 satoshi on a hand of blackjack
        /var %cch = $rand(1,4)
        if ( %cch == 1) /msg $chan 10 $+ $nick $+ 's hand: 4,0 %hcard1 [ $+ [ $nick ] ]  4,0 %hcard2 [ $+ [ $nick ] ] 
        if ( %cch == 2) /msg $chan 10 $+ $nick $+ 's hand: 4,0 %hcard1 [ $+ [ $nick ] ]  1,0 %hcard2 [ $+ [ $nick ] ] 
        if ( %cch == 3) /msg $chan 10 $+ $nick $+ 's hand: 1,0 %hcard1 [ $+ [ $nick ] ]  4,0 %hcard2 [ $+ [ $nick ] ] 
        if ( %cch == 4) /msg $chan 10 $+ $nick $+ 's hand: 1,0 %hcard1 [ $+ [ $nick ] ]  1,0 %hcard2 [ $+ [ $nick ] ] 
        if (( %hcard1 [ $+ [ $nick ] ] == A ) && ( %hcard2 [ $+ [ $nick ] ] == A )) {
          /set %addh [ $+ [ $nick ] ] 12
          /set %aceh [ $+ [ $nick ] ] 0
        }
        if (( %hcard1 [ $+ [ $nick ] ] == A ) || ( %hcard2 [ $+ [ $nick ] ] == A )) { /set %aceh [ $+ [ $nick ] ] 0 }
        /set %ccc [ $+ [ $nick ] ] $rand(1,2)
        if ( %ccc [ $+ [ $nick ] ] == 1) /msg $chan 10Dealer's hand: 4,0 %ccard1 [ $+ [ $nick ] ]  12,0 ? 
        if ( %ccc [ $+ [ $nick ] ] == 2) /msg $chan 10Dealer's hand: 1,0 %ccard1 [ $+ [ $nick ] ]  12,0 ? 
        if ( %addh [ $+ [ $nick ] ] == 21 ) {
          /set %bj [ $+ [ $nick ] ] $calc( $2 / 2 )
          /set %bj [ $+ [ $nick ] ] $calc( %bj [ $+ [ $nick ] ] + $2 )
          /msg $chan 4!!BLACKJACK!!   $nick has won %bj [ $+ [ $nick ] ] satoshi!!
          /set %bj.temp $calc( $readini( casino.ini, $nick, Money ) + %bj [ $+ [ $nick ] ] )
          /writeini casino.ini $nick Money %bj.temp
          /unset %bj.temp
          /unset %hs [ $+ [ $nick ] ]
          /unset %bet [ $+ [ $nick ] ]
          /unset %addh [ $+ [ $nick ] ]
          /unset %addc [ $+ [ $nick ] ]
          /unset %hcard1 [ $+ [ $nick ] ]
          /unset %hcard2 [ $+ [ $nick ] ]
          /unset %ccard1 [ $+ [ $nick ] ]
          /unset %ccard2 [ $+ [ $nick ] ]
          /unset %hcard3 [ $+ [ $nick ] ]
          /unset %ccard3 [ $+ [ $nick ] ]
          /unset %bj [ $+ [ $nick ] ]
          /unset %aceh [ $+ [ $nick ] ] 
          /unset %double [ $+ [ $nick ] ]
          /unset %bj
          /halt
        }
        if ( %addh [ $+ [ $nick ] ] != 21 ) {
          set %double [ $+ [ $nick ] ] $calc( %bet [ $+ [ $nick ] ] * 2)
          if ( $readini( casino.ini, $nick, Money ) >= %double [ $+ [ $nick ] ] ) {
            /msg $chan 10 Hit Stand or Double?
            /set %d [ $+ [ $nick ] ] 0
            /set %hs [ $+ [ $nick ] ] 0
            /halt
          }
          if ( $readini( casino.ini, $nick, Money ) < %double [ $+ [ $nick ] ] ) {
            /msg $chan 10 Hit or Stand?
            /set %hs [ $+ [ $nick ] ] 0
            /halt
          }
        }
      }
    }
  }
}
on *:TEXT:d:#:{
  if ( %d [ $+ [ $nick ] ] != $null ) {
    /unset %d [ $+ [ $nick ] ]
    /set %bet [ $+ [ $nick ] ] %double [ $+ [ $nick ] ] 
    /hit
    /var %cch = $rand(1,2)
    if ( %cch = 1 ) {
      if (( %hcard1 [ $+ [ $nick ] ] == A ) || ( %hcard2 [ $+ [ $nick ] ] == A )) {
        /msg $chan 10 $+ $nick hits: 4,0 %hcard3 [ $+ [ $nick ] ] 10 Total is %addh [ $+ [ $nick ] ] or $calc(%addh [ $+ [ $nick ] ] - 10)
      }
      else /msg $chan 10 $+ $nick hits: 4,0 %hcard3 [ $+ [ $nick ] ] 10 Total is %addh [ $+ [ $nick ] ]
    }
    if ( %cch = 2 ) {
      if (( %hcard1 [ $+ [ $nick ] ] == A ) || ( %hcard2 [ $+ [ $nick ] ] == A )) {
        /msg $chan 10 $+ $nick hits: 1,0 %hcard3 [ $+ [ $nick ] ] 10 Total is %addh [ $+ [ $nick ] ] or $calc(%addh [ $+ [ $nick ] ] - 10)
      }
      else {
        /msg $chan 10 $+ $nick hits: 1,0 %hcard3 [ $+ [ $nick ] ] 10 Total is %addh [ $+ [ $nick ] ]
      }
    }
    if ( %addh [ $+ [ $nick ] ] == 21 ) /stand
    if ( %aceh [ $+ [ $nick ] ] != $null ) {
      if ( %add [ $+ [ $nick ] ] > 21 ) {
        /set %addh [ $+ [ $nick ] ] $calc( %addh [ $+ [ $nick ] ] - 10)
        /unset %aceh [ $+ [ $nick ] ]
      }
    }
    if ( %hcard3 [ $+ [ $nick ] ] == A ) {
      if ( %aceh [ $+ [ $nick ] ] != $null ) {
        if ( $calc(%addh [ $+ [ $nick ] ] + 10) > 21 ) {
          /unset %aceh [ $+ [ $nick ] ]
        }
        if ( %addh [ $+ [ $nick ] ] == 21 ) /stand
      }
      if ( $calc(%addh [ $+ [ $nick ] ] + 10) == 21 ) /stand
    }
    if ( %hcard3 [ $+ [ $nick ] ] != A ) {
      if ( %aceh [ $+ [ $nick ] ] != $null ) {
        if ( %addh [ $+ [ $nick ] ] > 21 ) {
          /set %addh [ $+ [ $nick ] ] $calc(%addh [ $+ [ $nick ] ] - 10)
          /unset %aceh [ $+ [ $nick ] ]
        }
        if ( %addh [ $+ [ $nick ] ] == 21 ) /stand
      }
      if ( %addh [ $+ [ $nick ] ] == 21 ) /stand
    }
    if ( %addh [ $+ [ $nick ] ] > 21 ) {
      if ( %aceh [ $+ [ $nick ] ] == $null ) {
        /msg $chan 4 $+ $nick Busts! $nick loses %bet [ $+ [ $nick ] ] satoshi
        /var %ccc2 [ $+ [ $nick ] ] = $rand(1,2)
        if ( %ccc2 [ $+ [ $nick ] ] == 1 ) {
          if ( %ccc [ $+ [ $nick ] ] == 1) /msg $chan 10Dealer's hand: 4,0 %ccard1 [ $+ [ $nick ] ]  4,0 %ccard1 [ $+ [ $nick ] ] 
          if ( %ccc [ $+ [ $nick ] ] == 2) /msg $chan 10Dealer's hand: 1,0 %ccard1 [ $+ [ $nick ] ]  4,0 %ccard1 [ $+ [ $nick ] ] 
        }
        if ( %ccc2 [ $+ [ $nick ] ] == 2 ) {
          if ( %ccc [ $+ [ $nick ] ] == 1) /msg $chan 10Dealer's hand: 4,0 %ccard1 [ $+ [ $nick ] ]  1,0 %ccard1 [ $+ [ $nick ] ] 
          if ( %ccc [ $+ [ $nick ] ] == 2) /msg $chan 10Dealer's hand: 1,0 %ccard1 [ $+ [ $nick ] ]  1,0 %ccard1 [ $+ [ $nick ] ] 
        }
        /set %bj.temp $calc( $readini( casino.ini, $nick, Money ) - %bet [ $+ [ $nick ] ] )
        /writeini casino.ini $nick Money %bj.temp
        /unset %bj.temp
        /unset %hs [ $+ [ $nick ] ]
        /unset %bet [ $+ [ $nick ] ]
        /unset %addh [ $+ [ $nick ] ]
        /unset %addc [ $+ [ $nick ] ]
        /unset %hcard1 [ $+ [ $nick ] ]
        /unset %hcard2 [ $+ [ $nick ] ]
        /unset %ccard1 [ $+ [ $nick ] ]
        /unset %ccard2 [ $+ [ $nick ] ]
        /unset %hcard3 [ $+ [ $nick ] ]
        /unset %ccard3 [ $+ [ $nick ] ]
        /unset %a1 [ $+ [ $nick ] ]
        /unset %a2 [ $+ [ $nick ] ]
        /unset %b1 [ $+ [ $nick ] ]
        /unset %b2 [ $+ [ $nick ] ]
        /unset %a3 [ $+ [ $nick ] ]
        /unset %c3 [ $+ [ $nick ] ]
        /unset %aceh [ $+ [ $nick ] ]
        /unset %acec [ $+ [ $nick ] ]
        /unset %double [ $+ [ $nick ] ]
        /unset %bj
      }
      if ( %aceh [ $+ [ $nick ] ] != $null ) /set %addh [ $+ [ $nick ] ] $calc(%addh [ $+ [ $nick ] ] - 10)
    }
    if ( %addh [ $+ [ $nick ] ] < 21 ) /stand
  }
}
on *:TEXT:h:#:{
  if ( %hs [ $+ [ $nick ] ] != $null ) {
    /unset %d [ $+ [ $nick ] ]
    /hit
    /var %cch = $rand(1,2)
    if ( %cch = 1 ) {
      if (( %hcard1 [ $+ [ $nick ] ] == A ) || ( %hcard2 [ $+ [ $nick ] ] == A )) {
        /msg $chan 10 $+ $nick hits: 4,0 %hcard3 [ $+ [ $nick ] ] 10 Total is %addh [ $+ [ $nick ] ] or $calc(%addh [ $+ [ $nick ] ] - 10)
      }
      else /msg $chan 10 $+ $nick hits: 4,0 %hcard3 [ $+ [ $nick ] ] 10 Total is %addh [ $+ [ $nick ] ]
    }
    if ( %cch = 2 ) {
      if (( %hcard1 [ $+ [ $nick ] ] == A ) || ( %hcard2 [ $+ [ $nick ] ] == A )) {
        /msg $chan 10 $+ $nick hits: 1,0 %hcard3 [ $+ [ $nick ] ] 10 Total is %addh [ $+ [ $nick ] ] or $calc(%addh [ $+ [ $nick ] ] - 10)
      }
      else {
        /msg $chan 10 $+ $nick hits: 1,0 %hcard3 [ $+ [ $nick ] ] 10 Total is %addh [ $+ [ $nick ] ]
      }
    }
    if ( %addh [ $+ [ $nick ] ] == 21 ) /stand 
    if ( %aceh [ $+ [ $nick ] ] != $null ) {
      if ( %add [ $+ [ $nick ] ] > 21 ) {
        /set %addh [ $+ [ $nick ] ] $calc( %addh [ $+ [ $nick ] ] - 10)
        /unset %aceh [ $+ [ $nick ] ]
      }
    }
    if ( %hcard3 [ $+ [ $nick ] ] == A ) {
      if ( %aceh [ $+ [ $nick ] ] != $null ) {
        if ( $calc(%addh [ $+ [ $nick ] ] + 10) > 21 ) {
          /unset %aceh [ $+ [ $nick ] ]
        }
        if ( %addh [ $+ [ $nick ] ] == 21 ) /stand
      }
      if ( $calc(%addh [ $+ [ $nick ] ] + 10) == 21 ) /stand
    }
    if ( %hcard3 [ $+ [ $nick ] ] != A ) {
      if ( %aceh [ $+ [ $nick ] ] != $null ) {
        if ( %addh [ $+ [ $nick ] ] > 21 ) {
          /set %addh [ $+ [ $nick ] ] $calc(%addh [ $+ [ $nick ] ] - 10)
          /unset %aceh [ $+ [ $nick ] ]
        }
        if ( %addh [ $+ [ $nick ] ] == 21 ) /stand
      }
      if ( %addh [ $+ [ $nick ] ] == 21 ) /stand
    }
    if ( %addh [ $+ [ $nick ] ] > 21 ) {
      if ( %aceh [ $+ [ $nick ] ] == $null ) {
        /msg $chan 4 $+ $nick Busts! $nick loses %bet [ $+ [ $nick ] ] satoshi
        /var %ccc2 [ $+ [ $nick ] ] = $rand(1,2)
        if ( %ccc2 [ $+ [ $nick ] ] == 1 ) {
          if ( %ccc [ $+ [ $nick ] ] == 1) /msg $chan 10Dealer's hand: 4,0 %ccard1 [ $+ [ $nick ] ]  4,0 %ccard1 [ $+ [ $nick ] ] 
          if ( %ccc [ $+ [ $nick ] ] == 2) /msg $chan 10Dealer's hand: 1,0 %ccard1 [ $+ [ $nick ] ]  4,0 %ccard1 [ $+ [ $nick ] ] 
        }
        if ( %ccc2 [ $+ [ $nick ] ] == 2 ) {
          if ( %ccc [ $+ [ $nick ] ] == 1) /msg $chan 10Dealer's hand: 4,0 %ccard1 [ $+ [ $nick ] ]  1,0 %ccard1 [ $+ [ $nick ] ] 
          if ( %ccc [ $+ [ $nick ] ] == 2) /msg $chan 10Dealer's hand: 1,0 %ccard1 [ $+ [ $nick ] ]  1,0 %ccard1 [ $+ [ $nick ] ] 
        }
        /set %bj.temp $calc( $readini( casino.ini, $nick, Money ) - %bet [ $+ [ $nick ] ] )
        /writeini casino.ini $nick Money %bj.temp
        /unset %bj.temp
        /unset %hs [ $+ [ $nick ] ]
        /unset %bet [ $+ [ $nick ] ]
        /unset %addh [ $+ [ $nick ] ]
        /unset %addc [ $+ [ $nick ] ]
        /unset %hcard1 [ $+ [ $nick ] ]
        /unset %hcard2 [ $+ [ $nick ] ]
        /unset %ccard1 [ $+ [ $nick ] ]
        /unset %ccard2 [ $+ [ $nick ] ]
        /unset %hcard3 [ $+ [ $nick ] ]
        /unset %ccard3 [ $+ [ $nick ] ]
        /unset %a1 [ $+ [ $nick ] ]
        /unset %a2 [ $+ [ $nick ] ]
        /unset %b1 [ $+ [ $nick ] ]
        /unset %b2 [ $+ [ $nick ] ]
        /unset %a3 [ $+ [ $nick ] ]
        /unset %c3 [ $+ [ $nick ] ]
        /unset %aceh [ $+ [ $nick ] ]
        /unset %acec [ $+ [ $nick ] ]
        /unset %double [ $+ [ $nick ] ]
        /unset %bj
      }
      if ( %aceh [ $+ [ $nick ] ] != $null ) /set %addh [ $+ [ $nick ] ] $calc(%addh [ $+ [ $nick ] ] - 10)
    }
    if ( %addh [ $+ [ $nick ] ] < 21 ) /msg $chan 10 Hit or Stand?
  }
}
on *:TEXT:s:#:{
  if ( %hs [ $+ [ $nick ] ] != $null ) /stand
  /unset %d [ $+ [ $nick ] ]
  /unset %aceh [ $+ [ $nick ] ]
  /unset %acec [ $+ [ $nick ] ]
  /halt
}

alias /bjdeal {
  set %hcard1 [ $+ [ $nick ] ] $rand(0,11)
  set %hcard2 [ $+ [ $nick ] ] $rand(0,11)
  set %ccard1 [ $+ [ $nick ] ] $rand(0,11)
  set %ccard2 [ $+ [ $nick ] ] $rand(0,11)
  set %a1 [ $+ [ $nick ] ] $rand(1,4)
  set %a2 [ $+ [ $nick ] ] $rand(1,4)
  set %b1 [ $+ [ $nick ] ] $rand(1,4)
  set %b2 [ $+ [ $nick ] ] $rand(1,4)
  set %addh [ $+ [ $nick ] ] $calc( %hcard1 [ $+ [ $nick ] ] + %hcard2 [ $+ [ $nick ] ] )
  set %addc [ $+ [ $nick ] ] $calc( %ccard1 [ $+ [ $nick ] ] + %ccard2 [ $+ [ $nick ] ] )
  if ( %hcard1 [ $+ [ $nick ] ] == 0 ) /set %addh [ $+ [ $nick ] ] $calc(%addh [ $+ [ $nick ] ] + 10)
  if ( %hcard2 [ $+ [ $nick ] ] == 0 ) /set %addh [ $+ [ $nick ] ] $calc(%addh [ $+ [ $nick ] ] + 10)
  if ( %ccard1 [ $+ [ $nick ] ] == 0 ) /set %addc [ $+ [ $nick ] ] $calc(%addc [ $+ [ $nick ] ] + 10)
  if ( %ccard2 [ $+ [ $nick ] ] == 0 ) /set %addc [ $+ [ $nick ] ] $calc(%addc [ $+ [ $nick ] ] + 10)
  if ( %hcard1 [ $+ [ $nick ] ] == 11 ) /set %addh [ $+ [ $nick ] ] $calc(%addh [ $+ [ $nick ] ] - 1)
  if ( %hcard2 [ $+ [ $nick ] ] == 11 ) /set %addh [ $+ [ $nick ] ] $calc(%addh [ $+ [ $nick ] ] - 1)
  if ( %ccard1 [ $+ [ $nick ] ] == 11 ) /set %addc [ $+ [ $nick ] ] $calc(%addc [ $+ [ $nick ] ] - 1)
  if ( %ccard2 [ $+ [ $nick ] ] == 11 ) /set %addc [ $+ [ $nick ] ] $calc(%addc [ $+ [ $nick ] ] - 1)
  if ( %hcard1 [ $+ [ $nick ] ] == 1 ) {
    /set %addh [ $+ [ $nick ] ] $calc( %addh [ $+ [ $nick ] ] + 10 )
    /set %aceh [ $+ [ $nick ] ] 0
    /set %hcard1 [ $+ [ $nick ] ] A
  }
  if (( %hcard1 [ $+ [ $nick ] ] == 10 ) || ( %hcard1 [ $+ [ $nick ] ] == 0 ) || ( %hcard1 [ $+ [ $nick ] ] == 11 )) {
    if ( %a1 [ $+ [ $nick ] ] == 1 ) /set %hcard1 [ $+ [ $nick ] ] J
    if ( %a1 [ $+ [ $nick ] ] == 2 ) /set %hcard1 [ $+ [ $nick ] ] Q
    if ( %a1 [ $+ [ $nick ] ] == 3 ) /set %hcard1 [ $+ [ $nick ] ] K
    if ( %a1 [ $+ [ $nick ] ] == 4 ) /set %hcard1 [ $+ [ $nick ] ] 10
  }
  if ( %hcard2 [ $+ [ $nick ] ] == 1 ) {
    /set %addh [ $+ [ $nick ] ] $calc( %addh [ $+ [ $nick ] ] + 10 )
    /set %aceh [ $+ [ $nick ] ] 0
    /set %hcard2 [ $+ [ $nick ] ] A
  }
  if (( %hcard2 [ $+ [ $nick ] ] == 10 ) || ( %hcard2 [ $+ [ $nick ] ] == 0 ) || ( %hcard2 [ $+ [ $nick ] ] == 11 )) { 
    if ( %a2 [ $+ [ $nick ] ] == 1 ) /set %hcard2 [ $+ [ $nick ] ] J
    if ( %a2 [ $+ [ $nick ] ] == 2 ) /set %hcard2 [ $+ [ $nick ] ] Q
    if ( %a2 [ $+ [ $nick ] ] == 3 ) /set %hcard2 [ $+ [ $nick ] ] K
    if ( %a2 [ $+ [ $nick ] ] == 4 ) /set %hcard2 [ $+ [ $nick ] ] 10
  }
  if ( %ccard1 [ $+ [ $nick ] ] == 1 ) {
    /set %addc [ $+ [ $nick ] ] $calc( %addc [ $+ [ $nick ] ] + 10 )
    /set %acec [ $+ [ $nick ] ] 0
    /set %ccard1 [ $+ [ $nick ] ] A
  }
  if (( %ccard1 [ $+ [ $nick ] ] == 10 ) || ( %ccard1 [ $+ [ $nick ] ] == 0 ) || ( %ccard1 [ $+ [ $nick ] ] == 11 )) {
    if ( %b1 [ $+ [ $nick ] ] == 1 ) /set %ccard1 [ $+ [ $nick ] ] J
    if ( %b1 [ $+ [ $nick ] ] == 2 ) /set %ccard1 [ $+ [ $nick ] ] Q
    if ( %b1 [ $+ [ $nick ] ] == 3 ) /set %ccard1 [ $+ [ $nick ] ] K
    if ( %b1 [ $+ [ $nick ] ] == 4 ) /set %ccard1 [ $+ [ $nick ] ] 10
  }
  if ( %ccard2 [ $+ [ $nick ] ] == 1 ) {
    /set %addc [ $+ [ $nick ] ] $calc( %addc [ $+ [ $nick ] ] + 10 )
    /set %acec [ $+ [ $nick ] ] 0
    /set %ccard2 [ $+ [ $nick ] ] A
  }
  if (( %ccard2 [ $+ [ $nick ] ] == 10 ) || ( %ccard2 [ $+ [ $nick ] ] == 0 ) || ( %ccard2 [ $+ [ $nick ] ] == 11 )) {
    if ( %b2 [ $+ [ $nick ] ] == 1 ) /set %ccard2 [ $+ [ $nick ] ] J
    if ( %b2 [ $+ [ $nick ] ] == 2 ) /set %ccard2 [ $+ [ $nick ] ] Q
    if ( %b2 [ $+ [ $nick ] ] == 3 ) /set %ccard2 [ $+ [ $nick ] ] K
    if ( %b2 [ $+ [ $nick ] ] == 4 ) /set %ccard2 [ $+ [ $nick ] ] 10
  }
  return
}

alias /hit {
  set %hcard3 [ $+ [ $nick ] ] $rand(0,10)
  set %a3 [ $+ [ $nick ] ] $rand(1,4)
  set %addh [ $+ [ $nick ] ] $calc( %addh [ $+ [ $nick ] ] + %hcard3 [ $+ [ $nick ] ] )
  if ( %hcard3 [ $+ [ $nick ] ] == 0 ) /set %addh [ $+ [ $nick ] ] $calc(%addh [ $+ [ $nick ] ] + 10)
  if ( %hcard3 [ $+ [ $nick ] ] == 11 ) /set %addh [ $+ [ $nick ] ] $calc(%addh [ $+ [ $nick ] ] - 1)
  if ( %hcard3 [ $+ [ $nick ] ] == 1 ) {
    if ( %aceh [ $+ [ $nick ] ] != $null ) {
      if ( %addh [ $+ [ $nick ] ] > 11 ) {
        /set %addh [ $+ [ $nick ] ] $calc( %addh [ $+ [ $nick ] ] - 10 )
        /unset %aceh [ $+ [ $nick ] ]
      }
      if ( %addh [ $+ [ $nick ] ] <= 11 ) {
        /set %addh [ $+ [ $nick ] ] $calc( %addh [ $+ [ $nick ] ] + 10 )
        /unset %aceh [ $+ [ $nick ] ]
      }
    }
    if ( %aceh [ $+ [ $nick ] ] == $null ) {
      if ( %addh [ $+ [ $nick ] ] <= 11 ) {
        /set %addh [ $+ [ $nick ] ] $calc( %addh [ $+ [ $nick ] ] + 10 )
        /set %aceh [ $+ [ $nick ] ] 0
      }
    }
    /set %hcard3 [ $+ [ $nick ] ] A
  }
  if (( %hcard3 [ $+ [ $nick ] ] == 10 ) || ( %hcard3 [ $+ [ $nick ] ] == 0 ) || ( %hcard3 [ $+ [ $nick ] ] == 11 )) {
    if ( %a3 [ $+ [ $nick ] ] == 1 ) /set %hcard3 [ $+ [ $nick ] ] J
    if ( %a3 [ $+ [ $nick ] ] == 2 ) /set %hcard3 [ $+ [ $nick ] ] Q
    if ( %a3 [ $+ [ $nick ] ] == 3 ) /set %hcard3 [ $+ [ $nick ] ] K
    if ( %a3 [ $+ [ $nick ] ] == 4 ) /set %hcard3 [ $+ [ $nick ] ] 10
  }
}

alias /stand {
  var %ccc2 [ $+ [ $nick ] ] $rand(1,2)
  if ( %ccc [ $+ [ $nick ] ] == 1 ) {
    if ( %ccc2 [ $+ [ $nick ] ] == 1 ) /msg $chan 10Dealer's hand: 4,0 %ccard1 [ $+ [ $nick ] ]  4,0 %ccard2 [ $+ [ $nick ] ] 
    if ( %ccc2 [ $+ [ $nick ] ] == 2 ) /msg $chan 10Dealer's hand: 4,0 %ccard1 [ $+ [ $nick ] ]  1,0 %ccard2 [ $+ [ $nick ] ] 
  }
  if ( %ccc [ $+ [ $nick ] ] == 2 ) {
    if ( %ccc2 [ $+ [ $nick ] ] == 1 ) /msg $chan 10Dealer's hand: 1,0 %ccard1 [ $+ [ $nick ] ]  4,0 %ccard2 [ $+ [ $nick ] ] 
    if ( %ccc2 [ $+ [ $nick ] ] == 2 ) /msg $chan 10Dealer's hand: 1,0 %ccard1 [ $+ [ $nick ] ]  1,0 %ccard2 [ $+ [ $nick ] ] 
  }
  if ( %addc [ $+ [ $nick ] ] == 21 ) {
    /msg $chan 4Dealer has blackjack... $nick loses %bet [ $+ [ $nick ] ] satoshi!
    /set %bj.temp $calc( $readini( casino.ini, $nick, Money ) - %bet [ $+ [ $nick ] ] )
    /writeini casino.ini $nick Money %bj.temp
    /unset %bj.temp
    /unset %hs [ $+ [ $nick ] ]
    /unset %bet [ $+ [ $nick ] ]
    /unset %addh [ $+ [ $nick ] ]
    /unset %addc [ $+ [ $nick ] ]
    /unset %hcard1 [ $+ [ $nick ] ]
    /unset %hcard2 [ $+ [ $nick ] ]
    /unset %ccard1 [ $+ [ $nick ] ]
    /unset %ccard2 [ $+ [ $nick ] ]
    /unset %hcard3 [ $+ [ $nick ] ]
    /unset %ccard3 [ $+ [ $nick ] ]
    /unset %a1 [ $+ [ $nick ] ]
    /unset %a2 [ $+ [ $nick ] ]
    /unset %a3 [ $+ [ $nick ] ]
    /unset %b1 [ $+ [ $nick ] ]
    /unset %b2 [ $+ [ $nick ] ]
    /unset %c3 [ $+ [ $nick ] ]
    /unset %aceh [ $+ [ $nick ] ]
    /unset %acec [ $+ [ $nick ] ]
    /unset %double [ $+ [ $nick ] ]
    /unset %d [ $+ [ $nick ] ]
    /unset %bj
    return
  }
  /goto nextz 
  :hit
  set %ccard3 [ $+ [ $nick ] ] $rand(0,10)
  set %c3 [ $+ [ $nick ] ] $rand(1,4)
  set %addc [ $+ [ $nick ] ] $calc( %addc [ $+ [ $nick ] ] + %ccard3 [ $+ [ $nick ] ] )
  if ( %ccard3 [ $+ [ $nick ] ] == 0 ) /set %addc [ $+ [ $nick ] ] $calc(%addc [ $+ [ $nick ] ] + 10)
  if ( %ccard3 [ $+ [ $nick ] ] == 11 ) /set %addc [ $+ [ $nick ] ] $calc(%addc [ $+ [ $nick ] ] - 1)
  if ( %ccard3 [ $+ [ $nick ] ] == 1 ) {
    if ( %acec [ $+ [ $nick ] ] != $null ) {
      if ( %addc [ $+ [ $nick ] ] > 11 ) {
        /set %addc [ $+ [ $nick ] ] $calc( %addc [ $+ [ $nick ] ] - 10 )
        /unset %acec [ $+ [ $nick ] ]
      }
    }
    if ( %acec [ $+ [ $nick ] ] == $null ) {
      if ( %addc [ $+ [ $nick ] ] > 11 ) {
        /unset %acec [ $+ [ $nick ] ] 
      }
      if ( %addc [ $+ [ $nick ] ] <= 11 ) {
        /set %addc [ $+ [ $nick ] ] $calc( %addc [ $+ [ $nick ] ] + 10 )
        /set %acec [ $+ [ $nick ] ] 0
      }
    }
    /set %ccard3 [ $+ [ $nick ] ] A
  }
  if (( %ccard3 [ $+ [ $nick ] ] == 10 ) || ( %ccard3 [ $+ [ $nick ] ] == 0 ) || ( %ccard3 [ $+ [ $nick ] ] == 11 )) {
    if ( %c3 [ $+ [ $nick ] ] == 1 ) /set %ccard3 [ $+ [ $nick ] ] J
    if ( %c3 [ $+ [ $nick ] ] == 2 ) /set %ccard3 [ $+ [ $nick ] ] Q
    if ( %c3 [ $+ [ $nick ] ] == 3 ) /set %ccard3 [ $+ [ $nick ] ] K
    if ( %c3 [ $+ [ $nick ] ] == 4 ) /set %ccard3 [ $+ [ $nick ] ] 10
  }
  var %dd = $rand(1,2)
  if ( %dd == 1 ) /msg $chan 10Dealer draws 4,0 %ccard3 [ $+ [ $nick ] ] 
  if ( %dd == 2 ) /msg $chan 10Dealer draws 1,0 %ccard3 [ $+ [ $nick ] ] 
  /goto nextz
  :nextz
  if ( %addc [ $+ [ $nick ] ] < 17 ) /goto hit
  if ( %addc [ $+ [ $nick ] ] >= 17 ) {
    if ( %addc [ $+ [ $nick ] ] > 21 ) {
      if ( %acec [ $+ [ $nick ] ] == $null ) {
        /msg $chan 10Dealer busts! $nick has won %bet [ $+ [ $nick ] ] satoshi!
        /set %bj.temp $calc( $readini( casino.ini, $nick, Money ) + %bet [ $+ [ $nick ] ] )
        /writeini casino.ini $nick Money %bj.temp
        /unset %bj.temp
        /unset %hs [ $+ [ $nick ] ]
        /unset %bet [ $+ [ $nick ] ]
        /unset %addh [ $+ [ $nick ] ]
        /unset %addc [ $+ [ $nick ] ]
        /unset %hcard1 [ $+ [ $nick ] ]
        /unset %hcard2 [ $+ [ $nick ] ]
        /unset %ccard1 [ $+ [ $nick ] ]
        /unset %ccard2 [ $+ [ $nick ] ]
        /unset %hcard3 [ $+ [ $nick ] ]
        /unset %ccard3 [ $+ [ $nick ] ]
        /unset %a1 [ $+ [ $nick ] ]
        /unset %a2 [ $+ [ $nick ] ]
        /unset %a3 [ $+ [ $nick ] ]
        /unset %b1 [ $+ [ $nick ] ]
        /unset %b2 [ $+ [ $nick ] ]
        /unset %c3 [ $+ [ $nick ] ]
        /unset %acec [ $+ [ $nick ] ]
        /unset %double [ $+ [ $nick ] ]
        /unset %d [ $+ [ $nick ] ]
        /unset %bj
        return
      }
      if ( %acec [ $+ [ $nick ] ] != $null ) {
        /set %addc [ $+ [ $nick ] ] $calc( %addc [ $+ [ $nick ] ] - 10 )
        /unset %acec [ $+ [ $nick ] ]
        /goto hit
      }
    }
    if ( %addc [ $+ [ $nick ] ] <= 21 ) {
      /msg $chan 10Dealer Stands on %addc [ $+ [ $nick ] ]
      if ( %addc [ $+ [ $nick ] ] > %addh [ $+ [ $nick ] ] ) {
        /msg $chan 10Dealer wins! $nick loses %bet [ $+ [ $nick ] ] satoshi
        /set %bj.temp $calc( $readini( casino.ini, $nick, Money ) - %bet [ $+ [ $nick ] ] )
        /writeini casino.ini $nick Money %bj.temp
        /unset %bj.temp
        /unset %hs [ $+ [ $nick ] ]
        /unset %bet [ $+ [ $nick ] ]
        /unset %addh [ $+ [ $nick ] ]
        /unset %addc [ $+ [ $nick ] ]
        /unset %hcard1 [ $+ [ $nick ] ]
        /unset %hcard2 [ $+ [ $nick ] ]
        /unset %ccard1 [ $+ [ $nick ] ]
        /unset %ccard2 [ $+ [ $nick ] ]
        /unset %hcard3 [ $+ [ $nick ] ]
        /unset %ccard3 [ $+ [ $nick ] ]
        /unset %acec [ $+ [ $nick ] ]
        /unset %a1 [ $+ [ $nick ] ]
        /unset %a2 [ $+ [ $nick ] ]
        /unset %a3 [ $+ [ $nick ] ]
        /unset %b1 [ $+ [ $nick ] ]
        /unset %b2 [ $+ [ $nick ] ]
        /unset %c3 [ $+ [ $nick ] ]
        /unset %double [ $+ [ $nick ] ]
        /unset %d [ $+ [ $nick ] ]
        /unset %bj
        return
      }
      if ( %addc [ $+ [ $nick ] ] < %addh [ $+ [ $nick ] ] ) {
        /msg $chan 10 $+ $nick has won %bet [ $+ [ $nick ] ] satoshi!
        /set %bj.temp $calc( $readini( casino.ini, $nick, Money ) + %bet [ $+ [ $nick ] ] )
        /writeini casino.ini $nick Money %bj.temp
        /unset %bj.temp
        /unset %hs [ $+ [ $nick ] ]
        /unset %bet [ $+ [ $nick ] ]
        /unset %addh [ $+ [ $nick ] ]
        /unset %addc [ $+ [ $nick ] ]
        /unset %hcard1 [ $+ [ $nick ] ]
        /unset %hcard2 [ $+ [ $nick ] ]
        /unset %ccard1 [ $+ [ $nick ] ]
        /unset %ccard2 [ $+ [ $nick ] ]
        /unset %hcard3 [ $+ [ $nick ] ]
        /unset %ccard3 [ $+ [ $nick ] ]
        /unset %a1 [ $+ [ $nick ] ]
        /unset %a2 [ $+ [ $nick ] ]
        /unset %a3 [ $+ [ $nick ] ]
        /unset %b1 [ $+ [ $nick ] ]
        /unset %b2 [ $+ [ $nick ] ]
        /unset %c3 [ $+ [ $nick ] ]
        /unset %double [ $+ [ $nick ] ]
        /unset %d [ $+ [ $nick ] ]
        /unset %bj
        return
      }
      if ( %addc [ $+ [ $nick ] ] == %addh [ $+ [ $nick ] ] ) {
        /msg $chan 10Push
        /unset %hs [ $+ [ $nick ] ]
        /unset %bet [ $+ [ $nick ] ]
        /unset %addh [ $+ [ $nick ] ]
        /unset %addc [ $+ [ $nick ] ]
        /unset %hcard1 [ $+ [ $nick ] ]
        /unset %hcard2 [ $+ [ $nick ] ]
        /unset %ccard1 [ $+ [ $nick ] ]
        /unset %ccard2 [ $+ [ $nick ] ]
        /unset %hcard3 [ $+ [ $nick ] ]
        /unset %ccard3 [ $+ [ $nick ] ]
        /unset %a1 [ $+ [ $nick ] ]
        /unset %a2 [ $+ [ $nick ] ]
        /unset %a3 [ $+ [ $nick ] ]
        /unset %b1 [ $+ [ $nick ] ]
        /unset %b2 [ $+ [ $nick ] ]
        /unset %c3 [ $+ [ $nick ] ]
        /unset %double [ $+ [ $nick ] ]
        /unset %d [ $+ [ $nick ] ]
        /unset %bj
        /return
      }
    }
  }
}
;VIDEOPOKER
on *:INPUT:#:{ pokercommand $1- }
on *:TEXT:*:#:{ pokercommand $1- }
alias -l pokercommand {
  if ($1 == +vphelp) {
    /notice $nick 10Welcome to VideoPoker. Type 5+vp (#)10 to start game. Costs minimum 5 satoshi a turn. 4THIS GAME IS IN BETA, PAYMENTS MAY OR MAY NOT BE MADE.
	/notice $nick 10To see the current best hand ever type: 5!besthand  
    /notice $nick 10To change cards type 5+draw (card#'s)10. To pass just type 5+draw 
    /notice $nick 10For example this will change the third and fifth cards: 5+draw 35
    /notice $nick 10Payouts: Royal Flush(4,000:19, Straight Flush(250:1), Four of a Kind(125:1),  Full House(45:1), Flush(30:1), Straight(20:1), Three of a Kind(15:1), Two Pair(10:1), Jacks or Better(5:1) Type 5+vpodds10 for more info.
    /halt
  }
  if ($1 == +vpodds) { /notice $nick 10 There are a total of 2,598,960 totally different hands which can be dealt to you in Video Poker. When reviewing the math a player will get a royal flush once in about 40,000 hands and a straight flush in about 9,000 hands. That results in about a 63% chance of getting at least one royal flush and about a 27% chance of getting two in the same 40,000 hands. }
  if ($1 == +vpreset) {
    trashdeck $vp
    /unset %poker
    /msg $chan 10VideoPoker deck has been 4RESET.
    /halt
  }
  if ($1 == +vp) {
    if (%poker == on) {
      /notice $nick 10Game in progress. Please wait your turn...
      /halt
    }
    if ($readini( casino.ini, $nick, Money ) == $null) {
      /notice $nick $+ , You have not registered yet. Please have some complimentary satoshi. Type: +atm
      /halt
    }
    if ($readini( casino.ini, $nick, Money ) < 5) {
      /notice $nick 10Sorry but you don't have 5 satoshi to spend.
      /halt
    }
    else {
      if ($2 != $null) {
        if ($readini( casino.ini, $nick, Money ) < $2) {
          /notice $nick 10Sorry but you don't have $2 satoshi to spend.
          /halt
        }  
        else /set %poker.money $2
      }
      if ($2 == $null) /set %poker.money 5
      deal-vp
    }
  }
  if ($1 == +draw) { draw-vp $2- }
  if ($1 == +besthand) { /msg $chan $msg.vp.recordhand }
}
alias -l deal-vp {
  set %poker on
  if ($isdeck($vp)) { return }
  getdeck $vp
  var %i = 1, %deal.temp
  while (%i <= 5) {
    setcard $vp $vp %i
    inc %i
  }
  /msg $chan $msg.vp.hand
  /set %money.temp $calc( $readini( casino.ini, $nick, Money ) - $vp-bet)
  /writeini casino.ini $nick Money %money.temp
  /unset %money.temp
  /timerwarn 1 30 /notice $nick 10You have 30 seconds to change cards or your game will be ended. For help type:  4+vphelp
  /timerend1 1 60 /msg $chan 10VideoPoker 4GAME ENDED
  /timerend2 1 60 trashdeck $vp
  /timerend3 1 60 /unset %poker
  /timerend4 1 60 /halt
}
alias -l draw-vp {
  if (!$isdeck($vp)) { return }
  if (1 isin $1-) { setcard $vp $vp 1 }
  if (2 isin $1-) { setcard $vp $vp 2 }
  if (3 isin $1-) { setcard $vp $vp 3 }
  if (4 isin $1-) { setcard $vp $vp 4 }
  if (5 isin $1-) { setcard $vp $vp 5 }
  %index = $pkconvert($pvar($vp,1), $pvar($vp,2), $pvar($vp,3), $pvar($vp,4), $pvar($vp,5))
  if (%index > $pvar(Record,Index)) || ($pvar(Record,Index) == $null) {
    pset Record Index %index
    pset Record Hand %last-hand
    pset Record Nick $nick
  }
  /timerwarn off
  /timerend1 off
  /timerend2 off
  /timerend3 off
  /timerend4 off
  /set %money.temp $calc( $readini( casino.ini, $nick, Money ) + $vp-score)
  /writeini casino.ini $nick Money %money.temp
  /unset %money.temp
  psay $msg.vp.finalhand($vp)
  pset $vp
  trashdeck $vp
  /unset %poker
}
alias -l vp { return vp- $+ $nick }
alias -l vp-bet { return %poker.money }
alias -l vp-score {
  if ((%d0 == 8) && (%d1 == 14)) { var %mult = 4000 }
  elseif (%d0 == 8) { var %mult = 250 }
  elseif (%d0 == 7) { var %mult = 125 }
  elseif (%d0 == 6) { var %mult = 45 }
  elseif (%d0 == 5) { var %mult = 30 }
  elseif (%d0 == 4) { var %mult = 20 }
  elseif (%d0 == 3) { var %mult = 15 }
  elseif (%d0 == 2) { var %mult = 10 }
  elseif (%d0 == 1) { var %mult = $iif(%d1 >= 11, 5,0) }
  return $calc($vp-bet * %mult)
}
alias -l pc1 { return 12 }
alias -l pc2 { return 03 }
alias -l msg.vp.finalhand { return 10 $+ $nick $+ , your hand: $msg.vp.thehand $+ , is7 %last-hand $+ . 10You won $vp-score satoshi. }
alias -l msg.vp.hand { return 10 $+ $nick $+ , the bet is $vp-bet satoshi! Hand: $msg.vp.thehand }
alias -l msg.vp.thehand { return $convert.shortcard(1) $convert.shortcard(2) $convert.shortcard(3) $convert.shortcard(4) $convert.shortcard(5) }
alias -l msg.vp.recordhand { return 10The best hand so far was8 $pvar(Record,Nick) $+ 's $+ 10 hand: 7 $pvar(Record,Hand) $+ . }
alias -l pvar { return $readini(cards.ini, $1, $2) }
alias pset { $iif($3, writeini, remini) cards.ini $1- }
alias -l psay { $iif($nick == $me, .timer 1 0) msg $chan $1- }
alias -l pnotice { $iif($nick != $me, .notice $nick, .timer 1 0 echo $chan) $1- }
alias -l setcard { pset $2 $3 $getcard($1) }

;deck standards
alias -l getcard {
  if (!$hget($1)) { return }
  var %temp = $hget($1,$cardsleft($1))
  hdel $1 $cardsleft($1)
  return %temp
}
alias -l getdeck {
  trashdeck $1
  hmake $1
  var %c = 1
  while (%c <= 52) {
    hadd $1 %c %c
    inc %c
  }
  shuffledeck $1
}
alias -l shuffledeck {
  var %i = 1
  while ($cardsleft($1) >= %i) {
    var %temp = $rand(1,$cardsleft($1))
    var %temp.card = $hget($1,%temp)
    hadd $1 %temp $hget($1,%i)
    hadd $1 %i %temp.card
    inc %i
  }
}
alias -l trashdeck { if ($hget($1)) { hfree $1 } }
alias -l isdeck { if ($hget($1) != $null) { return $true } }
alias -l cardsleft { return $$hget($1,0).item }

;card standards
alias -l convert.shortcard { return $pc2 $+ $left($convert.rank($pvar($vp,$1)),1) $+ $convert.suit($pvar($vp,$1)) $+ 10 }
alias -l convert.card { return $pc2 $+ $convert.rank($1) $+ 10 of $convert.suit($1) }
alias -l convert.rank { return $convert.face($convert.ranknum($1)) }
alias -l convert.suit { return $gettok(06c.04d.04h.06s, $calc($convert.suitnum($1) + 1), $asc(.)) }
alias -l convert.face { return $gettok(Ace.2.3.4.5.6.7.8.9.Ten.Jack.Queen.King.Ace, $1, $asc(.)) }
alias -l convert.ranknum { return $calc($mod($calc($1 - 1),13) + 2) }
alias -l convert.suitnum { return $int($calc(($1 - 1) / 13)) }
alias -l mod { return $calc($1 - ($int($calc($1 / $2)) * $2)) }

;hand standards
alias -l cardrank { return $calc(( %d0 * (16 ^ 5) ) + ( %d1 * (16 ^ 4) ) + ( %d2 * (16 ^ 3) ) + ( %d3 * (16 ^ 2) ) + ( %d4 * (16 ^ 1)) + ( %d5 * (16 ^ 0))) }
alias -l pkconvert {
  setcards 0 0 0 0 0 0
  handconvert $1 $2 $3 $4 $5
  return $cardrank
}
alias -l handconvert {
  if (($convert.suitnum($1) == $convert.suitnum($2)) && ($convert.suitnum($2) == $convert.suitnum($3)) && ($convert.suitnum($3) == $convert.suitnum($4)) && ($convert.suitnum($4) == $convert.suitnum($5))) { var %flush = $true }
  tokenize 46 $sorttok($convert.ranknum($1) $+ . $+ $convert.ranknum($2) $+ . $+ $convert.ranknum($3) $+ . $+ $convert.ranknum($4) $+ . $+ $convert.ranknum($5), 46, nr)
  if (%flush) { setcards 5 $1 $2 $3 $4 $5 }
  if ((($1 == $calc($2 + 1)) || (($1 == 14) && ($2 == 5))) &&  ($2 == $calc($3 + 1)) && ($3 == $calc($4 + 1)) && ($4 == $calc($5 + 1))) {
    setcards $iif(%d0 == 5,8,4) $iif((($1 == 14) && ($2 == 5)),5,$1) 0 0 0 0
  }
  if (($1 == $2) && ($2 == $3) && ($3 == $4) && ($4 == $5)) { setcards 9 $1 0 0 0 0 }
  if (($1 == $2) && ($2 == $3) && ($3 == $4) && ($4 != $5)) { setcards 7 $1 $5 0 0 0 }
  if (($1 == $2) && ($2 == $3) && ($3 != $4) && ($4 == $5)) { setcards 6 $1 $5 0 0 0 }
  if (($1 == $2) && ($2 == $3) && ($3 != $4) && ($4 != $5)) { setcards 3 $1 $4 $5 0 0 }
  if (($1 == $2) && ($2 != $3) && ($3 == $4) && ($4 == $5)) { setcards 6 $5 $1 0 0 0 }
  if (($1 == $2) && ($2 != $3) && ($3 == $4) && ($4 != $5)) { setcards 2 $1 $3 $5 0 0 }
  if (($1 == $2) && ($2 != $3) && ($3 != $4) && ($4 == $5)) { setcards 2 $1 $5 $3 0 0 }
  if (($1 == $2) && ($2 != $3) && ($3 != $4) && ($4 != $5)) { setcards 1 $1 $3 $4 $5 0 }
  if (($1 != $2) && ($2 == $3) && ($3 == $4) && ($4 != $5)) { setcards 3 $4 $1 $5 0 0 }
  if (($1 != $2) && ($2 == $3) && ($3 != $4) && ($4 == $5)) { setcards 2 $3 $5 $1 0 0 }
  if (($1 != $2) && ($2 == $3) && ($3 == $4) && ($4 == $5)) { setcards 7 $5 $1 0 0 0 }
  if (($1 != $2) && ($2 == $3) && ($3 != $4) && ($4 != $5)) { setcards 1 $2 $1 $4 $5 0 }
  if (($1 != $2) && ($2 != $3) && ($3 == $4) && ($4 != $5)) { setcards 1 $3 $1 $2 $5 0 }
  if (($1 != $2) && ($2 != $3) && ($3 != $4) && ($4 == $5)) { setcards 1 $4 $1 $2 $3 0 }
  if (($1 != $2) && ($2 != $3) && ($3 == $4) && ($4 == $5)) { setcards 3 $5 $1 $2 0 0 }
  if (%d0 = 0) { setcards 0 $1 $2 $3 $4 $5 }
  convert.lasthand
}
alias convert.lasthand {
  if (%d0 == 0) { set %last-hand a HighCard, $convert.face(%d1) $+ , $convert.face(%d2) $+ , $convert.face(%d3) $+ , $convert.face(%d4) $+ , $convert.face(%d5) }
  if (%d0 == 1) { set %last-hand a Pair, $convert.face(%d1) $+ 's with $convert.face(%d2) $+ , $convert.face(%d3) $+ , $convert.face(%d4) odd }
  if (%d0 == 2) { set %last-hand Two Pair, $convert.face(%d1) $+ 's and $convert.face(%d2) $+ 's with a $convert.face(%d3) kicker }
  if (%d0 == 3) { set %last-hand Three of a Kind, $convert.face(%d1) $+ 's with $convert.face(%d2) and $convert.face(%d3) odd }
  if (%d0 == 4) { set %last-hand a Straight, $convert.face(%d1) to $convert.face($calc(%d1 - 4)) }
  if (%d0 == 5) { set %last-hand a Flush, $convert.face(%d1) $+ , $convert.face(%d2) $+ , $convert.face(%d3) $+ , $convert.face(%d4) $+ , $convert.face(%d5) }
  if (%d0 == 6) { set %last-hand a Fullhouse, $convert.face(%d1) $+ 's over $convert.face(%d2) $+ 's }
  if (%d0 == 7) { set %last-hand Four of a Kind, $convert.face(%d1) $+ 's with $convert.face(%d2) kicker }
  if (%d0 == 8) { set %last-hand a Straight Flush, $convert.face(%d1) to $convert.face($calc(%d1 - 4)) }
  if (%d0 == 9) { set %last-hand Five of a Kind, $convert.face(%d1) $+ 's }
}
alias -l setcards { %d0 = $1 | %d1 = $2 | %d2 = $3 | %d3 = $4 | %d4 = $5 | %d5 = $6 }
;
;TO DO:
;login to stop stealing
;!top10 somehow
;stop giving $0.xx
;
on *:TEXT:+casinotop:#:{ /topusers }
alias topusers {
  btrunc temp 0
  var %i = 1
  while ($ini(casino.ini,%i)) {
    write temp $v1 - $readini(casino.ini,$v1,money)
    inc %i
  }
  filter -cteuff 2 45 temp temp
  .play -n $nick temp
}
