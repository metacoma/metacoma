#!/usr/bin/env bash

set -ex

charts_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/charts"

# Update dependencies

for chart in spinnaker fluentd lcm; do
    pushd "$charts_dir/$chart"
    rm -rf charts
    helm dep up
    popd
done

# Build lcm and shellinabox packages

for chart in lcm shellinabox; do
    helm package "$charts_dir/$chart"
done

# Publish packages

git fetch origin
git checkout origin/gh-pages
lcm_chart_name="$(ls lcm-*)"
shellinabox_chart_name="$(ls shellinabox-*)"

mv ${lcm_chart_name} charts
mv ${shellinabox_chart_name} charts
helm repo index charts
git add charts/${shellinabox_chart_name} charts/${lcm_chart_name} charts/index.yaml
git commit -m "Publish new version of charts: ${lcm_chart_name%.*} ${shellinabox_chart_name%.*}"
git push origin HEAD:gh-pages
