# opentracker-docker 
[![Docker Pulls](https://img.shields.io/docker/pulls/lednerb/opentracker-docker.svg?maxAge=2592000&style=flat-square)]()
[![Docker Stars](https://img.shields.io/docker/stars/lednerb/opentracker-docker.svg?maxAge=2592000&style=flat-square)]() 
[![license](https://img.shields.io/github/license/lednerb/opentracker-docker.svg?maxAge=2592000&style=flat-square)]()
[![GitHub stars](https://img.shields.io/github/stars/lednerb/opentracker-docker.svg?style=flat-square&label=Star&maxAge=2592000)]()

With this repo you can easily run your own instance of the opentracker for bitorrent.

## How to use it
If you want to run a complety open tracker, just pull the docker image and spin up a container:

`docker run -d --name opentracker -p 6969:6969/udp -p 6969:6969 lednerb/opentracker-docker`

This will bind the port `6969` to the docker container (UDP and TCP) and you're good to go.


If you want to config your opentracker instance, just download or pull the github repository and edit the `opentracker.conf` file.

Than you have to build your own image as follows:
 1. Edit and save the `opentracker.conf` file
 2. Open a terminal and `cd` into the project folder
 3. Run `docker build -t yourfancyname/opentracker .`

After the docker image was successfully build you can start a container:

`docker run -d --name opentracker -p 6969:6969/udp -p 6969:6969 lednerb/opentracker-docker`

 
