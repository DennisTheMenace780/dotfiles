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

cargo install eza

## Version managers
cargo install --git https://github.com/MordechaiHadad/bob.git # Neovim Version Manager

bob use 0.9.5

# Will try this later once experimented with the movement of dotfiles on the vm 
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh" should clear up dotfiles even further
chsh -s "$(which zsh)"

