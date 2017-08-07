# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export PATH=$PATH:~/lib/:~/bin/:~/sauce/v5/scripts/:~/sauce/ivybase/scripts
export PYTHONPATH=/home/tp/sauce/runbench:/home/tp/sauce/
export CVSROOT=/project/ci/cvsroot

unset USERNAME

export DICTIONARY='en_GB'
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTTIMEFORMAT="%H:%M > "
export HISTIGNORE="&:bg:fg:ll:h"
export HOSTFILE=$HOME/.hosts    # Put list of remote hosts in ~/.hosts ...

export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'

# Use this if lesspipe.sh exists
export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

export LC_ALL=en_GB.UTF-8

#Java home override due to ivy fedora 25 badness
# export JAVA_HOME=$(readlink -f /usr/lib/jvm/java-*-openjdk-*/jre)

