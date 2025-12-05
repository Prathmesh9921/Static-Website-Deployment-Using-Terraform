# 🚀 Deploy a Static Website on AWS EC2 Using Terraform

This project demonstrates how to automate the deployment of a **static website** on an **AWS EC2 instance** using **Terraform**.  
The EC2 instance is provisioned with **Nginx**, and the website files are automatically cloned from a GitHub repository using **User Data**.

---

## 📌 Project Overview

- Infrastructure is fully created using **Terraform IaC**.
- A **Security Group** is created which allows:
  - HTTP (80)
  - SSH (22)
- Terraform provisions an **EC2 instance** inside the default VPC.
- **User Data** installs Nginx and deploys the website.
- Easy to deploy and destroy using Terraform commands.

---


---

## ⚙️ Prerequisites

Make sure you have:

- AWS Account
- IAM User with EC2 & VPC permissions
- Terraform installed (`terraform -v`)
- Existing EC2 Key Pair in AWS
- Forked static website repository

---

## 🧩 Terraform Configuration

### **main.tf**
Responsible for:

- Provider configuration  
- Security Group creation  
- EC2 instance deployment  
- User Data injection  

### **variables.tf**
Stores AMI ID, instance type, key pair name.

### **userdata.sh**
Installs Nginx & deploys the static website.

---

## ▶️ How to Deploy

### **1️⃣ Initialize Terraform**
```bash
terraform init
