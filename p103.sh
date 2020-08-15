#!/bin/bash

#This script downloads the repositories at n4rus to merge then into one
#p103 is an product from n4rus in service to the A100 & 3 company project

echo "Hello $USER!"
echo "This script one day will be set to an a.i. ..."
echo "I shall assist you to use the script for now on."

#1. Clone n4rus original repositories
git init
echo "Would you like to download the repositories from" 
echo "github.com/n4rus? Type 'y' for yes or 'n' for no:"

read -n 1 pushorno
echo

if [ $pushorno == "n" ]; then
    echo "Proceeding without cloning ..."
    echo "Alert: Without the repos the script may not function."
elif [ $pushorno == "y" ]; then
    echo "Starting git clone ..."
    git clone https://github.com/n4rus/a100e3
    #io must be already cloned as p103.sh must be initiated inside it
    #git clone https://github.com/n4rus/a100e3.github.io
    git clone https://github.com/n4rus/misc
    git clone https://github.com/n4rus/n4rus.github.io
    git clone https://github.com/n4rus/p103
    git clone https://github.com/n4rus/pi
    git clone https://github.com/n4rus/white-void
    #2. Make 103 dir to move the folders into it
    echo "Now moving them into the a100e3 folder"
    mv n4rus.github.io ./a100e3/ -v
    mv pi ./a100e3/ -v
    mv p103 ./a100e3/ -v 
    mv white-void ./a100e3/ -v
    mv misc ./a100e3 -v
else
	    echo "Input not recognized, proceeding without cloning ..."
	    echo "Alert: Without the repos the script may not function."
fi

#3. Merge and order content ocording to p103
echo "Create the python script file and the item table:"
echo "a100e3 item list into a100e3 file and within the a100e3.py script"
ls -lt ./* >> a100e3.dat
echo "#!"/bin/python > a100e3.py
echo "#" >> a100e3.py
echo """" >> a100e3.py
cat a100e3.dat >> a100e3.py
echo """" >> a100e3.py

#We could add some code to search an item accordinng to user intentions 
#var=user-int_or_variable+-err
#find ./* | grep var

#4. Call the user for quit or proceed to commit
echo "Directory tree sucessfully updated!"
echo "Type 'q' to quit or 'c' to commit, then press [Enter]:"
read -n 1 commitquit
echo

if [ $commitquit == "q" ]; then
    echo "You are leaving the script, bye!"
elif [ $commitquit == "c" ]; then
	echo "Proceeding to commit ..."
	
	#5. Call the user to add and commit
	git add --all
	echo "Initializing user interface ..."
	echo "Enter commentary to commit followed by [Enter]:"
	
	read commentary
	git commit -m "$commentary"
	#6. Call the user to push
	echo "Commit successfully updated, do you want to upload the updates?"
	echo "Type 'y' for yes or 'n' for no"
	read updateyn
	if [ $updateyn == "y"]; then
	   echo "proceeding to push..."
	   echo "Type the number of the repository to update followed by [Enter]:"
	   echo " [0] = https://github.com/n4rus/a100e3 "
	   echo " [1] = https://github.com/n4rus/a100e3.github.io"
	   echo " [2] = https://github.com/n4rus/n4rus.github.io"
	   echo " [3] = https://github.com/n4rus/misc"
	   echo " [4] = https://github.com/n4rus/p103"
	   echo " [5] = https://github.com/n4rus/pi"
	   echo " [6] = https://github.com/n4rus/white-void"
	   0="https://github.com/n4rus/a100e3"
	   1="https://github.com/n4rus/a100e3.github.io"
	   2="https://github.com/n4rus/n4rus.github.io"
	   3="https://github.com/n4rus/misc"
	   4="https://github.com/n4rus/p103"
	   5="https://github.com/n4rus/pi"
	   6="https://github.com/n4rus/white-void"
	   read reponame
	   git push $reponame    
	   elif [ $updateyn == "n"]; then
		echo "Don't forget to update later, bye!"
	   else
	       echo "You typed something else, please restart the script."
	       fi
else
    echo "Input not recognized, quiting ..."
fi
    exit 1
