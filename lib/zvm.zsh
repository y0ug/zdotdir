# ZVM_INIT_MODE=sourcing

# if set in zvm_config we shoyld export them
ZVM_FAST_ESCAPE=1
ZVM_ESCAPE_KEYTIMEOUT=0.001
ZVM_KEYTIMEOUT=0.04
ZVM_LINE_INIT_MODE="${ZVM_MODE_INSERT}"
ZVM_VI_SURROUND_BINDKEY="s-prefix"

#  ## Surround
#
# There are 2 kinds of keybinding mode for surround operating, default is classic mode, you can choose the mode by setting ZVM_VI_SURROUND_BINDKEY option.
#
#     classic mode (verb->s->surround)
#
#     S" : Add " for visual selection
#     ys" : Add " for visual selection
#     cs"' : Change " to '
#     ds" : Delete "
#
#     s-prefix mode (s->verb->surround)
#
#     sa" : Add " for visual selection
#     sd" : Delete "
#     sr"' : Change " to '
#
# Note that key sequences must be pressed in fairly quick succession to avoid a timeout. You may extend this timeout with the ZVM_KEYTIMEOUT option.
# How to select surround text object?
#
#     vi" : Select the text object inside the quotes
#     va( : Select the text object including the brackets
#
# Then you can do any operation for the selection:
#
#     Add surrounds for text object
#
#     vi" -> S[ or sa[ => "object" -> "[object]"
#     va" -> S[ or sa[ => "object" -> ["object"]
#
#     Delete/Yank/Change text object
#
#     di( or vi( -> d
#     ca( or va( -> c
#     yi( or vi( -> y
#
function zvm_config() {
  # print -P "%F{#f8f8f2}ZVM_CONFIG%f"
  ZVM_READKEY_ENGINE="${ZVM_READKEY_ENGINE_NEX}"

  #
  # ZVM_INSERT_MODE_CURSOR="${ZVM_CURSOR_BLINKING_UNDERLINE}"
  # ZVM_NORMAL_MODE_CURSOR="${ZVM_CURSOR_BLOCK}"
  # ZVM_OPPEND_MODE_CURSOR="${ZVM_CURSOR_BLINKING_UNDERLINE}"
  # ZVM_REPLACE_MODE_CURSOR="${ZVM_CURSOR_BLINKING_UNDERLINE}"
  # ZVM_VISUAL_MODE_CURSOR="${ZVM_CURSOR_BLOCK}"
  # ZVM_VISUAL_LINE_MODE_CURSOR="${ZVM_CURSOR_BLOCK}"
  #

  #fix tmux cursor block not showing
  ZVM_CURSOR_STYLE_ENABLED=true
}
my_zvm_vi_yank() {
  zvm_vi_yank
  echo -en "${CUTBUFFER}" | cbread
}

my_zvm_vi_delete() {
  zvm_vi_delete
  echo -en "${CUTBUFFER}" | cbread
}

my_zvm_vi_change() {
  zvm_vi_change
  echo -en "${CUTBUFFER}" | cbread
}

my_zvm_vi_change_eol() {
  zvm_vi_change_eol
  echo -en "${CUTBUFFER}" | cbread
}

my_zvm_vi_put_after() {
  CUTBUFFER=$(cbprint)
  zvm_vi_put_after
  zvm_highlight clear # zvm_vi_put_after introduces weird highlighting for me
}

my_zvm_vi_put_before() {
  CUTBUFFER=$(cbprint)
  zvm_vi_put_before
  zvm_highlight clear # zvm_vi_put_before introduces weird highlighting for me
}

# zvm_after_lazy_keybindings() {
# }

# function zvm_after_lazy_keybindings() {
function zvm_after_init() {
  # zvm_define_widget my_zvm_vi_yank
  # zvm_define_widget my_zvm_vi_delete
  # zvm_define_widget my_zvm_vi_change
  # zvm_define_widget my_zvm_vi_change_eol
  # zvm_define_widget my_zvm_vi_put_after
  # zvm_define_widget my_zvm_vi_put_before
  #
  # zvm_bindkey visual 'y' my_zvm_vi_yank
  # zvm_bindkey visual 'd' my_zvm_vi_delete
  # zvm_bindkey visual 'x' my_zvm_vi_delete
  # zvm_bindkey vicmd 'C' my_zvm_vi_change_eol
  # zvm_bindkey visual 'c' my_zvm_vi_change
  # zvm_bindkey vicmd 'p' my_zvm_vi_put_after
  # zvm_bindkey vicmd 'P' my_zvm_vi_put_before

  bindkey -M vicmd 'K' run-help
  # bindkey -M viins '^Y' forward-word
  # bindkey -M vicmd '^Y' forward-word

  # ctrl-space autosuggest-accept
  # bindkey -M viins '^@' autosuggest-accept
  # bindkey -M vicmd '^@' autosuggest-accept

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
  post-autosuggestions
  enable-fzf-tab
  enable-fzf-completion
}
