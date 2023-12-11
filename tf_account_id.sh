#!/usr/bin/bash
terraform console <<< var.account_id | tr -d '\"' | tail -1