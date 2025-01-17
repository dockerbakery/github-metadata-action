# The name of the person or app that initiated the workflow. For example, 'octocat'.
variable "GITHUB_ACTOR" {}

# The name of the base ref or target branch of the pull request in a workflow run. This is only set when the event that triggers a workflow run is either 'pull_request' or 'pull_request_target'. For example, 'main'.
variable "GITHUB_BASE_REF" {}

# The head ref or source branch of the pull request in a workflow run. This property is only set when the event that triggers a workflow run is either 'pull_request' or 'pull_request_target'. For example, 'feature-branch-1'.
variable "GITHUB_HEAD_REF" {}

# The 'job_id' of the current job. For example, 'greeting_job'.
variable "GITHUB_JOB" {}

# The branch or tag ref that triggered the workflow run. For workflows triggered by 'push', this is the branch or tag ref that was pushed. For workflows triggered by 'pull_request', this is the pull request merge branch. For workflows triggered by 'release', this is the release tag created. For other triggers, this is the branch or tag ref that triggered the workflow run. This is only set if a branch or tag is available for the event type. The ref given is fully-formed, meaning that for branches the format is 'refs/heads/<branch_name>'', for pull requests it is 'refs/pull/<pr_number>/merge', and for tags it is 'refs/tags/<tag_name>''. For example, 'refs/heads/feature-branch-1'.
variable "GITHUB_REF" {}

# The branch or tag name that triggered the workflow run. For example, 'feature-branch-1'.
variable "GITHUB_REF_NAME" {}

# 'true' if branch protections are configured for the ref that triggered the workflow run.
variable "GITHUB_REF_PROTECTED" {}

# The type of ref that triggered the workflow run. Valid values are 'branch' or 'tag'.
variable "GITHUB_REF_TYPE" {}

# The owner and repository name. For example, 'octocat/Hello-World'.
variable "GITHUB_REPOSITORY" {}

# The repository owner's name. For example, 'octocat'.
variable "GITHUB_REPOSITORY_OWNER" {}

# A unique number for each attempt of a particular workflow run in a repository. This number begins at 1 for the workflow run's first attempt, and increments with each re-run. For example, '3'.
variable "GITHUB_RUN_ATTEMPT" {}

# A unique number for each workflow run within a repository. This number does not change if you re-run the workflow run. For example, '1658821493'.
variable "GITHUB_RUN_ID" {}

# A unique number for each run of a particular workflow in a repository. This number begins at 1 for the workflow's first run, and increments with each new run. This number does not change if you re-run the workflow run. For example, '3'.
variable "GITHUB_RUN_NUMBER" {}

# The commit SHA that triggered the workflow. The value of this commit SHA depends on the event that triggered the workflow. For more information, see Events that trigger workflows. For example, 'ffac537e6cbbf934b08745a378932722df287a53'.
variable "GITHUB_SHA" {}

# The username of the user that initiated the workflow run. If the workflow run is a re-run, this value may differ from 'github.actor'. Any workflow re-runs will use the privileges of 'github.actor', even if the actor initiating the re-run ('github.triggering_actor') has different privileges.
variable "GITHUB_TRIGGERING_ACTOR" {}

# The architecture of the runner executing the job. Possible values are X86, X64, ARM, or ARM64.
variable "RUNNER_ARCH" {}

# The environment of the runner executing the job. Possible values are: 'github-hosted' for GitHub-hosted runners provided by GitHub, and 'self-hosted' for self-hosted runners configured by the repository owner.
variable "RUNNER_ENVIRONMENT" {}

# The name of the runner executing the job. For example, 'Hosted Agent'
variable "RUNNER_NAME" {}

# The operating system of the runner executing the job. Possible values are Linux, Windows, or macOS. For example, Windows
variable "RUNNER_OS" {}

# Secrets
# GitHub provides a token that you can use to authenticate on behalf of GitHub Actions
variable "GITHUB_METADATA_ACTION_GITHUB_TOKEN" {}
variable "GITHUB_METADATA_ACTION_GITHUB_TOKEN_FILE" { default = "/run/secrets/GITHUB_TOKEN" }

# Targets
target "github-metadata-action" {
    secret = [
        "id=GITHUB_TOKEN,env=GITHUB_METADATA_ACTION_GITHUB_TOKEN"
    ]
    args = {
        # Secrets
        GITHUB_TOKEN_FILE = "${GITHUB_METADATA_ACTION_GITHUB_TOKEN_FILE}"

        # Variables
        GITHUB_ACTOR = "${GITHUB_ACTOR}"
        GITHUB_BASE_REF = "${GITHUB_BASE_REF}"
        GITHUB_HEAD_REF = "${GITHUB_HEAD_REF}"
        GITHUB_JOB = "${GITHUB_JOB}"
        GITHUB_REF = "${GITHUB_REF}"
        GITHUB_REF_NAME = "${GITHUB_REF_NAME}"
        GITHUB_REF_PROTECTED = "${GITHUB_REF_PROTECTED}"
        GITHUB_REF_TYPE = "${GITHUB_REF_TYPE}"
        GITHUB_REPOSITORY = "${GITHUB_REPOSITORY}"
        GITHUB_REPOSITORY_OWNER = "${GITHUB_REPOSITORY_OWNER}"
        GITHUB_RUN_ATTEMPT = "${GITHUB_RUN_ATTEMPT}"
        GITHUB_RUN_ID = "${GITHUB_RUN_ID}"
        GITHUB_RUN_NUMBER = "${GITHUB_RUN_NUMBER}"
        GITHUB_SHA = "${GITHUB_SHA}"
        GITHUB_TRIGGERING_ACTOR = "${GITHUB_TRIGGERING_ACTOR}"
        RUNNER_ARCH = "${RUNNER_ARCH}"
        RUNNER_ENVIRONMENT = "${RUNNER_ENVIRONMENT}"
        RUNNER_NAME = "${RUNNER_NAME}"
        RUNNER_OS = "${RUNNER_OS}"
    }
}
