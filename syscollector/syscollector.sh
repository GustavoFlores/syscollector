#!/bin/bash


function cpu_data {
	kernel=`ssh $1 'uname -sr'`
	CPU=`ssh $1 'cat /proc/cpuinfo | grep processor| tail -1'`
	model=`ssh $1 'cat /proc/cpuinfo | grep "model name"| tail -1'`
	freq=`ssh $1 'cat /proc/cpuinfo | grep "cpu MHz"| tail -1'`
	echo -e "$kernel\n $CPU\n $model\n $freq\n"
	exit
}

cpu_data $1
