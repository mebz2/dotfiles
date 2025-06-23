# Lines configured by zsh-newuser-install
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mebz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
alias c="source ~/dotfiles/hypr/scripts/cd.sh"
alias cl='clear'
alias clr='clear; fastfetch'
alias src='source ~/.zshrc'
alias ls='eza --icons'
alias ll='ls -l'
alias l='ls'
alias la='ls -al'
alias v="nvim"
alias ff='fastfetch'
alias gs='git status'
alias gc='git commit'
alias gi='git init'
alias ga='git add'


#key bindings
#
bindkey "^h" backward-word
bindkey "^l" forward-word


#options

unsetopt prompt_sp
. "/home/mebz/.deno/env"

# Load pywal colors
[[ -f "${HOME}/.cache/wal/sequences" ]] && cat "${HOME}/.cache/wal/sequences"
[[ -f "${HOME}/.cache/wal/colors.zsh" ]] && source "${HOME}/.cache/wal/colors.zsh"
export TERM="xterm-256color"


autoload -Uz vcs_info

setopt prompt_subst

# Show only the branch name in brackets
zstyle ':vcs_info:git:*' formats '%F{green}git:(%b)%f'
zstyle ':vcs_info:git:*' actionformats '%F{yellow}git:(%b)%f'

precmd() {
  vcs_info
if [[ $PWD == $HOME ]]; then
    PROMPT_PATH=""
  else
    PROMPT_PATH="%c"
  fi
}


PROMPT='-> ${PROMPT_PATH}${vcs_info_msg_0_:+" "}${vcs_info_msg_0_} %# '

# %#


export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland
export FILE_MANAGER=nemo
export GTK_USE_PORTAL=1
