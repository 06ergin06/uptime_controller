#!/bin/bash
echo "Welcome to uptime controller"
WEBSITE=$1
if [ "$WEBSITE" != "" ]; then
    echo "$WEBSITE"

    while :
    do
        curl -s --head -o /dev/null "$WEBSITE"
        status=$?

        if [ "$status" -eq 0 ]; then
            echo "ONLINE ($status)"
        else
            echo "OFFLINE ($status)"
        fi
    done
else 
    echo -e "\e[31mYou must enter a parameter as a website \e[0m "
fi