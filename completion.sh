which brew > /dev/null
stat=$?

if [[ $stat -eq 0 ]] ; then
  config_path="$(brew --prefix)/etc/bash_completion"
fi

if [ -f "${config_path}" ]; then
  source "${config_path}"
fi

unset config_path stat
