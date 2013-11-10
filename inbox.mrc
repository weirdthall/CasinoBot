;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;The_Almighty_Duelist's Scripts;;;;;;
;;;;;Standalone Inbox Message Service;;;;;
;;;;;;;;;;;;;;;;v.3.0.0.0;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;Loading and Starting;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

on *:LOAD: {
  writeini mail.ini settings channel $$?="Please enter the channel you are going to be using this on."
  echo -a Thank you for choosing one of my scripts! To set specific inbox options, type /inbox | titlebar (C)2009 DJ Bill Enterprizes
}

on *:START: {
  echo -a Just a little reminder for you, type /inbox to set inbox specific options | titlebar (c)2009 DJ Bill Enterprizes
  titlebar $chr(169) $+ 2009 DJ Bill Enterprizes
}

;;;;;;;;;;;;;;;;;
;;;;;aliases;;;;;
;;;;;;;;;;;;;;;;;

alias umail {
  If ($1 == $null) echo -a Error $umail: Not enough parameters
  If ($readini(mail.ini,$1,registered) == yes) return $readini(mail.ini,$1,messages)
}

alias inbox {
  If ($1 == $null) {
    echo -a To set your specific inbox service channel: /inbox channel #channelhere
    echo -a To force an account to register: /inbox sudo make <account name> <password>
    echo -a To force an account to delete: /inbox sudo remove <acount name>
    echo -a To view a list of all current members and their messages: /inbox members
    If ($readini(mail.ini,status,admin) == on) {
      echo -a To view a list of all admin messages: /inbox admin view
      echo -a To turn the admin messaging option off: /inbox admin off
    }
    Else {
      echo -a To turn the admin messaging option on: /inbox admin on
    }
  }
  Else {
    If ($1 == channel) {
      If ($2 == $null) {
        echo -a Please type /inbox channel <your channel here>
      }
      Else {
        writeini mail.ini settings channel $2-
        echo -a Channel changed to $2-
      }
    }
    If ($1 == sudo) {
      If ($2 == make) {
        If ($4 == $null) {
          echo -a Please type $1 $2 <account name> <password>
        }
        Else {
          If ($readini(mail.ini,$3,registered) != yes) {
            writeini mail.ini $3 registered yes
            writeini mail.ini $3 password $4-
            writeini mail.ini $3 logged_in yes
            writeini mail.ini $3 ignore no
            writeini mail.ini $3 newmail yes
            writeini mail.ini $3 messages 1
            write $3 $+ mail.txt From: Admin Date: $asctime(ddmmmyy) Time: $asctime(hh:nn:ss TT) Message: Thank you for choosing our inbox messaging system. To explore further options, type !mail
            $iif($3 ison $mailchan,.notice $3 You have a new message in your !inbox,)
            writeini mail.ini status members $calc($readini(mail.ini,status,members) + 1)
            write mail.txt $3
            echo -a Account created and mail sent.
          }
          Else {
            echo -a $3 is already registered!
          }
        }
      }
      If ($2 == remove) {
        If ($3 == $null) {
          echo -a Please type $1 $2 <account name>
        }
        Else {
          If ($readini(mail.ini,$3,registered) == yes) {
            remini mail.ini $3
            .remove $3 $+ mail.txt
            $iif($3 ison $mailchan,.notice $3 Your account has been deleted.,)
            writeini mail.ini status members $calc($readini(mail.ini,status,members) - 1)
            write -ds $+ $3 mail.txt
            echo -a Account has been deleted.
          }
          Else {
            echo -a There is no such account!
          }
        }
      }
    }
    If ($1 == admin) {
      If ($2 == on) || ($2 == off) {
        writeini mail.ini status admin $2
        echo -a Admin messaging has been turned $2 $+ .
      }
      Elseif ($2 == view) {
        dialog -md viewadmin viewadmin
      }
      Else {
        echo -a Unknown command.
      }
    }
    If ($1 == members) {
      dialog -md members members
    }
  }
}

