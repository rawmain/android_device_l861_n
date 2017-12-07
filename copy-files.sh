#!/bin/bash

SYSDIR=$1
if [ "x$SYSDIR" = "x" ]; then
echo "You must specify system directory as first argument";
exit
fi

VENDOR=amoi
DEVICE=l861

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

rm -rf $BASE/*

for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
	DIR=`dirname $FILE`
	if [ ! -d $BASE/$DIR ]; then
		mkdir -p $BASE/$DIR
	fi
	if [ -f $SYSDIR/$FILE ]; then
		cp $SYSDIR/$FILE $BASE/$FILE
	fi
done

./setup-makefiles.sh
