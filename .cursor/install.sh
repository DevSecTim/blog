#!/usr/bin/env bash
set -euo pipefail

# Idempotent reconciler used for both the `install` and `start` lifecycle hooks.
# On snapshot/build boots the `install` hook is skipped and the workspace is
# re-checked-out without submodules, so `start` must re-run this to restore the
# theme submodule (and Hugo, if the base image lacks it).

# Pinned to match the Hugo version used by CI (see the Azure Static Web Apps workflow).
HUGO_VERSION="0.147.1"

# Operate from the repository root regardless of the caller's working directory.
cd "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

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
