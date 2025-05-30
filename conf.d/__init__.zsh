#!/usr/bin/env zsh
# __init__: This runs prior to any other conf.d contents.

# Apps
export EDITOR=nvim
export VISUAL=nvim
# export VISUAL=zeditor
export PAGER=moar
export XDG_CONFIG_DIR=$XDG_CONFIG_HOME
# Issue when PATH is getting to big slow completion
# not really used
unsetopt pathdirs
