#!/bin/bash

CMD=$1
ARG1=$2
if [[ $CMD == "aws" ]]; then
	shift 1
	aws $@
elif [[ $CMD == "console" && $ARG1 == "bash" ]]; then
	bash
else
	PROFILE=default
	export AWS_ACCESS_KEY_ID=$(iniget /.aws/credentials $PROFILE aws_access_key_id)
	export AWS_SECRET_ACCESS_KEY=$(iniget /.aws/credentials $PROFILE aws_secret_access_key)
	export AWS_REGION=$(iniget /.aws/config $PROFILE region)
	terraform -chdir=/root/work $@
fi

#::END::
