#!/bin/bash
#.... ..... ......   .....  Create a new local user script  ......... ....... .......


#Check if the user is SUDO/ROOT or not
if [[ $UID -ne 0  ]]
then
	echo "NOT A ROOT USER!"
	exit 1
fi


#Take at last one argument for user id else guide user!
if [[ "${#}" -lt 1 ]] 
then 
	echo "USAGE : ${0} Enter the USERNAME and any comment{optional} along with it "
	exit 1
fi

USERNAME=${1}
shift  
COMMENT=${@} 


#create password
PASSWORD=$(date +%s%N)

#create user
useradd -c  "$COMMENT" -m $USERNAME

#check if user is created or not
if [[ $? -ne 0 ]]
then 
	echo "ERROR : User not created!"
	exit 1
fi

# set password for the user
echo "$USERNAME:$PASSWORD" | chpasswd 

#check if password is set or not
if [[ $? -ne 0 ]]
then 
	echo "ERROR : Failed to set the password for the user : $USERNAME"
	exit 1
fi

#force the user to set a new password when logged in for the first time
passwd -e $USERNAME

#display the name and password for the user!
echo "Sucessfully created new user!"
echo "USER NAME IS : $USERNAME"
echo "PASSWORD IS : $PASSWORD"
echo "DONE!"

































	
