####################################
# Freaky's Slots Script
# �2007 Version 1.2
####################################

on *:TEXT:*:#:{
  if ($1 == !slots) {
    writeini Slots.ini $chan $nick $calc($readini(Slots.ini,$chan,$nick) - 20 ) 
    var %slots = $rand(1,72)
    if (%slots == 1) { msg # 3Slots: 4,1(!)(!)(!) | msg # 6JACKPOT!!!!! You have won 3 500  dollars $nick!!! | writeini Slots.ini $chan $nick $calc($readini(Slots.ini,$chan,$nick) + 500) }
    if (%slots == 2) { msg # 3Slots: 4,1(!)(!)8(%) }
    if (%slots == 3) { msg # 3Slots: 4,1(!)8(%)4(!) }
    if (%slots == 4) { msg # 3Slots: 8,1(%)4(!)(!) }
    if (%slots == 5) { msg # 3Slots: 4,1(!)8(%)(%) }
    if (%slots == 6) { msg # 3Slots: 8,1(%)4(!)8(%) }
    if (%slots == 7) { msg # 3Slots: 8,1(%)(%)4(!) }
    if (%slots == 8) { msg # 3Slots: 8,1(%)(%)(%) | msg # 6JACKPOT!!!!! You have won 3 200  dollars $nick!!! | writeini Slots.ini $chan $nick $calc($readini(Slots.ini,$chan,$nick) + 200) }
    if (%slots == 9) { msg # 3Slots: 4,1(!)(!)7(@) }
    if (%slots == 10) { msg # 3Slots: 4,1(!)7(@)4(!) }
    if (%slots == 11) { msg # 3Slots: 7,1(@)4(!)(!) }
    if (%slots == 12) { msg # 3Slots: 7,1(@)(@)4(!) }
    if (%slots == 13) { msg # 3Slots: 7,1(@)4(!)7(@) }
    if (%slots == 14) { msg # 3Slots: 4,1(!)7(@)(@) }
    if (%slots == 15) { msg # 3Slots: 4,1(!)8(%)7(@) }
    if (%slots == 16) { msg # 3Slots: 4,1(!)7(@)8(%) }
    if (%slots == 17) { msg # 3Slots: 8,1(%)4(!)7(@) }
    if (%slots == 18) { msg # 3Slots: 7,1(@)4(!)8(%) }
    if (%slots == 19) { msg # 3Slots: 7,1(@)8(%)4(!) }
    if (%slots == 20) { msg # 3Slots: 8,1(%)7(@)4(!) }
    if (%slots == 21) { msg # 3Slots: 8,1(%)7(@)8(%) }
    if (%slots == 22) { msg # 3Slots: 8,1(%)(%)7(@) }
    if (%slots == 23) { msg # 3Slots: 7,1(@)8(%)(%) }
    if (%slots == 24) { msg # 3Slots: 7,1(@)(@)4(!) }
    if (%slots == 25) { msg # 3Slots: 4,1(!)7(@)(@) }
    if (%slots == 26) { msg # 3Slots: 7,1(@)(@)8(%) }
    if (%slots == 27) { msg # 3Slots: 8,1(%)7(@)(@) }
    if (%slots == 28) { msg # 3Slots: 7,1(@)8(%)7(@) }
    if (%slots == 29) { msg # 3Slots: 7,1(@)(@)(@) | msg # 6JACKPOT!!!!! You have won 3 100  dollars $nick!!! | writeini Slots.ini $chan $nick $calc($readini(Slots.ini,$chan,$nick) + 100) }
    if (%slots == 30) { msg # 3Slots: 7,1(@)(@)(@) | msg # 6JACKPOT!!!!! You have won 3 100  dollars $nick!!! | writeini Slots.ini $chan $nick $calc($readini(Slots.ini,$chan,$nick) + 100) }
    if (%slots == 31) { msg # 3Slots: 7,1(@)(@)(@) | msg # 6JACKPOT!!!!! You have won 3 100  dollars $nick!!! | writeini Slots.ini $chan $nick $calc($readini(Slots.ini,$chan,$nick) + 100) }
    if (%slots == 32) { msg # 3Slots: 8,1(%)(%)(%) | msg # 6JACKPOT!!!!! You have won 3 200  dollars $nick!!! | writeini Slots.ini $chan $nick $calc($readini(Slots.ini,$chan,$nick) + 200) }
    if (%slots == 33) { msg # 3Slots: 9,1(&)(&)(&) | msg # 6JACKPOT!!!!! You have won 3 1000  dollars $nick!!! | writeini Slors.ini $chan $nick $clac($readini(Slots.ini,$chan,$nick) + 1000 }
    if (%slots == 34) { msg # 3Slots: 9,1(&)(&)7(@) }
    if (%slots == 35) { msg # 3Slots: 9,1(&)(&)8(%) }
    if (%slots == 36) { msg # 3Slots: 9,1(&)(&)4(!) }
    if (%slots == 37) { msg # 3Slots: 9,1(&)7(@)9(&) }
    if (%slots == 38) { msg # 3Slots: 9,1(&)8(%)9(&) }
    if (%slots == 39) { msg # 3Slots: 9,1(&)4(!)9(&) }
    if (%slots == 40) { msg # 3Slots: 7,1(@)9(&)(&) }
    if (%slots == 41) { msg # 3Slots: 8,1(%)9(&)(&) }
    if (%slots == 42) { msg # 3Slots: 4,1(%)9(&)(&) }
    if (%slots == 43) { msg # 3Slots: 9,1(&)7(@)(@) }
    if (%slots == 44) { msg # 3Slots: 7,1(@)9(&)7(@) }
    if (%slots == 45) { msg # 3Slots: 7,1(@)(@)9(&) }
    if (%slots == 46) { msg # 3Slots: 9,1(&)8(%)(%) }
    if (%slots == 47) { msg # 3Slots: 8,1(%)9(&)8(%) }
    if (%slots == 48) { msg # 3Slots: 8,1(%)(%)9(&) }
    if (%slots == 49) { msg # 3Slots: 9,1(&)4(!)(!) }
    if (%slots == 50) { msg # 3Slots: 4,1(!)9(&)4(!) }
    if (%slots == 51) { msg # 3Slots: 4,1(!)(!)9(&) }
    if (%slots == 52) { msg # 3Slots: 9,1(&)7(@)8(%) }
    if (%slots == 53) { msg # 3Slots: 9,1(&)7(@)4(!) }
    if (%slots == 54) { msg # 3Slots: 7,1(@)9(&)8(%) }
    if (%slots == 55) { msg # 3Slots: 7,1(@)9(&)4(!) }
    if (%slots == 56) { msg # 3Slots: 7,1(@)8(%)9(&) }
    if (%slots == 57) { msg # 3Slots: 7,1(@)4(!)9(&) }
    if (%slots == 58) { msg # 3Slots: 9,1(&)8(%)7(@) }
    if (%slots == 59) { msg # 3Slots: 9,1(&)8(%)4(!) }
    if (%slots == 60) { msg # 3Slots: 8,1(%)9(&)7(@) }
    if (%slots == 61) { msg # 3Slots: 8,1(%)9(&)4(!) }
    if (%slots == 62) { msg # 3Slots: 8,1(%)7(@)9(&) }
    if (%slots == 63) { msg # 3Slots: 8,1(%)4(!)9(&) }
    if (%slots == 64) { msg # 3Slots: 9,1(&)4(!)7(@) }
    if (%slots == 65) { msg # 3Slots: 9,1(&)4(!)8(%) }
    if (%slots == 66) { msg # 3Slots: 4,1(!)9(&)7(@) }
    if (%slots == 67) { msg # 3Slots: 4,1(!)9(&)8(%) }
    if (%slots == 68) { msg # 3Slots: 4,1(!)7(@)9(&) }
    if (%slots == 69) { msg # 3Slots: 4,1(!)8(%)9(&) }
    if (%slots == 70) { msg # 3Slots: 7,1(@)(@)(@) | msg # 6JACKPOT!!!!! You have won 3 100  dollars $nick!!! | writeini Slots.ini $chan $nick $calc($readini(Slots.ini,$chan,$nick) + 100) }
    if (%slots == 71) { msg # 3Slots: 8,1(%)(%)(%) | msg # 6JACKPOT!!!!! You have won 3 200  dollars $nick!!! | writeini Slots.ini $chan $nick $calc($readini(Slots.ini,$chan,$nick) + 200) }
    if (%slots == 72) { msg # 3Slots: 4,1(!)(!)(!) | msg # 6JACKPOT!!!!! You have won 3 500  dollars $nick!!! | writeini Slots.ini $chan $nick $calc($readini(Slots.ini,$chan,$nick) + 500) }
  }
  if ($1 == !give) { writeini Slots.ini $chan $nick $calc($readini(Slots.ini,$chan,$nick) - $3) | writeini Slots.ini $chan $3 $calc($readini(Slots.ini,$chan,$3) + $2) | notice $nick You Have Deposited $3 into $2 $+ 's Account. }
  if ($1 == !money) {
    if $readini(Slots.ini,$chan,$nick) == $null { notice $nick $nick You Dont Have Any Money In Your Account. }
    if $readini(Slots.ini,$chan,$nick) != $null { notice $nick $nick You Have $readini(Slots.ini,$chan,$nick) Dollars in Your Account. }
  }
  if ($1 == !slotsgame) { notice $nick Welcome To The Casino! You Options Are: !slots !money !give | notice $nick for help on these commands type !help <command> }
  if ($1 == !help) {
    if ($2 == !casino || $2 == casino) { notice $nick USAGE: !casino | notice $nick shows what is in the casino commands }
    if ($2 == !give || $2 == give) { notice $nick USAGE: !give <nick> <amount> | notice $nick Gives that person the amount of cash u specify }
    if ($2 == !slots || $2 == slots) { notice $nick USAGE: !slots | notice $nick lets you play a gave of slots }
    if ($2 == !money || $2 == money) { notice $nick USAGE: !money | notice $nick lets you see the money you have from slots }
  }
}



