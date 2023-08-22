#!/usr/bin/env bash
set -eux

echo "${SIGNING_KEY:?SIGNING_KEY must be set}"
echo ${SIGNING_KEY} > /tmp/cosign.key

for FILE in sboms/*; do
  cosign sign-blob --yes --tlog-upload=false --key /tmp/cosign.key --bundle attestations/cosign.bundle ${FILE}
done
