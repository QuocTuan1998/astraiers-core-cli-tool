type=none

_ASS_EXECUTER_PATH=$(which ass 2>/dev/null)
if [[ -x "$_ASS_EXECUTER_PATH" ]]; then
    _ASS_DIR=$(dirname $(realpath "$_ASS_EXECUTER_PATH"))
    _ASS_REPOSITORES_DIRS+=( $_ASS_DIR/local-repository )

    type=directory
    path=_ASS_REPOSITORES_DIRS
fi


