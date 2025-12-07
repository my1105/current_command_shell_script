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

PROJECT_DIR=$(pwd)
TEST_DIR=$(dirname $0)/dir

cd $TEST_DIR

if [ ! "$(bash $PROJECT_DIR/current | head -n 1)" ==  "# info of current directory" ]; then
    echo -e "${RED}You should display '# info of current directory' in the first line.${NC}"
    exit 1
fi

if [ ! "$(bash $PROJECT_DIR/current | head -n 2 | tail -n 1)" ==  $(pwd) ]; then
    echo -e "${RED}You should display woking directory in the second line.${NC}"
    exit 1
fi

if [ ! "$(bash $PROJECT_DIR/current | grep 'file' | wc -l )" -eq 2 ]; then
    echo -e "${RED}You should display file list at end.${NC}"
    exit 1
fi

cd $PROJECT_DIR

echo "ok"
exit 0
