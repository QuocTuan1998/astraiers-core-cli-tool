#!/bin/bash

# Thằng này là executer full chức năng cho hệ thống, có thể tùy chỉnh linh hoạt
# thêm bớt các tính năng abc.....
# Nói chung nó là bản full.
#
# Anh em nào không hiểu thì liên hệ Thanhntmany (0344087349) mình đàm đạo thêm hen

# Load mấy cái trong ass.sh vào môi trường hiện tại

# Get the directory path of the current executer
ASS_CORE_DIR=$(dirname $(realpath "${BASH_SOURCE[0]}"))

# =============================================================================
# Load the minimum-usable-core from ass.sh
. "${ASS_CORE_DIR}/ass.sh" --just-load

# =============================================================================
# Load the extension parts


# =============================================================================
# Main execution
