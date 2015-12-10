#!/bin/bash

if [ -z "$2" ]
	then
	cat $1 | underscore pretty
fi

if [ "$2" == "m" ]
	then
	cat $1 | underscore pretty | more
fi

if [ "$2" == "l" ]
	then
	cat $1 | underscore pretty | less
fi