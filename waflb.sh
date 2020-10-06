#!/usr/bin/env bash
set -ex



# environment = namespace, region is aws region, file is got using below command
# kubectl get ing -n $namespace |grep control  | awk '{ print $1 }' > $namespace.txt
environment=$1
region=$2
file=$3

cat $file | while read name
do
web_acl_id=$(aws ssm get-parameter --name /$environment/$region/web_acl_id --region $region|jq -r '.Parameter.Value')
echo $web_acl_id
lb_arn=$(aws resourcegroupstaggingapi get-resources --resource-type-filters elasticloadbalancing:loadbalancer --tag-filters Key=environment,Values=$environment Key="kubernetes.io/ingress-name",Values=$name --region $region | jq -r  .ResourceTagMappingList[].ResourceARN)
echo $lb_arn
aws waf-regional associate-web-acl --web-acl-id ${web_acl_id} --resource-arn ${lb_arn} --region $region
sleep 5
aws waf-regional list-resources-for-web-acl --web-acl-id ${web_acl_id} --resource-type APPLICATION_LOAD_BALANCER --region $region |grep loadbal |wc -l
#waf_verify=$(aws waf-regional --output json get-web-acl-for-resource --resource-arn ${lb_arn} --region $region |jq -r .WebACLSummary.WebACLId)
#echo $waf_verify
done
