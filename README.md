# Linux Log Analysis & Automation

A cybersecurity project that demonstrates Linux authentication log analysis, Bash scripting, automation, and security monitoring. The project analyzes system logs to detect failed and successful SSH login attempts, monitor sudo activity, identify suspicious IP addresses, generate daily security reports, and automate routine monitoring tasks using Cron.

## Project Overview

Linux systems continuously generate log files that record authentication events, user activities, system services, and security-related information. Security analysts regularly examine these logs to detect unauthorized access attempts, investigate suspicious activities, and monitor system health.

This project automates Linux log analysis using Bash scripts to reduce manual effort and improve incident detection. Authentication logs are parsed to identify login attempts, extract IP addresses, detect brute-force behavior, summarize system activity, and generate reports suitable for a Security Operations Center (SOC) environment.

## Objectives

- Analyze Linux authentication logs
- Detect failed SSH login attempts
- Monitor successful SSH logins
- Track sudo activity
- Identify suspicious IP addresses
- Generate automated security reports
- Archive important log files
- Schedule automated tasks using Cron
- Practice Linux administration and Bash scripting

## Technologies Used

| Technology | Purpose |
|------------|---------|
| Ubuntu 24.04 LTS | Main operating system |
| Kali Linux | Attack simulation |
| Bash | Automation scripts |
| OpenSSH Server | SSH authentication |
| Cron | Task scheduling |
| Git | Version control |
| Grep | Pattern searching |
| AWK | Text processing |
| Sed | Stream editing |
| Tar | Log backups |
| VMware Fusion | Virtualization |

## Project Architecture

```
                   Kali Linux
                        │
                SSH Login Attempts
                        │
                        ▼
                 Ubuntu Server
                        │
             /var/log/auth.log
                        │
        Bash Log Analysis Scripts
                        │
      ┌─────────────────┴─────────────────┐
      │                                   │
Security Reports                  Log Backups
      │                                   │
      └─────────────────┬─────────────────┘
                        ▼
                  GitHub Repository
```

## Project Workflow

1. Install Ubuntu and required packages.
2. Configure the OpenSSH Server.
3. Generate successful and failed SSH login attempts from Kali Linux.
4. Analyze authentication logs.
5. Extract usernames and IP addresses.
6. Detect suspicious login activity.
7. Generate daily security reports.
8. Archive important log files.
9. Automate execution using Cron.
10. Document findings.


## Folder Structure

```
linux-log-analysis-automation/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── docs/
│   ├── architecture.md
│   ├── methodology.md
│   └── log-files.md
│
├── scripts/
│   ├── failed_login_detection.sh
│   ├── auth_log_parser.sh
│   ├── suspicious_ip_detector.sh
│   ├── login_summary.sh
│   ├── log_summary.sh
│   ├── user_activity.sh
│   └── archive_logs.sh
│
├── reports/
│   ├── Daily_Log_Report.txt
│   └── Incident_Report.md
│
├── logs/
│   └── backups/
│
└── screenshots/
```


## Bash Scripts

### failed_login_detection.sh

Detects failed SSH login attempts from the authentication log and displays the total number of failed login attempts.

### auth_log_parser.sh

Parses authentication logs to display successful logins, failed logins, and sudo activity while extracting useful information for further analysis.

### suspicious_ip_detector.sh

Identifies IP addresses responsible for multiple failed authentication attempts, helping detect possible brute-force attacks.

### login_summary.sh

Displays a quick summary of authentication statistics, including successful logins, failed logins, and sudo usage.

### log_summary.sh

Generates a detailed Linux security report containing:

- Authentication statistics
- User information
- Host information
- Kernel version
- Logged-in users
- Top failed login IP addresses

### user_activity.sh

Displays information about currently logged-in users, recent login history, and user sessions.

### archive_logs.sh

Creates compressed backups of important Linux log files for future analysis and forensic investigations.

## Example Security Report

```
===========================================
Linux Security Daily Report
===========================================

Generated:
Tue Jul 15 14:22:03 IST

Hostname:
ubuntu

Current User:
aisha

Kernel:
6.8.0

-------------------------------------------

Successful Logins:
5

Failed Logins:
12

Sudo Commands:
18

Logged-in Users:
aisha

Top Failed Login IP Addresses:

8 192.168.29.101
4 192.168.29.105

===========================================
End of Report
===========================================
```


## Learning Outcomes

This project demonstrates practical skills in:

- Linux Administration
- Linux Log Analysis
- Bash Scripting
- Security Monitoring
- Incident Detection
- SSH Authentication Analysis
- User Activity Monitoring
- Cron Automation
- Log Management
- Git Version Control


## Future Improvements

Potential enhancements include:

- Email alerts for suspicious login attempts
- Slack or Microsoft Teams notifications
- Wazuh integration
- ELK Stack integration
- Fail2Ban integration
- Real-time dashboard
- Web interface for report visualization
- Automated threat intelligence lookup for suspicious IP addresses


## License

This project is licensed under the MIT License.

## Author

**Aisha Banu**
M.Tech Cybersecurity
