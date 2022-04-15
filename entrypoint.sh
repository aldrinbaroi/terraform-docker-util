#!/bin/bash

CMD=$1
ARG1=$2

[[ ! -d $PLUGIN_CACHE_DIR ]] && mkdir -p $PLUGIN_CACHE_DIR
if [[ $CMD == "aws" ]]; then
	shift 1
	aws $@
elif [[ $CMD == "console" && $ARG1 == "bash" ]]; then
	bash
else
	export AWS_ACCESS_KEY_ID=$(iniget /.aws/credentials $AWS_PROFILE aws_access_key_id)
	export AWS_SECRET_ACCESS_KEY=$(iniget /.aws/credentials $AWS_PROFILE aws_secret_access_key)
	export AWS_REGION=$(iniget /.aws/config $AWS_PROFILE region)
	terraform -chdir=/root $@
fi

#::END::
