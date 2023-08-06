# Install latest neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv ./nvim.appimage /usr/bin/nvim

# Install neovim config
# git clone https://github.com/IRTD/nvim-config.git
# mv ./nvim-config ~/.config/nvim/
# nvim --cmd 'PlugInstall | CocInstall coc-rust-analyzer | qa'

