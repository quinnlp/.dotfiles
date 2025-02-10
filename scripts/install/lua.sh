#! /usr/bin/env bash

NAME_VERSION="lua-5.1.5"
TAR_NAME="$NAME_VERSION.tar.gz"
curl -LO "https://www.lua.org/ftp/$TAR_NAME" --output-dir "$SOURCES"
tar -xz -f "$SOURCES/$TAR_NAME" -C "$SOURCES"

NPROC="$(nproc)"
BUILD_DIR="$SOURCES/$NAME_VERSION"
make linux -e MYCFLAGS="$CFLAGS" MYLDFLAGS="$LDFLAGS" -C "$BUILD_DIR" -j "$NPROC"

INSTALL="install"
INSTALL_DIR="$INSTALLS/$NAME_VERSION-$INSTALL"
make "$INSTALL" INSTALL_TOP="$INSTALL_DIR" -C "$BUILD_DIR" -j "$NPROC"
"$SCRIPTS/local-install.sh" "$INSTALL_DIR"
