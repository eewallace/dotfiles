
function host_color() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo 'red'
  else
    echo 'magenta'
  fi
}

function host() {
	echo '@'`hostname`
}	

function time_spacer() {
  echo 
}

PROMPT='%F{blue}╭─%F{cyan}%n%F{white}@%F{$(host_color)}%m %F{cyan}%~
%F{blue}╰─>%f '
RPROMPT="%F{green}%*%f"
