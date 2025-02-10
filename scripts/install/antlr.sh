#! /usr/bin/env bash

JAR_NAME="antlr-4.13.2-complete.jar"
curl -LO "https://www.antlr.org/download/$JAR_NAME" --output-dir "$INSTALLS"
"$SCRIPTS/local-install.sh" "$INSTALLS/$JAR_NAME"
