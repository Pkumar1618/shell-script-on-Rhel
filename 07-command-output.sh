#!/bin/bash

# How do you run a command inside the shell script and get the value?

# variable=$(command) when we run this command in side shell script after execute the shell script  whatever output comes that output saves in varible

DATE=$(date +%F)

echo "Today date is: $DATE"