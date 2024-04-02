this is kind of fun, but you need to add this to `~/.zshrc` to make this config work:
```bash
export ZSH_CUSTOM=$DOTFILES/zsh
export ZSH=$HOME/.oh-my-zsh

source $ZSH_CUSTOM/rc.zsh

source $ZSH/oh-my-zsh.sh
```
