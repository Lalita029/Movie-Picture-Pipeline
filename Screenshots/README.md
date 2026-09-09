# Project Verification Screenshots

This folder contains the project's local application checks and GitHub Actions CI/CD captures.

## Local application checks

### Frontend

The React frontend was verified at `http://localhost:3000` and displayed the movie list returned by the backend.

![Local frontend movie list](image.png)

### Backend API

The Flask API was verified at `http://localhost:5000/movies`.

![Local backend API](image-1.png)

The API was also checked from the local network at `http://192.168.1.102:5000/movies`.

![Backend LAN URL](image-2.png)

## GitHub Actions pipeline checks

### Backend CD

![Backend CD workflow](BACKEND%20CD.png)

### Backend CI

![Backend CI workflow](BACKEND%20CI.png)

### Frontend CI

![Frontend CI workflow](FRONTEND%20CI.png)

### Frontend CD

![Frontend CD workflow](FRONTEND%20CD.png)

## Final AWS evidence

For the final submission, add sequential, unedited captures showing:

1. AWS account identity, EKS cluster ARN, ECR repository ARNs, and deployed image references.
2. `kubectl get svc,pods,deploy,nodes -o wide` output.
3. `kubectl describe deploy` and `kubectl describe svc` output.
4. Frontend and backend ECR image tags and digests.
5. Current deployed frontend and backend LoadBalancer URLs.

Every AWS screenshot must show a timestamp and a unique identifier such as the Git commit SHA, AWS account ID, resource ARN, ECR digest, EKS cluster ARN, or LoadBalancer hostname. Do not reuse screenshots from another project or alter the captures.