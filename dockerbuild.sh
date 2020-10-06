#!/usr/bin/env bash 
set -ex

tag=$1
accountid=$2
region=$3
repo=$4

if [[ -z ${tag} ]]; then
    echo "Must provide string to tag container with"
    exit 1
fi

docker build \
    -t ${accountid}.dkr.ecr.${region}.amazonaws.com/${repo}:${tag} .

echo "Getting docker login from AWS"
eval $(aws ecr get-login --region ${region} --no-include-email --registry-ids ${accountid})
echo "Pushing container"
docker push ${accountid}.dkr.ecr.${region}.amazonaws.com/${repo}:${tag}
