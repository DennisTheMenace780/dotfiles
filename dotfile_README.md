To install dotfiles:
```shell
echo ".cfg" >> .gitignore
git clone --bare https://<github_pat>@github.com/DennisTheMenace780/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
```
The following ZSH plugins will need to be installed after 
