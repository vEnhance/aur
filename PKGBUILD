# Maintainer: neeshy <neeshy@tfwno.gf>
# Maintainer: Marcin Kolesinski <m dot kolesinski at gmail dot com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Kevin Puertas <kevinpr@jkanetwork.com>
# Contributor: Nascher <kevin@nascher.org>
# Contributor: Artefact2 <artefact2@gmail.com>
# Contributor: Philip Sequeira <phsequei@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
# Contributor: ZipFile <lin.aaa.lin@gmail.com>
# Contributor: Carlos Solis <csolisr at gmail dot com>
pkgname=stepmania
_pkgver=d55acb1ba26f1c5b5e3048d6d6c0bd116625216f
pkgver=5.1.0.b2.r627.d55acb1ba2
pkgrel=2
pkgdesc="Advanced rhythm game. Designed for both home and arcade use."
arch=(x86_64)
url="http://www.stepmania.com/"
license=('MIT AND CC-BY-NC-4.0')
depends=('glew' 'glu' 'libx11' 'libxext' 'libxtst' 'libxinerama' 'libxrandr'
         'alsa-lib' 'libpulse' 'libmad' 'libogg' 'libvorbis' 'libjpeg' 'libpng'
         'gtk3' 'libtommath' 'libtomcrypt' 'jsoncpp' 'pcre' 'zlib' 'libsm' 'libice')
optdepends=('ffmpeg: if attempting a build with WITH_SYSTEM_FFMPEG=YES')
         
makedepends=('cmake')
source=("https://github.com/stepmania/stepmania/archive/$_pkgver.tar.gz"
        "ffmpeg-mathops.patch"
        "ffmpeg-misc.patch"
        "stepmania 5.1.desktop")
# The following is needed to compile against system (newer) FFMpeg, but this currently results in crashes when video files are used in-game
#        "https://github.com/stepmania/stepmania/commit/3fef5ef60b7674d6431f4e1e4ba8c69b0c21c023.patch"
#        "ffmpeg-7.patch"
#        "ffmpeg-remove-asm-requirement.patch"

sha256sums=('7d0e0d4b13f780fc6181561b257d9cd8a3ef73df513f4b8f36743acebb63a130'
            'e8936b23e1c645a0cb259e50c9f2baba619d51bcbf657e933970d00e2ed3311d'
            '858b6fddfb576f28edabcb7c17b670e9cf2911f3130af2f31e22ff1ade4405ed'
            '2144dbd868ca3a9fbee4915c5130ee7fe238fce2c64a55d90a2602eda4ccb87c')
# Corresponding sums for disabled sources above
#            'fe3c77293d65b654c91d419ba7421feb2ad2da8e4561fadc5f02b3bd0f791634'
#            'f6406a9daa61f53a530402965cfc9533f9836d558026b0fc5627db05f8cde068'
#            'ae8d9911eaf7680d7f05a5bafa98588a1582f9b7713a295a66603a2ca8b5addf'

prepare() {
  # These patches all deal with compiling against newer (system) FFMpeg, which Stepmania does not currently support
#  cd "$srcdir/$pkgname-$_pkgver"
#  patch -Np1 -i "$srcdir/3fef5ef60b7674d6431f4e1e4ba8c69b0c21c023.patch"
#  patch -Np1 -i "$srcdir/ffmpeg-7.patch"
#  patch -Np1 -i "$srcdir/ffmpeg-remove-asm-requirement.patch"
  
  # CMake is handled here, in part because it includes additional commands (contained in upstream source) to download/extract FFMpeg
  # which requires patching to build.
  cd "$srcdir/$pkgname-$_pkgver/Build"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/opt \
    -DWITH_FULL_RELEASE=YES \
    -DWITH_PORTABLE_TOMCRYPT=NO \
    -DWITH_SYSTEM_FFMPEG=NO \
    -DWITH_SYSTEM_MAD=YES \
    -DWITH_SYSTEM_OGG=YES \
    -DWITH_SYSTEM_JPEG=YES \
    -DWITH_SYSTEM_PNG=YES \
    -DWITH_SYSTEM_GLEW=YES \
    -DWITH_SYSTEM_TOMMATH=YES \
    -DWITH_SYSTEM_TOMCRYPT=YES \
    -DWITH_SYSTEM_JSONCPP=YES \
    -DWITH_SYSTEM_PCRE=YES \
    -DWITH_SYSTEM_ZLIB=YES \
    -Wno-dev \
    ..
  make -f CMakeFiles/ffmpeg.dir/build.make CMakeFiles/ffmpeg.dir/clean
  make -f CMakeFiles/ffmpeg.dir/build.make ffmpeg-prefix/src/ffmpeg-stamp/ffmpeg-download
  # Patch Stepmania bundled FFMpeg
  cd "$srcdir/$pkgname-$_pkgver/extern/ffmpeg-linux-2.1.3"
  patch -Np1 -i "$srcdir/ffmpeg-mathops.patch"
  patch -Np1 -i "$srcdir/ffmpeg-misc.patch"
}

build() {
  cd "$srcdir/$pkgname-$_pkgver/Build"
  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make -C Build DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/stepmania-5.1/stepmania "$pkgdir/usr/bin/stepmania"
  # Stepmania's bundled .desktop file doesn't launch correctly, substitute with a working one
#  install -Dm644 stepmania.desktop "$pkgdir/usr/share/applications/stepmania.desktop"
  install -Dm644 "$srcdir/stepmania 5.1.desktop" "$pkgdir/usr/share/applications/stepmania.desktop"

  install -Dm644 Docs/Licenses.txt "$pkgdir/usr/share/licenses/$pkgname/Licenses.txt"
  cp -a icons "$pkgdir/usr/share"
}
