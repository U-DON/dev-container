#!/bin/bash

sed -i .bak -r "s/^BUILD_TIME=[[:digit:]]+$/BUILD_TIME=$(date +%s)/" "$(dirname -- $0)/.env"
