#!/bin/bash

args="--regex --rules regexes.json --entropy=False --repo_path=."

if [ -n "${INPUT_BRANCH}" ]; then
  args="${args} --branch ${INPUT_BRANCH}"
fi

if [ -n "${INPUT_ALLOWED_PATH}" ]; then
  args="${args} --allow ${INPUT_ALLOWED_PATH}"
fi

# Make workspace a safe directory for git
# See https://github.com/actions/checkout/issues/760
git config --global --add safe.directory /github/workspace

cp /regexes.json .
trufflehog . ${args} | tee trufflehog_output.log

if [[ $(stat -c%s trufflehog_output.log) -gt 0 ]]; then
  echo "truffleHog has found secrets :("
  exit 1
fi
