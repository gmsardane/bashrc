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

    unset nm netmask
}

fuck_off(){
 style_two_names=( linus you off donut king )
 style_one_name=( this that everything everyone pink )
 i=$(( $RANDOM % 5 ))

 if [[ ! -z ${2} ]] ; then
   curl http://foaas.herokuapp.com/${style_two_names[$i]}/${1}/${2}
 else
   curl http://foaas.herokuapp.com/${style_one_name[$i]}/${1}
 fi

 echo ""
}

pass_gen() {
    if [[ $# == 0 ]]; then
      len=12
    else
      len=${1}
    fi

    LC_CTYPE=C head -c 500 /dev/urandom |tr -dc \!-z |head -c ${len}; echo

    unset len
}

git_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "${ref#refs/heads/}"

    unset ref
}

rbenv_version() {
    ver=$(rbenv version) ; echo ${ver%(set*}

    unset ver
}

welcome() {
    which fortune > /dev/null
    fortune_check=$?
    case $- in
    *i*)    # interactive shell
	    echo -e "${WHITE}Welcome to ${LIGHTGREEN}$(hostname)${WHITE}:${NC}"
	    echo -e "    Today's date is "${YELLOW}"$(date +"%A %B %d, %Y")"${NC}
	    echo -e "    The current time is "${YELLOW}"$(date +"%r")"${NC}
	    echo ""
        if [[ $fortune_check -eq 0 ]] ; then
            echo -e ${LIGHTPURPLE}$(fortune -a)${NC}
            echo ""
        fi
    ;;
    *)      # non-interactive shell
    ;;
    esac
}
