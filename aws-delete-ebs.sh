for regions in `aws ec2 describe-regions --profile prod --output text|awk {'print $3'}`
do
   for volumes in `aws ec2 describe-volumes --profile prod --region $regions --output text| grep available | awk '{print $9}' | grep vol| tr '\n' ' '`
    do 
 aws ec2 delete-volume --profile prod --region $regions --volume-id $volumes
 done
done