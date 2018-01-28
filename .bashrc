# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
if [ `which colordiff 2> /dev/null` ]; then
	alias diff='colordiff'
fi
export LESS='-R -S -N --tabs=4'
#export LESSOPEN='| /usr/bin/src-hilite-lesspipe.sh %s'
export HISTIGNORE=rm:cd:exit

export NUM_THREADS=`expr $(cat /proc/cpuinfo | awk '/^processor/{print $3}' | tail -1) - 1`
export OMP_NUM_THREADS=$NUM_THREADS
export MKL_NUM_THREADS=$NUM_THREADS
export OMP_DYNAMIC=false
export OMP_NESTED=true
export MKL_DYNAMIC=false

if [ -z "$TMUX" ]; then

	if [ -e $HOME/.rbenv/bin ]; then
		export PATH=$HOME/.rbenv/bin:$HOME/usr/bin:$PATH
	fi

	export PATH=/usr/local/cuda/bin:$PATH
	export PATH=$HOME/usr/bin:$PATH
	export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:$HOME/usr/lib:/usr/local/lib:/usr/lib64:$LD_LIBRARY_PATH
	export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/local/lib64/pkgconfig:/usr/local/lib/pkgconfig:$HOME/usr/lib/pkgconfig:$PKG_CONFIG_PATH
	export CUDA_HOME=/usr/local/cuda
	export CUDA_DEVICE_ORDER=PCI_BUS_ID

	if [ `which R 2> /dev/null` ]; then
		export VIM_R_INCLUDE_DIR=`R RHOME`/include
		export VIM_R_PKG_PATH=`Rscript -e '.libPaths()[1]' | egrep -o '".+"' | sed -e 's/"//g'`
	fi

	if [ -e /opt/intel/composer_xe_2015/bin/compilervars.sh ]; then
		source /opt/intel/composer_xe_2015/bin/compilervars.sh intel64
	fi

	# linuxbrew
	#export PATH="$HOME/.linuxbrew/bin:$PATH"
	#export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
	#export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
	#export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"

	# pyenv
	if [ ! -e $HOME/.pyenv ]; then
		git clone https://github.com/yyuu/pyenv.git ~/.pyenv
		#git clone https://github.com/yyuu/pyenv-which-ext.git ~/.pyenv/plugins/pyenv-which-ext
	else
		export PYENV_ROOT=$HOME/.pyenv
		export PATH=$PYENV_ROOT/bin:$PATH
		eval "$(pyenv init -)"
	fi
fi

# rbev
#if [ -e $HOME/.rbenv/bin ]; then
#	eval "$(rbenv init -)"
#fi

# python startup
if [ -e $HOME/.pythonrc ]; then
	export PYTHONSTARTUP=$HOME/.pythonrc
fi

# pythonz
if [ ! -e $HOME/.pythonz/ ]; then
	curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash
fi
if [ -s $HOME/.pythonz/etc/bashrc ]; then
	source $HOME/.pythonz/etc/bashrc
fi


# direnv
type direnv > /dev/null 2>&1 && eval "$(direnv hook bash)"

# tmux plugin manager
if [ ! -e ~/.tmux/plugins/tpm ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# bazel

#source ~/usr/share/bazel/bazel-complete-template.bash

#if [ -e /opt/rh/devtoolset-4/enable ]; then
#	source /opt/rh/devtoolset-4/enable
#fi


# IFTTT secret key
if [ -f ~/.ifttt_secret ]; then
	source ~/.ifttt_secret
fi
