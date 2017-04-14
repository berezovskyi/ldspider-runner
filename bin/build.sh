#!/usr/bin/env bash
set -eu
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
mvn -version
# just in case you didn't bother to read the README
(cd "$SCRIPT_DIR/../" && git submodule update --init --recursive)
# see https://github.com/ldspider/ldspider/issues/10
(cd "$SCRIPT_DIR/../ldspider" && mvn clean package -Dmaven.test.skip=true)
