#### Environmental variables ####

export PATH="/usr/local/sbin:/usr/local/bin:${PATH}"
export EDITOR="emacsclient"
export CLICOLOR=1

export ARCHFLAGS="-arch x86_64"

export GOPATH="${HOME}/src/go"
if [ ! -e $GOPATH ] ; then
    mkdir $GOPATH
fi
