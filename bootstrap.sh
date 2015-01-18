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
source .zshrc
