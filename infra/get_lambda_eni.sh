#!/bin/bash

LAMBDA_NAME=$1
SUBNET_INDEX=$2
REGION=$3
PROFILE=$4

ENI_ID=$(aws ec2 describe-network-interfaces --filters Name=description,Values="AWS Lambda VPC ENI-$LAMBDA_NAME*" --query "NetworkInterfaces[$SUBNET_INDEX].NetworkInterfaceId" --output text --region $REGION --profile $PROFILE)

echo "{\"eni_id\": \"$ENI_ID\"}"
