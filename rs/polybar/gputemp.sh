#!/bin/sh
if ! gputemp=$(nvidia-smi --format=nounits,csv,noheader --query-gpu=temperature.gpu | xargs echo); then
	gputemp=0
fi
if [ "$gputemp" -gt 0 ]; then
	echo "GPU  $gputemp.0°C"
else
	echo "$no nvidia driver installed"
fi
