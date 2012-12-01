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
  branch=$(git_branch)
  stat=$?
  if [[ $stat -eq 0 ]] ; then
    echo -n "Git Branch: ${branch}"
  else
    echo -n ""
    fi
}

ruby_prompt() {
  version=$(rbenv version)
  if [ "${version% (set*}" == "system" ] ; then
    echo -n ""
  else
    echo -n "Ruby Version: ${version% (set*}"
  fi
}

prompt_command() {
  hname=$(hostname -s)
  uname=$(whoami)
  rver=$(rbenv_version)
  gbranch=$(git_branch)
  pwd_git=$?
  #   Find the width of the prompt:
  TERMWIDTH=${COLUMNS}

  temp="-- $(date) - $(ruby_prompt) - $(git_prompt) --- ${PWD} ---"

  fillsize=$(expr ${TERMWIDTH} - ${#temp})

  if [[ $fillsize -ge 0 ]] ; then
  fill="-------------------------------------------------------------------------------------------------------------------------------------------"
  fill="${fill:0:${fillsize}}"
  dir="${PWD}"
  fi

  if [[ $fillsize -lt 0 ]] ; then
  fill=""
  let cut=3-${fillsize}
  dir="...${PWD:${cut}}"
  fi
}

PROMPT_COMMAND=prompt_command

PS1="\[${NC}\]-- \[${WHITE}\]\$(date)\[${NC}\] - "
PS1="${PS1}\[${LIGHTRED}\]\$(ruby_prompt)\[${NC}\] - "
PS1="${PS1}\[${YELLOW}\]\$(git_prompt)\[${NC}\] "
PS1="${PS1}---\${fill}- \[${LIGHTRED}\]\$dir \[${NC}\]--\n"
PS1="${PS1}-- \[${LIGHTCYAN}\]\u\[${NC}\]@\[${BROWN}\]\h \[${NC}\]\$ "

export PS1