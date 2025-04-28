#!/usr/bin/env zsh
# __init__: This runs prior to any other conf.d contents.

# Apps
export EDITOR=nvim
export VISUAL=nvim
# export VISUAL=zeditor
export PAGER=moar

# Issue when PATH is getting to big
# not really used
unsetopt pathdirs
