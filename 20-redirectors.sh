#/bin/bash
LOGS_FOLDER="/var/log/shell-script" 
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) # echo "20-redirectories.sh" | cut -d "." -f1
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
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
        echo -e "$2 is...$R FAILED $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 is....$G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE :: $N sudo sh 20-redirectors.sh package1 package2 ..." | tee -a $LOG_FILE
    exit 1
}

echo "Script started executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT

if [ $# -eq 0 ] # $# is to check the how many args you will get
then
   USAGE
fi

# when we execute the script like bash with script name with args like mysql git postfix  
for package in $@ # $@ refers to all arguments passed through it 
do 
    dnf list installed $package | tee -a $LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed. going to install" | tee -a $LOG_FILE
        dnf install $package -y
        VALIDATE $? "installing $package"
    else
        echo "$package is already installed. nothing to do" | tee -a $LOG_FILE
    fi
done