!/bin/bash

if ! command -v ping &> /dev/null; then
    echo "ping command not found. Please install it."
    exit 1
fi

if ! command -v mail &> /dev/null; then
    echo "mail command not found. Please install it."
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Input file not found. Please provide a valid file with node IP addresses or hostnames."
    exit 1
fi

nodes=()
while read -r line; do
    nodes+=("$line")
done < "$1"

log_file="network_status_$(date +%Y%m%d_%H%M%S).log"

for node in "${nodes[@]}"; do
    timestamp=$(date +%Y-%m-%d\ %H:%M:%S)
    status=$(ping -c 1 "$node" &> /dev/null; echo $?)

    if [ "$status" -eq 0 ]; then
        status="reachable"
    else
        status="unreachable"
        echo "Node $node is unreachable. Sending email notification."
        echo "Subject: Node $node is unreachable" | mail -s "Node $node is unreachable" regnier.oliveira2@outlook.com
    fi

    echo "$timestamp Node $node is $status." >> "$log_file"
done



./monitoring_script.sh 192.168.1.1 google.com
