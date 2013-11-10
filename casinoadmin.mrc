on *:text:!CAgive *:#: {
  if ($nick == WeirdThall) || ($nick == WeirdyTest) {
    if (!$readini(casino.ini,$$2,Money) == $null) notice $nick $$2 has not registered for the Casino.
    else {
      writeini -n casino.ini $$2 Money $calc($readini(casino.ini,$$2,Money) +$$3)
      notice $nick Transaction successful.
      notice $$2 $nick has given you $$3 dollars. You now have $readini(casino.ini,$$2,Money) dollars.
    }
  }
  else {
    .notice $nick You are not a Casino Administrator!
  }
}

on *:text:!CAtake *:#: {
  if ($nick == admin1) || ($nick == admin2) {
    if (!$readini(casino.ini,$$2,Money) == $null) notice $nick $$2 has not registered for the Casino.
    else {
      writeini -n casino.ini $$2 Money $calc($readini(casino.ini,$$2,Money) -$$3)
      notice $nick Transaction successful.
      notice $$2 $nick has taken  $$3 dollars from you. You now have $readini(casino.ini,$$2,Money) dollars.
    }
  }
  else {
    .notice $nick You are not a Casino Administrator!
  }
}

on *:text:!canegareset*:#: {
  if (!$readini(casino.ini,$$2,Money) == <0) {
    writeini -n casino.ini $$2 Money $calc($readini(casino.ini,$$2,Money) 0)
  }
}
