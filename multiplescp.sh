#!/usr/bin/env bash
# SCP file from multiple servers and save with server in filename
for server in 10.10.1.1 10.10.2.1; do
   scp ubuntu@$server:~/status.xml ~/Documents/"$server"_status.xml
done
