#!/usr/bin/env bash
#set -eu
set -eou pipefail

# Vars
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_RED=$ESC_SEQ"31;01m"

echo "Running checks ..."

exec markdown-link-check {} \; 2> error.txt


if [ -e error.txt ] ; then
  if grep -q "ERROR:" error.txt; then
    echo "$COL_REDPlease check the log$COL_RESET\n"
    exit 1
  fi
fi
