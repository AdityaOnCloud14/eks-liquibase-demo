# Liquibase Kubernetes Application

This is a Spring Boot application that demonstrates the use of Liquibase for database migrations in a Kubernetes environment.

## Project Structure

```
liquibase-k8s-app/
├── Dockerfile              # Main application Dockerfile
├── Dockerfile.liquibase    # Liquibase migration Dockerfile
├── liquibase-app-deployment.yaml  # Kubernetes deployment
├── service.yaml            # Kubernetes service
├── src/
│   └── main/
│       └── java/
│           └── com/
│               └── liquibase/
│                   ├── Application.java
│                   └── controller/
│                       └── HealthController.java
│       └── resources/
│           └── application.properties
└── pom.xml
```

## Prerequisites

- Java 17
- Maven
- Docker
- Kubernetes cluster
- PostgreSQL database

## Building and Running

1. Build the application:
```bash
mvn clean package
```

2. Build Docker images:
```bash
docker build -t adityadhar/liquibase-app:latest .
docker build -f Dockerfile.liquibase -t adityadhar/liquibase-migrator:latest .
```

3. Deploy to Kubernetes:
```bash
kubectl apply -f liquibase-app-deployment.yaml
kubectl apply -f service.yaml
```

## Database Migrations

Database migrations are handled by Liquibase. The migrations are run as a separate job in Kubernetes before the main application starts.

## Health Check

The application exposes a health check endpoint at `/health`. 