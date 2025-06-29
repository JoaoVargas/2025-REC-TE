#!/bin/bash

hostname -I

LOG_DIR="/local_bind/iperf3_receiver_logs"

rm -rf "$LOG_DIR"
mkdir -p "$LOG_DIR"

ARRAY_FILE="$LOG_DIR/iperf3_combined.json"
echo "[" > "$ARRAY_FILE"

FIRST=1

while true; do
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
    LOG_FILE="$LOG_DIR/iperf3_${TIMESTAMP}.json"
    iperf3 -s --one-off  --json 2>&1 | tee "$LOG_FILE"
    if [ $FIRST -eq 1 ]; then
        cat "$LOG_FILE" >> "$ARRAY_FILE"
        FIRST=0
    else
        echo "," >> "$ARRAY_FILE"
        cat "$LOG_FILE" >> "$ARRAY_FILE"
    fi
done