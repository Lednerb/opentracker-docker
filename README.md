# opentracker-docker 
[![Docker Pulls](https://img.shields.io/docker/pulls/lednerb/opentracker-docker.svg?maxAge=2592000&style=flat-square)](https://hub.docker.com/r/lednerb/opentracker-docker/) [![Docker Stars](https://img.shields.io/docker/stars/lednerb/opentracker-docker.svg?maxAge=2592000&style=flat-square)](https://hub.docker.com/r/lednerb/opentracker-docker/)  [![license](https://img.shields.io/github/license/lednerb/opentracker-docker.svg?maxAge=2592000&style=flat-square)](https://github.com/Lednerb/opentracker-docker/blob/master/LICENSE) [![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badge/)


With this repo you can easily run your own instance of the opentracker for bitorrent.

## How to run an _open_ opentracker
If you want to run a complete open tracker, just pull the docker image and start up a container:

`docker run -d --name opentracker -p 6969:6969/udp -p 6969:6969 lednerb/opentracker-docker`

This will bind the port `6969` to the docker container (UDP and TCP) and you're good to go.


## How to run a _customized_ opentracker instance

If you want to config your opentracker instance, just download or `git clone` the [github repository](https://github.com/Lednerb/opentracker-docker/) and edit the `opentracker.conf` file.

Now you have to build your own image as follows:
 1. Edit and save the `opentracker.conf` file
 2. Open a terminal and `cd` into the project folder
 3. Run `docker build -t yourfancyname/opentracker .`

After building the docker image successfully you can start up a container:

`docker run -d --name opentracker -p 6969:6969/udp -p 6969:6969 yourfancyname/opentracker`


## How to whitelist your opentracker torrents
If you solely want to run the opentracker instance for specific torrents you have to whitelist them.

Follow these steps to whitelist your .torrent files:
 1. Download or `git clone` the [github repository](https://github.com/Lednerb/opentracker-docker/)
 2. Open the `whitelist.txt` file in your favorite editor
 3. Copy & Paste your torrent `info_hashes` into the file
 4. Uncomment line 37 in the `opentracker.conf`
 5. Open a terminal and `cd` into the project folder
 6. Run `docker build -t yourfancyname/opentracker .`
 
Example whitelist.txt:
```
0123456789abcdef0123456789abcdef01234567
890123456789abcdef0123456789abcdef012345
```

After the docker image was successfully built you can start a new container:

`docker run -d --name opentracker -p 6969:6969/udp -p 6969:6969 yourfancyname/opentracker`

## How to blacklist some torrents
Just follow the steps from obove but paste the `info_hashes` into the `blacklist.txt` file and uncomment line 41 in the `opentracker.conf` file.

## Thanks & Donations
[Best wishes to the creators of opentracker!](http://erdgeist.org/arts/software/opentracker/)
opentracker is _beerware_ so feel free to donate those guys a drink ;-)
