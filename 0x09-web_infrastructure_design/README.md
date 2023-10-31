Task 0: Simple Web Stack

What is a server?

A server refers to a computer hardware and software (system) that provides resources such as services, data, or programs to other computers (known as clients) over a network. Servers therefore store and process data. Examples of servers are web servers, proxy servers, application servers, file transfer protocol servers, file servers, mail servers, DNS servers, database servers and print servers. 

Role of the domain name

The primary role of the domain name is to identify internet resources such as computers, networks, and services with text-based labels (names) that are easier for human beings to memorize instead of numerical IP addresses. They therefore act as user-friendly alternatives to the numeric IP addresses which the computers use to identify resources on the internet. 

What type of DNS record www is in www.foobar.com

The www in www.foobar.com is a subdomain of the domain foobar.com. It is therefore associated with the CNAME (Canonical Name) DNS record. A CNAME is a DNS record that points a domain name (an alias) to another domain. The name that an alias points to is called a canonical name (CNAME). In this case, www.foobar.com points to foobar.com which points to the actual IP address using A record. 

Role of a web server

A web server is a computer system that is capable of accepting requests from clients, processing the requests, and responding to them by sending web content over the internet via a web browser. Web servers perform this function using the Hypertext Transfer Protocol (HTTP). In summary, the primary role of a web server is to store, process, and deliver web pages to its users. Examples of web servers are Nginx, Apache HTTP server, and Microsoft Internet Information Services (IIS). Web servers deliver static content as it it in the host. 

Role of the application server

While web servers deliver static content such as a webpage’s HTML, CSS, Images, Videos, and files, application servers deliver the same plus an additional dynamic content such as real-time updates, or personalized information to users. Application servers consist of applications which carry out specific operations (data processing) before sending the result to the client. Examples of activities carried out by application servers are user authentication, and processing and serving HTML and CSS files (done by web servers). 

These servers execute application-specific logic and generate dynamic content which is then displayed to the user. They achieve this function by running the server side (backend) code such as Python, PHP, and Ruby. 

Role of a database

A database refers to a collection of logically related information that is organized so that it can be easily accessible, managed, and updated through database management systems (DBMS). In summary, databases are used for storage, retrieval, updation, and analysis of data. 

What is the server using to communicate with the computer of the user requesting a website?

Servers communicate with the computers of users using specific protocols. These protocols are rules that govern the establishment, sustenance, and termination of that communication. Examples of these protocols are Hypertext Transfer Protocol (HTTP), HTTPs, Transmission Control Protocol/Internet Protocol (PCP/IP), Domain Name System (DNS) and Secure Shell (SSH) among others. The type of protocol used depends on a specific purpose of the communication. 

For instance, for a user requesting a website, the protocol used for communication between the server and the user is HTTP(s). This communication is facilitated by TCP/IP which ensures reliable transmission of data by breaking it into packets, sending the packets, and reassembling them at the user’s end. DNS is also used to resolve the text the user types on the browser into an IP address. 

Possible Issues

Single Point of Failure (SPOF) - A single point of failure is part of a web infrastructure system that if it fails will cause the entire system to fail. This problem is solved through redundancy. 

Downtime during maintenance - A single server web infrastructure such as this will be down during maintenance. This is because there is only one server and one database. This problem too can be solved through redundancy. 

Cannot scale if too much traffic is coming - This single server infrastructure cannot scale if too much traffic is coming because there is no other server in the system to help in balancing the load. 

Task 1: Distributed Web Infrastructure

This web infrastructure is an upgrade from the previous one which was simple (Just a single server). How is this an upgrade?
It consists of 3 identical servers
It consist of a load balancer (HAproxy)

Reasons for adding 2 more servers and a load balancer

The two additional servers introduced to the system are known as redundant servers. They serve as a backup in case the server in use fails so that our website can continue operating. Redundant or backup resources such as the two additional servers minimizes or prevents downtime in network systems. 

HAProxy stands for High Availability Proxy. It is a popular open source software TCP/HTTP load balancer and proxying solution. Its common use is to improve the performance and reliability of a server environment. It achieves this by distributing the workload across multiple servers. In my web infrastructure, the load balancer is used to distribute HTTP requests across the 3 servers ensuring that the system performance is high and cannot fail in case one server fails. In summary, HAProxy improves speed and performance by distributing workload across the three servers. 

The distribution algorithm that my load balancer is configured with is predictive load balancing which monitors the performance of each of the three servers and directs requests to the one whose performance is highest at any given time. This algorithm combines the fastest and least connections algorithms hence the best. 

Active-Active and Active-PAssive Load Balancing

In active-active load balancing, all servers are up and running at any given time and workload is distributed among them based on a particular algorithm such as fastest, least connections, observed, predictive, and round robin. Active-passive on the other hand is a set up in which one server remains active handling all workload while the passive server remains on standby. If the active one fails, the passive one takes over making sure there is no interruption. 

The system I have designed is an active-active one because all servers are up and running at any given time and they handle requests based on what the load balancer directs to them. 

Working of a database primary-replica (master-slave)
A master-slave is a database architecture that is divided into a master database and slave databases. The slave database serves as the back up for the master database. The master database is used for write operations but read operations are spread among multiple slave databases. The master-slave databases may have asynchronous or synchronous replication. In synchronous replication, changes made on the master database reflect immediately on the slave databases. In asynchronous replication, changes made on the master database are queued up and written later on the save ones. 

The master database is also called the primary node. It handles all write operations such as insert, update, and delete. It is the one that maintains the primary copy of data. The slave databases are known as replica or secondary nodes. They are copies of the data contained in the primary node. They only handle read operations. 

My architecture is still lacking salve databases (replicas/secondary dbs)

Possible Issues

The possible areas of SPOF in this structure are failures at the individual servers such as web server, application server, and database server from which all the three servers depend.
The absence of a firewall and not using HTTPS makes my architecture vulnerable because the requests to the server and responses are not protected. They can be intercepted and read by anybody. It is also impossible to filter and control incoming traffic because that function is carried out by a firewall. 
My system also lacks monitoring. It is therefore impossible for me to know when the system is attacked or is performing poorly. 


Task 2: Secured and Monitored web infrastructure

The secured and monitored web infrastructure has additional features that ensures that the communication between the clients and servers are secured and monitored. 3 Firewalls are included between the servers and the web resources. The purpose of these firewalls is to secure the network from cyber attacks. It prevents malicious and unwanted content from entering the environment. It also prevents unauthorized access by people such as hackers and insiders. The traffic is now served over HTTPS instead of HTTP because HTTPS requests are protected by Secure Socket Layer (SSL).
Monitoring clients, also known as data collectors or agents are software components that collect, process, and transmit data from various sources to a monitoring or log management services such as sumo logic. They help in analyzing log data of a system, its performance and other metrics. If I want to monitor my web server’s Query Per Second (QPS), I will analyze the data collected by my monitoring clients to establish how many requests the system receives per second. 

Terminating SSL at the load-balancer level poses various issues such as security in case the load balancer is compromised, performance degradation especially if the load balancer is less powerful to handle incoming traffic, and complexity of the infrastructure. 
Having only one MySQL server capable of accepting write is an issue because if write fails, all write requests will fail. It is also a hindrance to scalability. It can also slow down the system in case it receives a huge traffic. 
Having servers with all the same components such as mine is a problem because a fail in one of them will shut down the entire system. 

Task 3: Scale up

This task includes an additional load balancer and creates duplicates of the web, application, and database servers.

