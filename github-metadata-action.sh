#!/bin/bash

# GitHub Actions helpers
gh_group() { echo "::group::$1"; }
gh_group_end() { echo "::endgroup::"; }
gh_set_output() { echo "$1=$2" >> "$GITHUB_OUTPUT"; }
gh_set_env() { 
    export "$1"="$2"
    echo "$1=$2" >> "$GITHUB_ENV";
}

# Inputs
GITHUB_METADATA_ACTION_GITHUB_TOKEN="$1"

# Main
gh_group "Processing GitHub context"
gh_set_env "GITHUB_METADATA_ACTION_GITHUB_TOKEN" "${GITHUB_METADATA_ACTION_GITHUB_TOKEN}"
gh_set_output "bake-file" "${GITHUB_ACTION_PATH}/github-metadata-action.hcl"
echo "Output:"
echo "- bake-file = ${GITHUB_ACTION_PATH}/github-metadata-action.hcl"
gh_group_end

gh_group "Bake definition"
docker buildx bake -f "${GITHUB_ACTION_PATH}/github-metadata-action.hcl" --print github-metadata-action
gh_group_end
