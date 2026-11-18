# INC002 - Failed Release and Rollback

## Incident Type
Simulated application release failure.

## Environment
Ubuntu WSL2, Apache Tomcat 11, Maven, Java 21.

## Incident Description
Version 1.0 of the banking web application was running successfully with HTTP 200.

After deploying version 2.0, the application returned HTTP 503 (Service Unavailable).

## Root Cause
A deliberately introduced change in the V2 JSP set the HTTP response status to 503.

## Investigation
- Verified the V1 application returned HTTP 200.
- Built and deployed V2 using Maven and Tomcat.
- Used curl to identify HTTP 503.
- Confirmed the deployed application displayed Version 2.0 - FAILED RELEASE.

## Resolution
Restored the previously backed-up V1 WAR file to the Tomcat deployment directory.

## Verification
- HTTP status returned to 200.
- Application displayed Version 1.0 - STABLE.
- Application status was RUNNING.

## Lessons Learned
- Always back up a stable release before deployment.
- Validate application health after each release.
- Use HTTP status codes to detect application failures.
- Maintain a tested rollback procedure.
