#### PS1 Prompt ####

# Define Colors #
BLACK='\033[0;30m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
BROWN='\033[0;33m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTBLUE='\033[1;34m'
LIGHTGREEN='\033[1;32m'
LIGHTCYAN='\033[1;36m'
LIGHTRED='\033[1;31m'
LIGHTPURPLE='\033[1;35m'
YELLOW='\033[1;33m'
WHITE="\033[1;37m"
NC="\033[0m"

git_prompt() {
  if [ -z "$git_branch" ] ; then
    branch=$(git_branch)
    stat=$?
    if [[ $stat -eq 0 ]] ; then
      gbranch="Git Branch: ${branch}"
    else
      gbranch=""
    fi
  fi

  echo -n $gbranch
}

ruby_prompt() {
  if [ -z "$rprompt" ] ; then
    version=$(rbenv version)
    if [ "${version% (set*}" == "system" ] ; then
      export rprompt="Ruby Version: System"
    else
      export rprompt="Ruby Version: ${version% (set*}"
    fi
  fi

  echo -n $rprompt
}

chef_prompt() {
  if [ -z "$cprompt" ] ; then
    if [[ -f ./.chef/knife.rb && $PWD != ${HOME} ]] ; then
      export cprompt="Knife config: ./.chef/knife.rb"
    else
      conf_dir=$(readlink ${HOME}/.chef)
      export cprompt="Knife config: ${conf_dir##*/}"
    fi
  fi

  echo -n $cprompt
}

prompt_command() {
  if [ -z "$temp" ] ; then
    hostname=$(hostname -s)
    username=$(whoami)
    pwd_git=$?
    #   Find the width of the prompt:
    TERMWIDTH=${COLUMNS}
  
    export temp="-- $(date) - $(ruby_prompt) - $(git_prompt) - $(chef_prompt) -   ${PWD} ---"
  
    fillsize=$(expr ${TERMWIDTH} - ${#temp})
  
    if [[ $fillsize -ge 0 ]] ; then
      fill="-------------------------------------------------------------------------"
      fill="${fill}------------------------------------------------------------------"
      fill="${fill}------------------------------------------------------------------"
      fill="${fill}------------------------------------------------------------------"
      fill="${fill:0:${fillsize}}"
      dir="${PWD}"
    fi
  fi

  if [[ $fillsize -lt 0 ]] ; then
    fill=""
    let cut=3-${fillsize}
    dir="...${PWD:${cut}}"
  fi
}

unset_vars() {
  unset fillsize cut temp TERMWIDTH pwd_git hostname username
  unset conf_dir cprompt
  unset version rprompt
  unset branch stat
}

PROMPT_COMMAND="prompt_command ; ${PROMPT_COMMAND}"

PS1="\[${NC}\]-- \[${WHITE}\]\$(date)\[${NC}\] - "
PS1="${PS1}\[${LIGHTRED}\]\$(ruby_prompt)\[${NC}\] - "
PS1="${PS1}\[${YELLOW}\]\$(git_prompt)\[${NC}\] - "
PS1="${PS1}\[${LIGHTPURPLE}\]\$(chef_prompt)\[${NC}\] "
PS1="${PS1}---\${fill}- \[${LIGHTBLUE}\]\$dir \[${NC}\]--\n"
PS1="${PS1}-- \[${LIGHTCYAN}\]\u\[${NC}\]@\[${BROWN}\]\h \[${NC}\] \$ \$(unset_vars)"

export PS1