alias mailchan {
  return $readini(mail.ini,settings,channel)
}

alias mail {
  If ($2 == inbox) {
    writeini mail.ini $1 newmail no
    If ($3 == all) {
      var %temp.1 1
      var %temp.2 $readini(mail.ini,$1,messages)
      var %temp.3 1
      .notice $1 Welcome to your inbox! Please be patient while I display your messages, I will tell you when I'm finished.
      While (%temp.1 <= %temp.2) {
        If ($read($1 $+ mail.txt, %temp.1) != $null) {
          .timer 1 %temp.3 .notice $1 Message %temp.1 $read($1 $+ mail.txt, %temp.1)
          inc %temp.3
        }
        inc %temp.1
      }
      .timer 1 %temp.3 .notice $1 That's it! If you would like to delete a message, type !delete <message number> or type !delete all to delete all your messages!
    }
    If ($3 isnum) {
      If ($read($1 $+ mail.txt, $3) != $null) {
        .notice $1 Here is your message number $3 $+ :
        .notice $1 $read($1 $+ mail.txt, $3)
        .notice $1 If you would like to delete this message, type !delete $3
      }
      Else {
        .notice $1 There is no message number $3 $+ !
      }
    }
  }
  If ($2 == send) {
    writeini mail.ini $3 newmail yes
    writeini mail.ini $3 messages $calc($umail($3) + 1)
    write $3 $+ mail.txt From: $1 Date: $asctime(ddmmmyy) Time: $asctime(hh:nn:ss TT) Message: $4-
    If ($readini(mail.ini,$3,ingore) != yes) {
      If ($3 ison $mailchan) {
        .notice $3 You have new mail in your inbox, type !inbox $umail($3) to view it.
      }
    }
    .notice $1 Message has successfully been sent to $3
  }
  If ($2 == delete) {
    If ($3 == all) {
      writeini mail.ini $1 newmail no
      writeini mail.ini $1 messages 0
      remove $1 $+ mail.txt
      .notice $1 You have deleted all your messages.
    }
    If ($3 == account) {
      remini mail.ini $1
      remove $1 $+ mail.txt
      writeini mail.ini status members $calc($readini(mail.ini,status,members) - 1)
      write -ds $+ $1 mail.txt
      .notice $1 Your account has been deleted.
    }
    If ($3 isnum) {
      writeini mail.ini $1 messages $calc($umail($1) - 1)
      write -dl $+ $3 $1 $+ mail.txt
      .notice $1 Message number $3 has been deleted.
    }
  }
  If ($2 == settings) {
    If ($3 == password) {
      writeini mail.ini $1 password $4-
      .notice $1 Password successfully changed!
    }
    If ($3 == ignore) {
      writeini mail.ini $1 ignore $4
      .notice $1 Your ignore setting has been changed to: $4
    }
  }
  If ($2 == create) {
    writeini mail.ini $1 registered yes
    writeini mail.ini $1 password $3
    writeini mail.ini $1 logged_in yes
    writeini mail.ini $1 ignore no
    writeini mail.ini $1 newmail yes
    writeini mail.ini $1 messages 1
    write $1 $+ mail.txt From: Admin Date: $asctime(ddmmmyy) Time: $asctime(hh:nn:ss TT) Messages: Thank you for choosing the mail service on this channel! To see your options, type !mail
    writeini mail.ini status members $calc($readini(mail.ini,status,members) + 1)
    write mail.txt $1
    .notice $1 You have a new message in your inbox. Please type !inbox 1 to view it.
  }
}

;;;;;;;;;;;;;;;;
;;;;;Events;;;;;
;;;;;;;;;;;;;;;;

