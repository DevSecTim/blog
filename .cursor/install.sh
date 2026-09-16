#!/usr/bin/env bash
set -euo pipefail

# Pinned to match the Hugo version used by CI (see the Azure Static Web Apps workflow).
HUGO_VERSION="0.147.1"

install_hugo() {
  if command -v hugo >/dev/null 2>&1 && hugo version 2>/dev/null | grep -q "v${HUGO_VERSION}.*extended"; then
    echo "Hugo extended ${HUGO_VERSION} already installed."
    return
  fi

  echo "Installing Hugo extended ${HUGO_VERSION}..."
  local tmp
  tmp="$(mktemp -d)"
  curl -sSL "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" \
    -o "${tmp}/hugo.tar.gz"
  tar -xzf "${tmp}/hugo.tar.gz" -C "${tmp}" hugo
  sudo mv "${tmp}/hugo" /usr/local/bin/hugo
  rm -rf "${tmp}"
}

install_hugo
hugo version

# The PaperMod theme is a git submodule; CI checks it out too.
echo "Syncing theme submodule..."
git submodule update --init --recursive

echo "Environment setup complete."
