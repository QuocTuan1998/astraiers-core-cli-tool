#!/bin/bash

# Ass-core-tools use a group of variable that 

# File system layout definition 
FILE_SYSTEM_LAYOUT=unix-like
[[ "${TERMUX_PREFIX:=$PREFIX}" =~ com.termux ]] && FILE_SYSTEM_LAYOUT=termux

## Choose the destination folders for the installation files
case "$FILE_SYSTEM_LAYOUT" in
    *)
      # Initial default values
      _DEST_PREFIX=/usr
      _DEST_BINDIR=${_DEST_PREFIX}/bin
      _DEST_LIBDIR=${_DEST_PREFIX}/lib

      # Bash compat-completion-directory definition
      # Ref: https://raw.githubusercontent.com/scop/bash-completion/2.8/doc/bash_completion.txt
      _comp_compat_dir=${BASH_COMPLETION_COMPAT_DIR:-/etc/bash_completion.d}
      ;;
    termux)
      # As Termux uses it own file system layout, we must use a specific one for it.
      # Ref: https://github.com/termux/termux-packages/wiki/Termux-file-system-layout
      _DEST_PREFIX=${TERMUX_PREFIX:=$PREFIX}
      _DEST_BINDIR=${_DEST_PREFIX}/bin
      _DEST_LIBDIR=${_DEST_PREFIX}/lib

      _comp_compat_dir=${BASH_COMPLETION_COMPAT_DIR:-${_DEST_PREFIX}/etc/bash_completion.d}
    ;;
esac

