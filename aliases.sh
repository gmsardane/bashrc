#### Aliases ####
alias hist='history | grep $1'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias vim_plugin_installer='cd ~/.vim/bundle && git clone ${1} && cd -'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias ls='ls -G'
alias grep='grep --color=auto'
alias chef-gem='sudo /opt/chef/embedded/bin/gem'
alias gns3='sudo /Applications/GNS3.app/Contents/MacOS/GNS3'
function dash {
    open "dash://${1}"
}
