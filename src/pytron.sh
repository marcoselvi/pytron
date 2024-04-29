#!/usr/bin/env bash

DEFAULT_CONFIG_PYTRONRC="$HOME/.config/pytronrc"
DEFAULT_HOME_PYTRONRC="$HOME/.pytronrc"

find_pytron () {
  path=$1
  while [[ "$path" != "" && ! -e "$path/.pytron" ]]; do
    path=${path%/*}
  done
  echo "$path/.pytron"
}

# 1. Find .pytron config searching upwards from script location. Otherwise default to $HOME/.config/pytronrc or $HOME/.pytronrc

INPUT_SCRIPT_PATH=$(realpath $1)

PYTRON_CONFIG_PATH=$(find_pytron $INPUT_SCRIPT_PATH)
if [[ "$PYTRON_CONFIG_PATH" != "/.pytron" ]]; then
  echo "Local config"
  PYTRON_CONFIG_PATH=$PYTRON_CONFIG_PATH
elif [[ -e $DEFAULT_CONFIG_PYTRONRC ]]; then
  echo ".config pytronrc"
  PYTRON_CONFIG_PATH=$DEFAULT_CONFIG_PYTRONRC
elif [[ -e $DEFAULT_HOME_PYTRONRC ]]; then
  echo "home pytronrc"
  PYTRON_CONFIG_PATH=$DEFAULT_HOME_PYTRONRC
else
  echo "No .pytron or .pytronrc config file found"
  exit
fi

echo $PYTRON_CONFIG_PATH

# 2. Detect Python version and install if needed
# 3. Update libraries
# 3.1. Use hash of .pytron config path for env selection
# 3.2. Diff of previous .pytron config with local log
# 3.3. Update missing / changed libraries
# 4. Add env path to sys.path (at the front)
# 5. Run script with selected Python version
# 6. Add refresh of packages on a timed basis, for packages explicitly >VERSION.
