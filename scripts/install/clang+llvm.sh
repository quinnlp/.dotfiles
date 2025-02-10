#! /usr/bin/env bash

NAME="clang+llvm-18.1.8-x86_64-linux-gnu-ubuntu-18.04"
TAR_NAME="${NAME}.tar.xz"
curl -LO "https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/${TAR_NAME}" --output-dir "${SOURCES}"
tar -xJ -f "${SOURCES}/${TAR_NAME}" -C "${INSTALLS}"
"${SCRIPTS}/local-install.sh" "${INSTALLS}/${NAME}"
