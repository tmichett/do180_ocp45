#!/bin/bash

#Login to OCP and Create Project
source /usr/local/etc/ocp4.config

oc login -u ${RHT_OCP4_DEV_USER} -p ${RHT_OCP4_DEV_PASSWORD} ${RHT_OCP4_MASTER_API}
oc new-project ${RHT_OCP4_DEV_USER}-application

#Create Application from YAML
cd /home/student/DO180/labs/multicontainer-application
oc create -f todo-app.yml

# Get and Show Pod Status
oc get pods 
echo "Waiting for 15 seconds"
sleep 15
echo "###########Still starting ##############"
oc get pods
sleep 15
echo "######## Should be up  ###############"
oc get pods

#Load Database
echo "Port forwarding to MySQL - open additional terminal to load database - run LoadDB.sh"
oc port-forward mysql 3306:3306 
