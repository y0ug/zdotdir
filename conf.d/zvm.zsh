# in zvm_config something is overiding some so we set it here
bindkey -M vicmd 'K' run-help
bindkey -M viins '^Y' forward-word
bindkey -M vicmd '^Y' forward-word

# ctrl-space autosuggest-accept
bindkey -M viins '^@' autosuggest-accept
bindkey -M vicmd '^@' autosuggest-accept

bindkey -M vicmd "^R" atuin-search-viins
bindkey -M viins "^R" atuin-search-viins

bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^N' down-line-or-history
bindkey -M vicmd '^P' up-line-or-history
bindkey -M vicmd '^N' down-line-or-history

# ctrl backspace delete word
# bindkey -M viins '^?' backward-kill-word
bindkey -M viins '^H' backward-kill-word
bindkey -M vicmd '^H' backward-kill-word
# bindkey -M vicmd '^?' backward-kill-word

# showkey -a
bindkey -M viins "^[[1~" beginning-of-line
bindkey -M viins "^[[4~" end-of-line
bindkey -M vicmd "^[[1~" beginning-of-line
bindkey -M vicmd "^[[4~" end-of-line

# remove vi-add-eol
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(${ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#vi-add-eol})
bindkey -M vicmd "^E" autosuggest-clear
bindkey -M viins "^E" autosuggest-clear

bindkey -M emacs '^r' atuin-search
bindkey -M viins '^r' atuin-search-viins
# bindkey -M vicmd '/' atuin-search";

# bindkey -M emacs '^[[A' atuin-up-search
# bindkey -M vicmd '^[[A' atuin-up-search-vicmd
# bindkey -M viins '^[[A' atuin-up-search-viins
# bindkey -M emacs '^[OA' atuin-up-search
# bindkey -M vicmd '^[OA' atuin-up-search-vicmd
# bindkey -M viins '^[OA' atuin-up-search-viins
# bindkey -M vicmd 'k' atuin-up-search-vicmd"
#
