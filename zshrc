#Copy to .zshrc
#brew install zsh
#brew install lsd
#brew install tfenv
#brew install pyenv
#brew install tmux

zstyle ':vcs_info:git:*' formats '[%b]'
                                      
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{green}${PWD/#$HOME/~}%f %F{yellow}${vcs_info_msg_0_}%f > '

if [[ -z "$TMUX" ]]; then
        tmux 
fi

#export TFENV_ARCH=amd64

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias l='ls -l'
alias la='ls -a'
alias ll='ls -la'
alias lt='ls --tree'
