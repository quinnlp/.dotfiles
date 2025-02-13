#! /usr/bin/env bash

NAME="readline"
NAME_VERSION="${NAME}-8.2"
TAR_NAME="${NAME_VERSION}.tar.gz"
curl -LO "https://ftp.gnu.org/gnu/${NAME}/${TAR_NAME}" --output-dir "${SOURCES}"
tar -xz -f "${SOURCES}/${TAR_NAME}" -C "${SOURCES}"

SOURCE_DIR="${SOURCES}/${NAME_VERSION}"
INSTALL="install"
INSTALL_DIR="${INSTALLS}/${NAME_VERSION}-${INSTALL}"
(cd "${SOURCE_DIR}" && "${SOURCE_DIR}/configure" --prefix="${INSTALL_DIR}")

NPROC="$(nproc)"
make -C "${SOURCE_DIR}" -j "${NPROC}"
make "${INSTALL}" -C "${SOURCE_DIR}" -j "${NPROC}"
"${SCRIPTS}/local-install.sh" "${INSTALL_DIR}"
