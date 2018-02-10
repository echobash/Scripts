#!/bin/bash
#Author: NerdOfCode
#Purpose: Adds a few alias's that improve the efficieny of your terminal

#Tested: Linux Mint 18.1 Serena | Kernel Version 4.4.0-79-generic
#Tested: Antergos | Kernel Version: 4.15.1

#Storage for alias's
storage='.1bashrc'
shrt_alias=("content" "kernel")


function available_commands(){
	for i in "${shrt_alias[@]}"
	do
        echo $i
done

}

function custom(){
	printf "Enter custom alias: "
	read alias

	echo -e "Adding:\n"
	echo -e "$alias\n" | tee -a ~/$storage
	sleep 2
	echo "NOTE: you may need to manually run source ~/$storage..."
	source ~/$storage
	exit 0

}

function add_shortcuts(){
	if [ -f ~/$storage ]
	then
		echo "Shortcuts already exist..."
		echo "Please delete $storage and try again"
		exit 1
	fi


	echo -e "Adding\n"
	echo -e '#!/bin/bash' | tee -a ~/$storage
	echo -e '#Author: NerdOfCode' | tee -a ~/$storage
	echo -e '#Auto Generated by bashrc_alias.sh' | tee -a ~/$storage
	echo 'alias content="grep -R $1"' | tee -a ~/$storage
	echo 'alias kernel="uname -r"' | tee -a ~/$storage
	source ~/$storage
	sleep 2
	echo -e "\nNOTE: You may need to manually run 'source $storage'"

  	exit 0;}

function remove_shortcuts(){

	if [ -f ~/$storage ]
	then
		echo -e "Removing\n"
		rm ~/$storage
  		exit 0
	fi
	echo "The shortcuts aren't installed"
	exit 1;}

function options(){
	case $response in
        	"1") 
                	add_shortcuts;;
        	"2")
                	remove_shortcuts;;
        	"5")
                	echo "Good bye";exit;;
		"3")
			available_commands;;
        	"4")
			custom;;
		*)
                	echo "Unknown option selected";;
	esac
}


clear
while :
do
	echo -e "1)Add the shortcuts \n2)Remove the shortcuts\n3)Show available alias's\n4)Add Custom Alias\n5)Exit"
	read -p "Response: " response
	options
	sleep 3
	clear

done