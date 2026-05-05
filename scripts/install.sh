#!/usr/bin/env bash

set -euo pipefail

VERSION="v0.11.7"

case "$(uname -s)" in
Darwin) OS="macos" ;;
Linux) OS="linux" ;;
*)
    echo "Unsupported OS: $(uname -s)" >&2
    exit 1
    ;;
esac

ARCH="$(uname -m)"
case "${ARCH}" in
aarch64) ARCH="arm64" ;;
x86_64 | arm64) ;;
*)
    echo "Unsupported arch: ${ARCH}" >&2
    exit 1
    ;;
esac

TARBALL="nvim-${OS}-${ARCH}.tar.gz"
URL="https://github.com/neovim/neovim/releases/download/${VERSION}/${TARBALL}"

SUDO=""
[ "${EUID}" -ne 0 ] && SUDO="sudo"

cd /tmp
echo "==> Downloading ${URL}"
curl -fLO "${URL}"

echo "==> Extracting to /opt/nvim"
${SUDO} rm -rf /opt/nvim
${SUDO} tar -C /opt -xzf "${TARBALL}"
${SUDO} mv "/opt/nvim-${OS}-${ARCH}" /opt/nvim

echo "==> Symlinking to /usr/local/bin/nvim"
${SUDO} ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

echo "==> Cleanup"
rm -f "/tmp/${TARBALL}"

echo "==> Done"
nvim --version | head -1
