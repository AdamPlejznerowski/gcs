#!/bin/bash

set -Eeuo pipefail

TARGET_DIR="deps/gnome-sysroot"
BASE_URL="https://ftp.debian.org/debian/pool"

mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR" || exit 1

echo "Downloading specific packages to: $(pwd)"

# mutter-common is required by libmutter to work in case you or me didnt know
declare -a PACKAGES=(
    "libmutter-16-dev_48.7-0+deb13u1_amd64.deb"
    "libmutter-16-0_48.7-0+deb13u1_amd64.deb"
    "gir1.2-mutter-16_48.7-0+deb13u1_amd64.deb"
    "mutter-common_48.7-0+deb13u1_all.deb"
    "libglib2.0-dev_2.84.4-3~deb13u3_amd64.deb"
    "libglib2.0-dev-bin_2.84.4-3~deb13u3_amd64.deb"
    "libglib2.0-0t64_2.84.4-3~deb13u3_amd64.deb"
)

process_package() {
    local deb_file=$1
    local url=""

    if [[ $deb_file == libmutter* ]] || [[ $deb_file == gir1.2-mutter* ]] || [[ $deb_file == mutter-common* ]]; then 
    url="$BASE_URL/main/m/mutter/$deb_file"
    
    elif [[ $deb_file == libglib* ]]; then
    url="$BASE_URL/main/g/glib2.0/$deb_file"
    else
        echo "Uknown package: $deb_file"
        return 1
    fi

    echo "Downloading: $deb_file"
    if ! curl -fL --retry 3 -O "$url"; then
        echo "ERROR: Failed to download $deb_file z $url"
        return 1
    fi

    echo "Unpacking: $deb_file"

    local deb_path
    deb_path="$(pwd)/$deb_file"

    if ! dpkg-deb -x "$deb_path" .; then
        echo "ERROR: Unable to extract: $deb_file"
        rm -rf "$deb_file"
        return 1
    fi
}

for pkg in "${PACKAGES[@]}"; do
    process_package "$pkg" || exit 1
done

echo "The sysroot is at: $(pwd)"
echo "Files:"
ls -la  usr/lib/x86_64-linux-gnu/mutter-16* || echo "Missing mutter libraries in expected path"
ls -la usr/include/mutter-16 2>/dev/null || echo "No mutter headers in expected path"