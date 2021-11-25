#!/bin/bash

args="--regex --rules regexes.json --entropy=False --max_depth=50 --repo_path=."

if [ -n "${INPUT_BRANCH}" ]; then
  args="${args} --branch ${INPUT_BRANCH}"
fi

cp /regexes.json .
trufflehog . ${args}
