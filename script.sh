#!/bin/bash

site="https://kosakymm.com"
echo "Kontrol ediliyor: $site"

while :
do
    curl -s --head -o /dev/null "$site"
    status=$?

    if [ "$status" -eq 0 ]; then
        echo "Sonuç: ONLINE (Çıkış Kodu: $status)"
    else
        echo "Sonuç: OFFLINE (Çıkış Kodu: $status)"
    fi
done