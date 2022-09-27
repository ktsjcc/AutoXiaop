#!/bin/bash

. $HOME/xiaop/lib/vars.cfg
. $HOME/xiaop/lib/func.cfg

expect -v &> /dev/null;

if [ $? -eq 0 ];then
	echo "expect and tcl have been installed in your server, so you do not need to install again."
	installation;
	#chmod +x $HOME/xiaop/bin/auto;
	#grep "$HOME/xiaop/bin" $bashProfile &> /dev/null
	#if [ $? -eq 0 ]; then
	#	echo "" > /dev/null;
	#else
	
	#	sed -i "s|$(grep "PATH=" $bashProfile)|$(grep "PATH=" $bashProfile):$HOME/xiaop/bin|g" $bashProfile
	#	echo ">>installation finished, go to : $HOME/xiaop<<"
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
