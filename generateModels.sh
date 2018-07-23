#!/bin/bash

set -x

#Stop any openscads that are running
ps -ef | grep -i openscad | grep output | awk '{print $2}' | xargs -r kill

#names.txt should have a name in each line
readarray -t NAMEARRAY < names.txt

echo "There are ${#NAMEARRAY[*]} names"

cores=3
i=0
while [ $i -lt ${#NAMEARRAY[*]}  ]; do
 
    j=0
    while [ $j -lt $cores ]; do
        index=$(( $i + $j ))
	NAME=${NAMEARRAY[$index]}
        if [ ! -z "$NAME" ]; then
	    echo "generating " $NAME 
            cat name.scad | sed "s/^t=.*/t=\"$NAME\";/" > model-${NAME}.scad
	    openscad -o output-$NAME.stl model-$NAME.scad &
        fi
        j=$(($j + 1))
    done
    wait
    i=$(($i + $cores))
done
