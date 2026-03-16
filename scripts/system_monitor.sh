#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80
PROC_THRESHOLD=300

LOG_FILE="system_health.log"

# Function to log alerts
log_alert() {
    echo "$(date) ALERT: $1" | tee -a "$LOG_FILE"
}

# Check CPU Usage
check_cpu() {
    CPU_LINE=$(top -bn1 | grep "Cpu(s)")
    CPU_IDLE=$(echo "$CPU_LINE" | awk '{print $8}')
    CPU_USED=$(echo "100 - $CPU_IDLE" | bc)

    echo "$CPU_LINE"
    echo "CPU Used: $CPU_USED%"

    if (( $(echo "$CPU_USED > $CPU_THRESHOLD" | bc -l) ))
    then
        log_alert "CPU USAGE IS ABOVE THRESHOLD"
    fi
}

# Check Memory Usage
check_memory() {
    MEM_USED=$(free | awk '/Mem/ {printf("%.2f", $3/$2 * 100.0)}')

    echo "Memory Used: $MEM_USED%"

    if (( $(echo "$MEM_USED > $MEM_THRESHOLD" | bc -l) ))
    then
        log_alert "MEMORY USAGE IS ABOVE THRESHOLD"
    fi
}

# Check Disk Usage
check_disk() {
    DISK_USED=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

    echo "Disk Used: $DISK_USED%"

    if [ "$DISK_USED" -gt "$DISK_THRESHOLD" ]
    then
        log_alert "DISK USAGE IS ABOVE THRESHOLD"
    fi
}

# Check Running Processes
check_processes() {
    PROC_COUNT=$(ps -e --no-headers | wc -l)

    echo "Running Processes: $PROC_COUNT"

    if [ "$PROC_COUNT" -gt "$PROC_THRESHOLD" ]
    then
        log_alert "TOO MANY RUNNING PROCESSES: $PROC_COUNT"
    fi
}

# Run all checks
check_cpu
check_memory
check_disk
check_processes