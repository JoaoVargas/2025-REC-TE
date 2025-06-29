#!/bin/bash

echo "Started formatting iperf3 results..."

ARRAY_FILE="/local_bind/iperf3_receiver_logs/iperf3_combined.json"

OUTPUT_FILE="/local_bind/iperf3_receiver_logs/bps_values.csv"

echo "run_number,megabytes_per_second" > "$OUTPUT_FILE"
jq -r 'to_entries[] | "\(.key|tonumber+1),\(.value.end.sum_received.bits_per_second / 8 / 1000000)"' "$ARRAY_FILE" >> "$OUTPUT_FILE"

echo "Formatted results saved to $OUTPUT_FILE"