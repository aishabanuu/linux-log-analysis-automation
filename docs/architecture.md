# Project Architecture

## Overview

This project automates Linux authentication log analysis using Bash scripting. Authentication events generated on an Ubuntu virtual machine are collected from Linux log files and processed through multiple automation scripts. These scripts detect suspicious login attempts, summarize security events, archive important logs, and generate reports that simulate a Security Operations Center (SOC) monitoring workflow.


## Architecture Diagram

```
                 Kali Linux VM
                        │
      Successful & Failed SSH Attempts
                        │
                        ▼
              Ubuntu Linux Server
                        │
                /var/log/auth.log
                        │
          Linux Log Analysis Scripts
                        │
         ┌──────────────┬──────────────┐
         │              │              │
  Security Report  IP Detection  Log Backup
         │              │              │
         └──────────────┴──────────────┘
                        │
                        ▼
                 GitHub Repository
```


## Components

### Ubuntu VM

The Ubuntu virtual machine acts as the target server. It records authentication events, sudo activity, and system logs that are analyzed by the Bash scripts.


### Kali Linux VM

Kali Linux is used to simulate security events by generating successful and failed SSH login attempts against the Ubuntu machine.


### Authentication Logs

Authentication events are stored in:

```
/var/log/auth.log
```

These logs contain:

- Successful SSH logins
- Failed SSH logins
- Invalid users
- Sudo activity
- Session information


### Bash Scripts

The project uses multiple Bash scripts to automate repetitive SOC tasks.

Scripts include:

- failed_login_detection.sh
- auth_log_parser.sh
- suspicious_ip_detector.sh
- login_summary.sh
- log_summary.sh
- archive_logs.sh
- user_activity.sh


### Reports

The generated reports summarize:

- Authentication statistics
- Suspicious IP addresses
- User activity
- Host information
- System information


### Automation

Cron automatically executes selected scripts according to a predefined schedule, reducing manual monitoring effort.


## Workflow

1. Generate authentication events.
2. Store events in Linux log files.
3. Parse authentication logs.
4. Extract usernames and IP addresses.
5. Detect suspicious activity.
6. Generate security reports.
7. Archive important logs.
8. Automate execution using Cron.
