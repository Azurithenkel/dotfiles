# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:/home/ns/source/v5/scripts:/home/ns/tools/rhel6
PYTHONPATH=/home/ns/source/runbench
export CVSROOT=/project/ci/cvsroot
export PATH
export PYTHONPATH
unset USERNAME