on *:JOIN:#: {
  If ($chan == $mailchan) {
    If ($readini(mail.ini,$nick,registered) == yes) {
      If ($readini(mail.ini,$nick,ignore) != yes) {
        notice $nick Welcome back $nick $+ !
        If ($readini(mail.ini,$nick,newmail) == yes) {
          notice $nick You have new mail! To view your inbox, type !inbox
        }
        Else {
          notice $nick You have no new mail, but if you would like to check your mail options, type !mail
        }
      }
    }
    Else {
      If ($readini(mail.ini,$nick,ignore) != yes) {
        .notice $nick Welcome $nick $+ ! Why not register for the mail service?
        .notice $nick Type !mail register <password>
        .notice $nick You can ignore this message from now on by typing !ignore on
      }
    }
  }
}

on *:TEXT:!ignore*:*: {
  If ($readini(mail.ini,$nick,registered) == yes) {
    .notice $nick You can't ignore us! You're registered!
  }
  Else {
    If ($2 == on) {
      writeini mail.ini $nick ignore yes
      .notice $nick You've been added to the ignore list. If you would like to change this, please type !ignore off
    }
    Else {
      writeini mail.ini $nick ignore no
      .notice $nick You've been removed from the ignore list.
    }
  }
}

on *:PART:#: {
  If ($chan == $mailchan) {
    If ($readini(mail.ini,$nick,registered) == yes) {
      writeini mail.ini $nick logged_in no
    }
  }
}

on *:QUIT: {
  If ($readini(mail.ini,$nick,registered) == yes) {
    writeini mail.ini $nick logged_in no
  }
}

on *:NICK: {
  If ($readini(mail.ini,$nick,registered) == yes) {
    writeini mail.ini $nick logged_in no
  }
  If ($readini(mail.ini,$newnick,registered) == yes) {
    If ($readini(mail.ini,$newnick,ignore) != yes) {
      .notice $nick Welcome back $+ $nick $+ ! To see your messages and options, please login by typing !login <password>
    }
  }
}

on ^*:TEXT:!login*:*: {
  haltdef
  If ($readini(mail.ini,$nick,registered) == yes) {
    If ($2 != $null) {
      If ($readini(mail.ini,$nick,password) == $2) {
        writeini mail.ini $nick logged_in yes
        .notice $nick You have been logged in successfully.
      }
      Else {
        .notice $nick Incorrect password.
      }
    }
    Else {
      .notice $nick Please type !login <password>
    }
  }
  Else {
    .notice $nick Please create an account first. !mail register <password>
  }
  close -m $nick
}

on ^*:TEXT:!delete*:*: {
  haltdef
  If ($readini(mail.ini,$nick,registered) == yes) {
    If ($Readini(mail.ini,$nick,logged_in) == yes) {
      If ($2 != $null) {
        If ($2 == all) {
          mail $nick delete all
        }
        Elseif ($2 isnum) {
          mail $nick delete $2
        }
        Else {
          .notice $nick Unknown command. Please type !mail for more help with this.
        }
      }
      Else {
        .notice $nick Please type !mail for more help with this command.
      }
    }
    Else {
      .notice $nick Please login first. !login <password>
    }
  }
  Else {
    .notice $nick Please create an account first. !mail register <password>
  }
  close -m $nick
}

on ^*:TEXT:!send*:*: {
  haltdef
  If ($readini(mail.ini,$nick,registered) == yes) {
    If ($readini(mail.ini,$nick,logged_in) == yes) {
      If ($3 != $null) {
        If ($readini(mail.ini,$2,registered) == yes) {
          mail $nick send $2 $3-
        }
        Else {
          .notice $nick $2 isn't a registered user!
        }
      }
      Else {
        .notice $nick Please type !send <recipient> <message>
      }
    }
    Else {
      .notice $nick Please login first. !login <password>
    }
  }
  Else {
    .notice $nick Please create an account first. !mail register <password>
  }
  close -m $nick
}

