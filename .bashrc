# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
if [ `which colordiff 2> /dev/null` ]; then
	alias diff='colordiff'
fi
export LESS='-R -N --tabs=4'
#export LESSOPEN='| /usr/bin/src-hilite-lesspipe.sh %s'


if [ -z "$TMUX" ]; then
	export OMP_NUM_THREADS=10
#	export OMP_DYNAMIC=0
#	export OMP_NESTED=0

	if [ -e $HOME/.rbenv/bin ]; then
		export PATH=$HOME/.rbenv/bin:$HOME/usr/bin:$PATH
	fi

	export LD_LIBRARY_PATH=/usr/local/cuda-6.5/nvvm/lib64:/usr/local/cuda-6.5/lib64:$HOME/usr/lib:/usr/local/lib:/usr/lib64:$LD_LIBRARY_PATH
	export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/local/lib64/pkgconfig:$HOME/usr/lib/pkgconfig:$PKG_CONFIG_PATH

	if [ `which R 2> /dev/null` ]; then
		export R_INCLUDE_DIR=`R RHOME`/include
		export R_PKG_PATH=`Rscript -e '.libPaths()[1]' | egrep -o '".+"' | sed -e 's/"//g'`
	fi

	if [ -e /opt/intel/composer_xe_2015/bin/compilervars.sh ]; then
		source /opt/intel/composer_xe_2015/bin/compilervars.sh intel64
	fi
fi


if [ -e $HOME/.rbenv/bin ]; then
	eval "$(rbenv init -)"
fi
