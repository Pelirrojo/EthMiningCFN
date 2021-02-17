#!/usr/bin/env bash

# Function to check the command executed was ok or cut the execution with a message
function check {
    if [ "$1" -ne 0 ]; then
    echo "\n¯\_(ツ)_/¯ Problem running script. Please check errors. ¯\_(ツ)_/¯\n"
    exit "$1"
  fi
}

export AWS_REGION=us-east-1                   # Using Oregon
export AWS_DEFAULT_PROFILE=default            # Using a profile at your credentials config

# 1. Check dependencies
aws --version >/dev/null 2>&1 || { echo >&2 "I require AWS CLI Shell but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }

aws s3 ls
check $?

# 2. Deploy the stack:
read -r -p "This script is going to deploy infrastructure on your AWS cloud account, probably incurring in costs. Are you REALLY sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    aws cloudformation list-stacks
fi

echo "\n▂▃▅▇█▓▒░ Mission Accomplished ░▒▓█▇▅▃▂\n"

# EOF :)