## About

GitHub Metadata Action for Docker Buildx Bake.

## Usage

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
      "dockerfile": "Dockerfile",
      "args": {
        "CI": "true",
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
- [Bake File Definitions](https://github.com/docker/buildx/blob/master/docs/guides/bake/file-definition.md)
