#!/bin/bash

# Terminate already running bar instances
killall -q polybar

polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
