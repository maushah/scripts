#!/usr/bin/env bash
for server in 10.26.31.115 10.26.31.193 10.26.33.38 10.26.32.5 10.26.32.149 10.26.33.86; do
   scp -F ssh.config ubuntu@$server:~/status.xml ~/Documents/"$server"_status.xml
done
