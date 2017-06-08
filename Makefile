
vimplug=~/.vim/autoload/plug.vim
vimrc=~/.vimrc
mutt=~/.mutt
fzf=~/.fzf.bash
fira-font=~/.fonts/FiraSans-Book.ttf

all: ${vimplug} ${vimrc} ${mutt} ${fzf} ${fira-font}

${vimplug}:
	@echo "Installing Vim-plug ..."
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo "Please run :PlugInstall in ViM to install all the plugins"
	@echo "Press enter to continue"
	@read a

${vimrc}:
	ln -s ~/.dotfiles/vimrc ~/.vimrc

${mutt}:
	mkdir ~/.mutt
	ln -s ~/.dotfiles/mutt/muttrc ~/.mutt/muttrc
	ln -s ~/.dotfiles/mutt/colors.mine ~/.mutt/colors.mine
	@echo "Mutt needs ~/.muttrc with identity settings and ~/.muttpass.gpg"
	@echo "with the GPG encrypted password"
	@echo "Press enter to continue"
	@read a

${fzf}:
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	@echo "Installing FZF"
	~/.fzf/install

${fira-font}:
	@echo "Installing Fira fonts ..."
	mkdir -p ~/.fonts
	@svn co https://github.com/mozilla/Fira.git/trunk/ttf ~/.fonts
	@echo "Updating font cache ..."
	sudo fc-cache -f
