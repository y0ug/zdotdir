#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!

# XDG
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}
export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/repo}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}

# Set ZDOTDIR if you want to re-home Zsh.
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# Fish-like dirs
: ${__zsh_config_dir:=${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}}
: ${__zsh_user_data_dir:=${XDG_DATA_HOME:-$HOME/.local/share}/zsh}
: ${__zsh_cache_dir:=${XDG_CACHE_HOME:-$HOME/.cache}/zsh}

# Ensure Zsh directories exist.
() {
  local zdir
  for zdir in $@; do
    [[ -d "${(P)zdir}" ]] || mkdir -p -- "${(P)zdir}"
  done
} __zsh_{config,user_data,cache}_dir XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_{RUNTIME,PROJECTS}_DIR

# Make Terminal.app behave.
if [[ "$OSTYPE" == darwin* ]]; then
  export SHELL_SESSIONS_DISABLE=1
fi

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

#[[ -e /etc/profile ]] && source /etc/profile
[[ -e $HOME/.profile ]] && source $HOME/.profile

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,s}bin(N)
  $HOME/.local/{,s}bin(N)
  $HOME/.go/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

rehash
