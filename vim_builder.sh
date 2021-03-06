touch .env_extras
mkdir -p $HOME/apps
mkdir -p $HOME/.config/nvim
cp nvim_init.vim $HOME/config/nvim/init.vim
cd $HOME/apps
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
echo "$(cat .env_extras)alias nvim=\"$HOME/apps/nvim.appimage\"\n" >> .env_extras
# sudo pacman -Syu neovim
mkdir -p $HOME/.local/share/nvim/site/autoload
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +UpdateRemotePlugins +qa
sed -i.bu 's/async=True/**{"async": True}/' ~/.config/nvim/plugged/nvim-completion-manager/pythonx/cm.py
sed -i.bu 's/async=True/**{"async": True}/' ~/.config/nvim/plugged/nvim-completion-manager/pythonx/cm_core.py

