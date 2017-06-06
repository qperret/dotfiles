
vimplug=~/.vim/autoload/plug.vim
vimrc=~/.vimrc
mutt=~/.mutt
fzf=~/.fzf.bash

all: ${vimplug} ${vimrc} ${mutt} ${fzf}

${vimplug}:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "Please run :PlugInstall in ViM to install all the plugins"

${vimrc}:
	ln -s ~/.dotfiles/vimrc ~/.vimrc

${mutt}:
	mkdir ~/.mutt
	ln -s ~/.dotfiles/mutt/muttrc ~/.mutt/muttrc
	ln -s ~/.dotfiles/mutt/colors.mine ~/.mutt/colors.mine

${fzf}:
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	echo "Installing FZF"
	~/.fzf/install

