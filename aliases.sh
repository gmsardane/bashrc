#### Aliases ####
alias hist='history | grep $1'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias ls='ls -G'
alias grep='grep --color=auto'
function dash {
    open "dash://${1}"
}
