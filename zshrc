#Copy to .zshrc
#brew install zsh
#brew install lsd
#brew install tfenv
#brew install pyenv
#brew install tmux
#brew install font-hack-nerd-font

########################################
# Prompt: user@host dir (git_branch*) ➜
# Inspired by recommended concise prompt pattern.
# Shows:
#   • user and host
#   • current directory (relative to ~)
#   • current git branch and a '*' if the working tree is dirty
#   • a pretty arrow symbol

# Git helper for prompt
parse_git() {
  command git rev-parse --is-inside-work-tree &>/dev/null || return 0
  local branch dirty
  branch=$(command git symbolic-ref --quiet --short HEAD 2>/dev/null || \
           command git rev-parse --short HEAD 2>/dev/null)
  command git diff --quiet --ignore-submodules HEAD &>/dev/null || dirty='*'
  printf '[%s%s]' "$branch" "$dirty"
}

# Colors (ANSI)
local c_user="%F{green}"
local c_host="%F{yellow}"
local c_dir="%F{blue}"
local c_git="%F{magenta}"
local c_reset="%f"

setopt PROMPT_SUBST
# New concise prompt (user@host dir [branch*] ➜)
PROMPT="${c_user}%n${c_reset}@${c_host}%m ${c_dir}%~${c_reset} ${c_git}\$(parse_git)${c_reset} ➜ "


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
