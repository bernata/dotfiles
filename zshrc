#Copy to .zshrc
#brew install zsh
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

# change color of directories in exa
# https://the.exa.website/docs/colour-themes
export LS_COLORS="di=36;1"
export EXA_COLORS="da=35"

export TFENV_ARCH=amd64

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias ls=exa
alias ll="ls -al"
alias tree="exa --tree"
