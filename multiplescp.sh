#!/usr/bin/env bash
for server in 10.10.1.1 10.10.2.1; do
   scp -F ssh.config ubuntu@$server:~/status.xml ~/Documents/"$server"_status.xml
done
