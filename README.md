# Infrastructure as Code Challenge

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
