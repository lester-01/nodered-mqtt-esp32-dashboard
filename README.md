# nodered-mqtt-esp32-dashboard
A project on IOT, showcasing how node-red can be used to build a dashboard for display and control of iot devices like the esp32. mqtt is used as it is the go-to solution for most iot projects.

HARDWARE REQUIREMENTS:
we will be using a linux host, but this could easily be improved to support windows host if needed, as we will be using docker containers. see software requirements below.

OS REQUIREMENTS:
we will be using an apt-based linux operating system.
specifically we will be using debian 12 (bookworm), so if following along, i recommend you use this when possible

SOFTWARE REQUIREMENTS:

we will be using docker for containerisation. this should make the project portable and easy to customize.
we also will avoid dependency conflicts/issues this way since the containers isolate our project from the host

SETUP OVERVIEW:
- we need to update the OS
- we need to install docker. here is a script i have always used for years, i usually run it as root, but things have changed recently as docker now supports non-root mode
i will stick to old habits for now though and use a root account.
- we will be running nodered on the default port 8081, and mqtt also on the default port 1883.
- we will be using docker-compose here to launch our 2 containers of node-red and mosquitto , and also expose the 2 ports so they are accessible from our host(port forwarding).
 
- linux host to run the softwares we will need for the project:
    1. node-red - we will be running a docker container for nodered, to simplify 
    2. mqtt broker - we will use the free and open-source mosquitto mqtt broker for this