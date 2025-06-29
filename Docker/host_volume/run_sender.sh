#!/bin/bash

for i in {1..30}; do
    iperf3 -c "$RECEIVER_IP" -t 10 --format M --verbose
    echo "Run $i completed"
    sleep 1
done

ARRAY_FILE="/local_bind/iperf3_receiver_logs/iperf3_combined.json"
echo "]" >> "$ARRAY_FILE"

echo "Finalized all runs. Results saved to $ARRAY_FILE"