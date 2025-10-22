# The infrastructure for the Hogwarts Application
## Overview
This repository contains the infrastructure code for deploying and managing the Hogwarts Application. It includes Terraform configurations.
## Environments
### 1. Development Environment
This platform is considered as a local development environment for the Hogwarts application. It
consists of the following services:
- **Hogwarts Appplication:** The main application service for Hogwarts.
    - **Port**: `8081`
- **Keycloak**: Identity and Access Management (IAM) solution for authentication and authorization.
    - **Port**: `8080`
- **PostgreSQL**: Relational database management system for storing application data.
    - **Port**: `5432`
- **PostGres Admin**: Web-based administration tool for managing PostgreSQL databases.
    - **Port**: `5050`
- **MinIO**: High-performance, S3-compatible object storage service.
    - **Port**: `9000`
- **Redis**: In-memory data structure store, used as a database, cache, and message broker.
    - **Port**: `6379`
### 2. Staging environment
**AWS ACM:**
- Managing SSL certificates

**AWS ALB:**
- Routing to ECS services

**AWS ECS:**
- Managing containers

**AWS EC2:**
- Hogwarts application
- Keycloak

**AWS RDS:**
- PostGreSQL database
- redis cache
- PostGreSQL for Keycloak

**AWS S3:**
- media files

**AWS CloudWatch:**
- Logging
- Monitoring

## File Structure
`/docker`: Contains all docker images for local, staging and production  environments

`/envirnments`: As the name implies it contains scripts to build different environments like local, staging or production. 

`/environments/dev`: Contains scripts to build the local development environment. 

`/environments/staging`: Contains all needed terraform scripts to build the infrastructure on AWS. You need only to run the main.tf file.

`/environments/production`: Contains scripts to build the production environment on AWS.

## How to set up the Development Environment
### 1. Prerequisites
- Docker installed on your local machine.
- Your machine is a linux based os. When I developed this setup I used linux based os. So there might be some issues on other operating systems.

### 2. Run the development infrastructure
```bash
# Clone the repository
git clone https://github.com/thaidoan868/hogwarts-infra
cd hogwarts-infra
git switch dev

# Start the development environment
# Read make help for more commands
make up
```
