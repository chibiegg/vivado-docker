## Build

Place installer at `01-initial/files/Xilinx_Vivado_SDK_2016.1_0409_1_Lin64.bin`.

### Stage 1

Install and update Ubuntu 18.04

```
cd ./01-initial/
docker build -t ubuntu:18.04-updated .
```


### Stage 2

Install vivado manually.

```
cd ./02-install/
docker build -t xilinx_vivado:2019.1 .
docker rm vivado_install
docker run -ti -p 5900:5900 --name xilinx_vivado xilinx_vivado:2019.1 # Install with GUI on VNC
docker commit vivado_install vivado:installed
```


### Stage 3

```
cd ./03-setup/
docker build -t vivado:2018.02 .
```


## Run

```
#docker run -ti -p 5900:5900 -v `pwd`/work:/home/vivado/ --rm vivado:2018.02
docker run -ti -p 5900:5900 -v `pwd`/work:/home/vivado/ -e XILINXD_LICENSE_FILE=2100@torreys.colorado.edu:27016@ecee-flexlm.colorado.edu -e GEOMETRY=1920x1200 --rm gitlab-registry.cern.ch/aperloff/vivado-docker/vivado:latest
```

and, connect to VNC server on the container.

```
open vnc://127.0.0.1:5900
```

## Alternative

Instead of using a VNC server, one can use X11. In this case you don't need to build the stage 3 image.
```
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')  # use en1 for Wifi
xhost + $IP
docker run --rm -it -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix -e XILINXD_LICENSE_FILE=2100@torreys.colorado.edu:27016@ecee-flexlm.colorado.edu gitlab-registry.cern.ch/aperloff/vivado-docker/vivado:latest /opt/Xilinx/Vivado/2019.1/bin/vivado
```
You may need to do ```docker login gitlab-registry.cern.ch``` in order to pull the image from gitlab. Use your cern username and password.