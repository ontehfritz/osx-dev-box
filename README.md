# osx-dev-box
my osx dev setup
- install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- install omzh: `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- install zsh-autosuggestions: `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
- install zsh-syntax-highlighting: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc`
- install gh cli: `brew install gh`
- clone: `gh repo clone ontehfritz/osx-dev-box`
- `cd` into osx-dev-box
- `cp .zshrc ~/.zshrc`
-  install jankyborders: `brew tap FelixKratz/formulae brew install borders`
- cp bordersrc ~/.config/borders/bordersrc
- run: brew services start borders
- install aerospace: `brew install --cask nikitabobko/tap/aerospace`
- `cp .aerospace.toml ~/.aerospace.toml`
- start aerospace
- install zed:
- install jetbrains toolbox - sync settings with accounts, disable tabs
- install arc
- install gpg key chain, create key with email, make sure email is added in github, upload public key to github.
