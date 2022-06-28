## About

GitHub Metadata Action for Docker Buildx Bake.

## Usage

### Bake definition

This action also handles a bake definition file that can be used with the Docker Bake action. You just have to declare an empty target named `github-metadata-action` and inherit from it.

```hcl
// docker-bake.hcl
target "docker-metadata-action" {}
target "github-metadata-action" {}

target "build" {
  inherits = ["docker-metadata-action", "github-metadata-action"]
  context = "./"
  dockerfile = "Dockerfile"
  platforms = [
    "linux/amd64",
    "linux/arm/v6",
    "linux/arm/v7",
    "linux/arm64",
    "linux/386"
  ]
}
```

```yml
name: ci

on:
  push:
    branches:
      - 'main'
    tags:
      - 'v*'
  pull_request:
    branches:
      - 'main'

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      - name: Docker meta
        id: meta
        uses: docker/metadata-action@v4
        with:
          images: |
            name/app
          tags: |
            type=ref,event=branch
            type=ref,event=pr
            type=semver,pattern={{version}}
            type=semver,pattern={{major}}.{{minor}}
            type=sha

      - name: GitHub meta
        id: github-meta
        uses: dockerbakery/github-metadata-action@v1

      - uses: docker/bake-action@v2
        with:
          files: |
            ./docker-bake.hcl
            ${{ steps.meta.outputs.bake-file }}
            ${{ steps.github-meta.outputs.bake-file }}
          targets: build
```

## Output

> Output of `docker buildx bake -f github-metadata-action.hcl --print github-metadata-action` command.

```json
{
  "group": {
    "default": {
      "targets": [
        "github-metadata-action"
      ]
    }
  },
  "target": {
    "github-metadata-action": {
      "args": {
        "GITHUB_ACTOR": "unknown_actor",
        "GITHUB_BASE_REF": "main",
        "GITHUB_HEAD_REF": "unknown-branch",
        "GITHUB_JOB": "unknown_job_id",
        "GITHUB_REF": "refs/heads/main",
        "GITHUB_REF_NAME": "unknown-branch",
        "GITHUB_REF_PROTECTED": "false",
        "GITHUB_REF_TYPE": "branch",
        "GITHUB_REPOSITORY": "repo/owner",
        "GITHUB_REPOSITORY_OWNER": "owner",
        "GITHUB_RUN_ATTEMPT": "0",
        "GITHUB_RUN_ID": "1658821493",
        "GITHUB_SHA": "ffac537e6cbbf934b08745a378932722df287a53",
        "RUNNER_ARCH": "X64",
        "RUNNER_NAME": "Hosted Agent",
        "RUNNER_OS": "Linux"
      }
    }
  }
}
```

## Resources

- [GitHub Action Environment variables](https://docs.github.com/en/actions/learn-github-actions/environment-variables)
- [Workflow commands for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions)
- [Bake File Definitions](https://github.com/docker/buildx/blob/master/docs/guides/bake/file-definition.md)
