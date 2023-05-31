#!/bin/bash

# The set -e option instructs bash to immediately exit if any command [1] has a non-zero exit status
set -e 

# Remove a potentially pre-existing server.pid for Rails
SERVER_PID_FILE=/dalay/tmp/pids/server.pid
if [[ -f "$SERVER_PID_FILE" ]]; then
  echo "Removing pre-existing Rails server PID file: $SERVER_PID_FILE"
  rm -f /dalay/tmp/pids/server.pid
else
  echo "No pre-existing Rails server PID file"
fi

# This is important in Docker for signals to be proxied correctly.
# https://unix.stackexchange.com/questions/466999/what-does-exec-do
exec "$@"
