# Function to find project root
project_root() {
  # First check if devenv_root is set
  if [[ -n "$DEVENV_ROOT" ]]; then
    echo "$DEVENV_ROOT"
  # Otherwise try to find git root
  elif git rev-parse --show-toplevel &>/dev/null; then
    git rev-parse --show-toplevel
  fi
}

# Initial setup
# if root=$(project_root 2>/dev/null); then
#   dirname=$(basename "$root")
#   hash -d "$dirname"=$root
#   # hash -d p=$root
# fi

# Define a hook that runs whenever directory changes
function update_project_hash() {
  local root
  if root=$(project_root 2>/dev/null); then
    dirname=$(basename "$root")
    hash -d "$dirname"=$root
    #hash -d p=$root
  fi
}

# Register the hook to run on directory change
autoload -Uz add-zsh-hook
add-zsh-hook chpwd update_project_hash
