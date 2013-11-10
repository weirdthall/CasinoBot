on *:text:+loan*:#: { 
  if ( $readini(casinoloans.ini, $nick, Money ) == $null) && ($2 == $null) {
    .notice $nick You don't owe me any money $nick $+ !
  }
  if ( $readini( casino.ini, $nick, Money ) <= 10 ) && ($2 == $null) {
    .notice $nick You can ask for a loan with a maximum of 500 satoshi! 
  }
  if ( $readini( casino.ini, $nick, Money ) <= 10 ) && ($2 isnum) { 
    .notice $nick You requested a loan of $2 $+ . Checking........
    /var %casinorequestedordenied $rand(1,5) 
    if (%casinorequestedordenied == 1) {
      .timer 1 5 /notice $nick $nick $+ , your loan is 4Denied!
    }
    if (%casinorequestedordenied == 2) {
      .timer 1 5 /notice $nick $nick $+ , your loan is 4Denied!
    }
    if (%casinorequestedordenied == 3) {
      .timer 1 5 /notice $nick $nick $+ , your loan is 4Denied!
    }
    if (%casinorequestedordenied == 4) {
      .timer 1 5 /notice $nick $nick $+ , your loan is 4Denied!
    }
    if (%casinorequestedordenied == 5) { 
      .timer 1 4 /notice $nick $nick $+ , your loan is 9Accepted! 
      .timer 1 4 /notice $nick Money will be added to your account in a few seconds
      .timer 1 7 /writeini casino.ini $nick Money $calc( $readini( casino.ini, $nick, Money ) + $2 )
      .timer 1 7 /writeini casinoloans.ini $nick Money $calc( $readini( casinoloans.ini, $nick, Money ) + $2 )
    }
  }
  if ( $readini( casino.ini, $nick, Money ) > 10 ) {
    .notice $nick Loan denied, you have money left!
  }
}
on *:join:#: {
  if ( $readini( casinoloans.ini, $nick, Money ) != 0 ) && ( $readini( casinoloans.ini, $nick, Money ) != $null ) {
    .notice $nick Hello $nick $+ , time to pay up!
    .notice $nick You owe me $readini( casinoloans.ini, $nick, Money )
    .notice $nick Type +payback for more information!
  }
}
on *:text:+payback*:#: {
  if ( $readini(casinoloans.ini, $nick, Money ) == $null) && ($2 == $null) {
    .notice $nick You don't owe me any money $nick $+ ! 
  }
  if ($2 == $null) {
    /notice $nick 10Please type a number. Ex. +payback 10
    halt
  }
  if ($2 < 1) {
    /notice $nick 10Please payback your loan with 1 satoshi or more.
    halt
  }
  if ($2 > 1) {
    /notice $nick 6Thank you, processing your loan repayment.....
  }
  if ($readini( casino.ini, $nick, Money ) < $2) {
    /notice $nick 10Sorry but you don't have $2 satoshi with which to repay your loan.
	/notice $nick 10Loan repayment 4cancelled.
    halt
  }
  if ($readini( casino.ini, $nick, Money ) > $2) {
    /notice $nick 10Loan repayment of $2 satoshi  9SUCCESSFUL!
	/set %money.temp $calc( $readini( casino.ini, $nick, Money ) - $2)
    /writeini casino.ini $nick Money %money.temp
    /unset %money.temp
	
	/notice $nick 10$2 satoshi withdrawn from your account.
  }
}