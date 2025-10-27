# Secrets
# GitHub provides a token that you can use to authenticate on behalf of GitHub Actions
variable "GITHUB_METADATA_ACTION_GITHUB_TOKEN" {}
variable "GITHUB_METADATA_ACTION_GITHUB_WORKFLOW_RUN_URL" {}

# Default environment variables
# https://docs.github.com/en/actions/reference/workflows-and-actions/variables#default-environment-variables

variable "CI" { default = "true" }
variable "GITHUB_ACTION" {}
# variable "GITHUB_ACTION_PATH" {}
# variable "GITHUB_ACTION_REPOSITORY" {}
# variable "GITHUB_ACTIONS" { default = "true" }
variable "GITHUB_ACTOR" {}
variable "GITHUB_ACTOR_ID" {}
variable "GITHUB_API_URL" { default = "https://api.github.com" }
variable "GITHUB_BASE_REF" {}
variable "GITHUB_ENV" {}
variable "GITHUB_EVENT_NAME" {}
variable "GITHUB_EVENT_PATH" {}
variable "GITHUB_GRAPHQL_URL" { default = "https://api.github.com/graphql" }
variable "GITHUB_HEAD_REF" {}
variable "GITHUB_JOB" {}
variable "GITHUB_OUTPUT" {}
# variable "GITHUB_PATH" {}
variable "GITHUB_REF" {}
variable "GITHUB_REF_NAME" {}
variable "GITHUB_REF_PROTECTED" {}
variable "GITHUB_REF_TYPE" {}
variable "GITHUB_REPOSITORY" {}
variable "GITHUB_REPOSITORY_ID" {}
variable "GITHUB_REPOSITORY_OWNER" {}
variable "GITHUB_REPOSITORY_OWNER_ID" {}
variable "GITHUB_RETENTION_DAYS" {}
variable "GITHUB_RUN_ATTEMPT" {}
variable "GITHUB_RUN_ID" {}
variable "GITHUB_RUN_NUMBER" {}
variable "GITHUB_SERVER_URL" { default = "https://github.com" }
variable "GITHUB_SHA" {}
# variable "GITHUB_STEP_SUMMARY" {}
variable "GITHUB_TRIGGERING_ACTOR" {}
variable "GITHUB_WORKFLOW" {}
variable "GITHUB_WORKFLOW_REF" {}
variable "GITHUB_WORKFLOW_SHA" {}
variable "GITHUB_WORKSPACE" {}
variable "RUNNER_ARCH" {}
variable "RUNNER_DEBUG" {}
variable "RUNNER_ENVIRONMENT" {}
variable "RUNNER_NAME" {}
variable "RUNNER_OS" {}
variable "RUNNER_TEMP" {}
variable "RUNNER_TOOL_CACHE" {}

# Targets
target "github-metadata-action" {
    secret = [
        "id=GITHUB_ENV,type=file,src=${GITHUB_ENV}",
        "id=GITHUB_EVENT_PATH,type=file,src=${GITHUB_EVENT_PATH}",
        # "id=GITHUB_PATH,type=file,src=${GITHUB_PATH}",
        # "id=GITHUB_STEP_SUMMARY,type=file,src=${GITHUB_STEP_SUMMARY}",
        "id=GITHUB_OUTPUT,type=file,src=${GITHUB_OUTPUT}",
        "id=GITHUB_TOKEN,env=GITHUB_METADATA_ACTION_GITHUB_TOKEN",
        "id=GITHUB_WORKFLOW_RUN_URL,env=GITHUB_METADATA_ACTION_GITHUB_WORKFLOW_RUN_URL",
    ]
    contexts = {
        # GITHUB_ACTION_PATH = GITHUB_ACTION_PATH
        GITHUB_WORKSPACE = GITHUB_WORKSPACE
        RUNNER_TEMP = RUNNER_TEMP
        RUNNER_TOOL_CACHE = RUNNER_TOOL_CACHE
    }
    args = {
        CI = CI,
        GITHUB_ACTION = GITHUB_ACTION,
        # GITHUB_ACTION_REPOSITORY = GITHUB_ACTION_REPOSITORY,
        # GITHUB_ACTIONS = GITHUB_ACTIONS,
        GITHUB_ACTOR = GITHUB_ACTOR,
        GITHUB_ACTOR_ID = GITHUB_ACTOR_ID,
        GITHUB_API_URL = GITHUB_API_URL,
        GITHUB_BASE_REF = GITHUB_BASE_REF,
        GITHUB_EVENT_NAME = GITHUB_EVENT_NAME,
        GITHUB_GRAPHQL_URL = GITHUB_GRAPHQL_URL,
        GITHUB_HEAD_REF = GITHUB_HEAD_REF,
        GITHUB_JOB = GITHUB_JOB,
        GITHUB_REF = GITHUB_REF,
        GITHUB_REF_NAME = GITHUB_REF_NAME,
        GITHUB_REF_PROTECTED = GITHUB_REF_PROTECTED,
        GITHUB_REF_TYPE = GITHUB_REF_TYPE,
        GITHUB_REPOSITORY = GITHUB_REPOSITORY,
        GITHUB_REPOSITORY_ID = GITHUB_REPOSITORY_ID,
        GITHUB_REPOSITORY_OWNER = GITHUB_REPOSITORY_OWNER,
        GITHUB_REPOSITORY_OWNER_ID = GITHUB_REPOSITORY_OWNER_ID,
        GITHUB_RETENTION_DAYS = GITHUB_RETENTION_DAYS,
        GITHUB_RUN_ATTEMPT = GITHUB_RUN_ATTEMPT,
        GITHUB_RUN_ID = GITHUB_RUN_ID,
        GITHUB_RUN_NUMBER = GITHUB_RUN_NUMBER,
        GITHUB_SERVER_URL = GITHUB_SERVER_URL,
        GITHUB_SHA = GITHUB_SHA,
        GITHUB_TRIGGERING_ACTOR = GITHUB_TRIGGERING_ACTOR,
        GITHUB_WORKFLOW = GITHUB_WORKFLOW,
        GITHUB_WORKFLOW_REF = GITHUB_WORKFLOW_REF,
        GITHUB_WORKFLOW_SHA = GITHUB_WORKFLOW_SHA,
        RUNNER_ARCH = RUNNER_ARCH,
        RUNNER_DEBUG = RUNNER_DEBUG,
        RUNNER_ENVIRONMENT = RUNNER_ENVIRONMENT,
        RUNNER_NAME = RUNNER_NAME,
        RUNNER_OS = RUNNER_OS,
    }
}
