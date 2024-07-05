# Maintainer: neeshy <neeshy@tfwno.gf>
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
depends=('mesa' 'glew' 'glu' 'udev' 'libx11' 'libxext' 'libxtst' 'libxinerama' 'libxrandr'
         'alsa-lib' 'libpulse' 'ffmpeg' 'libmad' 'libogg' 'libvorbis' 'libjpeg' 'libpng'
         'gtk3' 'libtommath' 'libtomcrypt' 'jsoncpp' 'pcre' 'zlib')
makedepends=('cmake' 'nasm')
source=("https://github.com/stepmania/stepmania/archive/$_pkgver.tar.gz"
        "https://github.com/stepmania/stepmania/commit/3fef5ef60b7674d6431f4e1e4ba8c69b0c21c023.patch"
        "ffmpeg-7.patch"
        "stepmania.sh")
sha256sums=('7d0e0d4b13f780fc6181561b257d9cd8a3ef73df513f4b8f36743acebb63a130'
            'fe3c77293d65b654c91d419ba7421feb2ad2da8e4561fadc5f02b3bd0f791634'
            'f6406a9daa61f53a530402965cfc9533f9836d558026b0fc5627db05f8cde068'
            '6b379ff7f8aa341eb1557a82c1acd5bbe64a91344bd1c3965ce07ed0ebf135d2')

prepare() {
  cd "$srcdir/$pkgname-$_pkgver"
  patch -Np1 -i "$srcdir/3fef5ef60b7674d6431f4e1e4ba8c69b0c21c023.patch"
  patch -Np1 -i "$srcdir/ffmpeg-7.patch"
}

build() {
  cd "$srcdir/$pkgname-$_pkgver/Build"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/opt \
    -DWITH_FULL_RELEASE=YES \
    -DWITH_PORTABLE_TOMCRYPT=NO \
    -DWITH_SYSTEM_FFMPEG=YES \
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
    ..
  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make -C Build DESTDIR="$pkgdir" install

  install -Dm755 "$srcdir/stepmania.sh" "$pkgdir/usr/bin/stepmania"
  install -Dm644 stepmania.desktop "$pkgdir/usr/share/applications/stepmania.desktop"

  install -Dm644 Docs/Licenses.txt "$pkgdir/usr/share/licenses/$pkgname/Licenses.txt"
  cp -a icons "$pkgdir/usr/share"
}
