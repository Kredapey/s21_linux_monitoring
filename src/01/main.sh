#!/bin/bash

param=$1

if [[ $param =~ ^[0-9]+$ ]]; then
    echo "Invalid input: parametr is number"
else
    echo "Parametr is $param"
fi