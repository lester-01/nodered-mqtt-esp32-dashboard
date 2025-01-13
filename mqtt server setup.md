Mosquitto does not have a built-in user interface (UI) for configuration. Configuration is done via a configuration file called mosquitto.conf. This file can be customized to set various options for the Mosquitto broker1.

Location of mosquitto.conf:
On Linux: Typically found in /etc/mosquitto/mosquitto.conf.

On Windows: Typically found in C:\mosquitto\mosquitto.conf (the directory can vary depending on the installation).

Basic Configuration Example:
Here's a simple example of what the mosquitto.conf file might look like:

# Example configuration file for Mosquitto

# Allow anonymous connections
allow_anonymous true

# Define listeners
listener 1883
listener 8883

# Persistent Session
persistent_session true

# Log file and level
log_dest file /mosquitto/log/mosquitto.log
log_type all
log_dest stdout
log_type error

# Persistent storage
persistence true
persistence_location /mosquitto/data/mosquitto.db

explanation of the config file entries:
mosquitto.conf Configuration Entries:
allow_anonymous:

allow_anonymous true allows clients to connect to the MQTT broker without authentication. If set to false, clients must provide valid credentials to connect.

listener:

This sets up a listener on the specified port. For example, listener 1883 configures the broker to listen for connections on port 1883 (the default MQTT port).

You can specify multiple listeners on different ports if needed.

persistent_session:

persistent_session true enables persistent sessions, meaning that the broker will store session information for clients even when they disconnect. This allows clients to receive messages they missed while they were disconnected.

log_dest and log_type:

These options control where the broker logs information and what type of information is logged. For example, log_dest file /mosquitto/log/mosquitto.log directs logs to a specified file, while log_dest stdout sends logs to the standard output.

log_type all enables all types of logs, while log_type error logs only error messages.

persistence:

persistence true enables message persistence, allowing the broker to store retained messages and QoS 1 or 2 messages to disk.

persistence_location /mosquitto/data/mosquitto.db specifies the location where persistence data is stored.



Reloading Configuration:
To apply changes made to the mosquitto.conf file without restarting the broker, you can send a SIGHUP signal to the Mosquitto process:
kill -HUP $(pidof mosquitto)

to apply changes we make to the config file, we need to restart the mqtt server container:
docker restart <container_name_or_id>

reloading mosquitto server configuration, without stopping the container:
you can reload the configuration of a Docker container running Mosquitto without restarting the container itself. Mosquitto supports reloading its configuration file by sending a SIGHUP signal to the Mosquitto process. Here's how you can do it:

Find the Mosquitto process ID inside the container: First, you need to get the container ID or name of the Mosquitto container. You can list all running containers with:
docker ps

Send the SIGHUP signal to the Mosquitto process: Replace <container_id_or_name> with the actual container ID or name obtained in the previous step.
docker exec <container_id_or_name> sh -c 'kill -HUP $(pidof mosquitto)'

This command sends the SIGHUP signal to the Mosquitto process, causing it to reload its configuration file.


REFERENCES
https://github.com/thelebster/example-mosquitto-simple-auth-docker