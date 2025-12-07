#!/bin/bash

set -eu

RED='\033[0;31m'
NC='\033[0m' # No Color

if [ ! -e current ]; then
    echo -e "${RED}File not exists. You should create 'current' file.${NC}"
    exit 1
fi

if [ ! -x current ]; then
    echo -e "${RED}'current' file does not have execute permission. Please grant execute permission.${NC}"
    exit 1
fi

if [ ! "$(current | head -n 1)" ==  "# info of current directory" ]; then
    echo -e "${RED}You should set path to current command${NC}"
    exit 1
fi

echo "ok"
exit 0
