#!/bin/bash

ss-server -c config.json -u -d 8.8.8.8 --fast-open -a nobody 2>&1 &
