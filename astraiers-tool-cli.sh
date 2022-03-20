#!/bin/bash

# Thằng này là executer full chức năng cho hệ thống, có thể tùy chỉnh linh hoạt
# thêm bớt các tính năng abc.....
# Nói chung nó là bản full.
#
# Anh em nào muốn tìm hiểu thêm thì liên hệ Thanhntmany (0344087349)
# mình đàm đạo hen


# Get the directory path of the current script
ASS_CORE_DIR=$(dirname $(realpath "${BASH_SOURCE[0]}"))

# =============================================================================
# Load the minimum-usable-core from ass.sh
# --just-load --> Delay execution until everything is loaded.
. "${ASS_CORE_DIR}/ass.sh" --just-load

# =============================================================================
# Load the extension parts


# =============================================================================
# Main execution
main $@
