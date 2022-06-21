echo "::group::Processing GitHub context"
echo "::set-output name=bake-file::${GITHUB_ACTION_PATH}/github-metadata-action.hcl"
echo "Output:"
echo "- bake-file = ${GITHUB_ACTION_PATH}/github-metadata-action.hcl"
echo "::endgroup::"

echo "::group::Bake definition"
docker buildx bake -f "${GITHUB_ACTION_PATH}/github-metadata-action.hcl" --print github-metadata-action
echo "::endgroup::"
