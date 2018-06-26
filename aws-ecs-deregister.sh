STACKNAME=$1
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-Disc:$i ; done
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-Flume-1:$i ; done
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-Flume-2:$i ; done
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-Flume-3:$i ; done
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-Monitor:$i ; done
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-New:$i ; done
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-OpsCenter:$i ; done
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-Ready:$i ; done
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-Service-1:$i ; done
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-Service-2:$i ; done
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-Service-3:$i ; done
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-UI-1:$i ; done
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-UI-2:$i ; done
for i in {1..15}; do aws ecs deregister-task-definition --region us-east-1 --profile dev --task-definition $STACKNAME-UI-3:$i ; done