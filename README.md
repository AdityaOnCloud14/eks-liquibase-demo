# EKS Liquibase Demo

This project demonstrates how to use Liquibase for database migrations in a Kubernetes environment.

## Project Structure

```
eks-liquibase-demo/
├── deploy/
│   ├── liquibase-update-job.yaml    # Job to apply migrations
│   ├── liquibase-rollback-job.yaml  # Job to rollback migrations
│   ├── update.bat                   # Windows script to trigger update
│   ├── rollback.bat                 # Windows script to trigger rollback
├── src/
│   └── main/resources/db/
│       └── db.changelog-dev.sql     # Liquibase changelog
├── Dockerfile.liquibase              # Liquibase Dockerfile
├── build.bat                         # Build script
└── README.md
```

## Prerequisites

- Docker
- Kubernetes cluster
- kubectl configured to access your cluster
- MySQL database (RDS or other)

## Setup

1. Create the Kubernetes secret for database credentials:
```bash
kubectl create secret generic db-credentials \
  --from-literal=username='your-username' \
  --from-literal=password='your-password' \
  -n liquibase-test
```

2. Build the Liquibase migrator image:
```bash
build.bat
```

## Usage

### Applying Migrations

To apply database migrations:
```bash
deploy\update.bat
```

### Rolling Back Migrations

To rollback the last migration:
```bash
deploy\rollback.bat
```

## Database Schema

The changelog (`db.changelog-dev.sql`) creates two tables:
1. `employee` - Stores employee information
2. `department` - Stores department information with a reference to the department manager

## Troubleshooting

If migrations fail:
1. Check the job logs:
```bash
kubectl logs job/liquibase-update
```
2. Verify database connection details in the job YAML files
3. Ensure the Kubernetes secret exists and contains correct credentials 