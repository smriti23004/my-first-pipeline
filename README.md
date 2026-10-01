# Automated CI/CD Pipeline with GitHub Actions

This repository demonstrates a foundational DevOps workflow: an automated Continuous Integration and Continuous Deployment (CI/CD) pipeline that deploys a static website directly from source control.

## DevOps Concepts Applied

*   **Source Control Management (SCM):** Storing and tracking changes to the code in a centralized **Repository** (GitHub).
*   **Continuous Integration / Continuous Deployment (CI/CD):** The automated process of taking code changes and pushing them to a live production environment without manual intervention.
*   **Pipeline:** The sequence of automated steps (Checkout, Build, Deploy) defined in our configuration.
*   **Configuration as Code (CaC):** Defining the pipeline's behavior using a declarative **YAML** (`.yml`) file rather than configuring servers manually.
*   **Trigger:** The specific event (a **Push** or **Commit** to the `main` branch) that tells the pipeline to start executing.
*   **Runner:** The temporary, ephemeral cloud server allocated by GitHub to execute the pipeline instructions.
*   **Artifact:** The packaged version of the code that gets deployed to the hosting environment.

## Pipeline Architecture & Workflow

1.  **Version Control Setup:** Created a public repository to act as the single source of truth for the application code.
2.  **Code Commit:** Wrote the application code (`index.html`) and committed it to the `main` branch. 
3.  **Pipeline Configuration:** Switched the hosting source to GitHub Actions, which automatically generated a `.github/workflows/static.yml` workflow file. This file dictates the infrastructure automation.
4.  **Automated Execution:** 
    *   Whenever a new commit is pushed, the **Trigger** fires.
    *   GitHub spins up a **Runner** (a Linux environment in the cloud).
    *   The runner executes the **Checkout** step (pulling the code from the repo) and the **Deploy** step (uploading the artifact).
5.  **Continuous Deployment:** The static site is instantly published to GitHub Pages servers and updated globally, achieving a zero-touch deployment cycle.
