#!/usr/bin/env bash
set -euo pipefail

opts="-Dmaven.artifact.threads=12 -Daether.connector.connectTimeout=1000 -Daether.dependencyCollector.impl=bf"
# mvn dependency:resolve $opts
mvn dependency:resolve $opts -Dclassifier=javadoc
mvn dependency:resolve $opts -Dclassifier=test
mvn dependency:sources $opts
