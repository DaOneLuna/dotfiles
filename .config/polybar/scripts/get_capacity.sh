#!/bin/bash
cap=`upsc cyber | grep -oP "battery\.charge\:* \K([0-9]{1,3})(?=%?)"`
if [ $cap -ge 98 ]; then
	echo "  100%"
elif [ $cap -ge 70 ]; then
	echo "  ${cap}"
elif [ $cap -ge 45 ]; then
	echo "  ${cap}"
elif [ $cap -ge 10 ]; then
	echo "  ${cap}"
else :
	echo "  ${cap}"
fi