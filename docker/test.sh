#!/bin/bash

# test

set -xe
cd "$(dirname $0)"

docker run --rm -it ghcr.io/theshellland/pwnagotchi:latest bash
