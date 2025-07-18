#!/bin/bash
echo "Welcome to uptime controller"

online=0
offline=0
start=$(date +%s)


WEBSITE=$1
SLEEP=${2:-5}
function report(){
    end=$(date +%s)
    total_seconds=$((end-start))
    hours=$(( (total_seconds / 3600) ))
    minutes=$(( (total_seconds % 3600) / 60 ))
    seconds=$(( (total_seconds % 60) ))
    echo "-------- Uptime Report $WEBSITE : --------"
    echo -e "\e[32mOnline count : $online \e[0m"
    echo -e "\e[31mOffline count : $offline \e[0m"
    echo "Total runtime : $hours hours, $minutes minutes, $seconds seconds"

    exit 0
}
if [ "$WEBSITE" != "" ]; then
    echo "$WEBSITE"

    while :
    do
        curl -s --head -o /dev/null "$WEBSITE"
        status=$?

        if [ "$status" -eq 0 ]; then
            echo -e "\e[32mONLINE \e[0m"
            online=$((online + 1))
        else
            echo -e "\e[31mOFFLINE \e[1m(Error code : $status)\e[0m \e[0m"
            offline=$((offline + 1))
        fi
        sleep $SLEEP
    done
    trap report INT
else 
    echo -e "\e[31mYou must enter a parameter as a website \e[0m "
fi

