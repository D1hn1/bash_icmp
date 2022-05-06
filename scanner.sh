#!/bin/bash

function ctrl_c () {
        echo "Exiting..."
        exit
}
trap ctrl_c INT

for x in $(seq 0 255);do
        echo "Triying with -->" 192.168.$x
        for i in $(seq 0 255); do
                ttl=$(timeout 0.03 ping -c 1 192.168.$x.$i)
                if [[ $ttl ]]
                then
                        ttlN=$(echo $ttl | grep -o 'ttl=[0-9][0-9]*')
                        echo "\_____" 192.168.$x.$i " is active -->" $ttlN
                fi
        done;
done
