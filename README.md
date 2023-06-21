# Infrastructure as Code Challenge
TheKey's DevOps Challenge

## Challenge Details
The DevOps team at TheKey serves as the infrastructure engineers for the company. Strong competency in cloud environments (specifically Google Cloud) and creating CI/CD pipelines are required for this position.
We don't want this challenge to take too much of your personal time; a minimal viable product (MVP) will do. We want to see how you approach the problem, not write the perfect code.
We are looking for **Terraform code written to deploy a basic Nginx web server that delivers the default website running in a pod within Kubernetes**. This should include the following:

## Requirements
* Terraform code that does the following:
* Build a new nginx:latest image with a custom nginx.conf via Dockerfile
* Create a new namespace
* 2 Replicaset
* 0.5vcpu & 512Mi Limit
* ClusterIP + Port 8080
* 1 Persistent Volume
  * 2Gi capacity
  * local file path (e.g., `${PWD}/pvc`)
* Set nginx logs to write to the above PVC

**Bonus Points** (not required at all) for *any* of the following:
* Make it deployable to a Google Cloud Project
* Show security-first/SecOps practices
* Include some form of CI/CD pipeline code. GitHub Actions, Jenkins, or any other tool is fine.
* Create and use variables so this can be used in multiple builds.
* Create a method to add linting or verify that the code meets [Terraform style conventions](https://www.terraform.io/docs/language/syntax/style.html).

Feel free to send us your questions at the email address from which we sent you the challenge. We're happy to help!

Also, we understand this is an *infrastructure* challenge, and we've tried to make the application easy to manage. If you have [Docker Desktop]([https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop/)) installed on your local system, by enabling Kubernetes, you can easily test your code (and in turn so can we)

## Submission
Please [email a patch](https://thoughtbot.com/blog/send-a-patch-to-someone-using-git-format-patch) of your changes to the email address we sent you this challenge from. This allows us to see how you utilize git but ensures your submission isn't visible to everyone else. Pull Requests and Forks show everyone else your work.

> Note: you'll want to check out a new branch for your work to make correctly formatting the patch easier.
> ```
> git checkout -b my-branch
> ## make your changes, committing along the way
> git format-patch main --stdout > your-name.patch
> ```
