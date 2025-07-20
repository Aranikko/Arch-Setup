git_clone(){

	git clone https://aur.archlinux.org/yay.git
	git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
	git clone https://github.com/itRoy-pentest/RoyHyprland.git

}

install_dependencies(){

	sudo pacman -S freetype2 zsh hyprlock hyprpaper waybar ttf-font-awesome otf-font-awesome ttf-jetbrains-mono pavucontrol feh ranger thunar meson nwg-look papirus-icon-theme fastfetch file powerline-fonts inetutils ttf-font-awesome otf-font-awesome ttf-jetbrains-mono  ttf-dejavu bluez bluez-utils blueman vlc tar unzip zip 7zip

	cd yay 
	makepkg -si
	cd ..

	yay -S hyprshot wlogout

}

copy_cfg(){

	cd RoyHyprland
	cp -r kitty waybar wlogout wofi hypr fastfetch ~/.config
	cd ..
	cd Graphite-gtk-theme
	./install.sh
	cd ..
}

install_zsh(){

	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

}

git_clone
