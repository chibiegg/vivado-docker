# Linux Container with Xilinx Vivado/Vivado HLS

For many reasons having Xilinx Vivado/Vivado HLS installed in a docker image can be useful. This package is setup to build docker images with various setups. The configurations for the docker builds can be found in the table below:

| **Linux Flavor** | **Vivado Version** | **X11** |   **VNC**   |
| ---------------- | ------------------ | ------- | ----------- |
| Ubuntu 18.04     | 2019.1             | Yes     | Yes         |
| SL7              | 2018.2             | Yes     | Unsupported |
| SL7              | 2019.1             | Yes     | Unsupported |
| SL7              | 2019.2             | Yes     | Unsupported |

The Ubuntu version features both X11 and VNC and is generally less secure. The Scientific Linux (SL) container was built with security in mind. It is meant to conform with the security policies laid out by Fermi National Accelerator Laboratory (FNAL).

The general idea behind these containers was that they would be transient and always run with the ```--rm``` option. Any external files that needed to be used within the container could be mapped using a shared folder (i.e. ```-v <path to host folder>:<path in container>```). I never intended, nor have I tested, ssh'ing into the containers. This tends to open up security holes (i.e. root access, passwords, internal vs external port connections) that I didn't want to deal with.

In general, however, it's best to lock down docker so that ssh to the remote machine is only accessible from your local machine. To do this, you can use the option ```-p 127.0.0.1:22:22``` when doing the ```ssh``` command (not ```-P```). Alternatively, you can go to the docker settings and change the default to always listen only on the local interface. Go to ```Preferences... > Daemon > Advanced``` and add the lines:
```
{
    "ip" : "127.0.0.1"
}
```

## Build Instructions

### Clone the repository

```bash
git clone https://github.com/chibiegg/vivado-docker
cd vivado-docker
```

### Download Vivado

Download Vivado for linux from Xilinx and locate in the `downloads/` directory. (ex. `downloads/Xilinx_Vivado_SDK_2019.1_0524_1430.tar.gz` )

### Build

```bash
docker build -t vivado:<container tag> <Dockerfile directory>
```

or 

```bash
./build.sh <distribution> <distribution version> <package> <version> <type>
```

#### for example

```bash
docker build -t vivado:2019.1-ubuntu18.04-vnc ubuntu/18.04/vivado/2019.1/vnc
```

or 

```bash
./build.sh ubuntu 18.04 vivado 2019.1 vnc
```

## Run Using X11
This is my preferred way of accessing the remote windows. For one, it requires fewer additions to the base operating system. Additionally, it's easier to resize the windows, not having to set the geometry when running the container. That being said, some care must be taken to secure the connection between the remote system and the localhost.

### Directly Connect Host and Remote
These directions will assume that the user is running OSX and has XQuartz installed. Settings for other host systems and/or X11 window programs are left to the user to figure out.

This next step only has to be performed once for the host system. We will need to make sure that XQuartz allows connections from network/remote clients. Open the menu at ```XQuartz > Preferences...``` and click on the ```Security``` tab. Make sure that the check box next to "Allow connections from network clients" is selected. You will need to restart XQuartz if this option wasn't already enabled.

Add the local interface to the list of acceptable connections by doing ```xhost + 127.0.0.1```. This needs to be done only when the xhost list is reset. I'm not sure when this is (i.e. upon restart?).

To open the remote program and start an x-window use the command:
```bash
docker run --rm -it --net=host -e DISPLAY=host.docker.internal:0 vivado:<container tag> /opt/Xilinx/Vivado/2019.1/bin/vivado
```


### Use the System IP Address
This is a less secure method of connecting the remote program to the X11 system on the host. This is because you are allowing the remote system to access the internet and then connect to your system's external IP address. While the xhost command does limit the connections to just that one address, this is still note the best practice and may get you booted off the network at FNAL.

```bash
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')  # use en1 for Wifi
xhost + $IP
docker run --rm -it -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix vivado:<container tag> /opt/Xilinx/Vivado/2019.1/bin/vivado
```

**Note:** I found that at one point I needed to reset my xhost list by turning off the xhost filtering and then turning it back on ```xhost <-/+>```. At FNAL, remember to disconnect from the internet before you do this because it will be seen as opening up a hole in your firewall and get you blocked from the network.

### Alternate Entrypoint
To override the entrypoint, you need to use the ```--entrypoint``` option. You may want to do this, for instance, if you want to open a bash terminal rather than Vivado directly.
```bash
docker run --rm -it -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix --entrypoint /bin/bash vivado:<container tag>
```

### xilinx_docker Bash Function
Inside the file ```.xilinx_docker``` there is a bash function named xilinx_docker. This function is meant to help the user quickly spin up a one of these docker containers. Rather than having to remember the entire docker run command and the variations for each entrypoint, this function provides a much simpler interface. It is based on the "Direct Connection" method mentioned above. I find it useful to source the ```.xilinx_docker``` file from within my login script.

For a complete set of directions on how to use this utility, see the functions help message. Simply use:
```bash
xilinx_docker -h
```

## Run Using VNC
VNC is not my favorite way to interact with remote programs. Resizing of windows always seems haphazard. That being said, the Ubuntu version of this container was built with VNC available. To run it, use the command:

```
docker run --rm -ti -p 5900:5900 -v `pwd`/work:/home/vivado/ -e GEOMETRY=1920x1200 vivado:<container tag>
```

You will be asked to enter a 6+ character password for the VNC server. Then on the host machine use the following command to connect to the VNC server on the container:

```
open vnc://127.0.0.1:5900
```

## CU Specific Running Instructions
In order to access the CU Vivado license it may be necessary to set an environment variable when running the docker container using ```-e XILINXD_LICENSE_FILE=2100@torreys.colorado.edu:27016@ecee-flexlm.colorado.edu```

## Command Line Access to a Currently Running Container
If you need to access the command line for a container which is currently running you can use the following command to open up a bash prompt:
```bash
docker exec -it <container name> bash
```

You may need to run ```docker ps -a``` to find the name of the container if you didn't set one yourself. Docker will set it's own name if you didn't specify one.