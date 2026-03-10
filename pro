sudo dnf install wget unzip -y
wget https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip
unzip terraform_1.5.0_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform -version


nano main.tf
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = ">= 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "example" {
  filename = "lab.txt"
  content  = "Hello DevOps Lab"
}


terraform init
terraform plan
terraform apply



ls
cat lab.txt



6 ansible
sudo dnf install ansible -y
ansible --version


sudo nano /etc/ansible/hosts


//write at the bottom

[local]
localhost ansible_connection=local

// check local host

ansible all --list-hosts

//testing
ansible all -m ping


7 excersice 
ansible all -m ping
ansible all -a "df -h"

nano playbook.yml

- hosts: all
  become: yes
  tasks:
    - name: Install Apache
      dnf:
        name: httpd
        state: present

ansible-playbook playbook.yml


Exercise 8 — Setup Jenkins Server in VM (Fedora)
1️⃣ Install Java
sudo dnf install java-11-openjdk -y

Check Java:

java -version
2️⃣ Add Jenkins Repository
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
3️⃣ Import Jenkins Key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
4️⃣ Install Jenkins
sudo dnf install jenkins -y
5️⃣ Start Jenkins Service
sudo systemctl start jenkins

Enable Jenkins:

sudo systemctl enable jenkins

Check status:

sudo systemctl status jenkins
6️⃣ Open Jenkins in Browser
http://localhost:8080
7️⃣ Get Jenkins Initial Password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

3️⃣ Connect GitHub Repository

Go to:

Source Code Management

Select:

Git

Enter repository URL:

https://github.com/username/devops-lab.git
4️⃣ Add Build Step

Scroll to Build section → Click:

Add Build Step → Execute Shell

Write:

echo "Running Jenkins Build"
5️⃣ Build the Project

Click:

Save

Then click:

Build Now

Jenkins will pull code from GitHub and run the build.