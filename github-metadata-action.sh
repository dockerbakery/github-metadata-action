#!/bin/bash

echo "::group::Processing GitHub context"
echo "bake-file=${GITHUB_ACTION_PATH}/github-metadata-action.hcl" >> $GITHUB_STATE
echo "Output:"
echo "- bake-file = ${GITHUB_ACTION_PATH}/github-metadata-action.hcl"
echo "::endgroup::"

echo "::group::Bake definition"
docker buildx bake -f "${GITHUB_ACTION_PATH}/github-metadata-action.hcl" --print github-metadata-action
echo "::endgroup::"
