#!/bin/bash

set -euo pipefail

BASE_DIR=$(dirname "$0")

mkdir -p "$BASE_DIR"/shtc1/sw_i2c
cp "$BASE_DIR/../../embedded-common/"*.[ch] "$BASE_DIR"/shtc1/
cp "$BASE_DIR/../../embedded-common/sw_i2c/"*.[ch] "$BASE_DIR"/shtc1/sw_i2c/
cp "$BASE_DIR/../../shtc1/shtc1."[ch] "$BASE_DIR"/shtc1/
cp "$BASE_DIR/../../sht-common/sht_git_version.h" "$BASE_DIR"/shtc1/
gitversion=$(git describe --always --dirty)
cat << EOF > "$BASE_DIR/shtc1/sht_git_version.c"
/* THIS FILE IS AUTOGENERATED */
#include "sht_git_version.h"
const char * SHT_DRV_VERSION_STR = "$gitversion";
EOF
