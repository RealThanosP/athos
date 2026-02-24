pkgname=athos
pkgver=1.0.0
pkgrel=1
pkgdesc="TUI for installing packages and creating webapp launchers on Arch Linux"
arch=('any')
url="https://github.com/RealThanosP/athos"
license=('MIT')
depends=('gum' 'fzf')
optdepends=('yay')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

package() {
    cd "$pkgname"
    
    install -Dm755 athos "$pkgdir/usr/bin/athos"
    install -Dm755 athos-pkg-install "$pkgdir/usr/bin/athos-pkg-install"
    install -Dm755 athos-pkg-remove "$pkgdir/usr/bin/athos-pkg-remove"
    install -Dm755 athos-pkg-aur-install "$pkgdir/usr/bin/athos-pkg-aur-install"
    install -Dm755 athos-webapp-install "$pkgdir/usr/bin/athos-webapp-install"
    install -Dm755 athos-webapp-remove "$pkgdir/usr/bin/athos-webapp-remove"
    install -Dm755 athos-show-logo "$pkgdir/usr/bin/athos-show-logo"
    install -Dm755 athos-show-done "$pkgdir/usr/bin/athos-show-done"
    
    install -Dm644 logo.txt "$pkgdir/usr/share/athos/logo.txt"
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/athos.png"
    
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/athos.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=athos
Comment=Package and Web App Installer, based on Omarchy ()
Exec=/usr/bin/athos
Icon=athos
Terminal=true
Type=Application
Categories=System;PackageManager;
Keywords=install;package;aur;webapp;
EOF
}
