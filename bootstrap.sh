#!/bin/sh

# Generate manifest and initial deploy
spiff merge \
    bosh-init-deployment.yml \
    bosh-init-secrets.yml \
    > bosh-init-manifest.yml

bosh-init deploy bosh-init-manfifest.yml

# Upload release required for deploying another bosh
bosh upload release https://bosh.io/d/github.com/cloudfoundry/bosh
bosh upload release https://bosh.io/d/github.com/cloudfoundry/uaa-release
bosh upload release https://bosh.io/d/github.com/cloudfoundry-incubator/bosh-aws-cpi-release
