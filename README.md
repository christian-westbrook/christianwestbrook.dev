This repository contains the source code for [christianwestbrook.dev](https://christianwestbrook.dev/), the personal blog site of Christian Westbrook.

## Project Structure

### Folders

| Folder | Purpose |
|--------|---------|
| docs/ | Architectural model as code using Structurizr: https://structurizr.com/ |
| infra | Git hooks for automated CI/CD and nginx configuration files for serving web content from inside an application container |
| public/ | Created by the build process to store output files ready to be served by a web server |
| src/ | Source files used to build the site |

### Files

| Filename | Purpose |
|----------|---------|
| `.dockerignore` | Tells Docker which files to ignore when copying files into an application container |
| `.gitignore` | Tells Git which files to ignore when tracking development |
| `Dockerfile` | Configures an application container using Docker: https://www.docker.com/ |
| `Jenkinsfile` | Configures a continuous integration and delivery pipeline using Jenkins: https://www.jenkins.io/ |
| `LICENSE` | Specifies how others may legally use this software |
| `Makefile` | Defines the build process using GNU Make: https://www.gnu.org/software/make/ |
| `README.md` | Documents the project structure |

