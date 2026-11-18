# Banking Application Support & Release Lab

A hands-on technical lab simulating banking application support, batch processing, incident investigation, monitoring, deployment, and rollback.

## Technologies
- Ubuntu Linux (WSL2)
- Oracle Database 26ai Free
- SQL and SQL*Plus
- Bash scripting and cron
- Docker
- Apache Tomcat 11
- Java 21 and Maven
- Git and GitHub

## What I Implemented

### 1. Oracle Database
- Created banking tables for customers, accounts, and transactions.
- Inserted sample banking data.
- Developed SQL reports for completed transactions.

### 2. Batch Processing
- Automated daily transaction reporting using Bash and SQL*Plus.
- Scheduled execution with cron.
- Added execution logging and error handling.

### 3. Monitoring and Incident Management
- Created a batch monitoring script.
- Simulated a batch failure and investigated the resulting alert.
- Documented incident INC001.

### 4. Application Deployment
- Built a Java web application using Maven.
- Deployed the WAR file to Apache Tomcat.
- Investigated and resolved a deployment permission issue.

### 5. Release Management and Rollback
- Deployed stable application V1 (HTTP 200).
- Simulated a failed V2 release (HTTP 503).
- Restored V1 using a backed-up WAR file.
- Verified successful recovery (HTTP 200).
- Documented incident INC002.

## Project Structure
- `sql/` - SQL reporting
- `scripts/` - Batch automation and monitoring
- `incidents/` - Incident reports and root cause analysis
- `deployment/` - Maven web application and deployment resources
- `reports/` - Generated reports (excluded from Git)
- `logs/` - Execution and monitoring logs (excluded from Git)

## Security
Database credentials are stored locally in a `.env` file, excluded from Git.

## Purpose
This is a local educational lab using fictional banking data. Application failures and incidents are simulated for troubleshooting practice.
