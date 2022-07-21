#!/bin/bash

cd /home/student/DO180/labs/multicontainer-application
mysql -uuser1 -h 127.0.0.1 -pmypa55 -P3306 items < db.sql

#Expose Route to ToDo List Application
oc expose service todoapi

#Get Route and Show it
oc get route

#Verify To-Do List

echo "Open Firefox with the route provided and verify ToDo List"
echo "Remember to add /todo/ to the route"

