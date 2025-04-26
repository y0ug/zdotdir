#!/usr/bin/env zsh

# Set nix functions and completions that are not found in my system.
_fps=("$HOME/.local/state/nix/profiles/home-manager/home-path/share/zsh/site-functions"
  "$HOME/.nix-profile/share/zsh/site-functions/")

for _dir in $_fps; do
  if [[ -r "$_dir" ]]; then
    fpath=("$_dir" $fpath)
  fi
done
unset _dir _fps
