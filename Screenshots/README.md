# Project Verification Screenshots

These screenshots are original local verification captures for this project. They show the frontend and backend running together on the developer machine; they are not a substitute for AWS CI/CD and EKS ownership evidence.

## Local frontend

The React frontend is running at `http://localhost:3000` and displays the movie list returned by the backend.

![Local frontend movie list](image.png)

## Local backend API

The Flask backend returns the movie JSON response at `http://localhost:5000/movies`.

![Local backend API](image-1.png)

The same API is reachable from the local network at `http://192.168.1.102:5000/movies`.

![Backend LAN URL](image-2.png)

## AWS submission evidence still required

Before submission, add your own sequential, unedited screenshots for:

1. Frontend CI and CD workflow runs.
2. Backend CI and CD workflow runs.
3. AWS account identity, EKS cluster ARN, ECR repository ARNs, and deployed image references.
4. `kubectl get svc,pods,deploy,nodes -o wide` output.
5. `kubectl describe deploy` and `kubectl describe svc` output.
6. Frontend and backend ECR image tags and digests.
7. Current deployed frontend and backend LoadBalancer URLs.

Every AWS screenshot must be sequential and unedited, with a timestamp and a unique identifier such as the Git commit SHA, AWS account ID, resource ARN, ECR digest, EKS cluster ARN, or LoadBalancer hostname. Do not reuse screenshots from another project.