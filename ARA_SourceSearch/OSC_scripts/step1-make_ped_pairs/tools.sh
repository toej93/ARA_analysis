#####Functions for getting run and pedestal file full names 

function getRunNumFromDataFile() {

    if [ "$1" == "" ]
	then
	echo "usage: $FUNCNAME <run num>" 1>&2
	return
    fi
    local FILE=$1
    
    local filename=$(basename "$FILE")
    local runnum="${filename%.*}"
    local runnum=`echo "$runnum" | cut -d't' -f2`

    echo $runnum
    return
}

function getRunNumFromPedFile() {

    if [ "$1" == "" ]
	then
	echo "usage: $FUNCNAME <run num>" 1>&2
	return
    fi
    local FILE=$1
    
    local filename=$(basename "$FILE")
    local runnum=${filename:20:4}
    echo $runnum
    return
}


function getPedFileFromRunFile() {
    
    local PED_LIST=$1
    local DATAFILE=$2
    local runNum=$(getRunNumFromDataFile "$DATAFILE")
    local diff=0
    local closestDiff=100000
    local targetFile

    while read line; do 
        local runNumFromPed=$(getRunNumFromPedFile "$line")
	diff=$(expr $runNum - $runNumFromPed)
	if [ $diff -gt 0 ]
	then
		if [ $diff -lt $closestDiff ]
		then
			closestDiff="$diff"	
			targetFile=$line
		fi
	fi
    done < $PED_LIST
    echo $targetFile
    return
}
