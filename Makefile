
vimrc=~/.vimrc
gitconfig=~/.gitconfig

all: ${vimrc} ${gitconfig}

${vimrc}:
	ln -s ~/.dotfiles/vimrc ~/.vimrc

${gitconfig}:
	ln -s ~/.dotfiles/gitconfig ~/.gitconfig
	@echo "Git needs ~/.gitconfig.local with identity settings"
	@echo "Press enter to continue"
	@read a
