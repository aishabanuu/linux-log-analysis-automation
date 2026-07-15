# Linux Security Incident Report

## Incident Summary

Authentication logs were analyzed to identify unauthorized login attempts and monitor user authentication activity on the Ubuntu system.

---

## Objective

The objective of this investigation was to automate Linux authentication log analysis using Bash scripting and identify suspicious login behavior.

---

## Investigation Process

The investigation consisted of the following steps:

1. Collect authentication logs.
2. Generate failed SSH login attempts.
3. Generate successful SSH logins.
4. Monitor sudo activity.
5. Extract usernames.
6. Extract source IP addresses.
7. Detect repeated authentication failures.
8. Generate automated reports.

---

## Findings

### Failed Login Attempts

Multiple failed SSH login attempts were successfully detected from the authentication log.

### Successful Authentication

Legitimate SSH login sessions were successfully identified.

### Sudo Activity

Administrative commands executed using sudo were detected and recorded.

### Suspicious IP Addresses

Repeated failed login attempts originating from the same IP address indicate potential brute-force behavior.

---

## Security Impact

Repeated failed authentication attempts may indicate:

- Password guessing attacks
- Brute-force attacks
- Unauthorized access attempts
- Automated login scanning

---

## Recommendations

- Enable Fail2Ban.
- Use SSH key authentication.
- Disable root SSH login.
- Restrict SSH access using firewall rules.
- Enable multi-factor authentication.
- Integrate authentication logs with a SIEM platform.
- Regularly review authentication reports.

---

## Conclusion

The automated Bash scripts successfully analyzed Linux authentication logs and generated meaningful security reports. The project demonstrates practical Linux administration, security monitoring, and automation skills applicable to entry-level SOC operations.
