#!/usr/bin/env bash

# Check dependencies
aws --version >/dev/null 2>&1 || { echo >&2 "I require AWS CLI Shell but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }
curl --version >/dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }

# Function to check the command executed was ok or cut the execution with a message
function check {
    if [ "$1" -ne 0 ]; then
    echo "\n¯\_(ツ)_/¯ Problem running script. Please check errors. ¯\_(ツ)_/¯\n"
    exit "$1"
  fi
}

AWS_REGION=eu-west-1                   # Using Oregon
AWS_DEFAULT_PROFILE=default            # Using a profile at your credentials config

aws s3 ls >> /dev/null
check $?


# 2. Deploy the stack:
read -r -p "This script is going to deploy infrastructure on your AWS cloud account, probably incurring in costs. Are you REALLY sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
  aws cloudformation deploy \
    --stack-name eth-mining-cfn \
    --template eth-mining-cfn.template \
    --parameter-overrides \
      DefaultVPCId=$(aws ec2 describe-vpcs --query 'Vpcs[0].VpcId' --output text) \
      HomeIp=$(curl -s http://checkip.amazonaws.com/)/32 \
    --capabilities CAPABILITY_IAM \
    --tags \
      project="eth-mining"
fi

echo "\n▂▃▅▇█▓▒░ Mission Accomplished ░▒▓█▇▅▃▂\n"

# EOF :)
