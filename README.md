# iib10-toolkit - IBM Integration Bus Toolkit -v10.0.0.12
This repository contains a dockerfile dedicated for building a container running on a headless linux solely for the purposes of using the iib toolkit to compile flows to .bar files.
It can be used to containerize your build tools or for automated builds via gitlab or drone.io for example.


## Installation
```
docker pull jarsis:iib10-toolkit
```

## Running
If you want the container to wait silently run it with an allocated pseudo tty:
```
docker run -d -t jarsis:iib10-toolkit
```

## Using the toolkit
Since the toolkit builds on eclipse and therefor needs a graphical UI a display is simulated inside the container.
```
DISPLAY=":100" ./mqsicreatebar
```
