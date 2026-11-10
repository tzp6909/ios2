#!/bin/sh
set -eu
cd "$(dirname "$0")"

if [ "$#" -eq 0 ]; then
    set -- roothide
fi

# This project is intentionally packaged for Roothide only.
for scheme in "$@"; do
    case "$scheme" in
        roothide) ;;
        *) printf 'This project supports only the roothide scheme: %s\n' "$scheme" >&2; exit 2 ;;
    esac
done

: "${THEOS:?Set THEOS to a compatible Roothide Theos toolchain first}"
for scheme in "$@"; do
    printf '\nBuilding %s\n' "$scheme"
    make clean THEOS_PACKAGE_SCHEME="$scheme"
    make package THEOS_PACKAGE_SCHEME="$scheme"
done
