#!/bin/bash
a=`upsc cyber | grep -oP "ups\.load\:* \K([0-9]+)"`
echo $(( a * 10 ))