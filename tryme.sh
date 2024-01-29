#/bin/bash

v="git@github.com:cahcommercial/outcomes-aws-ct-tf-module-ec2?ref=v0.1.2"
v2=${v%\?*} 
echo $v2