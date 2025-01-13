#!/bin/sh

# Create the password file if it doesnt exist
if [ ! -f /mosquitto/config/passwordfile ]; then
  echo "Creating password file..."
  touch /mosquitto/config/passwordfile
  mosquitto_passwd -b /mosquitto/config/passwordfile usernametest1 passwordtest1
fi

# Start Mosquitto
exec "$@"
