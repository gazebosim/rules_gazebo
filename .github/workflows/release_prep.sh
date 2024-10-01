#!/usr/bin/env bash

# invoked by release workflow
# (via https://github.com/bazel-contrib/.github/blob/master/.github/workflows/release_ruleset.yaml)

set -o errexit -o nounset -o pipefail

TAG=${GITHUB_REF_NAME}

# The prefix is chosen to match what GitHub generates for source archives
PREFIX="rules_gazebo-${TAG}"
ARCHIVE="rules_gazebo-$TAG.tar.gz"
git archive --format=tar --prefix=${PREFIX}/ ${TAG} | gzip > $ARCHIVE
SHA=$(shasum -a 256 $ARCHIVE | awk '{print $1}')

cat > release_notes.txt << EOF
## Using Bzlmod

Add to your \`MODULE.bazel\` file:

\`\`\`starlark
bazel_dep(name = "rules_gazebo", version = "${TAG}")
\`\`\`

## Using WORKSPACE

Paste this snippet into your \`WORKSPACE\` file:

\`\`\`starlark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_gazebo",
    sha256 = "${SHA}",
    strip_prefix = "${PREFIX}",
    url = "https://github.com/gazebosim/rules_gazebo/releases/download/${TAG}/rules_gazebo-${TAG}.tar.gz",
)
\`\`\`
EOF