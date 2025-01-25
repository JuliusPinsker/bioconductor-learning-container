#!/bin/bash

# Get total system memory in KB
TOTAL_MEM=$(awk '/MemTotal/ {print $2}' /proc/meminfo)

# Calculate stack size (use 80% of total memory to leave room for other processes)
# Convert from KB to bytes
STACK_SIZE=$(( (TOTAL_MEM * 1024 * 80) / 100 ))

# Set ulimit with calculated stack size
ulimit -s $STACK_SIZE

# Get number of CPU cores
CPU_CORES=$(nproc)

# Set R options to use all available cores
export R_PARALLELIZE=true
export OMP_NUM_THREADS=$CPU_CORES

# Print resource allocation information
echo "Total Memory: $((TOTAL_MEM / 1024)) MB"
echo "Stack Size Set To: $((STACK_SIZE / 1024)) KB"
echo "CPU Cores Available: $CPU_CORES"

# Start RStudio
/init