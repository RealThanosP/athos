pkgname=athos
pkgver=1.0.0
pkgrel=1
pkgdesc="TUI for installing packages and creating webapp launchers on Arch Linux"
arch=('any')
url="https://github.com/RealThanosP/athos"
license=('MIT')
depends=('gum' 'fzf')
optdepends=('yay')
source=('athos'
        'athos-pkg-install'
        'athos-pkg-remove'
        'athos-pkg-aur-install'
        'athos-pkg-aur-remove'
        'athos-webapp-install'
        'athos-webapp-remove'
        'athos-launch-webapp'
        'athos-utils.sh'
        'logo.txt'
        'icon.png')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

<<<<<<< HEAD
prepare() {
    cat > "athos.desktop" <<EOF
=======
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
    install -Dm755 athos-launch-webapp "$pkgdir/usr/bin/athos-launch-webapp"
    install -Dm755 install.sh "$pkgdir/usr/bin/athos-install"
    install -Dm755 uninstall.sh "$pkgdir/usr/bin/athos-uninstall"
    
    install -Dm644 logo.txt "$pkgdir/usr/share/athos/logo.txt"
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/athos.png"
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/athos.png"
    
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/athos.desktop" <<EOF
>>>>>>> refs/remotes/origin/main
[Desktop Entry]
Version=1.0
Name=athos
Comment=Package and Web App Installer, based on Omarchy ()
Exec=/usr/bin/athos
Icon=/usr/share/icons/hicolor/256x256/apps/athos.png
Terminal=true
Type=Application
Categories=System;PackageManager;
Keywords=install;package;aur;webapp;
EOF
}

<<<<<<< HEAD
package() {
    install -Dm755 athos "$pkgdir/usr/bin/athos"
    install -Dm755 athos-pkg-install "$pkgdir/usr/bin/athos-pkg-install"
    install -Dm755 athos-pkg-remove "$pkgdir/usr/bin/athos-pkg-remove"
    install -Dm755 athos-pkg-aur-install "$pkgdir/usr/bin/athos-pkg-aur-install"
    install -Dm755 athos-pkg-aur-remove "$pkgdir/usr/bin/athos-pkg-aur-remove"
    install -Dm755 athos-webapp-install "$pkgdir/usr/bin/athos-webapp-install"
    install -Dm755 athos-webapp-remove "$pkgdir/usr/bin/athos-webapp-remove"
    install -Dm755 athos-launch-webapp "$pkgdir/usr/bin/athos-launch-webapp"
    install -Dm755 athos-utils.sh "$pkgdir/usr/bin/athos-utils.sh"
    
    install -Dm644 logo.txt "$pkgdir/usr/share/athos/logo.txt"
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/athos.png"
    
    install -Dm644 athos.desktop "$pkgdir/usr/share/applications/athos.desktop"
=======
post_install() {
    echo ""
    echo "========================================"
    echo "  athos installed successfully!"
    echo "========================================"
    echo ""
    echo "Run the following command to complete setup:"
    echo ""
    echo "  athos-install"
    echo ""
    echo "This will create desktop entry and add PATH to your shell."
    echo ""
>>>>>>> refs/remotes/origin/main
}
