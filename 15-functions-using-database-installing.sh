#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is...FAILED"
        exit 1
    else
        echo "$2 is...Success"
    fi
}

if [ $? -ne 0 ]
then
    ehco "Please run this script with root priveleges"
    exit 1
fi

dnf list installed Git

if [ $? -ne 0 ]
then
    echo "Git is not installed. going to install"
    dnf install git -y
    VALIDATE $? "Installing git"
else 
    echo "Git is already install. nothing to do"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Mysql is not installed. going to install"
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"
else
    echo "Mysql is already installed. nothing to do"
fi
