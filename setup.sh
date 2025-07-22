git_clone(){

	git clone https://aur.archlinux.org/yay.git
	git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
	git clone https://github.com/itRoy-pentest/RoyHyprland.git

}

install_dependencies(){

	sudo pacman -Suy freetype2 copyq flatpak peazip freecad steam zsh hyprlock hyprpaper waybar ttf-font-awesome otf-font-awesome ttf-jetbrains-mono pavucontrol feh ranger thunar meson nwg-look papirus-icon-theme fastfetch file powerline-fonts inetutils ttf-font-awesome otf-font-awesome ttf-jetbrains-mono  ttf-dejavu bluez bluez-utils blueman vlc tar unzip zip 7zip

	cd yay 
	makepkg -si
	cd ..

	yay -S hyprshot wlogout heroic-games-launcher orca-slicer
	
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

zsh_dependencies(){

	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


}

edit_zshrc(){

	sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
	sed -i 's/^plugins=(.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
	source ~/.zshrc

}


finally_zsh(){

	chsh
	/bin/zshrc

}



while true; do

	clear

	echo "1. All the bellow."
	echo "2. Git clone and install dependencies."
	echo "3. Copy configs."	
	echo "4. Install ZSH."
	echo "5. Configurate ZSH."
	
	read -p "Choise option: " x
	
	case $x in
	
		1) git_clone; install_dependencies; copy_cfg; install_zsh; zsh_dependencies; edit_zsh; finally_zsh; reboot;;

		2) git_clone; install_dependencies;;
		
		3) copy_cfg;;
	
		4)  install_zsh;;
		
		5) zsh_dependencies; edit_zsh; finally_zsh; reboot;;



	esac	
















done














