#!/bin/bash

# Path to the executable
EXECUTABLE="./gpool --pubkey EZSJBoHaAhaDTLtTja4GowTsFJDXyoocRdwPD2v8qkSa"

# Function to start the process
start_process() {
    # Start the process and forward stdout to terminal
    $EXECUTABLE &
    # Save the process ID
    PID=$!
}

# Main loop
while true; do
    # Start the process
    start_process

    # Wait for 10 minutes (600 seconds)
    sleep 1200

    # Kill the process after 10 minutes
    kill $PID

    # Wait for the process to terminate gracefully
    wait $PID 2>/dev/null
done

