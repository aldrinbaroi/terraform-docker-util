#!/bin/bash

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/go/bin
CMD=$1
ARG1=$2
if [[ $CMD == "aws" ]]; then
	shift 1
	aws $@
elif [[ $CMD == "console" && $ARG1 == "bash" ]]; then
	bash
else
	terraform $@
fi

#::END::
