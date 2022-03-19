type=none

# Local extend repository (good for development)
if [ -n "${ASS_LOCAL_EXTEND_REPOSITORY_DIR}" ]; then
    type=directory
    path=$ASS_LOCAL_EXTEND_REPOSITORY_DIR
fi
