#!/bin/bash

file="./build.properties"

function prop {
    grep "${1}" ${file} | cut -d'=' -f2
}

echo "BUILD_NUMBER     = " $(prop 'BUILD_NUMBER')
echo "WORKSPACE        = " $(prop 'WORKSPACE')
echo "JOB_NAME         = " $(prop 'JOB_NAME')
echo "BUILD_NUMBER     = " $(prop 'BUILD_NUMBER')
echo "JENKINS_URL      = " $(prop 'JENKINS_URL')
echo "REPO_URL         = " $(prop 'REPO_URL')

