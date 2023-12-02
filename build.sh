#!/usr/bin/env bash

# set -ex

set -e

## Build
docker build --no-cache -t jniltinho/cloud-cli .

## Test
# docker --rm -it jniltinho/cloud-cli bash
# docker run --rm -it -v ${PWD}:/opt/cloud  jniltinho/cloud-cli bash
