## About

GitHub Metadata Action for Docker Buildx Bake.

## Usage

> [!IMPORTANT]
> Starting from `v4`, it is recommended to use this action with `docker/bake-action`.
>
> To use this action without the requirement mentioned above, please set the `BUILDX_BAKE_ENTITLEMENTS_FS=0` environment variables or specify the `--allow fs=*` to the `docker buildx bake` command.

### Bake definition

This action also handles a bake definition file that can be used with the Docker Bake action. You just have to declare an empty target named `github-metadata-action` and inherit from it.

```hcl
// docker-bake.hcl
target "docker-metadata-action" {}
target "github-metadata-action" {}

target "default" {
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
      - uses: actions/checkout@v5

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Docker meta
        id: meta
        uses: docker/metadata-action@v5
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
        uses: dockerbakery/github-metadata-action@v4

      - uses: docker/bake-action@v6
        with:
          files: |
            ./docker-bake.hcl
            cwd://${{ steps.meta.outputs.bake-file }}
            cwd://${{ steps.github-meta.outputs.bake-file }}
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
      "context": ".",
      "contexts": {
        "GITHUB_ACTION_PATH": "/home/runner/work/github-metadata-action/github-metadata-action/./",
        "GITHUB_WORKSPACE": "/home/runner/work/github-metadata-action/github-metadata-action",
        "RUNNER_TEMP": "/home/runner/work/_temp",
        "RUNNER_TOOL_CACHE": "/opt/hostedtoolcache"
      },
      "dockerfile": "Dockerfile",
      "args": {
        "CI": "true",
        "GITHUB_ACTION": "meta",
        "GITHUB_ACTIONS": "true",
        "GITHUB_ACTION_REPOSITORY": "",
        "GITHUB_ACTOR": "socheatsok78",
        "GITHUB_ACTOR_ID": "4363857",
        "GITHUB_API_URL": "https://api.github.com",
        "GITHUB_BASE_REF": "",
        "GITHUB_EVENT_NAME": "push",
        "GITHUB_GRAPHQL_URL": "https://api.github.com/graphql",
        "GITHUB_HEAD_REF": "",
        "GITHUB_JOB": "test",
        "GITHUB_REF": "refs/heads/v4",
        "GITHUB_REF_NAME": "v4",
        "GITHUB_REF_PROTECTED": "false",
        "GITHUB_REF_TYPE": "branch",
        "GITHUB_REPOSITORY": "dockerbakery/github-metadata-action",
        "GITHUB_REPOSITORY_ID": "505687899",
        "GITHUB_REPOSITORY_OWNER": "dockerbakery",
        "GITHUB_REPOSITORY_OWNER_ID": "105844391",
        "GITHUB_RETENTION_DAYS": "90",
        "GITHUB_RUN_ATTEMPT": "1",
        "GITHUB_RUN_ID": "18833940306",
        "GITHUB_RUN_NUMBER": "86",
        "GITHUB_SERVER_URL": "https://github.com",
        "GITHUB_SHA": "978ff20500d7b241bb13e7a4a74d70c5f4b31c49",
        "GITHUB_TRIGGERING_ACTOR": "socheatsok78",
        "GITHUB_WORKFLOW": "test",
        "GITHUB_WORKFLOW_REF": "dockerbakery/github-metadata-action/.github/workflows/test.yml@refs/heads/v4",
        "GITHUB_WORKFLOW_SHA": "978ff20500d7b241bb13e7a4a74d70c5f4b31c49",
        "RUNNER_ARCH": "X64",
        "RUNNER_DEBUG": "",
        "RUNNER_ENVIRONMENT": "github-hosted",
        "RUNNER_NAME": "GitHub Actions 1000000060",
        "RUNNER_OS": "Linux"
      },
      "secret": [
        {
          "id": "GITHUB_ENV",
          "src": "/home/runner/work/_temp/_runner_file_commands/set_env_30874525-f2f7-4e7e-8b78-6a75232224aa"
        },
        {
          "id": "GITHUB_EVENT_PATH",
          "src": "/home/runner/work/_temp/_github_workflow/event.json"
        },
        {
          "id": "GITHUB_OUTPUT",
          "src": "/home/runner/work/_temp/_runner_file_commands/set_output_30874525-f2f7-4e7e-8b78-6a75232224aa"
        },
        {
          "id": "GITHUB_TOKEN",
          "env": "GITHUB_METADATA_ACTION_GITHUB_TOKEN"
        },
        {
          "id": "GITHUB_WORKFLOW_RUN_URL",
          "env": "GITHUB_METADATA_ACTION_GITHUB_WORKFLOW_RUN_URL"
        }
      ]
    }
  }
}
```

## Resources

- [GitHub Action Environment variables](https://docs.github.com/en/actions/learn-github-actions/environment-variables)
- [Workflow commands for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions)
- [Bake File Definitions](https://github.com/docker/buildx/blob/master/docs/guides/bake/file-definition.md)
