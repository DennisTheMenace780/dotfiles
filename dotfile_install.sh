# Set XDG spec for the machine
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

# TODO: How to make this work on Mac?
sudo apt update && sudo apt upgrade
sudo apt -y install \
    git \
    curl \
    gpg \
    build-essential \
    cmake \
    make \
    gcc \
    fzf \
    zsh \
    ripgrep 

# Install Rust Ecosystem
curl https://sh.rustup.rs -sSf | sh
source "$HOME/.cargo/env"

# Grab ZSH plugins
# ZSH_CUSTOM = $USER/.oh-my-zsh/custom
# git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k
cargo install eza

## Version managers
cargo install --git https://github.com/MordechaiHadad/bob.git # Neovim Version Manager
cargo install fnm # Node Version Manager

fnm install 18
bob use 0.9.5

# Will try this later once experimented with the movement of dotfiles on the vm 
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
chsh -s "$(which zsh)"

