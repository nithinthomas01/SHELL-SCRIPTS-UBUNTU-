#!/bin/bash
#$Revison : 1

#............variables
BASE=/home/nithin/Desktop/shell
DAYS=10
DEPTH=1
RUN=0


#............directiory existence check
if [ ! -d $BASE ]
then
	echo "directory dosn't exist!"
	exit 1
fi
	
#...............create archeive folder if it does not exist
if [ ! -d $BASE/archeive ]
then
	mkdir $BASE/archeive
fi
#................iterate over files and check the size
for i in $(find $BASE -maxdepth $DEPTH -type f -size -20M)
do 
	echo $i
	gzip $i || echo exit 1 
	mv $i.gz $BASE/archeive || exit 1
done	
