#!/bin/bash

LOG_FILE=$1

if [ ! -f "$LOG_FILE" ]
then
    echo "ERROR: FILE NOT FOUND"
    exit 1
fi

REPORT_FILE="report.txt"
exec > "$REPORT_FILE"

echo "----- LOG ANALYSIS REPORT -----"
echo "GENERATED ON: $(date)"

echo
echo "----- TOTAL 404 ERRORS: -----"
echo

ERROR_404_COUNT=$(grep "404" "$LOG_FILE" | wc -l)
echo "TOTAL 404 ERRORS: $ERROR_404_COUNT"

echo
echo "----- TOP REQUESTED PAGES: -----"
echo

TOP_PAGES=$(awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5)
echo "$TOP_PAGES"

echo
echo "----- TOP IP ADDRESSES: -----"
echo

TOP_IPS=$(awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5)
echo "$TOP_IPS"