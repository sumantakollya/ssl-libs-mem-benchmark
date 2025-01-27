#!/bin/bash

# Specify the core number you want to run the executable on
CORE=8

# Path to the executable
EXECUTABLE="./openssl_client"

# Directory to save the CPU utilization logs
LOG_DIR="./cpubench-ossl-1.1.1w"
mkdir -p $LOG_DIR

# Get PID of the current process
PID=$$

# Record CPU utilization using psrecord with --include-children option
psrecord $PID --log $LOG_DIR/cpu_util_$CORE.log --plot $LOG_DIR/plot.png --include-children &

# Run the server executable once on the same core
taskset -c $CORE ./openssl_server &

# Run the client executable 100 times on the specified core
for i in {1..100}
do
    # Start the executable with taskset and get its PID
    taskset -c $CORE $EXECUTABLE &
    wait $!
done