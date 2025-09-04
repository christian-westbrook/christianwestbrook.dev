# Contributing

Thanks for considering contributing! Here's a quick guide to making new contributions.

## Getting Started

Start by [forking](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo) and [cloning](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) the repository:  
`git clone <your-fork-url>`  

Add the source repository as an upstream remote so that you can keep your fork up to date with the source repository:  
`git remote add upstream https://github.com/christian-westbrook/christianwestbrook.dev`  
`git pull` # TODO  

With [Docker](https://www.docker.com/get-started/) installed, try building and running the project locally:  
`docker image build --tag christianwestbrook.dev:local .`  
`docker container run --detach --rm --publish 80:80 christianwestbrook.dev:local`  

You should find the project running at `http://localhost:80` if this process was successful.  
If you're having trouble, feel free to create an [issue](https://github.com/christian-westbrook/christianwestbrook.dev/issues) for help.  

## Making Changes

Start by creating a feature branch with a meaningful name: `git checkout -b <feature-name>`  

Make your changes locally, adding tests for new functionality.  

Ensure that all tests are passing.  

Commit your changes using [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) with clear messages.  

Here is a quick guide for which commit prefixes to use and when to use them:

| Prefix | Description |
|--------|-------------|
| `feat:` | For introducing new functionality |
| `fix:` | For bug fixes in existing functionality |
| `refactor:` | For restructuring code without changing behavior |
| `docs:` | For changes to documentation |
| `build:` | For changes to the build process |
| `!` | Add to another prefix like `feat!:` to indicate a breaking change |

## Submitting Changes

Once you're ready to submit your changes, start by pushing your branch to your forked repository: `git push origin feature-name`  

Create a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests) from your fork to the source repository, describing the changes you made and why you made them.  

Link to any related issues in the body of the pull request.  

## Review Process

Once your pull request is in, a Maintainer (currently just me) will review your submission and may suggest changes.  

Automated tests will run on your pull request and must pass before your submission can be merged.  

Address any feedback by pushing new commits to your branch.  

Once your submission is approved by a Maintainer, they will merge your pull request into the main branch.  

## Coding Style

Follow existing code conventions wherever possible, but feel free to [suggest improvements!](https://github.com/christian-westbrook/christianwestbrook.dev/issues)

## Questions

Feel free to open an [issue](https://github.com/christian-westbrook/christianwestbrook.dev/issues) or to contact [Christian](mailto:christian.a.westbrook@proton.me) for help.  