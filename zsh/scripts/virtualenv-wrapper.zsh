alias venv='source .venv/bin/activate'

WORKON_HOME=$HOME/.virtualenvs

if [ "$DISTRO" = "ubuntu" ]; then
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
else
    source `which virtualenvwrapper.sh`
fi
