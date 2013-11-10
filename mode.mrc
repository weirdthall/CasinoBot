; Mode changing script
; Written by WeirdThall
; v0.6 04-10-2013
; First iteration of script.  Codes set up, no restrictions on who can access yet.
; Second iteration of script. Basic access rights set, need to stop bot being able to de-op itself.

on *:load:{
  echo -at 4Mode changer script v0.5 by WeirdThall
}

on *:TEXT:+q*:#: { 
  if (!$nick($chan,$nick,@&~)) { return }
  if ($2 == $null) { mode # +q $nick } 
  else { mode # +q $2 }
}

on *:TEXT:+a*:#: { 
  if (!$nick($chan,$nick,@&~)) { return }
  if ($2 == $null) { mode # +a $nick } 
  else { mode # +a $2 }
}

on *:TEXT:+o*:#: { 
  if (!$nick($chan,$nick,@&~)) { return }
  if ($2 == $null) { mode # +o $nick } 
  else { mode # +o $2 }
}

on *:TEXT:+h*:#: { 
  if (!$nick($chan,$nick,@&~)) { return }
  if ($2 == $null) { mode # +h $nick } 
  else { mode # +h $2 }
}

on *:TEXT:+v*:#: { 
  if (!$nick($chan,$nick,@&~)) { return }
  if ($2 == $null) { mode # +v $nick } 
  else { mode # +v $2 }
}

on *:TEXT:-q*:#: { 
  if (!$nick($chan,$nick,@&~)) { return }
  if ($2 == $null) { mode # -q $nick } 
  else { mode # -q $2 }
}

on *:TEXT:-a*:#: { 
  if (!$nick($chan,$nick,@&~)) { return }
  if ($2 == $null) { mode # -a $nick } 
  else { mode # -a $2 }
}

on *:TEXT:-o*:#: { 
  if (!$nick($chan,$nick,@&~)) { return }
  if ($2 == $null) { mode # -o $nick } 
  else { mode # -o $2 }
}

on *:TEXT:-h*:#: { 
  if (!$nick($chan,$nick,@&~)) { return }
  if ($2 == $null) { mode # -h $nick } 
  else { mode # -h $2 }
}

on *:TEXT:-v*:#: { 
  if (!$nick($chan,$nick,@&~)) { return }
  if ($2 == $null) { mode # -v $nick } 
  else { mode # -v $2 }
}