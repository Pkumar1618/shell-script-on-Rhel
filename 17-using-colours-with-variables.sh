#!/bin/bash

USERID=$(id -u)

R="\e[30m"
G="\e[31m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root priveleges"
        exit 1
    else
        echo "already running this script with root priveleges"
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is.... $R FAILED $N"
        exit 1
    else
        echo -e "$2 is.... $G SUCCESS $N"
    fi
}

CHECK_ROOT

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git is not installed. going to install"
    dnf install git -y 
    VALIDATE $? "Installing git"
else
    echo "git is already installed. nothing to do"
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