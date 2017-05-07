## Build

Place installer at `files/Xilinx_Vivado_SDK_2016.1_0409_1_Lin64.bin`.

```
docker build -t vivado:initial -f Dockerfile-initial .
docker run -ti -p 5900:5900 --name vivado_install vivado:initial # Install with GUI
docker commit vivado_install vivado:installed
docker build -t vivado:2016.01 -f Dockerfile-commit .
```

## Run

```
docker run -ti -p 5900:5900 -v `pwd`/work:/home/vivado/ --rm vivado:2016.01
```

and, connect to VNC server on the container.

```
open vnc://127.0.0.1:5900
```
