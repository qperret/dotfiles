
vimplug=~/.vim/autoload/plug.vim
vimrc=~/.vimrc
mutt=~/.mutt
fzf=~/.fzf.bash
fira-font=~/.fonts/FiraSans-Book.ttf
xdefaults=~/.Xdefaults
i3config=~/.i3/config

all: ${vimplug} ${vimrc} ${mutt} ${fzf} ${fira-font} ${xdefaults} ${i3config}

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
	mkdir ~/.mutt/cache
	ln -s ~/.dotfiles/mutt/muttrc ~/.mutt/muttrc
	ln -s ~/.dotfiles/mutt/colors.mine ~/.mutt/colors.mine
	@echo "Mutt needs ~/.muttrc.local with identity settings"
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

${xdefaults}:
	@echo "Setting up Xdefaults"
	ln -s ~/.dotfiles/Xdefaults ${xdefaults}

${i3config}:
	ln -s ~/.dotfiles/i3 ~/.i3
