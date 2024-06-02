# Web infrastructure design

This project focused on designing a secure, scalable, and highly available web infrastructure for hosting the website www.foobar.com. The project evolved through several stages, progressively enhancing the architecture to meet specific requirements.

Initially, we designed a simple single-server setup that included a web server (Nginx), an application server, and a MySQL database. This setup highlighted fundamental concepts like the role of a server, DNS, web server, application server, and database. It also identified critical issues such as single points of failure (SPOF), downtime during maintenance, and scalability limitations.

Next, we expanded the infrastructure to a three-server setup, incorporating a load balancer (HAProxy) and splitting the web server, application server, and database onto separate servers. This configuration improved load distribution and redundancy, reducing SPOFs and enhancing performance. We also discussed load balancing algorithms, active-active vs. active-passive setups, and the primary-replica database model.

In the final stage, we further secured the infrastructure by adding firewalls, an SSL certificate for HTTPS, and monitoring clients. This ensured encrypted traffic and continuous monitoring of the system's health. The infrastructure now featured two load balancers configured in a high-availability cluster, with dedicated servers for web, application, and database components.

Throughout the project, we emphasized understanding the purpose and functionality of each component and addressing potential issues such as SSL termination, having a single writable MySQL server, and the necessity for end-to-end encryption. This project demonstrated the principles of designing a robust and secure web infrastructure capable of handling increased traffic and maintaining high availability.
