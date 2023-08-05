# Install latest neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv ./nvim.appimage ~/../../usr/bin/nvim

# Install neovim config
git clone https://github.com/IRTD/nvim-config.git
mv ./nvim-config ~/.config/nvim/
nvim --cmd 'PlugInstall | CocInstall coc-rust-analyzer | qa'

# Install Kitty terminal
apt install kitty -y

# Create kitty config dir and download conf files
mkdir ~/.config/kitty/
curl https://raw.githubusercontent.com/SolDoesTech/hyprland/main/kitty/kitty.conf > ~/.config/kitty/kitty.conf
curl https://raw.githubusercontent.com/SolDoesTech/hyprland/main/kitty/mocha.conf > ~/.config/kitty/mocha.conf

# Add build-essential and cmake
apt install build-essential -y
apt install cmake -y

# Install rust and cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source ~/.bashrc

# Install programs with cargo
cargo install -q exa &
cargo install -q zoxide &
cargo install -q starship &
cargo install -q bat &

# Install starship config
curl https://raw.githubusercontent.com/IRTD/helix-config/master/starship.toml > ~/.config/starship.toml

# Add starship eval
echo 'eval "$(starship init bash)"' >> ~/.bashrc

# Add zoxide eval
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc

# Add auto-cd
echo "shopt -s autocd" >> ~/.bashrc

# Add custom keybinds to .bashrc
echo "alias .='exa -1al'" >> ~/.bashrc
echo "alias c='clear'" >> ~/.bashrc
echo "alias v='nvim'" >> ~/.bashrc
