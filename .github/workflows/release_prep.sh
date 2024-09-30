#!/usr/bin/env bash

# invoked by release workflow
# (via https://github.com/bazel-contrib/.github/blob/master/.github/workflows/release_ruleset.yaml)

#set -o errexit -o nounset -o pipefail

RULES_NAME="rules_gazebo"
TAG="${GITHUB_REF_NAME}"
PREFIX="${RULES_NAME}-${TAG:1}"
ARCHIVE="${RULES_NAME}-${TAG:1}.tar.gz"

echo $RULES_NAME
echo $TAG
echo $PREFIX
echo $ARCHIVE

# embed version in MODULE.bazel
perl -pi -e "s/version = \"0\.0\.0\",/version = \"${TAG:1}\",/g" MODULE.bazel

stash_name=`git stash create`;
git archive --format=tar --prefix=${PREFIX}/ "${stash_name}" | gzip > $ARCHIVE

SHA=$(shasum -a 256 $ARCHIVE | awk '{print $1}')

cat << EOF
Add to your \`MODULE.bazel\` file:

\`\`\`starlark
bazel_dep(name = "${RULES_NAME}", version = "${TAG:1}")
\`\`\`
EOF
