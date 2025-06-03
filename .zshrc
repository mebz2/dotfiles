# Lines configured by zsh-newuser-install
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mebz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
#
alias c="source ~/dotfiles/hypr/scripts/cd.zsh"
alias cl='clear'
alias clr='clear; fastfetch'
alias src='source ~/.zshrc'
alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland "
alias ls='eza --icons'
alias ll='ls -l'
alias v="nvim"
alias ff='fastfetch'
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

precmd() {
  vcs_info
}

# Show only the branch name in brackets
zstyle ':vcs_info:git:*' formats '%F{green}(%b)%f'
zstyle ':vcs_info:git:*' actionformats '%F{green}(%b)%f'

setopt prompt_subst
PROMPT='%c${vcs_info_msg_0_} %# '


