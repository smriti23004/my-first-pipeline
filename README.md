# Automated CI/CD Pipeline with Quality Gates

This repository demonstrates a foundational DevOps workflow: a multi-stage Continuous Integration and Continuous Deployment (CI/CD) pipeline. It automatically lints code for errors and, upon passing, deploys a static website directly from source control.

## DevOps Concepts Applied

*   **Source Control Management (SCM):** Storing and tracking changes to the code in a centralized **Repository** (GitHub).
*   **Continuous Integration (CI):** Automatically running a **Linter** (HTMLHint) on every commit to catch syntax errors and enforce code quality.
*   **Continuous Deployment (CD):** The automated process of pushing validated code to a live production environment.
*   **Quality Gate:** A rule that blocks the deployment if the testing job fails, protecting the live production environment from broken code.
*   **Job Dependencies:** Configuring pipeline steps sequentially (e.g., `needs: test`) so that downstream jobs only execute if upstream jobs succeed.
*   **Configuration as Code (CaC):** Defining the pipeline's behavior using a declarative **YAML** (`.yml`) file.
*   **Runner:** The temporary, ephemeral cloud servers allocated by GitHub to execute the testing and deployment instructions.

## Pipeline Architecture & Workflow

1. **Code Commit:** Application code (`index.html`) is updated and pushed to the `main` branch.
2. **Trigger:** The push event automatically triggers the GitHub Actions workflow.
3. **Stage 1: Test (Continuous Integration)**
   * A cloud runner spins up, installs Node.js, and runs the HTMLHint linter against the source code.
   * *Pass/Fail Gate:* If the code contains syntax errors (e.g., a missing HTML tag), the pipeline fails, the developer is alerted, and the deployment is halted.
4. **Stage 2: Deploy (Continuous Deployment)**
   * *Dependency:* This stage strictly requires Stage 1 to pass (`needs: test`).
   * A new runner checks out the validated code, packages it as an **Artifact**, and deploys it to GitHub Pages servers.
5. **Live Update:** The static site is instantly updated globally with zero manual intervention.
