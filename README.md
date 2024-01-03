# DEPLOYMENT OF TIME LOG JS APP

### **- OVERVIEW OF A PROJECT -** 
The main goal of this repo is to make a usage of Terraform and Github Actions for a simple Time Log App. We'll use VSC as our IDE.

### **-TECHNOLOGIES-**

- Docker and DockerHub account
- Kubernetes (kubectl, minikube)
- GitHub account
- Terraform
- Nginx


### **- STEPS -**

*1.* Creating an app.

The first step is to create a base application. I will use the app idea from my previous project for this. This time it will be written in JS, and it will be an app that will show on time logs.

*2.* Creating Git repository.

After creating the application, the next task is to create a repo on github. Then I create a .gitignore file that will prevent node modules from being uploaded to github, with each commit
  
*3.* Dockerizing the App .

The next step is to dockerize the apilaction. For this, I create a DockerFile, which will create the image needed to run the application.

*4.* Creating CI with Github Actions

We will use GitHub's Github Actions tool to create the CI. The task of our workflow will be to create a Docker image, which will then be uploaded to DockerHub, using credentials from our DockerHub account.

*5.* Deploying App

To deploy the appke will use Kubernetes (minikube). To manage this infrastructure I will use Terraform. For the purpose of this, I have created a providers file, as well as a configuration file for kubernetes, which will provide services and pods.

### **- SUMMARY -**
