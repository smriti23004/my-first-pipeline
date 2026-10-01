# Secure Cloud-Native CI/CD & Docker Pipeline

This repository demonstrates an enterprise-grade DevOps and DevSecOps workflow. It features a multi-stage GitHub Actions pipeline that automatically lints source code, scans for security vulnerabilities in parallel, and builds a secure, production-ready Docker container published to the GitHub Container Registry (GHCR).

## DevOps & Cloud-Native Concepts Applied

*   **Containerization (Docker):** Packaging the application and its web server dependencies into a single, immutable artifact that runs consistently across any cloud provider.
*   **Artifact Repository:** Automatically publishing the built Docker image to the GitHub Container Registry (GHCR).
*   **DevSecOps & "Shift-Left":** Running automated vulnerability and secret scanning (Aqua Trivy) concurrently with code linting, blocking the build if high or critical threats are detected.
*   **Principle of Least Privilege (Security Remediation):** Actively remediating the `DS-0002` container escape vulnerability by utilizing an unprivileged base image (`nginx-unprivileged`) and enforcing a non-root `USER` execution context.
*   **Parallel Execution & Quality Gates:** Running testing and security jobs simultaneously to optimize pipeline speed, with strict rules (`needs: [test, security]`) that prevent container builds if any gate fails.
*   **Configuration as Code (CaC):** Defining the pipeline architecture in YAML and the infrastructure blueprint in a `Dockerfile`.

## Pipeline Architecture & Workflow

1. **Code Commit:** Application code (`index.html`) or infrastructure blueprints (`Dockerfile`) are updated and pushed to the `main` branch.
2. **Stage 1: Parallel Validation Gates**
   * **Job A (Linting):** A cloud runner validates HTML syntax.
   * **Job B (Security):** Aqua Trivy scans the filesystem and `Dockerfile` for CVEs, misconfigurations (e.g., running as root), and hardcoded secrets.
   * *Pass/Fail Gate:* The pipeline halts immediately if either job fails, sending an alert for remediation.
3. **Stage 2: Build & Push Artifact (Continuous Delivery)**
   * *Dependency:* Strictly requires both validation gates to pass.
   * A runner authenticates with GHCR, builds the Docker image from the validated `Dockerfile`, tags it with the latest commit, and pushes it to the registry.
4. **Result:** A highly secure, portable Docker image is instantly available for deployment to any Kubernetes cluster or cloud server.
