** Bash configuration **

My .bashrc file was getting unmanagable, so I split it up into multiple files under .bash.d/.  I have it laid out like this:

* aliases.sh
* color_man.sh
* functions.sh
* env_variables.sh
* prompt.sh
* rbenv.sh
* shell_settings.sh
* secrets.sh

The .bashrc file itself is very simple, it just parses everything in ${HOME}/.bash.d/ with a *.sh file extension.  Most of the files in there are self explanatory; aliases.sh, env_variables.sh, prompt.sh do what you think, color_man.sh adds color too man pages, functions.sh is a file to drop any additional interactive bash functions you want (password generators, netmask calculators ect.), rbenv.sh has some configuration for rbenv and secrets.sh is a file in .gitignore for storing variables that should be kept secret (AWS/GitHub keys ect.).