#!/bin/bash

USERID=$(id -u)

VALIDATE(){  # this validate function
    echo "exit status: $1" # here we are taking exit status with $1 this is first arg. 

}
if [ $? -ne 0 ]
then
    echo "Please run this script with root priveleages."
    exit 1
fi

dnf list installed git

VALIDATE $?  # this validate function exit status we are passing here with $? because it first arg.

