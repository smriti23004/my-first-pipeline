# Automated DevSecOps CI/CD Pipeline

This repository demonstrates an advanced, multi-stage DevSecOps pipeline using GitHub Actions. It automatically enforces code quality and security by running parallel linting and vulnerability scans before allowing any code to be deployed to the live environment.

## DevOps & DevSecOps Concepts Applied

*   **DevSecOps & "Shift-Left":** Integrating security checks directly into the development workflow as early as possible, rather than waiting for a post-deployment audit.
*   **Parallel Execution:** Running the testing and security jobs simultaneously to reduce overall pipeline execution time.
*   **Secret Scanning:** Using automated tools to detect hardcoded credentials (like API keys or passwords) before they can be exposed on the internet.
*   **Quality & Security Gates:** Strict pipeline rules (`needs: [test, security]`) that block deployment if either the linter or the security scanner fails.
*   **Continuous Integration (CI):** Automatically validating code syntax using an HTML linter on every commit.
*   **Continuous Deployment (CD):** The automated process of pushing validated, secure code to GitHub Pages.
*   **Configuration as Code (CaC):** Defining the entire infrastructure and pipeline behavior in a single, version-controlled YAML file.

## Pipeline Architecture & Workflow

1. **Code Commit:** Application code is updated and pushed to the `main` branch.
2. **Trigger:** The push event automatically triggers the GitHub Actions workflow.
3. **Stage 1: Parallel Validation Gates**
   * **Job A (Test):** A cloud runner executes HTMLHint to check for syntax errors.
   * **Job B (Security):** A concurrent cloud runner executes **Aqua Trivy** to scan the repository for high/critical vulnerabilities, misconfigurations, and exposed secrets.
   * *Pass/Fail Gate:* If either job fails, the pipeline halts immediately, alerting the developer and blocking deployment.
4. **Stage 2: Deploy**
   * *Dependency:* This stage waits for both Job A and Job B to pass successfully.
   * A new runner checks out the validated code, packages it as an artifact, and deploys it to the live hosting environment.
5. **Live Update:** The secure static site is instantly updated globally.
