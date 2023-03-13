#!/bin/bash

BOLD="\e[1m"
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
ENDCOLOR="\e[0m"

RC="$(docker ps -q -f status=running | wc -l)"
version="$(docker --version | awk '{print $3}' | tr ',' ' ')"

if [ $? == 0 ]
then
        echo -e "Docker is installed with version ${GREEN}${version}${ENDCOLOR}"
else
        echo 'Docker is not installed'
fi

if [ ${RC} = 0 ]
then
        echo -e "${BOLD}${CYAN}${RC}${ENDCOLOR} ${RED}containers are running now, nothing to clean${ENDCOLOR}"
elif [ ${RC} > 0 ]
then
        echo -e "${BOLD}${GREEN}${RC} Containers are running now..............${ENDCOLOR}"
        echo -e "${BOLD}${RED}Clearing Running Containers.........${ENDCOLOR}"
        docker container rm -f $(docker ps -q)
        echo -e "${BOLD}${CYAN}${RC} ${BOLD}Running Containers cleaned.....${ENDCOLOR}"
        x="$(docker ps -q -f status=running | wc -l)"
        echo "${x} Containers are running now"
        echo -e "${BOLD}${GREEN}Creating new containers....${ENDCOLOR}"
        docker run -d --name con_1 docker/getting-started
        docker run -d --name con_2 docker/getting-started
        x="$(docker ps -q -f status=running | wc -l)"
        echo -e "${BOLD}${GREEN}${x} New Containers Created....${ENDCOLOR}"
fi
