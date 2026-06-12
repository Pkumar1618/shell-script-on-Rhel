#!/bin/bash

USERID=$(id -u)

CHECK_ROOT(){
    if [ $? -ne 0 ]
    then
        echo "Please run this script with root priveleges."
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is...FAILED"
        exit 1
    else
        echo "$2 is...success"
    fi
}

CHECK_ROOT

dnf list installed Git

if [ $? -ne 0 ]
then
    echo "Git is not installed. going to install"
    dnf install git -y
    VALIDATE $? "Installing git"
else
    echo "Git is already installed.. noting to do"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Mysql is not installed. going to install"
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else
    echo "Mysql is already installed. nothing to do"
fi

dnf list installed postfix

if [ $? -ne 0 ]
then 
    echo "postfix is not installed. going to install"
    dnf install postfix -y
    VALIDATE $? "Installing postfix"
else
    echo "postfix is already installed. nothing to do"
fi