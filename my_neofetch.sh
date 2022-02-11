#!/bin/bash

echo $USER"@"$HOSTNAME
i=0
while [ $i -ne $((${#USER} + ${#HOSTNAME} + 1)) ]
do
    echo -n "-";
    i=$(($i + 1));
done
echo ""
echo "OS:" $OSTYPE;
echo "Kernel:" $(uname -r);
echo "Uptime:" $(uptime);
echo "Shell: $(bash --version | cut -d$'\n' -f1)"
echo -n "CPU: "
i=3;
while [ true ]
do
    S=$(cat /proc/cpuinfo | grep "model name" -m1 | cut -d' ' -f$i);
    if [ -z $S ]; then
        break;
    fi;
    echo -n $S" ";
    i=$(($i + 1));
done
echo "";
Total=$(($(cat /proc/meminfo | grep MemTotal | tr -s ' ' | cut -d' ' -f2) / 1024));
Available=$(($(cat /proc/meminfo | grep MemAvailable | tr -s ' ' | cut -d' ' -f2) / 1024))
echo "Memory:" $Available"MiB / "$Total"MiB";