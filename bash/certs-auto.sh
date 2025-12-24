#!/usr/bin/env bash

if [ -z "$JAVA_HOME" ]; then
  echo "Использование: JAVA_HOME=[path] $0"
  exit 1
fi

imp() {
  "$JAVA_HOME/bin/keytool.exe" \
    -cacerts \
    -noprompt \
    -trustcacerts \
    -importcert \
    -alias test_$(basename "$1") \
    -file "$1"
}

for f in *.pem *.cer *.der; do
  imp "$f"
done
