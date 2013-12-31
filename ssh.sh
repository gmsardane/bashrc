pgrep ssh-agent|grep -q $SSH_AGENT_PID
if [[ $? -ne 0 ]] ; then
    if [[ -f ${HOME}/.ssh_agent ]] ; then
        rm ${HOME}/.ssh_agent 
    fi

    ssh-agent > ${HOME}/.ssh_agent 
fi

source ${HOME}/.ssh_agent 
