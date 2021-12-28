## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/glop12/uofmporject1/blob/main/Diagrams/Project1Diagram.png?raw=true

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._
metricbeat-config.yml
metricbeat-playbook.yml
filebeat-config.yml
file-beat-config.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting direct access to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?


     admin will need to log on to this devices first and its a secure computer.
     
load balancers protects with DDOS attacks. It balances traffic and directs its to servers so it can spread the work among servers


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the vulnerable VMs and system metric.
- _TODO: What does Filebeat watch for?_


    Forwarding and centralizing log data

- _TODO: What does Metricbeat record?_


    Records system and services running on the server

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| JumpBoxProbisioner | Gateway  | 10.0.0.1   | Linux            |
| Web-1    |  Web server        |  10.0.0.10          | Linux                 |
| Web-2    |  Web server        |  10.0.0.9          |      Linux            |
| Web-3    |  Web server        |   10.0.0.12         |          Linux        |
|ElkServer  | Elk server        | 10.1.0.4           |         Linux         |
| RTLoadBalancer    | Load Balancer          |    40.77.46.46        |   --------               |
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

-- Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses_


    75.72.34.184 - Workstation


Machines within the network can only be accessed by SSH.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_


    Its being accessed through my Workstation and which i have to use Jumpbox inorder to connect and then connect to my 
    container from there i am able to connect to the ELK server

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| JumpBoxProvisioner | Yes               |    Host: 75.72.34.184  |
|          | |ElkServer: 10.1.0.4 |
|          | |Web-1: 10.0.0.10, Web-2: 10.0.0.9, Web-3: 10.0.0.12|
| ElkServer | Yes               |   Host: 75.72.34.184    |
|          | |JumpBoxProvisioner: 40.86.9.245|
|          | |Web-1: 10.0.0.10, Web-2: 10.0.0.9, Web-3: 10.0.0.12|
| Web-1| No               |    JumpBoxProvisioner: 40.86.9.245   |
|          | |RTLoadBalancer: 40.77.46.46|
| Web-2| No               |    JumpBoxProvisioner: 40.86.9.245   |
|          | |RTLoadBalancer: 40.77.46.46|
| Web-3| No               |    JumpBoxProvisioner: 40.86.9.245   |
|          | |RTLoadBalancer: 40.77.46.46|
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_


    Doesn't require an agent installation. Yaml files are easy to understand and they're much easier to catch errors.


The playbook implements the following tasks:
- Install docker
- Than we are going to install pip3
- we are going to configure the machine to increase the memory to 262144. this is when running the Elk Container 
- Docker python module will be installed
- We are going to image and launch elk container - the ports that this will use will be 5601:5601, 9200:9200 and 5044:5044

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://raw.githubusercontent.com/glop12/uofmporject1/main/Diagrams/Elk-Container%20picture.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_

    
    Web-1: 10.0.0.10 
    Web-2: 10.0.0.9 
    Web-3: 10.0.0.12

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_

    
    Filebeat
    Metricbeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

    
    Metricbeat: is used to monitor Performance in this case it monitors container performance and send this information
    Elasticsearch. 
    Filebeat: is used to monitor and collects log events and sends them to Elasticsearch

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Filebeat-playbook.yml file to /etc/ansible.
- Update the filebeat-config.yml file to include 10.1.0.4:9200 in the elasticsearch line and 10.1.0.4:5601 in Kibana line.
- Run the playbook, and navigate to http://ElkServerIP:5601/app/kibana to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
