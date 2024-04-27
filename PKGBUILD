# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-types-markdown
_name=types-Markdown
pkgver=3.6.0.20240316
pkgrel=1
pkgdesc='Typing stubs for Markdown'
arch=(any)
url=https://github.com/python/typeshed
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('de9fb84860b55b647b170ca576895fcca61b934a6ecdc65c31932c6795b440b8')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
