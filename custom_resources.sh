#!/usr/bin/env bash
#
# A small script that s6 runs as root before switching to the "rstudio" user.
# It reports CPU & memory info similar to your original entrypoint script.

echo "-------------------------------"
echo "Custom cont-init script: Resource Info"
echo "-------------------------------"

# Detect CPU cores
CPU_CORES=$(nproc)
echo "Number of CPU cores detected: $CPU_CORES"

# Export environment variable for multi-threading if desired
export OMP_NUM_THREADS="$CPU_CORES"

# Check for cgroup memory limits (if any)
if [ -f /sys/fs/cgroup/memory/memory.limit_in_bytes ]; then
  cgroup_limit=$(cat /sys/fs/cgroup/memory/memory.limit_in_bytes 2>/dev/null || echo 0)
  if [ "$cgroup_limit" -gt 0 ] && [ "$cgroup_limit" -lt 9223372036854771712 ]; then
    memory_mb=$(( cgroup_limit / 1024 / 1024 ))
    echo "Cgroup memory limit detected: ${memory_mb}MB"
  else
    echo "No real cgroup memory limit set (container may use all host memory)."
  fi
else
  echo "No cgroup memory limit file found (container may use all host memory)."
fi

echo "-------------------------------"
echo ""
echo "Access the RStudio server via http://localhost:8787/"
