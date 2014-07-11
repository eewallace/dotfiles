typeset -U path
path=(`ruby -rubygems -e "puts Gem.user_dir"`/bin ~/bin $path ~/.rvm/bin .)
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
alias shutdown='systemctl halt'
