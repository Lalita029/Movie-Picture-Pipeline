#!/bin/bash
set -euo pipefail

OUTPUT_DIR="${1:-Screenshorts/evidence-$(date -u +%Y%m%dT%H%M%SZ)}"
CLUSTER_NAME="${EKS_CLUSTER_NAME:-cluster}"
AWS_REGION="${AWS_REGION:-us-east-1}"

mkdir -p "$OUTPUT_DIR"
exec > >(tee "$OUTPUT_DIR/verification.txt") 2>&1

echo "UTC timestamp: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "Git commit: $(git rev-parse HEAD)"
echo

echo '--- AWS identity ---'
aws sts get-caller-identity

echo '--- EKS cluster ---'
aws eks describe-cluster \
  --name "$CLUSTER_NAME" \
  --region "$AWS_REGION" \
  --query 'cluster.{name:name,arn:arn,status:status,endpoint:endpoint}' \
  --output table

echo '--- ECR repositories ---'
aws ecr describe-repositories \
  --region "$AWS_REGION" \
  --repository-names frontend backend \
  --query 'repositories[].{name:repositoryName,arn:repositoryArn,uri:repositoryUri}' \
  --output table

echo '--- Kubernetes resources ---'
kubectl get svc,pods,deploy,nodes -o wide

echo '--- Deployment details ---'
kubectl describe deploy

echo '--- Service details ---'
kubectl describe svc

echo '--- Frontend ECR images ---'
aws ecr describe-images \
  --region "$AWS_REGION" \
  --repository-name frontend \
  --query 'imageDetails[].{tags:imageTags,digest:imageDigest,pushed:imagePushedAt}' \
  --output table

echo '--- Backend ECR images ---'
aws ecr describe-images \
  --region "$AWS_REGION" \
  --repository-name backend \
  --query 'imageDetails[].{tags:imageTags,digest:imageDigest,pushed:imagePushedAt}' \
  --output table

echo '--- Service endpoints ---'
kubectl get svc frontend backend \
  -o custom-columns='NAME:.metadata.name,EXTERNAL-IP:.status.loadBalancer.ingress[*].hostname,PORT:.spec.ports[*].port'

echo
echo "Evidence saved to $OUTPUT_DIR/verification.txt"
echo "Capture this terminal session as sequential, unedited screenshots with the timestamp and identifiers visible."