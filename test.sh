#!/usr/bin/env bash

export CI="true"
export GITHUB_ACTION="__repo-owner_name-of-action-repo"
export GITHUB_ACTION_PATH=${GITHUB_ACTION_PATH:-"$(pwd)"}
export GITHUB_ACTION_REPOSITORY="dockerbakery/github-metadata-action"
export GITHUB_ACTIONS="true"
export GITHUB_ACTOR="octocat"
export GITHUB_ACTOR_ID="1234567"
export GITHUB_API_URL="https://api.github.com"
export GITHUB_BASE_REF="main"
export GITHUB_ENV="$(pwd)/fake/GITHUB_ENV"
export GITHUB_EVENT_NAME="push"
export GITHUB_EVENT_PATH="$(pwd)/fake/event.json"
export GITHUB_GRAPHQL_URL="https://api.github.com/graphql"
export GITHUB_HEAD_REF=""
export GITHUB_JOB="test-job"
export GITHUB_OUTPUT="$(pwd)/fake/GITHUB_OUTPUT"
export GITHUB_PATH="$(pwd)/fake/GITHUB_PATH"
export GITHUB_REF="refs/heads/main"
export GITHUB_REF_NAME="main"
export GITHUB_REF_PROTECTED="false"
export GITHUB_REF_TYPE="branch"
export GITHUB_REPOSITORY="dockerbakery/github-metadata-action"
export GITHUB_REPOSITORY_ID="123456789"
export GITHUB_REPOSITORY_OWNER="dockerbakery"
export GITHUB_REPOSITORY_OWNER_ID="1234567"
export GITHUB_RETENTION_DAYS="90"
export GITHUB_RUN_ATTEMPT="1"
export GITHUB_RUN_ID="1658821493"
export GITHUB_RUN_NUMBER="1"
export GITHUB_SERVER_URL="https://github.com"
export GITHUB_SHA="ffac537e6cbbf934b08745a378932722df287a53"
export GITHUB_STEP_SUMMARY="$(pwd)/fake/step_summary.md"
export GITHUB_TRIGGERING_ACTOR="octocat"
export GITHUB_WORKFLOW="My test workflow"
export GITHUB_WORKFLOW_REF="dockerbakery/github-metadata-action/.github/workflows/test.yml@refs/heads/main"
export GITHUB_WORKFLOW_SHA="ffac537e6cbbf934b08745a378932722df287a53"
export GITHUB_WORKSPACE="$(pwd)"
export RUNNER_ARCH="X64"
export RUNNER_DEBUG=""
export RUNNER_ENVIRONMENT="github-hosted"
export RUNNER_NAME="Hosted Agent"
export RUNNER_OS="Linux"
export RUNNER_TEMP="$(pwd)/fake/tmp"
export RUNNER_TOOL_CACHE=${RUNNER_TOOL_CACHE:-"$(pwd)/fake/RUNNER_TOOL_CACHE"}

rm -rf ./fake/
mkdir -p "$(dirname "${GITHUB_ENV}")" && touch "${GITHUB_ENV}"
mkdir -p "$(dirname "${GITHUB_EVENT_PATH}")" && echo '{}' > "${GITHUB_EVENT_PATH}"
mkdir -p "$(dirname "${GITHUB_OUTPUT}")" && touch "${GITHUB_OUTPUT}"
mkdir -p "$(dirname "${GITHUB_PATH}")" && touch "${GITHUB_PATH}"
mkdir -p "$(dirname "${GITHUB_STEP_SUMMARY}")" && touch "${GITHUB_STEP_SUMMARY}"
mkdir -p "${RUNNER_TEMP}"
mkdir -p "${RUNNER_TOOL_CACHE}"

echo "HELLO=world" >> "${GITHUB_ENV}"
echo "$HOME/.local/bin" >> "$GITHUB_PATH"

export GITHUB_METADATA_ACTION_GITHUB_TOKEN=$(gh auth token)
export BUILDX_BAKE_ENTITLEMENTS_FS=1

cd example && {
    docker buildx bake -f ./docker-bake.hcl -f ../github-metadata-action.hcl --no-cache --print
    docker buildx bake -f ./docker-bake.hcl -f ../github-metadata-action.hcl --no-cache
}
