#!/bin/bash

# build

set -xe
cd "$(dirname $0)"

docker build $@ -t ghcr.io/theshellland/pwnagotchi:latest -f Dockerfile-pwn ../
