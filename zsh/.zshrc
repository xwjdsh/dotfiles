# Homebrew (Apple Silicon / Intel / Linuxbrew)
if [[ -z "${HOMEBREW_PREFIX:-}" ]]; then
  for _brew in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
    [[ -x "$_brew" ]] && eval "$("$_brew" shellenv)" && break
  done
  unset _brew
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Prompt is handled by starship
ZSH_THEME=""

# Add wisely, as too many plugins slow down shell startup.
plugins=(git command-not-found sudo ssh-agent golang extract)

# ssh-agent plugin
zstyle :omz:plugins:ssh-agent identities personal/id_ed25519 personal_rsa/id_rsa work/id_ed25519

source $ZSH/oh-my-zsh.sh

# Keep these after oh-my-zsh; syntax-highlighting must be sourced last.
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Editor
export EDITOR=nvim
export VISUAL=nvim

alias vim="nvim"
alias vi="nvim"

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias gs='git status'

alias lzd='lazydocker'
alias lzg='lazygit'

# fix 'gpg: signing failed: Inappropriate ioctl for device'
export GPG_TTY=$TTY

export GOPATH=$HOME/go
export MASON_HOME="$HOME/.local/share/nvim/mason"
export PATH="$GOPATH/bin:$MASON_HOME/bin:$HOME/.local/bin:$PATH"

eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Machine-specific overrides (not tracked)
[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local
