#!/usr/bin/env bash
set -eu
mvn -version
(cd ../ldspider && mvn clean package -Dmaven.test.skip=true)
