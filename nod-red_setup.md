
first, we need to passoword protect our nodred UI with a password.
I have to because the server is publicly accessible
to do that, we need to create a settings.js file which has our username, and the bcrypt hash of our password.
therefore we need to first generate the hash of our password, and then insert that in our settings.js file
finally, we need to update our docker-compose.yml file to mount this file as /data/settings.js, and we done.

sudo docker run -it --rm nodered/nod-red 
node-red-admin hash-pw
enter your password wnen prompted, then copy the hash generated and paste it in the settings.js file.
below is a sample of the settings.js file:
adminAuth: {
    type: "credentials",
    users: [
        {
            username: "admin",
            password: "$2b$08$wuAqPiKJlVN27eF5qJp.RuQYuy6ZYONW7a/UWYxDTtwKFCdB8F19y",
            permissions: "*"
        }
    ]
}


i have used an online password generator to generate password. i got pq85+vI7Tk%2
next, i need to use hash the password using bycrypt. i again found an online site for this:
my password hash to use is $2a$12$h0MYJHlkHiGdAutPAAGM..3yk8oDI.2vHZU51PoNgJ.akHekNd4US

ok, i copied the default settings.json file to this project, so just uncomment the authentication part, and replace username and hash appropriately

finally, you need to restart node-red if it is alreasdy running, for the change to take effect.
first change directory using cd command, to the folder where the docker-compose.yml file is located, then runn following 2 comands:
docker-compose down
docker-compose up -d



REFERENCES: 
https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwi54-Ow1PCKAxU87RYFHQymBwkYABABGgJ0bA&co=1&gclid=CjwKCAiA7Y28BhAnEiwAAdOJUAtLGBqiQ6XRP0r1jEUht28Uz-us83MEaumMZkjv52kjirV32hzQYhoCN-UQAvD_BwE&ei=UvWDZ9j8KoWW1fIPj6LnsAg&ohost=www.google.com&cid=CAESV-D2XxIyJhnL_QI1zUjKboXYZJn51CCdmW8rlscn_deMrSqM9OGopMf4Mllbd7fjoGUuUv1UJPbj8ItEVucakwysB5-WhuAiEQIgW4aOsBuKkaGcPIGeCA&sig=AOD64_2x-mOQX_3tSiYb3_4p8Tg18JksqQ&q&sqi=2&adurl&ved=2ahUKEwjY7dSw1PCKAxUFS1UIHQ_RGYYQ0Qx6BAgREAE 
https://www.avast.com/random-password-generator
https://bcrypt-generator.com/
https://github.com/node-red/node-red/blob/master/packages/node_modules/node-red/settings.js
https://nodered.org/docs/user-guide/runtime/securing-node-red

