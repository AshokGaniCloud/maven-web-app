#!/bin/bash
Cloud=AWS
Tech=Devops

echo "Currently you are working in this Technology is: $Tech"

echo "We are using a cloud as $Cloud in my company."

age=30

if test $age -eq 30
then
        echo "you are eligible to vote."
else
        echo "you are not eligible to vote."
fi
echo "writing a Sample nested if..."

if test $age -lt 35
then
        echo "you are a youth."
        if test $age -gt 10
        then
                echo "you are having a Job & also you are married."
        else
                echo "you are not having a Job & also you are not married."
        fi
else
        echo "you are not youth."
fi

echo "writing  a Multiple if method or elif method.."

if test $age -gt 35
then
        echo "you are a Middle aged person."
elif test $age -ge 40
then
        echo "you are a becoming a Senior Person."
elif test $age -lt 10
then
        echo "you are a Kid."
elif test $age -le 15
then
        echo "you are a becoming Teenage Person."
elif test $age -ne 30
then
        echo "you are a Teenager and also present you are studing engineer."
elif test $age -eq 30
then
        echo "you are a Youth & also having a Job."
else
        echo "You are a Old Citizen."
fi

echo "writing a Switch case method..."

case "$age" in
        8)
                echo "you are a Kid." ;;
        14)
                echo "you are a Teenager." ;;
        19)
                echo "You are eligible to vote." ;;
        24)
                echo "You are a youth." ;;
        27)
                echo "you are a jobholder." ;;
        30)
                echo "you are a Youth & also Married." ;;
        default)
                echo "You are a Senior Citizen."
                ;;
esac

echo "Writing a Sample File test of rwo permisions."

if [ -f /root/file.txt ]
then
        echo "file was exists in this directory."
else
        echo "file was not exists in this directory."
fi

if [ -r /root/ansible/playbook.yaml ]
then
        echo "file has read permissions."
else
        echo "file has not having read permissions."
fi
if [ -w /root/newfile.txt ]
then
        echo "file has write permissions."
else
        echo "file has not write permissions."
fi

if [ -x /root/script.sh ]
then
        echo "file has write permissions."
else
        echo "file has not write permissions."
fi

if [ -e /root/myfile.txt ]
then
        echo "file is exists in $HOME"
else
        echo "file is not exists in $HOME"
fi

if [ -d /root/ansible ]
then
        echo "directory exists in $HOME"
else
        echo "directory is not exists in $HOME"
fi
if [[ "${age}" -eq 30 ]]
then
        echo "you are a youth & also having a Software Job."
fi

if [ -h /root/file ]
then
        echo "file is symlink file."
else
        echo "file is not a symlink file."
fi

if (( $age > 10 ))
then
        echo "you are a youth & eligible to vote & also having a Job."
fi

if [ -s /root/script.sh ]
then
        echo "file length is gt 0 byte."
else
        echo "file length is not gt 0 byte."
fi

if [ /root/file.txt -nt /root/ansible/playbook.yaml ]
then
        echo "file is newer than yaml file."
else
        echo "file is not newer than yaml file."
fi
if [ /root/ansible/playbook.yaml -ot /root/file.txt ]
then
        echo "yaml file is older than regular file."
else
        echo "yaml file is not older than regular file."
fi

if [ /root/file.txt -ef /root/file3.txt ]
then
        echo "both files are same."
else
        echo "both files are not same."
fi

if [ -z "${Cloud}" ]
then
        echo "String is not empty."
else
        echo "String is Empty."
fi

if [ -n "${Cloud}" ]
then
        echo "String is not empty String and have some data."
else
        echo "string is empty and not having any data."
fi

if [[ "${Cloud}" == "${Cloud}" ]]
then
        echo "Both String values are equal."
else
        echo "Both String values are not equal."
fi

if [[ "${Cloud}" != "${Tech}" ]]
then
        echo "Both String values are not Equal,Because String address is differrent."
else
        echo "Both String values are Equal,Because String Address is same."
fi

echo "**************************************"

myage=27

if [[ "${age}" > "${myage}" ]]
then
        echo "$age string is gt $myage string."
else
 echo "$age string is not gt $myage string value."
fi

if [[ "${myage}" < "${age}" ]]
then
        echo "$myage String value is lt $age String value."
else
        echo "$myage String value is lt $age String value."
fi

echo "Checking a String values are empty or not"
echo "..............................................."

if [[ -z "$Cloud" ]]; then
    echo "String is empty"
elif [[ -n "$Cloud" ]]; then
    echo "String is not empty"
else
echo "This never happens"
fi

echo "**************************************"

if [[ "${age}" -gt 0 && "${age}" -lt 35 ]]
then
        echo "you are a youth & also have a Software Field Job."
else
        echo "you are a not youth & also you have not a Software Field Job."
fi


if [[ "${myage}" -lt 35 || "${myage}" -eq 27 ]]
then
        echo "You are a DevopsEngineer from mnc company."
else
echo "you are not a DevopsEngineer from mnc company."
fi

if [ ! "${age}" ]
then
        echo "you are a Teenager."
else
        echo "you are a Senior Citizen."
fi

echo "****************************************"
echo "..........................................."
echo " "

IFS=","

echo "First Argument is: " $1
echo "Second Argument is: " $2

echo "Third Argument is: " $3

echo "Fourth Argument is: " $4

echo "All Arguments list is: " $@

echo "Number of Arguments Passed:" $#

echo "All Arguments with IFS is:" $*

echo "Script Name is: " $0

echo "Process Id of the Shell is: " $$

echo "Process last argument of previous command id is: " $_

echo "process hostflag command id is: " $-
echo "******************************************"

echo "bash Inline Comment......."

: '
This is a
very neat comment
in bash
'
echo ".........................."

MyCloud="Azure"

echo "The length of String is: ${MyCloud:0:length}"

SRC=/root/ansible/playbook.yaml
BASEPATH=${SRC##*/}
echo $BASEPATH

DIRPATH=${SRC%$BASEPATH}
echo $DIRPATH

STR="HELLO WORLD!"
echo ${STR,}
echo ${STR,,}

STR1="hello world!"
echo ${STR1^}
echo ${STR^^}

ARR=(hello World)
echo "${ARR[@],}"
echo "${ARR[@]^}"



