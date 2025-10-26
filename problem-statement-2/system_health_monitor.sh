#!/bin/bash

LOG_FILE="/var/log/system_health.log"

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90
PROC_THRESHOLD=300

log_alert() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ALERT: $message" | tee -a "$LOG_FILE"
}

check_cpu() {
    local cpu_usage
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    cpu_usage=${cpu_usage%.*}

    if [ "$cpu_usage" -gt "$CPU_THRESHOLD" ]; then
        log_alert "High CPU usage detected: ${cpu_usage}%"
    fi
}
