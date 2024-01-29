#/bin/bash

# IFS=' ' read -a arr <<< "${{ vars.TF_STANDARD_MODULE_LIST }}"
IFS=' ' read -a arr <<< "git@github.com:cahcommercial/outcomes-aws-ct-tf-module-ec2 git@github.com:cahcommercial/outcomes-aws-ct-tf-module-rds"
FLAG="false"

# REPO_MODULES=$(echo '${{ steps.tf-config-inspect.outputs.config }}' | jq -r -c .module_calls[].source)
REPO_MODULES=$(jq -r -c .module_calls[].source test.json)
echo Checking against the following standard modules: "${arr[@]}"
for userModule in $REPO_MODULES 
do 
    echo checking user provided $userModule
    for standardModule in "${arr[@]}"
    do
        baseModule=${userModule%\?*}
        echo extracting base module: $baseModule
        if [[ $baseModule == $standardModule ]]; then 
            FLAG="true"
            echo found match for "$baseModule"
            break 
        fi
        FLAG="false"
    done
done
if [[ $FLAG == "false" ]]; then 
    echo One or more user provided modules are not using the standard modules... exiting
    exit 1;
fi 