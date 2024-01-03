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

*6.* Nginx

For now, last step is create a Nginx configuration file that acts as a reverse proxy to forward incoming requests to a timelog application deployed within a Kubernetes cluster.

### **- FUTURE -**

Further improvements I see for this project is the addition of server status monitoring tools such as Grafana and Prometheus. In the future, I would also like to add a CD for minikube here, which I tried to implement, but encountered minor problems, probably due to lack of experience. I tried to do it with AWS, which in turn worked out for me, but due to the need for fees, I had to limit this option.

A bigger step, would be to create a database to collect server logs, but this would require more streamlining.

### **- SUMMARY -**

The main purpose of this project, was to learn about the infrastructure management tool, Terraform. I used it in a very simple case, but it gave me some insight and also an idea of how it can be used on a larger scale and how convenient a tool it is to use. In addition, I also used Nginx for the first time in my project, which in this case was simply used to get acquainted with it rather than for any specific purpose that would improve the performance of the entire application. It is always something that in the future can give a foundation for using this tool in larger projects.ł

Of course, the project also included tools such as Docker or Github Actions, but this is not my first contact with them, so I got around without major problems.

This is definitely a project that I will want to develop in the future, because it provides a sandbox for me, into which I can deploy more and more DevOps tools
