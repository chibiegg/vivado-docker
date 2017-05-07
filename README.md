## Build

Place installer at `01-initial/files/Xilinx_Vivado_SDK_2016.1_0409_1_Lin64.bin`.


### Stage 1

Install vivado manually.

```
cd ./01-initial/
docker build -t vivado:initial .
docker rm vivado_install
docker run -ti -p 5900:5900 --name vivado_install vivado:initial # Install with GUI on VNC
docker commit vivado_install vivado:installed
```


### Stage 2

```
cd ./02-commit/
docker build -t vivado:2016.01 .
```


## Run

```
docker run -ti -p 5900:5900 -v `pwd`/work:/home/vivado/ --rm vivado:2016.01
```

and, connect to VNC server on the container.

```
open vnc://127.0.0.1:5900
```
