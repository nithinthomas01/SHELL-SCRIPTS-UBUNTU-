#!/bin/bash

FREESPACE=$(free -mt| grep Total | awk '{print $4}')
THRES=5000
if [[ $FREESPACE -lt $THRES ]]
then 
	echo "RAM running out please kill!"
else
	echo "RAM space is enough!"
fi
