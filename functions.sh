#### Custom Commands ####
get_nm() {
    # Set nm first
    nm=$1    

    if [ "$nm" -le 8 ] ; then
	netmask=$(echo "256 - (2^(8 - $nm))" | bc).0.0.0
    elif [ "$nm" -le 16 ] ; then
	netmask=255.$(echo "256 - (2^(16 - $nm))" | bc).0.0
    elif [ "$nm" -le 24 ] ; then
	netmask=255.255.$(echo "256 - (2^(24 - $nm))" | bc).0
    elif [ "$nm" -le 32 ] ; then
	netmask=255.255.255.$(echo "256 - (2^(32 - $nm))" | bc)
    else
	echo "Bad netmask" 1>&2;
    fi
    echo $netmask
}

pass_gen() {
    if [[ $# == 0 ]]; then
      len=12
    else
      len=${1}
    fi

    head -c 500 /dev/urandom |tr -dc \!-z |head -c ${len}; echo
}

git_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "${ref#refs/heads/}"
}

rbenv_version() {
  ver=$(rbenv version) ; echo ${ver%(set*}
}

welcome() {
case $- in
*i*)    # interactive shell
	echo -e "${WHITE}Welcome to ${LIGHTGREEN}$(hostname)${WHITE}:${NC}"
	echo -e "    Today's date is "${YELLOW}"$(date +"%A %B %d, %Y")"${NC}
	echo -e "    The current time is "${YELLOW}"$(date +"%r")"${NC}
	echo ""
	echo -e ${LIGHTPURPLE}$(fortune -a)${NC}
	echo ""
;;
*)      # non-interactive shell
;;
esac
}
