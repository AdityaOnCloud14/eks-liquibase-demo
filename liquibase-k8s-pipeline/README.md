# Liquibase Kubernetes Pipeline

This project demonstrates a complete CI/CD pipeline for database migrations using Liquibase in a Kubernetes environment.

## Project Structure

```
liquibase-k8s-pipeline/
├── deploy/
│   ├── liquibase-update-deployment.yaml   # Update deployment (init container style)
│   ├── liquibase-rollback-deployment.yaml # Rollback deployment (init container style)
├── .harness/
│   ├── liquibase-cd-pipeline.yaml         # Main Harness pipeline (Update + Rollback parallel)
├── concourse/
│   ├── liquibase-build-pipeline.yml       # Concourse CI for building docker image
├── docker/
│   ├── Dockerfile.liquibase               # Dockerfile for liquibase
├── src/
│   ├── main/
│   │   └── resources/
│   │       └── db/
│   │           └── db.changelog-dev.sql   # SQL changelogs (dogs and cats etc.)
```

## Setup Instructions

1. **Prerequisites**
   - Kubernetes cluster
   - Docker registry access
   - Harness CD setup
   - Concourse CI setup

2. **Configuration**
   - Update the database credentials in Kubernetes secrets
   - Configure the Docker registry credentials
   - Set up the necessary environment variables

3. **Deployment**
   - The pipeline will automatically build and deploy the Liquibase changes
   - Rollback is available if needed

## Features

- Automated database migrations
- Rollback capability
- Environment-specific changelogs
- Secure credential management
- CI/CD integration

## Usage

1. Add your database changes to the changelog files
2. Commit and push changes
3. The pipeline will automatically:
   - Build the Docker image
   - Deploy the changes
   - Handle rollback if needed

## Security Notes

- Database credentials are managed through Kubernetes secrets
- Docker registry credentials are securely stored
- All sensitive information is properly encrypted 