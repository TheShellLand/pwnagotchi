#!/bin/bash

# run

set -xe
cd "$(dirname $0)"

docker run --rm ghcr.io/theshellland/pwnagotchi:latest
