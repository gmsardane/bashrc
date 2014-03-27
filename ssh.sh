if [[ -f ${HOME}/.ssh_agent ]] ; then
    source ${HOME}/.ssh_agent 
    pgrep ssh-agent|grep -q $SSH_AGENT_PID
    if [[ $? -ne 0 ]] ; then
        rm ${HOME}/.ssh_agent 
        ssh-agent > ${HOME}/.ssh_agent 
        source ${HOME}/.ssh_agent 
    fi
fi

