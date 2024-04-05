this is funny, but you need to add this to `~/.zshrc` to make this config work:
```bash
export ZSH_CUSTOM=$DOTFILES/config/zsh
export ZSH=$HOME/.oh-my-zsh

source $ZSH_CUSTOM/rc.zsh

source $ZSH/oh-my-zsh.sh
```
