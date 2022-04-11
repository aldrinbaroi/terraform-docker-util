#!/bin/bash

CMD=$1
ARG1=$2
if [[ $CMD == "aws" ]]; then
	shift 1
	aws $@
elif [[ $CMD == "console" && $ARG1 == "bash" ]]; then
	bash
else
	AWS_ACCESS_KEY_ID=$(iniget /root/.aws/credentials $PROFILE aws_access_key_id)
	AWS_SECRET_ACCESS_KEY=$(iniget /root/.aws/credentials $PROFILE aws_secret_access_key)
	AWS_REGION=$(iniget /root/.aws/config $PROFILE region)
	terraform $@
fi

#::END::
