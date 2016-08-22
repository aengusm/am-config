cd
rm -rf am-config
git clone https://github.com/aengusm/am-config.git
rm -rf .vim
rm -f .vimrc
ln -s am-config/vim .vim
ln -s .vim/vimrc .vimrc

if [[ -e .zshrc ]]; then
    if ! [[ -h .zshrc ]]; then
        cp .zshrc .zshrc_local
    fi
fi

rm -f .zshrc
ln -s am-config/zsh/zshrc .zshrc

rm -rf .tmux.conf
ln -s am-config/tmux/tmux.conf .tmux.conf

# Install VIM Plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
    echo 'Installing OS X stuff...'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install tmux
fi

# Configure git
rm -rf .gitignore_global
ln -s am-config/git/gitignore_global .gitignore_global
git config --global core.excludesfile ~/.gitignore_global