on ^*:TEXT:!inbox*:*: {
  haltdef
  If ($readini(mail.ini,$nick,registered) == yes) {
    If ($readini(mail.ini,$nick,logged_in) == yes) {
      If ($2 == $null) {
        mail $nick inbox all
      }
      Else {
        If ($2 isnum) {
          mail $nick inbox $2
        }
        Else {
          mail $nick inbox all
        }
      }
    }
    Else {
      .notice $nick Please login first. !login <password>
    }
  }
  Else {
    .notice $nick Please register an account first. !mail register <password>
  }
  close -m $nick
}

on ^*:TEXT:!mail*:*: {
  haltdef
  If ($readini(mail.ini,$nick,registered) == yes) {
    If ($readini(mail.ini,$nick,logged_in) == yes) {
      .notice $nick Please select from the following options:
      .notice $nick To view your inbox type !inbox, or to view a specific message, type !inbox <message number>
      .notice $nick To send a message to another use, type !send <user> <message>
      .notice $nick To delete a message, type !delete <message number>, or to delete all your messages, type !delete all
      If ($readini(mail.ini,status,admin) == on) {
        .notice $nick To send a message to the admin, please type !admin <message>
      }
    }
    Else {
      .notice $nick Please login first! Please type !login <password>
    }
  }
  Else {
    If ($2 == $null) {
      .notice $nick You don't have an account with us! Please type !mail register <password>
    }
    Else {
      If ($2 == register) {
        If ($3 == $null) {
          .notice $nick Please type !mail register <password>
        }
        Elseif ($3 == $nick) {
          .notice $nick You can't use your own nick as a password!
        }
        Else {
          mail $nick create $3-
        }
      }
    }
  }
  close -m $nick
}

on ^*:TEXT:!admin*:*: {
  haltdef
  If ($readini(mail.ini,$nick,registered) == yes) {
    If ($readini(mail.ini,$nick,logged_in) == yes) {
      If ($2 == $null) {
        .notice $nick Please type !admin <message>
      }
      Else {
        mail $nick send admin $2-
      }
    }
    Else {
      .notice $nick Please login first! Please type !login <password>
    }
  }
  Else {
    .notice $nick You don't have an account yet! Please type !mail register <password>
  }
  close -m $nick
}

;;;;;;;;;;;;;;;;;
;;;;;Dialogs;;;;;
;;;;;;;;;;;;;;;;;

dialog members {
  title Members List
  option dbu
  size -1 -1 102 95
  list 1, 1 1 100 50
  button "New Member", 2, 1 51 100 10
  button "Delete Member", 3, 1 62 100 10, disable
  button "View Messages", 4, 1 73 100 10, disable
  button "Done", 5, 1 84 100 10, cancel
}

dialog viewmessages {
  title Message List
  option dbu
  size -1 -1 301 184
  text "Member:", 1, 1 1 50 10
  text "", 2, 51 1 249 10, right
  list 3, 1 11 300 150
  button "Delete Selected", 4, 1 162 300 10, disable
  button "Delete All", 5, 1 173 300 10
}

dialog viewadmin {
  title Admin Messages
  option dbu
  size -1 -1 301 184
  list 1, 1 1 300 150
  button "Delete Selected", 2, 1 151 300 10, disable
  button "Delete All", 3, 1 162 300 10
  button "Send a message", 4, 1 173 300 10
}

;;;;;;;;;;;;;;;;;;;;;;;
;;;;;Dialog Events;;;;;
;;;;;;;;;;;;;;;;;;;;;;;

