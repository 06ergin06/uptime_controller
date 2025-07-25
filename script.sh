#!/bin/bash
# Copyright (C) 2025 İbrahim Hakkı Ergin <ibrahimh.ergin@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
echo "Welcome to uptime controller"

online=0
offline=0
start=$(date +%s)
trap report INT

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
    
else 
    echo -e "\e[31mYou must enter a parameter as a website \e[0m "
fi

