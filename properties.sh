#!/bin/bash

file="./build.properties"

function prop {
    grep "${1}" ${file} | cut -d'=' -f2
}

echo "WORKSPACE = " $(prop 'BUILD')
echo "WORKSPACE = " $(prop 'WORKSPACE')
echo "TAG       = " $(prop 'GIT_URL')
