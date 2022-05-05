#!/bin/bash

CMD=$1
ARG1=$2

export AWS_CONFIG_DIR=/.aws
[[ ! -d $PLUGIN_CACHE_DIR ]] && mkdir -p $PLUGIN_CACHE_DIR
if [[ $CMD == "aws" ]]; then
	shift 1
	aws $@
elif [[ $CMD == "console" && $ARG1 == "bash" ]]; then
	bash
else
	export AWS_ACCESS_KEY_ID=$(ini-get /.aws/credentials $AWS_PROFILE aws_access_key_id)
	export AWS_SECRET_ACCESS_KEY=$(ini-get /.aws/credentials $AWS_PROFILE aws_secret_access_key)
	export AWS_REGION=$(ini-get /.aws/config $AWS_PROFILE region)
	terraform -chdir=/root $@
fi

#::END::
