#!/bin/sh
for port in $(seq 8000 8100); do
  # Check if the port is in use
  if ! ss -tuln | grep -q ":$port "; then
    echo "Starting server on port $port"
    python3 -m http.server "$port"
    break
  fi
done
