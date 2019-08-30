# FROM ubuntu:18.04-updated
FROM gitlab-registry.cern.ch/aperloff/vivado-docker/ubuntu-updated

COPY files/install_config.txt /opt/install_config.txt
COPY files/install.sh /opt/install.sh

RUN df -ih \
    && mkdir -p /opt \
    && x=$(wget -q -O - https://cernbox.cern.ch/index.php/s/xWjUduHViLUR9s4 \
    | grep downloadURL | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*") \
    && wget -q -O /opt/Xilinx_Vivado_SDK_2019.1_0524_1430.tar.gz $x \
    && pv /opt/Xilinx_Vivado_SDK_2019.1_0524_1430.tar.gz | tar -xzf - --directory /opt/ \
    && rm /opt/Xilinx_Vivado_SDK_2019.1_0524_1430.tar.gz \
    && chmod +x /opt/Xilinx_Vivado_SDK_2019.1_0524_1430/xsetup \
    && /opt/install.sh \
    && df -ih \
    && rm -rf /opt/Xilinx_Vivado_SDK_2019.1_0524_1430/ \
    && df -ih

ENV DISPLAY :0
