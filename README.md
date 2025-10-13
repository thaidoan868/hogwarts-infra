# The infrastructure for the Hogwarts Application
## Overview
This repository contains the infrastructure code for deploying and managing the Hogwarts Application. It includes Terraform configurations.
## Local Platform for the Hogwarts application
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
## How to run the platform 

