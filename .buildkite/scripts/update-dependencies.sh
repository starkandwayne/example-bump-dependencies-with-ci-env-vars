#!/bin/bash

set -euo pipefail

[[ -n "${UPDATE_RUBY_VERSION:-}" ]] && {
  echo "--- Update :ruby:"
  sed -i "s/^ruby.*$/ruby \"$UPDATE_RUBY_VERSION\"/g" Gemfile
  cat Gemfile
}

echo "--- Bundle :ruby:"
gem install bundler
bundle install --verbose
