#!/bin/bash
set -e

aws rds create-db-instance \
  --db-instance-identifier my-postgres-instance \
  --db-instance-class db.t3.medium \
  --engine postgres \
  --allocated-storage 20 \
  --master-username demo_user \
  --master-user-password demo_password \
  --db-name demo_db \
  --backup-retention-period 7 \
  --no-multi-az \
  --no-publicly-accessible \
  --region us-east-1

