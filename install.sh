#!/bin/bash

. $HOME/AutoXiaop/lib/vars.cfg
. $HOME/AutoXiaop/lib/func.cfg

expect -v &> /dev/null;

if [ $? -eq 0 ];then
	echo "expect and tcl have been installed in your server, so you do not need to install again."
	installation;
	#chmod +x $HOME/AutoXiaop/bin/auto;
	#grep "$HOME/AutoXiaop/bin" $bashProfile &> /dev/null
	#if [ $? -eq 0 ]; then
	#	echo "" > /dev/null;
	#else
	
	#	sed -i "s|$(grep "PATH=" $bashProfile)|$(grep "PATH=" $bashProfile):$HOME/AutoXiaop/bin|g" $bashProfile
	#	echo ">>installation finished, go to : $HOME/AutoXiaop<<"
	#	exec bash --login
	#	exit;
	#fi
else
	read -p "lack of dependencies=======>[expect], automatically install by using yum?[Y/N]:" res
	if [ "$(tr "[:lower:]" "[:upper:]" <<<"$res")" == "Y" ]; then

		sudo yum install -y expect;
		installation;

	elif [ "$(tr "[:lower:]" "[:upper:]" <<<"$res")" == "N" ]; then
		
		echo "please intall [expect] mannually then retry."	
		exit;
	fi
fi
