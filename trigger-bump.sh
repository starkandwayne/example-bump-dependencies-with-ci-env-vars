#!/bin/bash

curl -H "Authorization: Bearer ${BUILDKITE_TOKEN_CREATE_BUILDS:?required}" \
  "https://api.buildkite.com/v2/organizations/starkandwayne/pipelines/example-bump-deps/builds" \
  -X POST \
  -d '{"commit":"HEAD","branch":"master","message":"bump sinatra","env": {"UPDATE_RUBYGEM_VERSION_SINATRA": "2.0.8"}}'
