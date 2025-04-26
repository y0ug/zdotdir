#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#


# Set nix functions and completions.
_fps=( "$HOME/.local/state/nix/profiles/home-manager/home-path/share/zsh/site-functions"
   "$HOME/.nix-profile/share/zsh/site-functions/" )

for _dir in $_fps; do
  if [[ -r "$_dir" ]]; then
    fpath=("$_dir" $fpath)
  fi
done
unset _dir _fps


# Set any zstyles you might use for configuration.
[[ ! -f ${ZDOTDIR:-$HOME}/.zstyles ]] || source ${ZDOTDIR:-$HOME}/.zstyles
[[ ! -f ${ZDOTDIR:-$HOME}/.zaliases ]] || source ${ZDOTDIR:-$HOME}/.zaliases

# Set prompt theme
typeset -ga ZSH_THEME
zstyle -a ':zephyr:plugin:prompt' theme ZSH_THEME ||
ZSH_THEME=(p10k mmc)

# Set helpers for antidote.
is-theme-p10k()     { [[ "$ZSH_THEME" == (p10k|powerlevel10k)* ]] }
is-theme-starship() { [[ "$ZSH_THEME" == starship* ]] }

# Load things from lib.
for zlib in $ZDOTDIR/lib/*.zsh; source $zlib
unset zlib

#
# Prompt
#

# Uncomment to manually set your prompt, or let Zephyr do it automatically in the
# zshrc-post hook. Note that some prompts like powerlevel10k may not work well
# with post_zshrc.
setopt prompt_subst transient_rprompt
autoload -Uz promptinit && promptinit
prompt "$ZSH_THEME[@]"

#
# Wrap up
#

# Never start in the root file system. Looking at you, Zed.
[[ "$PWD" != "/" ]] || cd

# Manually call post_zshrc to bypass the hook
(( $+functions[run_post_zshrc] )) && run_post_zshrc

# Finish profiling by calling zprof.
[[ "$ZPROFRC" -eq 1 ]] && zprof
[[ -v ZPROFRC ]] && unset ZPROFRC

# Always return success
true
