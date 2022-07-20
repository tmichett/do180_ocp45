#!/bin/bash

# Building Container Image
cd nodejs
./build.sh

#Running Multi-Container Applicaiton
cd networked
./run.sh

#Adding Data to Database for ToDo List
cd ../../
echo "Waiting for 30 seconds for containers to come up and loading data to MySQL"
sleep 30
echo "Loading data into SQL Container"
mysql -uuser1 -h 172.25.250.9 \
 -pmypa55 -P30306 items < \
 ./nodejs/networked/db.sql
