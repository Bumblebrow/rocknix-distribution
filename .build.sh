#!/bin/bash

if [ ! -z $1 ]
then
	PROJECT=ROCKNIX DEVICE=SM8250 ARCH=aarch64 ./scripts/build $1;
	PROJECT=ROCKNIX DEVICE=SM8550 ARCH=aarch64 ./scripts/build $1;
fi
