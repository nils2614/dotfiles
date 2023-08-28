# zshrc by Nils Offermann

# User specific environment
PATH="$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export PATH

# Check for interactive shell
if ! [[ -o interactive ]]; then
  return
fi

# Linux / macOS specific setup steps
if [ $(/usr/bin/uname) = 'Linux' ]; then
  alias ls='ls -h --color=auto'
  alias my-macchina='macchina -UKS -o host -o kernel -o distribution -o packages -o shell -o uptime -o processor -t mine'

elif [ $(/usr/bin/uname) = 'Darwin' ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"

  alias ls='ls -h --color=auto'
  alias my-macchina='macchina -UKS -o host -o kernel -o operating-system -o packages -o shell -o uptime -o processor -t mine'
fi

# General shell setup
export PROMPT='%B%F{white}[%F{green}%m %F{blue}%1~%F{white}]%b%# %f'
alias nano='nano -x'
alias ll='ls -lA'

HISTFILE=~/.zsh_history
HISTSIZE=2500
SAVEHIST=5000

setopt histignoredups histignorespace noglob
unsetopt beep
autoload -Uz compinit
compinit

if command macchina &> /dev/null; then
  my-macchina
fi
