# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# the following setup uses docker containers to issue your commands, to keep the system clear of interference from different installations and versions of tools


#blockchain development (solidity)
function truffle () {
(docker run -ti --rm -v ${HOME}:/root -p 9545:9545 -v $(pwd):/app cryptng/truffle-suite:latest truffle "$@" && sudo chown -R 1000:1000 *)
}

function truffled () {
(docker run -ti --rm -v $(pwd):/app -p 9545:9545 cryptng/truffle-suite:latest truffle develop "$@")
}

function ngc () {
(docker run -ti --rm -v $(pwd):/app -w /app cryptng/dotnet-nethereum-codegen:1.0.1 /root/.dotnet/tools/Nethereum.Generator.Console "$@" && sudo chown -R 1000:1000 *)
}

#package managers
function npm () {
(docker run -ti --rm -v ${HOME}:/root -v $(pwd):/app cryptng/truffle-suite npm "$@")
}

function yarn () {
(docker run -ti --rm -v ${HOME}:/root -v $(pwd):/myapp danlynn/ember-cli:4.1.1 yarn "$@" && sudo chown -R 1000:1000 *)
}



#web development 
function node () {
(docker run -ti --rm -v ${HOME}:/root -v $(pwd):/app cryptng/truffle-suite node "$@" && sudo chown -R 1000:1000 *)
}

function ember () {
(docker run -ti --rm -v ${HOME}:/root -v $(pwd):/myapp danlynn/ember-cli:4.1.1 ember "$@" && sudo chown -R 1000:1000 *)
}

function embers () {
(docker run -ti --rm -p 4200:4200 -p 7020:7020 -p 7357:7357  -v ${HOME}:/root -v $(pwd):/myapp danlynn/ember-cli:4.1.1 ember serve "$@" && sudo chown -R 1000:1000 *)
}

function angular () {
(docker run -ti --rm -v ${HOME}:/root -v $(pwd):/myapp alexsuch/angular-cli:14.1.2 ng "$@" && sudo chown -R 1000:1000 *)
}

function angulars () {
(docker run -ti --rm -v ${HOME}:/root -v $(pwd):/myapp alexsuch/angular-cli:14.1.2 ng serve "$@" && sudo chown -R 1000:1000 *)
}

#dotnet
function dotnet () {
(docker run -ti --rm -v ${HOME}:/root -v $(pwd):/app -w /app cryptng/dotnet-nethereum-codegen:latest dotnet "$@" && sudo chown -R 1000:1000 *)
}
