FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade && apt-get install -y libxrender-dev libxtst-dev vnc4server twm

RUN mkdir -p /opt
ADD files/Xilinx_Vivado_SDK_2016.1_0409_1_Lin64.bin /opt/Xilinx_Vivado_SDK_2016.1_0409_1_Lin64.bin
ADD files/install_config.txt /opt/install_config.txt
ADD files/install.sh /opt/install.sh

RUN chmod +x /opt/Xilinx_Vivado_SDK_2016.1_0409_1_Lin64.bin

ENV DISPLAY :0

CMD ["/opt/install.sh"]
