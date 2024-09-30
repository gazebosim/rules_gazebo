#!/usr/bin/env bash

# invoked by release workflow
# (via https://github.com/bazel-contrib/.github/blob/master/.github/workflows/release_ruleset.yaml)

set -o errexit -o nounset -o pipefail

TAG=${GITHUB_REF_NAME}

# The prefix is chosen to match what GitHub generates for source archives
PREFIX="rules_gazebo-${TAG}"
ARCHIVE="rules_gazebo-$TAG.tar.gz"
git archive --format=tar --prefix=${PREFIX}/ ${TAG} | gzip > $ARCHIVE

cat << EOF
Add to your \`MODULE.bazel\` file:

\`\`\`starlark
bazel_dep(name = "rules_gazebo", version = "${TAG}")
\`\`\`
EOF
