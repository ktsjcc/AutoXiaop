#!/bin/bash
bashProfile=~/.bash_profile
expect -v &> /dev/null;
if [ $? -eq 0 ];then
	echo "expect and tcl have been installed in your server, so you do not need to install again."
	chmod +x auto;
	#mv auto.sh /usr/bin/auto
	#mkdir -p /usr/share/AutoXiaop/conf; cp -a ./send.conf.template /usr/share/AutoXiaop/conf/send.conf.template
	#mkdir -p /usr/share/AutoXiaop/bin;  cp -a ./auto /usr/share/AutoXiaop/bin/auto
	#mkdir -p /usr/share/AutoXiaop/lib;  cp -a ./func.cfg /usr/share/AutoXiaop/lib/func.cfg
	sed -i "s|$(grep "PATH=" $bashProfile)|$(grep "PATH=" $bashProfile):$HOME/xiaop|g" $bashProfile
        echo \alias auto="$HOME/xiaop/bin/auto|grep -v password" >> $bashProfile
	echo ">>installation finished, go to : $HOME/xiaop<<"
else
	read -p "lack of dependencies=======>[expect], automatically install by using yum?[Y/N]:" res
	if [ "$(tr "[:lower:]" "[:upper:]" <<<"$res")" == "Y" ]; then

		sudo yum install -y expect;

	elif [ "$(tr "[:lower:]" "[:upper:]" <<<"$res")" == "N" ]; then
		
		echo "please intall [expect] mannually then retry."	
		exit;
	fi
fi
