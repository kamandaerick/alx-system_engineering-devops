### **Postmortem Report: Nginx Service Outage Due to Misconfigured User**

#### **Issue Summary**

- **Duration of Outage**:  
  **Start**: August 18, 2024, 10:21 AM UTC  
  **End**: August 18, 2024, 1:10 PM UTC  
  **Total Duration**: 2 hours 49 minutes

- **Impact**:  
  During the outage, the Nginx web server on one of the backend servers was non-operational. This resulted in the HAProxy load balancer only serving content from the remaining operational server, instead of distributing traffic between both servers as intended. Approximately 50% of incoming web traffic was routed to a single server, leading to potential latency issues and reduced fault tolerance. There were no reports of downtime from end users, but the system was operating below optimal efficiency.

- **Root Cause**:  
  The Nginx service failed to start due to a misconfiguration in the `nginx.conf` file. The configuration specified that Nginx should run under a non-existent `nginx` user, leading to a failure in service startup.

---

#### **Timeline**

- **10:21 AM**: Issue detected through a manual check using `curl`. The load balancer's round-robin configuration was not alternating between servers.
- **10:22 AM**: Initial investigation began by verifying the HAProxy configuration and confirming it was correctly set up to distribute traffic.
- **10:35 AM**: Investigated the backend servers and noticed that one server was not responding to requests.
- **10:40 AM**: Checked the status of Nginx on the problematic server and discovered that the service was inactive.
- **10:45 AM**: The error logs revealed that Nginx was failing to start due to a `getpwnam("nginx") failed` error.
- **11:00 AM**: I started investigating the issue by googling the causes and solutions to such a problem.
- **11:15 AM**: I identified the root cause—Nginx was configured to run under a non-existent user.
- **11:30 AM**: I changed the Nginx configuration to run under the `www-data` user, which is the default web server user.
- **11:35 AM**: I verified the configuration syntax and restarted the Nginx service successfully.
- **11:40 AM**: I conducted tests to ensure Nginx was running correctly and that HAProxy was alternating traffic between both servers.
- **1:10 PM**: I confirmed that the system was fully operational and the issue was resolved.

#### **Root Cause and Resolution**

- **Root Cause**:  
The Nginx service was configured to run under the `nginx` user, which did not exist on the system. This caused the service to fail during startup because it couldn’t find the specified user in the system’s user database. The misconfiguration likely occurred during a recent update or deployment when the configuration file was altered without verifying the presence of the `nginx` user.

- **Resolution**:  
  The issue was resolved by editing the `/etc/nginx/nginx.conf` file to change the user directive from `nginx` to `www-data`. The `www-data` user is the default system user for web servers on Ubuntu systems. After making this change, the Nginx configuration was tested for syntax errors using `nginx -t`, and the service was restarted. Nginx then successfully started, and traffic was once again balanced correctly between both servers by HAProxy.

#### **Corrective and Preventative Measures**

- **Improvements/Fixes**:
  - **User Validation**: Implement a script to validate that all user accounts referenced in configuration files actually exist on the system before deploying any configuration changes.
  - **Configuration Management**: Adopt a more rigorous configuration management process that includes peer reviews and automated testing before applying changes to production systems.
  - **Monitoring**: Set up alerts for service failures or inactive states for critical services like Nginx to ensure rapid detection of issues.

- **Task List**:
  1. **Patch Nginx Configuration**: Ensure all servers have the correct Nginx configuration, using the `www-data` user.
  2. **Add Monitoring**: Implement monitoring and alerting for the Nginx service to detect failures immediately.
  3. **Automate User Validation**: Develop and integrate a pre-deployment check that validates all user accounts referenced in system configurations.
  4. **Document Configuration Changes**: Update documentation to reflect the correct user setup for Nginx, ensuring future deployments do not repeat this issue.

By addressing these areas, we can reduce the risk of similar outages in the future and ensure a more resilient web stack.

