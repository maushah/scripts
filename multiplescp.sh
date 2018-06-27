#!/usr/bin/env bash
for server in 10.0.31.115 10.0.31.193 10.0.33.38 10.0.32.5 10.0.32.149 10.0.33.86; do
   scp -F ssh.config ubuntu@$server:~/status.xml ~/Documents/"$server"_status.xml
done
