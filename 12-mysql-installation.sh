#!/bin/bash

USERID=(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run this script with root priveleges"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Mysql is not installed, going to install"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Mysql installation is failure. check it.."
        exit 1
    else
        echo "mysql installation is success."
    fi
else
    echo "Mysql is already installed nothing to do.."
fi