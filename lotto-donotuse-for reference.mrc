alias id return ids.txt
alias theme return $read(themes.txt, s, $chan)
on *:TEXT:!bot*:#Yourchannel,?:{
  if ($read(admin.txt, s, $nick)) || ($nick($chan,$nick,&~)) {
    if ($2 == on) {
      set $+(%,Bot.,$chan) 1
      msg $chan $theme $+ All commands have been enabled for $chan 
    }
    elseif ($2 == off) {
      set $+(%,Bot.,$chan) 0
      msg $chan $theme $+ All commands have been disabled for $chan 
    }
  }
  else msg $chan $theme $+ Sorry $nick $+ , only Ops may turn me on/off
}
on *:TEXT:*:#YourChannel,?:{
  if ($($+(%,Bot.,$chan),2) == 0) { halt }
  if ($1 == !about) {
    msg $chan $theme $+  $+ $me $+ , is currently running bot script version $bsv created from scratch by $creater 
  }
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;---- ID script
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  if ($1 == !id) {
    if (!$2) {
      if (!$read(ids.txt, s, $nick)) {
        msg $chan No ID found - add your ID with !addid <id> or !addid <name> <id>.
      }
      else {
        msg $chan $nick $+ 's ID is $read(ids.txt, s, $nick)
      }
    }
    else {
      if (!$read(ids.txt, s, $2)) {
        msg $chan No ID found - add id with !addid <nick> <id>
      }
      else {
        msg $chan $2 $+ 's id is: $read(ids.txt, s, $2)
      }
    }
  }
  if ($1 == !profile) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ View $2 $+ 's profile: http://www.torn.com/profiles.php?XID= $+ $read($id, s, $iif($2,$2,$nick))
    }
  }
  if ($1 == !bust) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ Bust $2 from jail: http://www.torn.com/jail1.php?XID= $+ $read($id, s, $iif($2,$2,$nick)) $+ &action=breakout
    }
  }
  if ($1 == !bail) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ Bail $2 from jail: http://www.torn.com/jail1.php?XID= $+ $read($id, s, $iif($2,$2,$nick)) $+ &action=buy
    }
  }
  if ($1 == !cash) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ Send $2 cash: http://www.torn.com/sendcash.php?XID= $+ $read($id, s, $iif($2,$2,$nick))
    }
  }
  if ($1 == !trade) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ Trade with $2 $+ : http://www.torn.com/trade.php?step=start&userID= $+ $read($id, s, $iif($2,$2,$nick))
    }
  }
  if ($1 == !mail) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ Send $2 mail: http://www.torn.com/messages.php?action=send&XID= $+ $read($id, s, $iif($2,$2,$nick))
    }
  }
  if ($1 == !attack) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ Attack $2 $+ : http://www.torn.com/attack.php?PID= $+ $read($id, s, $iif($2,$2,$nick)) $+ &refreshcode=666
    }
  }
  if ($1 == !mug) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ Mug $2 $+ : http://www.torn.com/attack.php?PID= $+ $read($id, s, $iif($2,$2,$nick)) $+ &refreshcode=666
    }
  }
  if ($1 == !ignore) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ Ignore $2 $+ : http://www.torn.com/ignorelist.php?step=add&XID= $+ $read($id, s, $iif($2,$2,$nick))
    }
  }
  if ($1 == !revive) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ Revive $2 $+ : http://www.torn.com/revive.php?ID= $+ $read($id, s, $iif($2,$2,$nick))
    }
  }
  if ($1 == !bounty) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ Bounty $2 $+ : http://www.torn.com/bounties.php?action=add2&XID= $+ $read($id, s, $iif($2,$2,$nick))
    }
  }
  if ($1 == !display) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ View $2 $+ 's display case: http://www.torn.com/displaycase.php?userID= $+ $read($id, s, $iif($2,$2,$nick))
    }
  }
  if ($1 == !bazaar) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ View $2 $+ 's bazaar: http://www.torn.com/bazaar.php?userID= $+ $read(ids.txt, s, $iif($2,$2,$nick))
    }
  }
  if ($1 == !enemy) {
    if (!$read(ids.txt, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ Add $2 to your enemies list: http://www.torn.com/blacklist.php?step=add&XID= $+ $read($id, s, $iif($2,$2,$nick))
    }
  }
  if ($1 == !friend) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ Add $2 to your friends list: http://www.torn.com/friendlist.php?step=add&XID= $+ $read($id, s, $iif($2,$2,$nick))
    }
  }
  if ($1 == !properties) {
    if (!$read($id, s, $iif($2,$2,$nick))) { msg $chan $theme $+ I have no ID stored for $2 $+ , add it with !addid <TornID> or !addid <Nick> <TornID> }
    else {
      msg $chan $theme $+ View $2 $+ 's properties: http://www.torn.com/properties.php?step=otherproperties&ID= $+ $read($id, s, $iif($2,$2,$nick))
    }
  }
  if ($1 == !allids) {
    describe $chan has $comma($lines($id)) IDs stored.
  }
  if ($1 == !addid) {
    if ((!$3) && ($2 isnum)) {
      if ($read($id, s, $nick)) {
        msg $chan $read(themes.txt, s, $chan) $+ Sorry $nick already has an ID added It is $read(ids.txt, s, $nick) Please contact an OP to remove it.
      }
      else {
        write $id $nick $2
        msg $chan $read(themes.txt, s, $chan) $+  $+ $nick $+ 's id has been added as $2
      }
    }
    else if (($3) && ($3 isnum)) {
      if ($read($id, s, $2)) {
        msg $chan $read(themes.txt, s, $chan) $+ Sorry $2 Already has an ID added It is  $read(ids.txt, s, $2) Please contact an OP to remove it.
      }
      else {
        write $id $2 $3
        msg $chan $read(themes.txt, s, $chan) $+  $+ $2 $+ 's id has been added as $3
      }
    }
    else {
      msg $chan $read(themes.txt, s, $chan) $+ The correct command is: !addid <id> or !addid <name> <id>
    }
  }
  if ($1 == !delid) {
    if ($nick($chan,$nick,@&~)) {
      if ($2 !isnum) {
        if (!$read($id, s, $2)) {
          msg $chan $read(themes.txt, s, $chan) $+ No ID found - add it with !addid <nick> <id>
        }
        else {
          write -ds $2 $id
          msg $chan $read(themes.txt, s, $chan) $+  $+ $2 $+ 's id has been removed
        }
      }
      else {
        msg $chan $read(themes.txt, s, $chan) $+ The corect command command is: !delid <nick>
      }
    }
    else {
      msg $chan $read(themes.txt, s, $chan) $+ Please contact an op to delete IDs....
    }
  }
  ;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;---- Giveaway script
  ;;;;;;;;;;;;;;;;;;;;;;;;;;
  if ($1 == !give) {
    if ($($+(%,Gon.,$chan),2) == 0) { halt }
    if ($($+(%,giveaway.,$chan),2) == on) { msg $chan $theme $+ Giveaways are currently active in $chan  }
    else {
      if ($strip($2) == $null) { msg $chan $theme $+ Please use the correct command !give [prize here] }
      else {
        if ($2 isnum) {
          set $+(%,number.,$chan) $2
          set $+(%,prize.,$chan) $chr(36) $+ $comma($2)
          set $+(%,giver.,$chan) $nick
          set $+(%,giveaway.,$chan) on
          set $+(%,gatime.,$chan) $ctime
          timerlga. $+ $chan off
          msg $chan $theme $+  $+ $($+(%,giver.,$chan),2) has just started a giveaway in $chan  for a/an $($+(%,prize.,$chan),2) type !lotto $+ , !enter or !join
        }
        else {
          set $+(%,prize.,$chan) $2-
          set $+(%,giver.,$chan) $nick
          set $+(%,giveaway.,$chan) on
          set $+(%,gatime.,$chan) $ctime
          timerlga. $+ $chan off
          msg $chan $theme $+  $+ $($+(%,giver.,$chan),2) has just started a giveaway in $chan  for a/an $($+(%,prize.,$chan),2) type !lotto $+ , !enter or !join
        }
      }
    }
  }
  if ($1 == !lotto) || ($1 == !enter) || ($1 == !join) {
    if ($($+(%,Gon.,$chan),2) == 0) { halt }
    if ($($+(%,giver.,$chan),2) == $nick) { msg $chan $theme $+ The lotto starter $chr(40) $+ $($+(%,giver.,$chan),2) $+ $chr(41) cannot join the lotto. }
    else {
      var %txt give $+ $chan $+ .txt
      if (!$read(%txt,s,$nick)) {
        if (%giveaway == off) { msg $chan $theme $+  $+ $nick $+ , There is not a giveaway going on in $chan right now. }
        else {
          if (!$read($idfl, s, $nick)) { msg $chan $theme $+  $+ $nick $+ , before you enter you should add your ID type !addid <TornID> }
          else {
            write %txt $nick entered
            msg $chan $theme $+ Thank you $nick $+ , you have been entered in the current lotto for a/an $($+(%,prize.,$chan),2) $+ , your ticket is number $lines(%txt) $+ !
          }
        }
        else {
          echo -a $read(%txt,s,$nick)
          msg $chan $theme $+  $+ $nick $+ , You have already been entered for the current lotto in $chan with ticket number $readn $+ !
        }
      }
    }
  }
  if ($1 == !Draw) {
    if ($($+(%,Gon.,$chan),2) == 0) { halt }
    if ($($+(%,giveaway.,$chan),2) == off) { msg $chan $theme $+ How can you end something that hasn't been started? }
    if ($($+(%,giveaway.,$chan),2) == on) {
      if ($nick == $($+(%,giver.,$chan),2)) || ($nick($chan,$nick,~)) {
        if ($lines(give $+ $chan $+ .txt) > 2) {
          msg $chan $theme $+ The giveaway is being draw....
          set $+(%,winner.,$chan) $remove($read(give $+ $chan $+ .txt),entered) 
          set $+(%,winnerticket.,$chan) $readn
          msg $chan $theme $+ Ticket number $($+(%,winnerticket.,$chan),2) has been selected.
          msg $chan $theme $+ The winner of the $($+(%,prize.,$chan),2) donated by $($+(%,giver.,$chan),2) is $($+(%,winner.,$chan),2) $+ 's ID is: $+ $read(ids.txt, s, $winner($chan)) $+ $chan,winner)))
          unset $+(%,number.,$chan) 
          unset $+(%,prize.,$chan)
          unset $+(%,winnerticket.,$chan)
          unset $+(%,winner.,$chan)
          unset $+(%,gatime.,$chan)
          unset $+(%,giver.,$chan)
          set $+(%,giveaway.,$chan) off
          write -c give $+ $chan $+ .txt
          timerlga. $+ $chan 0 %lgatme msg $chan $theme $+ Giveaways are currently enabled in $chan $+ . Start a new one with: !give [Prize Here]
        }
        else {
          msg $chan $theme $+ There must be more than 2 participants to start the giveaway.
        }
      }
      else {
        msg $chan $theme $+ Only %giver or Channel Owners (~) can draw the giveaway!
      }
    }
  }
  if ($1 == !cgive) {
    if ($($+(%,Gon.,$chan),2) == 0) { halt }
    if ($nick($chan,$nick,@&~)) {
      if ($($+(%,giveaway.,$chan),2) == off) { msg $chan $theme $+ How can you cancel something that hasn't been started? }
      else {
        unset $+(%,number.,$chan) 
        unset $+(%,prize.,$chan)
        unset $+(%,gatime.,$chan)
        unset $+(%,giver.,$chan)
        set $+(%,giveaway.,$chan) off
        msg $chan $theme $+ The current giveaway has been cancelled by a channel staff member
        timerlga. $+ $chan 0 %lgatme msg $chan $theme $+ Giveaways are currently enabled in $chan $+ . Start a new one with: !give [Prize Here]
      }
    }
    else msg $chan $theme $+ Sorry $nick $+ , only Ops may cancel the giveaway.
  }
  if ($1 == !ticket) {
    if ($($+(%,Gon.,$chan),2) == 0) { halt }
    if ($($+(%,giveaway.,$chan),2) == off) { msg $chan 4The giveaway is currently inactive in $chan $+ ! }
    else {
      if ($nick == $($+(%,giver.,$chan),2)) { 
        msg $chan $theme $+  $+ $nick you cannot have a ticket as you started the giveaway.  
      }
    }
    else {
      if ($read(give $+ $chan $+ .txt, s, $nick)) {
        msg $chan $theme $+  $+ $nick $+ , you have ticket number $readn $+ !
      }
    }
  }
  if ($1 == !remove) {
    if ($($+(%,Gon.,$chan),2) == 0) { halt }
    if ($nick($chan,$nick,@&~)) {
      if ($($+(%,giveaway.,$chan),2) == off) {
        msg $chan $theme $+ There is not a giveaway going on in $chan right now.
      }
      if ($($+(%,giveaway.,$chan),2) == on) {
        set %drule $2-
        set %drule $replace(%drule,$chr(32),$chr(42))
        write -ds $+ %drule give $+ $chan $+ .txt
        msg $chan $theme $+  $+ $2  has been removed from the current giveaway.
      }
    }
    else msg $chan $theme $+ Sorry $nick $+ , only Ops may remove someone from the giveaway.
  }
  if ($1 == !igive) {
    if ($($+(%,Gon.,$chan),2) == 0) { halt }
    if ($($+(%,giveaway.,$chan),2) == off) { msg $chan $theme $+ The giveaway is currently inactive in $chan  }
    else {
      var %txt give $+ $chan $+ .txt
      msg $chan $theme $+ The current prize is a/an $($+(%,prize.,$chan),2) donated by $($+(%,giver.,$chan),2) 
      msg $chan $theme $+ There is currently $lines(%txt) participants in the current giveaway.
      msg $chan $theme $+ The giveaway has been running for $duration($calc($ctime - $($+(%,gatime.,$chan))))
    }
  }
  if ($1 == !prize) {
    if ($($+(%,Gon.,$chan),2) == 0) { halt }
    if ($($+(%,giveaway.,$chan),2) == off) { msg $chan 4The giveaway is currently inactive in $chan  }
    else {
      msg $chan $theme $+ The current prize is a/an $($+(%,prize.,$chan),2) donated by $($+(%,giver.,$chan),2) 
    }
  }
  if ($1 == !changeprize) {
    if ($($+(%,Gon.,$chan),2) == 0) { halt }
    if ($($+(%,giveaway.,$chan),2) == off) { msg $chan $theme $+ The giveaway is currently inactive in $chan  }
    else {
      if ($2 isnum) {
        unset $+(%,number.,$chan) 
        unset $+(%,prize.,$chan)
        set $+(%,number.,$chan) $2
        set $+(%,prize.,$chan) $chr(36) $+ $comma($2)
        msg $chan $theme $+ The prize has been changed to $($+(%,prize.,$chan),2)
      }
      else {
        unset $+(%,prize.,$chan)
        set $+(%,prize.,$chan) $2-
        msg $chan $theme $+ The prize has been changed to $($+(%,prize.,$chan),2)
      }
    }
    else msg $chan $theme $+ Sorry $nick $+ , only Ops may change the giveaway prize.
  }
  if ($1 == !ga) {
    if ($nick($chan,$nick,@&~)) {
      if ($2 == on) {
        set $+(%,Gon.,$chan) 1
        timerlga. $+ $chan 0 %lgatme msg $chan $theme $+ Giveaways are currently enabled in $chan $+ . Start a new one with: !give [Prize Here]
        mag $chan $theme $+ Giveaways have been enabled for $chan 
      }
      elseif ($2 == off) {
        set $+(%,Gon.,$chan) 0
        timerlga. $+ $chan off
        msg $chan $theme $+ Giveaways have been disabled for $chan 
      }
    }
    else msg $chan $theme $+ Sorry $nick $+ , only Ops may turn the giveaway on/off
  }
  if (you sent * to * iswm $1-) && ($remove($3,$chr(44),$chr(36)) isnum) && ($remove($3,$chr(44),$chr(36)) > 0) && ($nick($chan,$nick,~&@%+)) {
    inc $+(%,total,$chan) $remove($3,$chr(44),$chr(36))
    msg $chan $theme $+ I have added $3 to the total. The total amount of money given out in $chan is $ $+ $comma($($+(%,total,$chan),5))
  }
  if ($1 == !total) {
    msg $chan $theme $+ The total amount of money given out in $chan is $ $+ $comma($($+(%,total,$chan),5))
  }
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;---- Direct links
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  if ($1 == !gym) {
    msg $chan $theme $+ Visit the Gym: http://www.torn.com/gym.php
  }
  if ($1 == !crimes) {
    msg $chan $theme $+ Do some crimes: http://www.torn.com/crimes.php
  }
  if ($1 == !events) {
    msg $chan $theme $+ Check your events: http://www.torn.com/events.php
  }
  if ($1 == !faction) {
    msg $chan $theme $+ Your Faction: http://www.torn.com/factions.php?step=your
  }
  if ($1 == !auction) {
    msg $chan $theme $+ Take a look at the Auction House: http://www.torn.com/amarket.php
  }
  if ($1 == !poker) {
    msg $chan $theme $+ Play a game of poker: http://www.torn.com/poker.php
  }
  if ($1 == !jail) && (!$2) {
    msg $chan $theme $+ Take a look at the prisoners in TC Jail: http://www.torn.com/jailview.php
  }
  if ($1 == !news) {
    msg $chan $theme $+ Read through the TC Times: http://www.torn.com/newspaper.php
  }
  if ($1 == !laptop) {
    msg $chan $theme $+ Your Laptop: http://www.torn.com/laptop.php
  }
  if ($1 == !records) {
    msg $chan $theme $+ Your criminal offences: http://www.torn.com/criminalrecords.php
  }
  if ($1 == !bounties) {
    msg $chan $theme $+ bounties: http://www.torn.com/bounties.php
  }
  if ($1 == !hospital) {
    msg $chan $theme $+ Have a look at the injured in TC Hospital: http://www.torn.com/hospitalview.php
  }
  if ($1 == !preferences) {
    msg $chan $theme $+ Change your preferences: http://www.torn.com/preferences.php
  }
  if ($1 == !offences) {
    msg $chan $theme $+ See your criminal offences: http://www.torn.com/criminalrecords.php
  }
  if ($1 == !awards) {
    msg $chan $theme $+ Look at your awards: http://www.torn.com/awards.php
  }
  if ($1 == !forums) {
    msg $chan $theme $+ Browse through the forums: http://www.torn.com/forums.php
  }
  if ($1 == !stocks) {
    msg $chan $theme $+ View your stock portfolio: http://www.torn.com/stockexchange.php?step=portfolio
  }
  if ($1 == !tcse) {
    msg $chan $theme $+ Torn City Stock Exchange (TCSE): http://www.torn.com/stockexchange.php?step=profile&stock=0
  }
  if ($1 == !tcsb) {
    msg $chan $theme $+ Torn City and Shanghi Banking Corporation (TCSB): http://www.torn.com/stockexchange.php?step=profile&stock=1
  }
  if ($1 == !tcb) {
    msg $chan $theme $+ Torn City Investment Banking (TCB): http://www.torn.com/stockexchange.php?step=profile&stock=2
  }
  if ($1 == !sys) {
    msg $chan $theme $+ Syscore MFG (SYS): http://www.torn.com/stockexchange.php?step=profile&stock=3
  }
  if ($1 == !slag) {
    msg $chan $theme $+ Society and Legal Authorities Group (SLAG): http://www.torn.com/stockexchange.php?step=profile&stock=4
  }
  if ($1 == !iou) { 
    msg $chan $theme $+ Insured On Us (IOU): http://www.torn.com/stockexchange.php?step=profile&stock=5
  }
  if ($1 == !grn) {
    msg $chan $theme $+ Grain (GRN): http://www.torn.com/stockexchange.php?step=profile&stock=6
  }
  if ($1 == !tchs) {
    msg $chan $theme $+ Torn City Health Service (TCHS): http://www.torn.com/stockexchange.php?step=profile&stock=7
  }
  if ($1 == !yaz) {
    msg $chan $theme $+ Yazoo (YAZ): http://www.torn.com/stockexchange.php?step=profile&stock=8
  }
  if ($1 == !tct) {
    msg $chan $theme $+ The Torn City Times (TCT): http://www.torn.com/stockexchange.php?step=profile&stock=9
  }
  if ($1 == !cnc) {
    msg $chan $theme $+ Crude & Co. (CNC): http://www.torn.com/stockexchange.php?step=profile&stock=10
  }
  if ($1 == !msg) {
    msg $chan $theme $+ Messaging Inc. (MSG): http://www.torn.com/stockexchange.php?step=profile&stock=11
  }
  if ($1 == !tmi) {
    msg $chan $theme $+ TC Music Inductries (TMI): http://www.torn.com/stockexchange.php?step=profile&stock=12
  }
  if ($1 == !tcp) {
    msg $chan $theme $+ TC Media Productions (TCP): http://www.torn.com/stockexchange.php?step=profile&stock=13
  }
  if ($1 == !iil) {
    msg $chan $theme $+ I Industries Ltd. (IIL): http://www.torn.com/stockexchange.php?step=profile&stock=14
  }
  if ($1 == !fhc) {
    msg $chan $theme $+ Feathery Hotel Corp (FHC): http://www.torn.com/stockexchange.php?step=profile&stock=15
  }
  if ($1 == !sym) {
    msg $chan $theme $+ Symbiotic Ltd. (SYM): http://www.torn.com/stockexchange.php?step=profile&stock=16
  }
  if ($1 == !lsc) {
    msg $chan $theme $+ Lucky Shot Casino (LSC): http://www.torn.com/stockexchange.php?step=profile&stock=17
  }
  if ($1 == !prn) {
    msg $chan $theme $+ Performance Ribaldry Network (PRN): http://www.torn.com/stockexchange.php?step=profile&stock=18
  }
  if ($1 == !ewm) {
    msg $chan $theme $+ Eaglewood Mercenary (EWM): http://www.torn.com/stockexchange.php?step=profile&stock=19
  }
  if ($1 == !tcm) {
    msg $chan $theme $+ Torn City Motors (TCM): http://www.torn.com/stockexchange.php?step=profile&stock=20
  }
  if ($1 == !elbt) {
    msg $chan $theme $+ The Empty Lunchbox Building Traders (ELBT): http://www.torn.com/stockexchange.php?step=profile&stock=21
  }
  if ($1 == !hrg) {
    msg $chan $theme $+ Home Retail Group (HRG): http://www.torn.com/stockexchange.php?step=profile&stock=22
  }
  if ($1 == !tgp) {
    msg $chan $theme $+ Tell Group Plc. (TGP): http://www.torn.com/stockexchange.php?step=profile&stock=23
  }
  if ($1 == !24) {
    msg $chan $theme $+ The mysterious stock no. 24 (24): http://www.torn.com/stockexchange.php?step=profile&stock=24
  }
  if ($1 == !wssb) {
    msg $chan $theme $+ West Side South Bank University (WSSB): http://www.torn.com/stockexchange.php?step=profile&stock=25
  }
  if ($1 == !istc) {
    msg $chan $theme $+ International School TC (ISTC): http://www.torn.com/stockexchange.php?step=profile&stock=26
  }
  if ($1 == !bag) {
    msg $chan $theme $+ Big Al's Gun Shop (BAG): http://www.torn.com/stockexchange.php?step=profile&stock=27
  }
  if ($1 == !evl) {
    msg $chan $theme $+ Evil Ducks Candy Corp (EVL): http://www.torn.com/stockexchange.php?step=profile&stock=28
  }
  if ($1 == !mcs) {
    msg $chan $theme $+ Mc Smoogle Corp (MCS): http://www.torn.com/stockexchange.php?step=profile&stock=29
  }
  if ($1 == !wlt) {
    msg $chan $theme $+ Wind Lines Travel (WLT): http://www.torn.com/stockexchange.php?step=profile&stock=30
  }
  if ($1 == !tcc) {
    msg $chan $theme $+ Torn City Clothing (TCC): http://www.torn.com/stockexchange.php?step=profile&stock=31
  }
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;---- Bot control commands
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  if ($1 == !theme) {
    if ($read(admin.txt, s, $nick)) || ($nick($chan,$nick,&~)) {
      if ($strip($2) == $null) {
        msg $chan $theme $+ To set this channels color theme use: !theme <ColorCode>
        msg $chan $theme $+ Set $me $+ 's theme with the following color codes: ( 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 11 11 12 12 13 13 14 14 15 15 $theme $+ )
        msg $chan $theme $+ To reset this channels color theme use: !theme 0
      }
      else {
        write -ds $chan themes.txt
        write themes.txt $chan  $+ $2-
        msg $chan $theme $+  $+ $me $+ 's color theme will now look like this in $chan 
      }
    }
  }
  if ($1 == !part) {
    if ($chan) {
      if ($2 == $me) {
        if ($read(admin.txt, s, $nick)) || ($nick == monster18) || ($nick == toclafane) {
          part $chan Requested by $nick 
        }
        else msg $chan $theme $+ Only Ops can ask me to part the channel!
      }
      else msg $chan $theme $+ To avoid confusion, to make me part the channel, use !part  $+ $me $+ 
    }
  }
  if ($1 == !hop) {
    if ($chan) {
      if ($2 == $me) {
        if ($read(admin.txt, s, $nick)) || ($nick == monster18) || ($nick == toclafane) {
          hop $chan Requested by $nick
        }
        else msg $chan $theme $+ Only Ops can ask me to hop the channel!
      }
      else msg $chan $theme $+ To avoid confusion, to make me part the channel, use !hop $+ $me $+ 
    }
  }
  if ($1 == !join) && ($2) {
    if ($read(admin.txt, s, $nick)) || ($nick == monster18) || ($nick == toclafane) {
      join $2
      msg $chan $theme $+ Channel $2 joined.
    }
  }
  if ($1 == !zchan) {
    if ($read(admin.txt, s, $nick)) || ($nick == monster18) || ($nick == toclafane) {
      if ($2 == add) {
        if ($read(ZChans.txt, w, $3)) { msg $chan $theme $+  $+ $3 is already on my ZChan list, $nick $+ . }
        else {
          write ZChans.txt $3
          msg $chan $theme $+  $+ $3 added to my ZChan list, $nick $+ .
        }
      }
      if ($2 == del) {
        if (!$read(ZChans.txt, w, $3)) { msg $chan $theme $+  $+ $3 is not on my ZChan list to delete, $nick $+ . }
        else {
          write -ds $+ $3 ZChans.txt
          msg $chan $theme $+  $+ $3 removed from my ZChan list, $nick $+ .
        }
      }
      if ($2 == count) {
        msg $chan $theme $+ I have $lines(ZChans.txt)  channels stored in my ZChan list, $nick $+ .
      }
      if ($2 == list) {
        msg $chan $theme $+ Listing channels on ZChan list..
        var %zc.list = 1
        var %zc.lines = $lines(ZChans.txt)
        while (%zc.list <= %zc.lines) {
          msg $chan $theme $+  $+ [ $+ %zc.list $+ / $+ %zc.lines $+ ] $read(ZChans.txt, %zc.list)
          inc %zc.list
        }
      }
      if ($2 == globalmsg) {
        var %zc = 1
        var %zc.lines = $lines(ZChans.txt)
        while (%zc <= %zc.lines) {
          msg $read(ZChans.txt, %zc) $read(themes.txt, s, $read(ZChans.txt, %zc)) $+ $1-
          inc %zc
        }
        msg $chan $theme $+ GlobalMsg sent to all channels in ZChan list, $nick $+ .
      }
      if ($2 == help) {
        msg $chan $theme $+ Commands: !zchan add #chan , !zchan del #chan , !zchan count , !zchan list , !zchan globalmsg message
      }
    }
  }
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;---- Misc/other commands
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  if ($1 == !calc) {
    if ($strip($2) == $null) { msg $chan $theme $+ The correct command is: !calc <Calculation> }
    else {
      var %calc $comma($calc($replace($2-,k,000,m,000000,b,000000000,t,000000000000,q,000000000000000,$chr(44),$null)))
      msg $chan $theme $+ Calculating: $2-
      msg $chan $theme $+ Result is: %calc
      if (%calc == 0) {
        msg $chan $theme $+ if 0 is not the correct awnser then thats because this calculator cant handle some of the characters or the formula used
      }
    }
  }
  if ($1 == !mute) {
    if ($chan) {  
      if ($2) {  
        if ($read(admin.txt, s, $nick)) || ($nick == monster18) || ($nick == toclafane) {
          if ($2 isnum) { 
            if ($3) {
              if ($3 !isop $chan) || (!$zs.admin($3)) { 
                if ($3 ison $chan) { 
                  mode $chan +b-qaohv ~q: $+ $address($3,2) $str($3 $chr(32),6)
                  msg $chan $theme $+  $+ $3 has been muted for $2 minutes by $nick $+ .
                  .timer 1 $calc( $2 * 60 ) mode $chan -b ~q: $+ $address($3,2)
                }
                else msg $chan $theme $+ Erm, $3 is not on $chan at the moment.. unable to mute.. so, yeah.
              }
              else msg $chan $theme $+ I will not mute Ops. 
            }
            else msg $chan $theme $+ Please use the correct command: !mute Mins Nick 
          }
          else msg $chan $theme $+  $+ $2 must be a number. E.g. !mute 10 Nick will mute for 10 minutes.
        }
      }
      else msg $chan $theme $+ Please use the correct command: !mute Mins Nick
    }
  }
  if ($1 == !giveaway) {
    if ($chan) {
      var %rgivenick = $nick($chan,$rand(1,$nick($chan,0))) | var %rgiveid = $read($id, s, %rgivenick)
      msg $chan $theme $+ Random winner in $chan is: %rgivenick [ $+ $iif(%rgiveid,%rgiveid,No ID Stored) $+ ]
    }
  }
  if ($1 == !d) {
    if (!%bot [ $+ [ $chan ] ]) {
      var %i 1
      var %time $ctime
      var %dups 0
      /msg $chan $theme $+ Removing duplicate ids from ids.txt
      while (%i <= $lines($id)) {
        tokenize 32 $read($id,%i)
        if (%id [ $+ [ $1 ] ] == 1) {
          write deleted.txt $1-
          write -ds $+ $1 ids.txt
          inc %dups
        }
        var %id [ $+ [ $1 ] ] 1
        inc %i
      }
      msg $chan $theme $+ Finished sorting, found $iif(%dups,%dups,no) duplicate id's operation took $duration($calc($ctime - %time))
      0
      .231..3
    }
  }
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;---- Alerts script
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  if ($1 == !a) || ($1 == !alert) || ($1 == !alerts) {
    if (!$2) {
      if (!$timer(.travel $+ $nick)) && (!$timer(.drugs $+ $nick)) && (!$timer(.energy $+ $nick)) && (!$timer(.hosp $+ $nick)) && (!$timer(.jail $+ $nick)) && (!$timer(.nerve $+ $nick)) && (!$timer(.happy $+ $nick)) && (!$timer(remind $+ $nick)) && (!$timer(.edu $+ $nick)) && (!$timer(.oc $+ $nick)) && (!$timer(.bank $+ $nick)) {
        msg $iif($chan,$chan,$nick) $theme $+  $+ $nick $+ , no alerts found.
      }
      else {
        var %drug = $iif($timer(.drugs $+ $nick),$iif($($+(%,drug,$nick),2), $+ $($+(%,drug,$nick),2) $+ ,Drug) effects in $duration($timer(.drugs $+ $nick).secs) ( $+ $time($calc($gmt + $duration($duration($timer(.drugs $+ $nick).secs).secs)),h:nntt) $+ ),)
        var %energy = $iif($timer(.energy $+ $nick),Energy refill in $duration($timer(.energy $+ $nick).secs) ( $+ $time($calc($gmt + $duration($duration($timer(.energy $+ $nick).secs).secs)),h:nntt) $+ ),)
        var %happy = $iif($timer(.happy $+ $nick),Happy refill in $duration($timer(.happy $+ $nick).secs) ( $+ $time($calc($gmt + $duration($duration($timer(.happy $+ $nick).secs).secs)),h:nntt) $+ ),)
        var %nerve = $iif($timer(.nerve $+ $nick),Nerve refill in $duration($timer(.nerve $+ $nick).secs) ( $+ $time($calc($gmt + $duration($duration($timer(.nerve $+ $nick).secs).secs)),h:nntt) $+ ),)
        var %hosp = $iif($timer(.hosp $+ $nick),Hospital release in $duration($timer(.hosp $+ $nick).secs) ( $+ $time($calc($gmt + $duration($duration($timer(.hosp $+ $nick).secs).secs)),h:nntt) $+ ),)
        var %jail = $iif($timer(.jail $+ $nick),Jail release in $duration($timer(.jail $+ $nick).secs) ( $+ $time($calc($gmt + $duration($duration($timer(.jail $+ $nick).secs).secs)),h:nntt) $+ ),)
        var %travel = $iif($timer(.travel $+ $nick),Travel $+ $iif($($+(%,destination,$nick),2),,ling) $iif($($+(%,destination,$nick),2),to $($+(%,destination,$nick),2),on a plane) in $duration($timer(.travel $+ $nick).secs) ( $+ $time($calc($gmt + $duration($duration($timer(.travel $+ $nick).secs).secs)),h:nntt) $+ ),)
        var %edu = $iif($timer(.edu $+ $nick),Education course in $duration($timer(.edu $+ $nick).secs) ( $+ $time($calc($gmt + $duration($duration($timer(.edu $+ $nick).secs).secs)),h:nntt $+ $chr(44) doo mmm) $+ ),)
        var %oc = $iif($timer(.oc $+ $nick),OC ready in $duration($timer(.oc $+ $nick).secs) ( $+ $time($calc($gmt + $duration($duration($timer(.oc $+ $nick).secs).secs)),h:nntt $+ $chr(44) doo mmm) $+ ),)
        var %bank = $iif($timer(.bank $+ $nick),Bank investment finishes in $duration($timer(.bank $+ $nick).secs) ( $+ $time($calc($gmt + $duration($duration($timer(.bank $+ $nick).secs).secs)),h:nntt $+ $chr(44) doo mmm) $+ ),)
        var %remind = $iif($timer(remind $+ $nick),Reminder: $($+(%,remind,$nick),2) in $duration($timer(remind $+ $nick).secs) ( $+ $time($calc($gmt + $duration($duration($timer(remind $+ $nick).secs).secs)),h:nntt) $+ ),)
        if (%drug) { var %alist = %alist $+ $iif(%alist,$chr(44),$null) %drug }
        if (%energy) { var %alist = %alist $+ $iif(%alist,$chr(44),$null) %energy }
        if (%happy) { var %alist = %alist $+ $iif(%alist,$chr(44),$null) %happy }
        if (%nerve) { var %alist = %alist $+ $iif(%alist,$chr(44),$null) %nerve }
        if (%hosp) { var %alist = %alist $+ $iif(%alist,$chr(44),$null) %hosp }
        if (%jail) { var %alist = %alist $+ $iif(%alist,$chr(44),$null) %jail }
        if (%travel) { var %alist = %alist $+ $iif(%alist,$chr(44),$null) %travel }
        if (%edu) { var %alist = %alist $+ $iif(%alist,$chr(44),$null) %edu }
        if (%oc) { var %alist = %alist $+ $iif(%alist,$chr(44),$null) %oc }
        if (%bank) { var %alist = %alist $+ $iif(%alist,$chr(44),$null) %bank }
        if (%remind) { var %alist = %alist $+ $iif(%alist,$chr(44),$null) %remind }
        msg $iif($chan,$chan,$nick) $theme $+ Alerts for  $+ $nick $+ : %alist
      }
    }
    if ($2 == off) { 
      if (!$timer(.travel $+ $nick)) && (!$timer(.drugs $+ $nick)) && (!$timer(.energy $+ $nick)) && (!$timer(.hosp $+ $nick)) && (!$timer(.jail $+ $nick)) && (!$timer(.nerve $+ $nick)) && (!$timer(.happy $+ $nick)) && (!$timer(remind $+ $nick)) && (!$timer(.edu $+ $nick)) {
        msg $chan $theme $+  $+ $nick $+ , no alerts found to switch off.
      }
      else {
        .timer. $+ jail $+ $nick off | .timer. $+ happy $+ $nick off | .timer. $+ hosp $+ $nick off | .timer. $+ travel $+ $nick off
        .timer. $+ drugs $+ $nick off | .timer. $+ energy $+ $nick off | .timer. $+ nerve $+ $nick off  | .timer. $+ edu $+ $nick off
        .timerremind $+ $nick off
        unset $+(%,destination,$nick,2) $+(%,remind,$nick)
        msg $chan $theme $+  $+ $nick $+ , all your alerts have been switched off.
      }
    }
  }
  if ($1-2 == !nerve off) && ($timer(.nerve $+ $nick)) { 
    msg $chan $theme $+  $+ $nick $+ , your alert has been switched off.
    .timer. $+ nerve $+ $nick off
  }
  if ($1-2 == !happy off) && ($timer(.happy $+ $nick)) {
    msg $chan $theme $+  $+ $nick $+ , your alert has been switched off.
    .timer. $+ happy $+ $nick off
  }
  if ($1-2 == !energy off) && ($timer(.energy $+ $nick)) {
    msg $chan $theme $+  $+ $nick $+ , your alert has been switched off.
    .timer. $+ energy $+ $nick off
  }
  if ($1 == !drug) || ($1 == !fx) {
    if ($2 == off) && ($timer(.drugs $+ $nick)) {
      msg $chan $theme $+  $+ $nick $+ , your alert has been switched off.
      .timer. $+ drugs $+ $nick off
    }
    if ($2 isnum) { 
      var %dtime = $calc(60 * $2)
      .timer $+ .drugs $+ $nick -co 1 %dtime msg $chan $theme $+  $+ $nick $+ , the drug effects should now be wearing off.
      msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.drugs $+ $nick).secs) $+  when your drug effects should be wearing off. ( $+ $time($calc($gmt + $duration($duration($timer(.drugs $+ $nick).secs).secs)),h:nntt) TC Time)
    }
  }
  if (($1-2 == !plane off) || ($1-2 == !travel off)) && ($timer(.travel $+ $nick)) {
    msg $chan $theme $+  $+ $nick $+ , your alert has been switched off.
    .timer. $+ travel $+ $nick off
  }
  if ($1-2 == !jail off) && ($timer(.jail $+ $nick)) {
    msg $chan $theme $+  $+ $nick $+ , your alert has been switched off.
    .timer. $+ jail $+ $nick off
  }
  if (($1-2 == !education off) || ($1-2 == !edu off)) && ($timer(.edu $+ $nick)) {
    msg $chan $theme $+  $+ $nick $+ , your alert has been switched off.
    .timer. $+ edu $+ $nick off
  }
  if (($1-2 == !hosp off) || ($1-2 == !hospital off)) && $timer(.hosp $+ $nick) {
    msg $chan $theme $+  $+ $nick $+ , your alert has been switched off.
    .timer. $+ hosp $+ $nick off
  }
  if ($1-2 == !oc off) && $timer(.oc $+ $nick) {
    msg $chan $theme $+  $+ $nick $+ , your alert has been switched off.
    .timer. $+ oc $+ $nick off
  }
  if ($1-2 == !bank off) && $timer(.bank $+ $nick) {
    msg $chan $theme $+  $+ $nick $+ , your alert has been switched off.
    .timer. $+ bank $+ $nick off
  }
  if ($1 == !remind) {
    if ($2) {
      if ($2 == off) {
        if ($timer(remind $+ $nick)) {
          .timerremind $+ $nick off
          msg $chan $theme $+  $+ $nick $+ , your reminder has been cancelled. 
        }
        else msg $chan $theme $+  $+ $nick $+ , no remind set to cancel.
      }
      else {
        if ($2 isnum) { 
          if ($3) {
            set %remind $+ $nick $replace($replace($3-,$chr(124),$+(,$chr(124),)),$chr(36),$+(,$chr(36),))
            msg $chan $theme $+  $+ $nick $+ , I will remind you to $3- in $duration($calc($2 * 60)) $+ .
            .timerremind $+ $nick 1 $calc($2 * 60) msg $chan $theme $+  $+ $nick $+ , you asked me to remind you to $($+(%,remind,$nick),2) $+ .
          }
          else msg $chan $theme $+ You need to specify what you want me to remind you: !remind  Reminder here
        }
        else msg $chan $theme $+  $+ $2 is not a number. Use !remind  Reminder here
      }
      else msg $chan $theme $+ Use the correct command: !remind  Reminder here
    }
  }
  if ($2 == drug) && ($4 isnum) && ($5 == minutes) && (($6 == left) || ($6 == left])) {
    set $+(-u,%dtime) %drug $+ $nick $remove($1,$chr(91),$chr(46),$chr(124),$chr(36))
    var %dtime = $calc(60 * $4)
    .timer $+ .drugs $+ $nick -co 1 %dtime msg $chan $theme $+  $+ $nick $+ , your $($+(%,drug,$nick),2) effects should now be wearing off.
    msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.drugs $+ $nick).secs) $+  when your $($+(%,drug,$nick),2) effects should be wearing off. ( $+ $time($calc($gmt + $duration($duration($timer(.drugs $+ $nick).secs).secs)),h:nntt) TC Time)
  }
  if ($1-8 == You are currently on the plane flying to) && (($10-14 == You should be there in) || ($11-15 == You should be there in)) {
    if ($16 isnum) {
      var %ptime = $calc($16 * 60)
      set $+(-u,%ptime) %destination $+ $nick $remove($9 $10,$chr(46),$chr(124),$chr(36))
      .timer $+ .travel $+ $nick -co 1 %ptime msg $chan $theme $+  $+ $nick $+ , you are now landing at $($+(%,destination,$nick),2) $+ .
      msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.travel $+ $nick).secs) $+  that you are due to land in $($+(%,destination,$nick),2) $+ . ( $+ $time($calc($gmt + $duration($duration($timer(.travel $+ $nick).secs).secs)),h:nntt) TC Time)
    }
    else {
      var %ptime = $calc($15 * 60)
      set $+(-u,%ptime) %destination $+ $nick $remove($9,$chr(46),$chr(124),$chr(36))
      .timer $+ .travel $+ $nick -co 1 %ptime msg $chan $theme $+  $+ $nick $+ , you are now landing at $($+(%,destination,$nick),2) $+ .
      msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.travel $+ $nick).secs) $+  that you are due to land in $($+(%,destination,$nick),2) $+ . ( $+ $time($calc($gmt + $duration($duration($timer(.travel $+ $nick).secs).secs)),h:nntt) TC Time)
    }
  }
  if ($1-8 == You step onto the plane. It will take) && ($9 isnum) && ($10-15 == hours to get to the destination.) {
    unset %destination $+ $nick
    var %ptime = $calc($9 * 60 * 60)
    .timer $+ .travel $+ $nick -co 1 %ptime msg $chan $theme $+  $+ $nick $+ , you are now landing at your destination.
    msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.travel $+ $nick).secs) $+  that you are due to land at your destination. ( $+ $time($calc($gmt + $duration($duration($timer(.travel $+ $nick).secs).secs)),h:nntt) TC Time)
  }
  if ($1-3 == You pay the) && ($5-12 = and step onto the plane. It will take) && ($14-19 = minutes to get to the destination.) {
    unset %destination $+ $nick
    var %ptime = $calc($13 * 60)
    .timer $+ .travel $+ $nick -co 1 %ptime msg $chan $theme $+  $+ $nick $+ , you are now landing at your destination.
    msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.travel $+ $nick).secs) $+  that you are due to land at your destination. ( $+ $time($calc($gmt + $duration($duration($timer(.travel $+ $nick).secs).secs)),h:nntt) TC Time)
  }
  if ($1 == Nerve:) {
    if ($chr(47) isin $2) {
      var %temp.nerve = $replace($2,/,$chr(32) $chr(32))
      var %bar.nerve = $right(%temp.nerve,2)
      var %nerve = $left(%temp.nerve,2)
      var %min.nerve = $asctime($calc($gmt + %daylight),nn)
      var %sec.nerve = $asctime($calc($gmt + %daylight),ss)
      var %secs.passed.nerve = $calc(%min.nerve * 60 + %sec.nerve)
      while (%secs.passed.nerve > 300) {
        var %secs.passed.nerve = $calc(%secs.passed.nerve - 300)
      }
      if ($strip(%nerve,burc) < $strip(%bar.nerve,burc)) { 
        var %refill.nerve = $calc(300 - %secs.passed.nerve + (%bar.nerve - %nerve - 1) * 300)
        .timer $+ .nerve $+ $nick -co 1 %refill.nerve msg $chan $theme $+  $+ $nick $+ , your Nerve Bar is now full.
        msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.nerve $+ $nick).secs) $+  when your Nerve Bar has fully regenerated. ( $+ $time($calc($gmt + $duration($duration($timer(.nerve $+ $nick).secs).secs)),h:nntt) TC Time)
      }
    }
  }
  if ($1 == Happy:) {
    if ($chr(47) isin $2) {
      var %temp.happy = $replace($2,/,$chr(32) $chr(32))
      var %bar.happy = $right(%temp.happy,5)
      var %happy = $left(%temp.happy,5)
      var %min.happy = $asctime($calc($gmt + %daylight),nn)
      var %sec.happy = $asctime($calc($gmt + %daylight),ss)
      var %secs.passed.happy = $calc(%min.happy * 60 + %sec.happy)
      while (%secs.passed.happy > 900) {
        var %secs.passed.happy = $calc(%secs.passed.happy - 900)
      }
      if ($strip(%happy,burc) < $strip(%bar.happy,burc)) { 
        var %refill = $calc($calc($calc($calc($calc(%bar.happy - %happy) - 5) / 5) * 15) * 60)
        .timer $+ .happy $+ $nick -co 1 $calc($calc(900 - %secs.passed.happy) + %refill) msg $chan $theme $+  $+ $nick $+ , your Happy Bar is now full.
        msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.happy $+ $nick).secs) $+  when your Happy Bar has fully regenerated. ( $+ $time($calc($gmt + $duration($duration($timer(.happy $+ $nick).secs).secs)),h:nntt) TC Time)
      }
    }
  }
  if ($1 == Energy:) {
    if ($chr(47) isin $2) {
      var %temp.energy = $replace($2,/,$chr(32) $chr(32))
      var %bar = $right(%temp.energy,3)
      var %energy = $remove($left(%temp.energy,3),$chr(32))
      if (%bar == 150) {
        var %min = $asctime($calc($gmt + %daylight),nn)
        var %sec = $asctime($calc($gmt + %daylight),ss)
        var %secs.passed = $calc(%min * 60 + %sec)
        while (%secs.passed > 600) {
          var %secs.passed = $calc(%secs.passed - 600)
        }
        if ($strip(%energy,burc) < $strip(%bar,burc)) { 
          var %refill = $calc(((((%bar - %energy) - 5) / 5) * 10) * 60) 
          .timer $+ .energy $+ $nick -co 1 $calc($calc(600 - %secs.passed) + %refill) msg $chan $theme $+  $+ $nick $+ , your Energy Bar is now full.
          msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.energy $+ $nick).secs) $+  when your Energy Bar has fully regenerated. ( $+ $time($calc($gmt + $duration($duration($timer(.energy $+ $nick).secs).secs)),h:nntt) TC Time)
        }
      }
      if (%bar == 100) {
        var %min = $asctime($calc($gmt + %daylight),nn)
        var %sec = $asctime($calc($gmt + %daylight),ss)
        var %secs.passed = $calc(%min * 60 + %sec)
        while (%secs.passed > 900) {
          var %secs.passed = $calc(%secs.passed - 900)
        }
        if ($strip(%energy,burc) < $strip(%bar,burc)) { 
          var %refill = $calc($calc($calc($calc($calc(%bar - %energy) - 5) / 5) * 15) * 60)
          .timer $+ .energy $+ $nick -co 1 $calc($calc(900 - %secs.passed) + %refill) msg $chan $theme $+  $+ $nick $+ , your Energy Bar is now full.
          msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.energy $+ $nick).secs) $+  when your Energy Bar has fully regenerated. ( $+ $time($calc($gmt + $duration($duration($timer(.energy $+ $nick).secs).secs)),h:nntt) TC Time)
        }
      }
    }
  }
  if ($1 == You) && (($2 ==  are) || ($2 == will)) && (($3 == in) || ($3 == be)) && (($4 == hospital) || ($4 == here)) && ($5 == for) && ($6 == another) {
    if ($8 == hours,) || ($8 == hour) { var %h = $calc($7 * 3600) }
    if ($10 == minutes) || ($10 == minute) { var %m = $calc($9 * 60) }
    if ($8 == minutes) || ($8 == minute) { var %m = $calc($7 * 60) }
    if ($13 == seconds) { var %s = $12 }
    if ($11 == seconds) { var %s = $10 }
    if ($8 == seconds) { var %s = $7 }
    var %htime = $calc((%h + %m) + %s)
    .timer $+ .hosp $+ $nick -co 1 %htime msg $chan $theme $+  $+ $nick $+ , you are due to be released from hospital.
    msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.hosp $+ $nick).secs)  when you are due to be released from the hospital. ( $+ $time($calc($gmt + $duration($duration($timer(.hosp $+ $nick).secs).secs)),h:nntt) TC Time)
  }
  if ($1 == You) && ($2 == will) && ($3 == be) && ($4 == in) && ($5 == jail) && ($6 == for) { 
    if ($9 == hours,) || ($9 == hour,) { var %h = $calc($8 * 3600) }
    if ($11 == minutes) || ($11 == minute) { var %m = $calc($10 * 60) }
    if ($8 == minutes) || ($8 == minute) { var %m = $calc($7 * 60) }
    if ($14 == seconds) { var %s = $13 }
    if ($10 == seconds) { var %s = $9 }
    if ($8 == seconds) { var %s = $7 }
    var %jtime = $calc((%h + %m) + %s)
    .timer $+ .jail $+ $nick -co 1 %jtime msg $chan $theme $+  $+ $nick $+ , you are due to be released from jail.
    msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.jail $+ $nick).secs) $+  when you are due to be released from the jail. ( $+ $time($calc($gmt + $duration($duration($timer(.jail $+ $nick).secs).secs)),h:nntt) TC Time)
  }
  if ($1-3 == In Education ~) || ($1-3 == [In Education ~) {
    var %d = $calc((($4 * 24) * 60) * 60) | var %h = $calc(($6 * 60) * 60) | var %m = $calc($8 * 60) | var %s = $11
    var %etime = $calc(%d + %h + %m + %s)
    .timer $+ .edu $+ $nick -co 1 %etime msg $chan $theme $+  $+ $nick $+ , your education course is now complete.
    msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.edu $+ $nick).secs) $+  when your education course is complete. ( $+ $time($calc($gmt + $duration($duration($timer(.edu $+ $nick).secs).secs)), h:nntt $+ $chr(44) doo mmm) $+ ) 
  }
  if ($1-3 == It will take) && ($4 isnum) && ($5-8 == weeks to complete.) {
    var %etime = $calc(((($4 * 7) * 24) * 60) * 60)
    .timer $+ .edu $+ $nick -co 1 %etime msg $chan $theme $+  $+ $nick $+ , your education course is now complete.
    msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.edu $+ $nick).secs) $+  when your education course is complete. ( $+ $time($calc($gmt + $duration($duration($timer(.edu $+ $nick).secs).secs)),h:nntt $+ $chr(44) doo mmm) $+ ) 
  }
  if ($1-6 == This course will be completed in) {
    if ($8 == days,) || ($8 == day,) {
      var %etime = $calc($calc(($7 * 24 * 60 * 60) + ($12 * 60)) + $iif(minute isin $10,$9 * 60,$9 * 60 * 60))
    }
    if ($8 == hours) || ($8 == hour) { var %etime = $calc(($7 * 60 * 60) + ($10 * 60)) }
    if ($8 == minute) || ($8 == minutes) { var %etime = $calc($7 * 60) }
    .timer $+ .edu $+ $nick -co 1 %etime msg $chan $theme $+  $+ $nick $+ , your education course is now complete.
    msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.edu $+ $nick).secs) $+  when your education course is complete. ( $+ $time($calc($gmt + $duration($duration($timer(.edu $+ $nick).secs).secs)),h:nntt $+ $chr(44) doo mmm) $+ )
  }
  if (($3 == -) || ($2 == -)) && ((($4 == hrs) || ($5 == hrs)) || ((($4 == mins) || $5 == mins)) && (left isin $2-)) {
    var %octime = $duration($remove($iif($3 == -,$4-,$3-),left))
    .timer $+ .oc $+ $nick -co 1 %octime msg $chan $theme $+  $+ $nick $+ , your organised crime is now ready.
    msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.oc $+ $nick).secs) $+  when your organised crime is ready. ( $+ $time($calc($gmt + $duration($duration($timer(.oc $+ $nick).secs).secs)),h:nntt $+ $chr(44) doo mmm) $+ )
  }
  if ($1-15 == You currently have an investment account. When the time is up, you may withdraw the) && ($remove($16,$chr(44),$chr(36)) isnum) && ($17-24 == and start a new account if you wish.) {
    set -u3 %bank $+ $nick $true
  }
  if ($($+(%,bank,$nick),2)) && (remain. isin $3-) && ($1 isnum) {
    var %btime = $duration($remove($1-,$chr(44),remain.))
    .timer $+ .bank $+ $nick -co 1 %btime msg $chan $theme $+  $+ $nick $+ , your investment is now finished.
    msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.bank $+ $nick).secs) $+  when your investment finishes. ( $+ $time($calc($gmt + $duration($duration($timer(.bank $+ $nick).secs).secs)),h:nntt $+ $chr(44) doo mmm) $+ )     
  }
  if (($1-2 == You have) || ($1-2 == [You have)) && ($remove($3,$chr(44),$chr(36)) isnum) && ($4 == invested,) && ((remain isin $7-) || (remain] isin $7-)) {
    var %btime = $duration($remove($5-,$chr(44),remain,]))
    .timer $+ .bank $+ $nick -co 1 %btime msg $chan $theme $+  $+ $nick $+ , your investment is now finished.
    msg $chan $theme $+  $+ $nick $+ , I will remind you in  $+ $duration($timer(.bank $+ $nick).secs) $+  when your investment finishes. ( $+ $time($calc($gmt + $duration($duration($timer(.bank $+ $nick).secs).secs)),h:nntt $+ $chr(44) doo mmm) $+ )
  }
}
alias -l comma {
  var %a, %b = $regsub($ticks,$1,/\G([+-]?\d+?)(?=(?:\d{3})++(?=\.\d++$|$))/g,\1 $+ $chr(44),%a)
  return %a
}
