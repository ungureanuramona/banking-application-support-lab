#!/bin/bash

# Banking Application Support - Batch Monitoring

set -euo pipefail

PROJECT_DIR="$HOME/projects/banking-application-support-lab"
LOG_FILE="$PROJECT_DIR/logs/batch.log"
ALERT_FILE="$PROJECT_DIR/logs/alerts.log"

# Verify that the batch log exists
if [[ ! -f "$LOG_FILE" ]]; then
    echo "$(date) - CRITICAL - Batch log not found" | tee -a "$ALERT_FILE"
    exit 2
fi

# Get the last batch execution result
LAST_STATUS=$(grep -E ' - (SUCCESS|ERROR) - ' "$LOG_FILE" | tail -n 1 || true)

if [[ -z "$LAST_STATUS" ]]; then
    echo "$(date) - WARNING - No batch execution result found" | tee -a "$ALERT_FILE"
    exit 1
elif [[ "$LAST_STATUS" == *" - ERROR - "* ]]; then
    echo "$(date) - CRITICAL - Last batch execution failed" | tee -a "$ALERT_FILE"
    echo "$LAST_STATUS"
    exit 2
else
    echo "$(date) - OK - Last batch execution successful"
    exit 0
fi
