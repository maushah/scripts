#!/bin/bash
#loop AWS profiles
  buckets=($(aws s3 ls s3:// --recursive --region ap-southeast-1 | awk '{print $3}'))

#loop S3 buckets
  for j in "${buckets[@]}"; do
  echo "${j}"
  echo "## Check Versioning Status"
  aws s3api get-bucket-versioning --bucket "${j}"  --region ap-southeast-1  --output text | awk '{print}'
  echo "## Check Encryption Status"
  aws s3api get-bucket-encryption --bucket "${j}"  --region ap-southeast-1  --output text | awk '{print}'
  echo "## Check Bucket Public Access Block Status"
  aws s3api get-public-access-block --bucket "${j}"  --region ap-southeast-1  --output text | awk '{print}'
  echo "## Check Bucket Policy"
  aws s3api get-bucket-policy --bucket "${j}"  --region ap-southeast-1  --output text | awk '{print}'
done