on *:DIALOG:members:*:*: {
  If ($devent == init) {
    var %temp.1 1
    var %temp.2 $readini(mail.ini,status,members)
    While (%temp.1 <= %temp.2) {
      If ($read(mail.txt, %temp.1) != $null) {
        did -a $dname 1 $read(mail.txt, %temp.1)
      }
      inc %temp.1
    }
  }
  If ($devent == sclick) {
    If ($did == 1) {
      did -e $dname 3,4
    }
    If ($did == 2) {
      var %temp.account $$?="Please enter a username."
      var %temp.pass $$?="Please enter a password."
      inbox sudo make %temp.account %temp.pass
      did -a $dname 1 %temp.account
      dialog -v $dname
    }
    If ($did == 3) {
      If ($did(1).seltext == $null) {
        did -b $dname 3,4
      }
      Else {
        inbox sudo remove $did(1).seltext
        dialog -x $dname
        dialog -md $dname $dname
      }
    }
    If ($did == 4) {
      If ($did(1).seltext == $null) {
        did -b $dname 3,4
      }
      Else {
        set %mail.focus $did(1).seltext
        dialog -md viewmessages viewmessages
        dialog -x $dname
      }
    }
  }
  If ($devent == dclick) {
    If ($did == 1) {
      set %mail.focus $did(1).seltext
      dialog -md viewmessages viewmessages
      dialog -x $dname
    }
  }
}

on *:DIALOG:viewmessages:*:*: {
  If ($devent == init) {
    If (%mail.focus == $null) {
      dialog -x $dname
      dialog -md members members
    }
    Else {
      did -a $dname 2 %mail.focus
      var %temp.1 1
      var %temp.2 $readini(mail.ini,%mail.focus,messages)
      While (%temp.1 <= %temp.2) {
        If ($read(%mail.focus $+ mail.txt, %temp.1) != $null) {
          did -a $dname 3 $read(%mail.focus $+ mail.txt, %temp.1)
        }
        inc %temp.1
      }
    }
  }
  If ($devent == sclick) {
    If ($did == 3) {
      did -e $dname 4
      echo -a $did(3).seltext
    }
    If ($did == 4) {
      If ($did(3).seltext == $null) {
        did -b $dname 4
      }
      Else {
        mail %mail.focus delete $did(3).sel
        dialog -x $dname
        dialog -md $dname $dname
      }
    }
    If ($did == 5) {
      mail %mail.focus delete all
      did -r $dname 3
      did -b $dname 4
    }
  }
}

on *:DIALOG:viewadmin:*:*: {
  If ($devent == init) {
    If ($readini(mail.ini,status,admin) == on) {
      var %temp.1 1
      var %temp.2 $readini(mail.ini,admin,messages)
      While (%temp.1 <= %temp.2) {
        If ($read(adminmail.txt, %temp.1) != $null) {
          did -a $dname 1 $read(adminmail.txt, %temp.1)
        }
        inc %temp.1
      }
    }
    Else {
      dialog -x $dname
      echo -a Please type /inbox admin on
    }
  }
  If ($devent == sclick) {
    If ($did == 1) {
      did -e $dname 2
    }
    If ($did == 2) {
      If ($did(1).seltext == $null) {
        did -b $dname 2
      }
      Else {
        mail admin delete $did(1).sel
        dialog -x $dname
        dialog -md $dname $dname
      }
    }
    If ($did == 3) {
      mail admin delete all
      dialog -r $dname 1
      did -b $dname 2
    }
    If ($did == 4) {
      var %temp.1 $$?="Please enter the recipient."
      var %temp.2 $$?="Please enter the messages."
      mail admin send %temp.1 %temp.2
    }
  }
}

;;;;;;;;;;;;;;;;;
;;;;;Pop-ups;;;;;
;;;;;;;;;;;;;;;;;

menu nicklist,query {
  -
  Mail
  .Register User: /inbox sudo make $$1 12345
  .Unregister User: /inbox sudo remove $$1
  .View Messages: /set %mail.focus $$1 | /dialog -md viewmessages viewmessages
}

menu * {
  -
  Mail
  .View Admin Messages: /dialog -md viewadmin viewadmin
  .View Members: /inbox members
}

;;;;;;;;;;;;;;;;
;;;;;Safety;;;;;
;;;;;;;;;;;;;;;;

on $*:TEXT:/^[\.!@](.*) [$%](.*)/Si:*:{ halt }
