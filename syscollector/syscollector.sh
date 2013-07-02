#!/bin/bash


function cpu_data {
	ssh $1 'uname -a'
	exit
}

cpu_data $1
