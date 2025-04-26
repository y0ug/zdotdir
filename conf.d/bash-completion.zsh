# Function to load bash completions tool fpath
#
load_bash_completions_fp() {
  # Make sure bash completion is installed and initialized
  autoload -U +X bashcompinit && bashcompinit

autoload -U +X bashcompinit && bashcompinit

  # Load completions from /etc/bash_completion.d/
local nix_profiles=(${(s: :)NIX_PROFILES})
  # Load completions from XDG_DATA_DIRS/bash-completion/completions/
local xdg_dirs=(${(s/:/)XDG_DATA_DIRS})
tmppath=(${nix_profiles[@]/%//etc/bash_completion.d} ${xdg_dirs[@]/%//bash-completion/completions})

echo tmppath: $tmppath
local valid_fpath=()

for dir in ${tmppath}; do
  if [[ -d "$dir" ]]; then
  echo valid_fpath $dir
  echo valid $dir
    valid_fpath+=("$dir")
  fi
done

fpath=( $fpath $valid_fpath )
}

function load_gnu_generic_completions() {
  local commands=(
    exa
    ls
    rg
  )

  for cmd in $commands; do
    echo "Loading gnu generic completion for $cmd"


    fallback_gnu_generic $cmd
  done
}


