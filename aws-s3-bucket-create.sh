#!/bin/bash 
RESULT=2 
until [  $RESULT -eq 0 ]; do
    aws s3 mb s3://public.com --region us-west-2 --profile prod
    RESULT=$?
    sleep 50 
done 
echo "Bucket created!"