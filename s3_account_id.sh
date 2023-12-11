#!/usr/bin/bash
aws s3 cp s3://atlantis-account-repo-config/repo_account_id_config.json - | jq --arg path "$1" -r '.[] | select (.repo_name==($path)) | .account_id'