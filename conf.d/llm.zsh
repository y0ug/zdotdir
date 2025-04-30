# set -a
(( $+commands[load_env.sh] )) || return 1
source load_env.sh llm
# set +a
