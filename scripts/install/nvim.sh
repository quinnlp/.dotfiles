#! /usr/bin/env bash

NAME="nvim-linux64"
TAR_NAME="$NAME.tar.gz"
curl -LO "https://github.com/neovim/neovim/releases/latest/download/$TAR_NAME" --output-dir "$SOURCES"
tar -xz -f "$SOURCES/$TAR_NAME" -C "$INSTALLS"
"$SCRIPTS/local-install.sh" "$INSTALLS/$NAME"
