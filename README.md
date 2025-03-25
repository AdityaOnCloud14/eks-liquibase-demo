---

# 🚀 Liquibase on Amazon EKS with GitHub Actions

This project provides a fully automated solution for managing **PostgreSQL schema and data migrations** using [Liquibase](https://www.liquibase.org/), deployed on **Amazon EKS**, orchestrated with **GitHub Actions**, and integrated with Kubernetes-native workflows.

---

## 🔍 Project Overview

Modern applications evolve quickly, and so do their databases. This project solves the challenge of delivering **repeatable, automated, and auditable** database changes with:

- **Liquibase** for version-controlled schema and data migration
- **Amazon EKS** for scalable, managed Kubernetes
- **GitHub Actions** for continuous delivery
- **Init containers** to dynamically clone migration scripts

---

## 🧠 How It Works

### ➕ What This Project Does:
- Uses a **Kubernetes Job** to run Liquibase migrations inside a container
- Leverages **initContainers** to dynamically clone the latest migration scripts from GitHub
- Automates `update` and `rollback` operations via **GitHub Actions workflow inputs**
- Uses **SQLFluff** to lint SQL migration files before applying them
- Stores **database credentials in Kubernetes secrets**
- Supports connecting to PostgreSQL from DBeaver using port-forwarding

---

## 🔁 Init Container Explained

### Why Use an Init Container?
The `initContainer` is a **key design element** in this solution. Its role is to:
- Clone the latest Liquibase migration scripts from a GitHub repository
- Share them with the main Liquibase container using a shared volume (`emptyDir`)
- Ensure the Liquibase container always uses fresh, version-controlled code

### Benefits:
✅ No need to rebuild container images for migration script updates  
✅ Supports clean GitOps workflows  
✅ Decouples app logic from DB logic

---

## 📂 Project Structure

```bash
eks-liquibase-demo/
├── .github/workflows/
│   └── deploy.yaml                  # GitHub Actions workflow
├── liquibase/
│   ├── db.changelog-master.xml     # Master changelog for Liquibase
│   ├── schema-changes.sql          # Table creation and rollback logic
│   └── data-inserts.sql            # Data inserts and rollback logic
├── manifests/
│   ├── db-credentials-secret.yaml  # Secret containing PostgreSQL credentials
│   ├── postgres-deployment.yaml    # Kubernetes manifest for PostgreSQL
│   ├── postgres-service.yaml       # ClusterIP service to expose PostgreSQL
│   ├── liquibase-job-template.yaml # Templated Kubernetes job for Liquibase
├── .sqlfluff                       # SQL linter config
├── README.md
```

---

## 🛠️ Setup & Usage

### Prerequisites:
- AWS CLI & EKS configured
- kubectl installed
- GitHub Secrets for AWS access
- PostgreSQL deployed on your EKS cluster

---

### 1️⃣ Deploy PostgreSQL & Secrets

Apply the database and secret configs:
```bash
kubectl apply -f manifests/postgres-deployment.yaml -n liquibase-demo
kubectl apply -f manifests/postgres-service.yaml -n liquibase-demo
kubectl apply -f manifests/db-credentials-secret.yaml -n liquibase-demo
```

---

### 2️⃣ Trigger Migration via GitHub Actions

Go to **Actions → Liquibase Migration Pipeline → Run Workflow**

#### Available Inputs:
- `operation`:  
  - `update` → Run pending changesets  
  - `rollbackCount N` → Rollback last N changesets  
- `rollbackCount`: (Only used if `operation=rollbackCount N`)

---

### 3️⃣ How the GitHub Workflow Works

- SQL files are linted using SQLFluff
- Command (update/rollbackCount) is injected into `liquibase-job-template.yaml`
- A Kubernetes Job is created using `kubectl`
- Logs are printed and the job is cleaned up after execution

---

## 🔄 Example: Run Locally

To run the job locally for testing:
```bash
sed "s|__LIQUIBASE_COMMAND__|update|g" manifests/liquibase-job-template.yaml > manifests/liquibase-job.yaml
kubectl apply -f manifests/liquibase-job.yaml -n liquibase-demo
```

To rollback last 2 changes:
```bash
sed "s|__LIQUIBASE_COMMAND__|rollbackCount 2|g" manifests/liquibase-job-template.yaml > manifests/liquibase-job.yaml
kubectl apply -f manifests/liquibase-job.yaml -n liquibase-demo
```

---

## 🧪 SQL Linting with SQLFluff

Included in the pipeline:

```bash
sqlfluff lint liquibase/ --dialect postgres
```

Configure rules via `.sqlfluff`

---

## 🔐 Secrets Management

### Currently Using:
- Kubernetes secret (`db-credentials-secret.yaml`) with base64-encoded values

### Production Recommendations:
| Scope           | Recommended Vault         |
|------------------|----------------------------|
| CI/CD            | GitHub Secrets            |
| Kubernetes       | AWS Secrets Manager       |
| Advanced usage   | HashiCorp Vault + IRSA    |

---

## 🖥️ Connect via DBeaver

Enable port-forwarding:
```bash
kubectl port-forward svc/postgres-service 5432:5432 -n liquibase-demo
```

Then in DBeaver:
- Host: `localhost`
- Port: `5432`
- DB: `demo_db`
- User: `demo_user`
- Pass: `demo_password`

---

## 🧹 Cleanup

To delete the Liquibase job:
```bash
kubectl delete job liquibase-job -n liquibase-demo
```

---

## 📌 Contribution

Feel free to fork the repo, improve SQL linting, or extend rollback strategies!

---

## 🙌 Authors

Maintained by [@AdityaOnCloud14](https://github.com/AdityaOnCloud14)  
Made with ❤️ for database CI/CD on Kubernetes

---
