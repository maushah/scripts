#!/bin/bash

bucket=$1

set -ex

echo "Removing all versions from $bucket"

markers=`aws s3api list-object-versions --bucket $bucket |jq '.DeleteMarkers'`

echo "removing delete markers"
for marker in $(echo "${markers}" | jq -r '.[] | @base64'); do 
    marker=$(echo ${marker} | base64 --decode)

    key=`echo $marker | jq -r .Key`
    versionId=`echo $marker | jq -r .VersionId `
    cmd="aws s3api delete-object --bucket $bucket --key $key --version-id $versionId"
    echo $cmd
    $cmd
done
