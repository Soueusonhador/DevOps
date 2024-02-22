# DevOps Tasks

## Task 1: Node Monitoring Tool with Push Notifications
**Description:**  
Develop a Python application for monitoring nodes, collecting alerts, notifications, and logs, and analyzing them to provide notifications in the console. The tool should provide the following functionalities:
- Collect alerts, notifications, and logs from multiple nodes in the network.
- Analyze the collected data to identify critical events or issues.
- Display the analyzed data in a simple format in the terminal for critical events.

**Requirements:**
- The Python application should include functionality to collect and store alerts, notifications, and logs from the monitored nodes.
- Implement an analysis module to process the collected data and identify critical events.
- The UI dashboard should provide real-time updates and push notifications for critical events.

**Evaluation Criteria:**
- Correctness and efficiency of the data collection and analysis logic.
- Implementation of notification capabilities.
- Proper error handling and logging of critical events.
- Clean and well-structured Python code with appropriate comments.

## Task 2: Multi-Cloud Node Provisioning with Terraform
**Description:**  
Develop a Terraform script that provisions a network of nodes, assigning random node IDs, in both Google Cloud Platform (GCP) and Amazon Web Services (AWS). The tool should provide the following functionalities:
- Provision 5 nodes in GCP and 5 nodes in AWS using Terraform.
- Ensure that each node is created in a different region and zone every time the script is executed.
- Generate a report or log with the details of the provisioned nodes, including their node IDs, cloud provider, region, and zone.

**Requirements:**
- The Terraform script should define the infrastructure for provisioning nodes in GCP and AWS.
- It should use random assignment logic to select different regions and zones for each node.
- The script should generate a report or log containing the details of the provisioned nodes.

**Evaluation Criteria:**
- Correctness and efficiency of the Terraform script in provisioning nodes across GCP and AWS.
- Proper handling of cloud provider-specific configurations and resources.
- Implementation of random region and zone assignment logic.
- Clean and well-structured code with appropriate comments.

## Task 3: Develop a Network Monitoring Tool
**Description:**  
Create a shell script that monitors the network connectivity and status of nodes in the network. The tool should provide the following functionalities:
- Ping a list of specified nodes and display the status of each node (reachable or unreachable).
- Log the timestamp and status of each node in a file for historical analysis.
- Provide an option to send an email notification if any node becomes unreachable.

**Requirements:**
- The script should accept a list of node IP addresses or hostnames as input.
- It should use the ping command to check the connectivity status of each node.
- The script should log the results to a file with timestamps.
- Implement an option to send an email notification if any node is unreachable.
