#! /usr/bin/env bash

VERSION="4.13.2"
TAR_NAME="$VERSION.tar.gz"
curl -LO "https://github.com/antlr/antlr4/archive/refs/tags/$TAR_NAME" --output-dir "$SOURCES"
tar -xz -f "$SOURCES/$TAR_NAME" -C "$SOURCES"

NAME_VERSION="antlr4-$VERSION"
SOURCE_DIR="$SOURCES/$NAME_VERSION/runtime/Cpp"
BUILD_DIR="$SOURCE_DIR/build"
mkdir -p "$BUILD_DIR"

INSTALL="install"
INSTALL_DIR="$INSTALLS/$NAME_VERSION-$INSTALL"
cmake -S "$SOURCE_DIR" -B "$BUILD_DIR" -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR" -DCMAKE_BUILD_TYPE="Release" 

NPROC="$(nproc)"
make -C "$BUILD_DIR" -j "$NPROC"
make "$INSTALL" -C "$BUILD_DIR" -j "$NPROC"
"$SCRIPTS/local-install.sh" "$INSTALL_DIR"
