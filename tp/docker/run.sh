#!/usr/bin/env bash
set -euo pipefail

winpty docker run --rm -it --network host -v "/$PWD:/home" k-alpine bash
