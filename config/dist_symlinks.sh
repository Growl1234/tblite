#!/usr/bin/env bash

if [ -z "$MESON_DIST_ROOT" ]; then
    echo "Error: This script must be run via meson dist."
    exit 1
fi

echo "Setting up symlinks for nested subprojects in distribution tarball..."

cd "$MESON_DIST_ROOT/subprojects" || exit 1

if [ -d "test-drive" ] && [ -d "toml-f" ]; then
    echo "  -> Symlinking test-drive into toml-f/subprojects"
    mkdir -p toml-f/subprojects
    cd toml-f/subprojects
    ln -sfn ../../test-drive test-drive
    cd ../../
fi

if [ -d "mstore" ] && [ -d "dftd4" ]; then
    echo "  -> Symlinking mstore into dftd4/subprojects"
    mkdir -p dftd4/subprojects
    cd dftd4/subprojects
    ln -sfn ../../mstore mstore
    cd ../../
fi

echo "Symlink setup complete."
