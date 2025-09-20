# ABC-20092025

1. Create a Linux VM in Azure Portal
A new Linux virtual machine was provisioned using the Azure portal. During setup, SSH authentication was configured by uploading a public key to the VM, and a static public IP address was assigned to ensure reliable remote connectivity and automation access.

2. Store the Certificate in Ansible Vault
The SSH private key or access certificate generated for the VM was securely encrypted using Ansible Vault. This approach ensures sensitive credentials are not exposed in plain text and can be safely injected into automation workflows. The encrypted vault file is committed to source control for traceability but remains protected from unauthorized access.

3. Execute Configuration Tasks with Ansible Playbook
An Ansible playbook was authored to automate setup tasks on the VM:

Install Terraform and Git: The playbook ensures that both Terraform and Git CLI tools are installed and up-to-date, forming the foundation for infrastructure-as-code (IaC) deployment and code management.

Clone the Terraform Scripts Repository: Using secure credentials, the playbook clones the GitHub repository containing all required .tf configuration files for automated provisioning.

Execute Terraform Scripts: The playbook runs the Terraform scripts within the cloned repository and directs the command output to a log file. This enables consistent infrastructure setup and records operations for troubleshooting.

Cleanup Temporary Files: Post-execution, the playbook removes both the cloned repo and any temporary files to maintain the VM’s hygiene and minimize residual artifacts.

4. Create a Dedicated GitHub Repository
A repository named ABC-20092025 was created on GitHub to version-control the entire project. This repository stores all scripts, playbooks, documentation, and related automation files. Maintaining a centralized repository ensures code integrity, collaboration, and CI/CD enablement.

5. Verification of Tool Installation
A shell script was added to the repository to verify installation of Terraform and Git on the target Linux VM. This script checks for the existence and correct version of each tool, providing instant diagnostics during deployment or troubleshooting.

6. Infrastructure Pipeline Automation with AZD
An Azure Developer CLI (azd) pipeline was created to orchestrate the Ansible-driven configuration workflow (step 3). This pipeline automates execution, enabling repeatable infrastructure setup and rapid environment provisioning with minimal manual intervention. Pipeline logs are reviewed to ensure successful completion of all tasks.

