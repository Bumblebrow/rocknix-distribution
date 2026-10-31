# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2026-present ROCKNIX (https://github.com/ROCKNIX)

PKG_NAME="hakux-lr"
PKG_VERSION="0.13.0"
PKG_SHA256="c5fee76576bc3c09d254a8b84090ee64eec3a23aff57da4a910d0fd3612407d9"
PKG_ARCH="aarch64"
PKG_LICENSE="GPL-3.0-or-later"
PKG_SITE="https://github.com/portare-ch/hakuX-lr"
PKG_URL="${PKG_SITE}/releases/download/linux-v${PKG_VERSION}/hakux-${PKG_VERSION}-aarch64.tar.gz"
PKG_SOURCE_DIR="hakux-${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain zlib"
PKG_LONGDESC="hakuX libretro core"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -p ${PKG_BUILD}/lib/libretro/hakux_libretro.so ${PKG_BUILD}/lib/libretro/hakux_libretro.info \
    ${INSTALL}/usr/lib/libretro
}
