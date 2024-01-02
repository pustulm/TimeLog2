# DEPLOYMENT OF TIME LOG JS APP

***- OVERVIEW OF A PROJECT -*** 
The main goal of this repo is to make a usage of Terraform and Github Actions for a simple Time Log App.

***-TECHNOLOGIES-***

- Docker
- Node.js
- Kubernetes
- Minikube
- Github Actions
Also in future I want to add Prometheus and Grafana

***-STEPS-***

1. SETUP ENVIROMENT AND SERVER CREATION
  First of all I installed Node.js, after what I intialized a new Node.js proejct, which was basic web server. After few configurations which included defining routes and implementing basic functionalities we can jump in next step.

2. DEVOPS INTEGRATION
  We can split this into few smaller sections.
  -Version Control-
   
  Creating Git repo for version control. After that I can create .gitignore file, after what I can initialize my codebase to the repo.
 
  -Creating Docker File-
  
  After creating repo I'm creating a Dockerfile. Now I'm ready to include this Dockerfile to CI.

  -Continuous Integration-
  
  For CI I decied to use Github Action. My workflow, for now, will include creating a Docker Image on my DockerHub account. 
  
  -Deployment-

  To deploy I use Kubernetes (Minikube). I created a deplyoment file which help me to creating deployment, pods and service on my minikube node.
