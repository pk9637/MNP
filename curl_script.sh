#!/bin/bash

curl http://34.205.65.251:8004/ > /dev/null

if [ $? == 0 ]
then
echo 'Application running fine'
else
echo 'Application failed'
fi
