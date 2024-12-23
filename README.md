# osx-dev-box
my osx dev setup
1. install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. install omzh: `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
3. install zsh-autosuggestions: `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
4. install zsh-syntax-highlighting: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc`
5. install gh cli: `brew install gh`
6. clone: `gh repo clone ontehfritz/osx-dev-box`
7. `cd` into osx-dev-box
8. `cp .zshrc ~/.zshrc`
9.  install jankyborders: `brew tap FelixKratz/formulae brew install borders`
10. install aerospace: `brew install --cask nikitabobko/tap/aerospace`
11. `cp .aerospace.toml ~/.aerospace.toml`
12. start aerospace
13. install zed:
14. install jetbrains toolbox - sync settings with accounts, disable tabs
15. use vim bindings on all editors
16. install arc, soon to be zen
17. install gpg key chain, create key with email, make sure email is added in github, upload public key to github. 
