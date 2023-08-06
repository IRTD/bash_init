# Install latest neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv ./nvim.appimage /usr/bin/nvim

# Install latest nodejs
curl 'https://nodejs.org/dist/v18.17.0/node-v18.17.0-linux-x64.tar.xz' -o 'node.tar.gz'
mkdir node_temp
tar -xf 'node.tar.gz' -C ./node_temp/ --strip-components=1
sudo mv ./node_temp/bin/node /usr/bin/node
rm -rf node_temp
rm -rf node.tar.gz
sudo apt install nodejs -y

# Install neovim config
git clone https://github.com/IRTD/nvim-config.git
sudo mv ./nvim-config ~/.config/nvim/
nvim --noplugin --headless +PlugInstall +qall

#Install kitty
sudo apt install kitty

#Install kitty config
mkdir ~/.config/kitty/
curl https://raw.githubusercontent.com/SolDoesTech/hyprland/main/kitty/kitty.conf -o ~/.config/kitty/kitty.conf
curl https://raw.githubusercontent.com/SolDoesTech/hyprland/main/kitty/mocha.conf -o ~/.config/kitty/mocha.conf
sed -i 's/15/13/g' ~/.config/kitty/kitty.conf
sed -i 's/0.95/0.85/g' ~/.config/kitty/kitty.conf

# Install rust needed things
sudo apt install cmake -y
sudo apt install build-essential -y

# Install rustup and cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
source "$HOME/.cargo/env"

# Install cargo things
cargo install exa
cargo install starship
cargo install zoxide
cargo install bat

# Add aliases to .bashrc
echo "alias .='exa -1al'" >> ~/.bashrc
echo "alias c='clear'" >> ~/.bashrc
echo "alias v='nvim'" >> ~/.bashrc

# Invoke Starship and Zoxide
echo 'eval "$(starship init bash)"' >> ~/.bashrc
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc

# Install starship config
curl https://raw.githubusercontent.com/IRTD/helix-config/master/starship.toml > ~/.config/starship.toml

# Install github auth
sudo apt install gh
