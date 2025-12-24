#!/bin/bash
mvn dependency:resolve -Dclassifier=javadoc
mvn dependency:resolve -Dclassifier=sources
