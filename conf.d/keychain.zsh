# run only if keychain is installed
# and SSH_AUTH_SOCK or SSH_AGENT_PID not already set
[[ -v SSH_AUTH_SOCK || -v SSH_AGENT_PID ]] && return 1
(( $+commands[keychain] )) || return 0

# Path to cache file
KEYCHAIN_CACHE=${KEYCHAIN_CACHE:-${XDG_CACHE_HOME:-$HOME/.cache}/keychain}

# Function to check if the SSH agent is still valid
function is_ssh_agent_valid() {
  # Check if the socket file exists
  if [[ -n "$SSH_AUTH_SOCK" && -S "$SSH_AUTH_SOCK" ]]; then
    # Check if the agent process is still running
    if [[ -n "$SSH_AGENT_PID" && -d "/proc/$SSH_AGENT_PID" ]]; then
      return 0
    fi
  fi
  return 1
}

# Check if cache exists and load it
if [[ -f "$KEYCHAIN_CACHE" ]]; then
  source "$KEYCHAIN_CACHE"

  # Verify the cached agent is still valid
  if ! is_ssh_agent_valid; then
    # If invalid, run keychain again and update cache
    keychain --eval -q > "$KEYCHAIN_CACHE"
    source "$KEYCHAIN_CACHE"
  fi
else
  # Cache doesn't exist, create it
  keychain --eval -q > "$KEYCHAIN_CACHE"
  source "$KEYCHAIN_CACHE"
fi
