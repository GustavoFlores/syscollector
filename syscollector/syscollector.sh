#!/bin/bash


# For the functons we swap the spaces and new lines for a placeholder.

function cpu_data {
	kernel=`ssh $1 'uname -sr| sed "s/[[:blank:]]\+/#/g"'`
	CPU=`ssh $1 'cat /proc/cpuinfo | grep processor| tail -1'`
	model=`ssh $1 'cat /proc/cpuinfo | grep "model name"| tail -1'`
	freq=`ssh $1 'cat /proc/cpuinfo | grep "cpu MHz"| tail -1'`
	cpudata=`echo ${kernel}!${CPU}!${model}!${freq}|sed 's/[[:blank:]]\+/#/g'`
	echo $cpudata
}


function mem_data {
	memory=`ssh $1 'cat /proc/meminfo | grep MemTotal| sed "s/[[:blank:]]\+/#/g"'`
	memdata=`echo ${memory}| sed 's/[[:blank:]]\+/#/g'`	
	echo "$memdata"
}

cpu_data $1 | sed 's/\#/ /g' | sed 's/\!/\n/g'
mem_data $1 | sed 's/\#/ /g' | sed 's/\!/\n/g'

