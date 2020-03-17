#!/bin/bash

set -euo pipefail

[[ -n "${UPDATE_RUBY_VERSION:-}" ]] && {
  echo "--- Update :ruby:"
  sed -i "s/^ruby.*$/ruby \"$UPDATE_RUBY_VERSION\"/g" Gemfile
}

[[ -n "${UPDATE_RUBYGEM_VERSION_SINATRA:-}" ]] && {
  echo "--- Update :ruby: sinatra ${UPDATE_RUBYGEM_VERSION_SINATRA}"
  sed -i "s/^gem \"sinatra\".*$/gem \"sinatra\", \"$UPDATE_RUBYGEM_VERSION_SINATRA\"/g" Gemfile
}

cat Gemfile
echo "--- Bundle :ruby:"
gem install bundler
bundle install --verbose

echo "--- Check :git: diff"
git diff
