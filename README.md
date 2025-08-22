This repository contains the source code for [christianwestbrook.dev](https://christianwestbrook.dev/), the personal blog site of Christian Westbrook.

## Project Structure

### Folders

| Folder | Purpose |
|--------|---------|
| src/ | Source files used to build the site |
| public/ | Created by the build process to store output files ready to be served by a web server |

### Files

| Filename | Purpose |
|----------|---------|
| `README.md` | Documents the project structure |
| `LICENSE` | Specifies how others may legally use this software |
| `Dockerfile` | Configures an application container using Docker: https://www.docker.com/ |
| `.dockerignore` | Tells Docker which files to ignore when copying files into an application container |
| `Jenkinsfile` | Configures a continuous integration and delivery pipeline using Jenkins: https://www.jenkins.io/ |
| `Makefile` | Defines the build process using GNU Make: https://www.gnu.org/software/make/ |
| `nginx.conf` | Configures a web server used to serve the site from inside an application container using nginx: https://nginx.org/ |
| `.gitignore` | Tells Git which files to ignore when tracking development |