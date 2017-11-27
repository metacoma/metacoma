#!/usr/bin/env bash

set -ex

charts_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/charts"

# Update dependencies

for chart in spinnaker fluentd lcm; do
    pushd "$charts_dir/$chart"
    helm dep up
    popd
done

# Build lcm package

helm package "$charts_dir/lcm"

# Publish package

git fetch origin
git checkout origin/gh-pages
chart_name="$(ls lcm-*)"

mv ${chart_name} charts
helm repo index charts
git add charts/${chart_name} charts/index.yaml
git commit -m "Publish new version of chart: ${chart_name%.*}"
git push origin HEAD:gh-pages
