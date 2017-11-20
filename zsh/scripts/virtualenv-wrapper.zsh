alias venv='source .venv/bin/activate'

DISTRO=`cat /etc/os-release | grep '^ID=' | cut -d= -f2`
WORKON_HOME=$HOME/.virtualenvs

if [ "$DISTRO" = "ubuntu" ]; then
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
else
    source `which virtualenvwrapper.sh`
fi
