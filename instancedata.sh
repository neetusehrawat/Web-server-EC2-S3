#!/bin/bash

curl -w '\n' http://instance-data/latest/meta-data/hostname > metadata.txt
curl -w '\n' http://instance-data/latest/meta-data/iam/info >> metadata.txt
curl -w '\n' http://instance-data/latest/meta-data/security-groups >>metadata.txt
