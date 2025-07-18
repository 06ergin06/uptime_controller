#!/bin/bash
echo "Welcome to uptime controller"

online=0
offline=0


WEBSITE=$1
function report(){
    echo "-------- Uptime Report $WEBSITE : --------"
    echo -e "\e[32mOnline count : $online \e[0m"
    echo -e "\e[31mOffline count : $offline \e[0m"
    exit 0
}
if [ "$WEBSITE" != "" ]; then
    echo "$WEBSITE"

    while :
    do
        curl -s --head -o /dev/null "$WEBSITE"
        status=$?

        if [ "$status" -eq 0 ]; then
            echo "ONLINE ($status)"
            online=$((online + 1))
        else
            echo "OFFLINE ($status)"
            offline=$((offline + 1))
        fi
        trap report INT
    done
else 
    echo -e "\e[31mYou must enter a parameter as a website \e[0m "
fi
