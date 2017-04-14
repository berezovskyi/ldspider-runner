#!/usr/bin/env bash
set -eu
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
mvn -version
(cd "$SCRIPT_DIR/../ldspider" && mvn clean package -Dmaven.test.skip=true)
