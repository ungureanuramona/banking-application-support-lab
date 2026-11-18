#!/bin/bash

# Banking Application Support - Daily Batch Report

set -euo pipefail

PROJECT_DIR="$HOME/projects/banking-application-support-lab"
REPORT_FILE="$PROJECT_DIR/reports/daily_report_$(date +%Y%m%d_%H%M%S).txt"
LOG_FILE="$PROJECT_DIR/logs/batch.log"

# Load Oracle credentials for scheduled execution
if [[ -f "$PROJECT_DIR/.env" ]]; then
    source "$PROJECT_DIR/.env"
fi

echo "$(date) - INFO - Starting daily banking report" >> "$LOG_FILE"

# Verify Oracle password is available
if [[ -z "${ORACLE_PASSWORD:-}" ]]; then
    echo "$(date) - ERROR - ORACLE_PASSWORD is not set" >> "$LOG_FILE"
    exit 1
fi

# Execute SQL report
if {
    printf 'WHENEVER SQLERROR EXIT FAILURE\n'
    printf 'CONNECT banking_app/"%s"@//localhost:1521/FREEPDB1\n' "$ORACLE_PASSWORD"
    sed '1d' "$PROJECT_DIR/sql/daily_report.sql"
} | docker exec -i banking-oracle sqlplus -s /nolog > "$REPORT_FILE" 2>&1; then

    echo "$(date) - SUCCESS - Report generated: $REPORT_FILE" >> "$LOG_FILE"
    echo "Report generated successfully: $REPORT_FILE"
else
    echo "$(date) - ERROR - Batch execution failed" >> "$LOG_FILE"
    cat "$REPORT_FILE"
    exit 1
fi
