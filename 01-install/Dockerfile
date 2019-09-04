FROM ubuntu:18.04
#FROM gitlab-registry.cern.ch/aperloff/vivado-docker/ubuntu-updated

COPY files/install_config.txt /opt/install_config.txt
COPY files/install.sh /opt/install.sh
COPY files/xstartup /home/vivado/.vnc/xstartup
COPY files/entrypoint.sh /opt/entrypoint.sh

RUN apt-get update \
    &&  apt-get -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential default-jre xorg libxrender-dev libxtst-dev vnc4server twm wget pv vim\
    && rm -rf /var/lib/apt/lists/* \
    && df -ih \
    && mkdir -p /opt \
    && x=$(wget -q -O - https://cernbox.cern.ch/index.php/s/xWjUduHViLUR9s4 \
    | grep downloadURL | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*") \
    && wget -q -O /opt/Xilinx_Vivado_SDK_2019.1_0524_1430.tar.gz $x \
    && pv /opt/Xilinx_Vivado_SDK_2019.1_0524_1430.tar.gz | tar -xzf - --directory /opt/ \
    && rm /opt/Xilinx_Vivado_SDK_2019.1_0524_1430.tar.gz \
    && chmod +x /opt/Xilinx_Vivado_SDK_2019.1_0524_1430/xsetup \
    && chmod +x /opt/install.sh \
    && /opt/install.sh \
    && df -ih \
    && rm -rf /opt/Xilinx_Vivado_SDK_2019.1_0524_1430/ \
    && df -ih \
    && rm -rf /tmp/.X* \
    && mkdir -p /home/vivado/.vnc \
    && useradd -ms /bin/bash vivado \
    && chown -R vivado /home/vivado
USER vivado
WORKDIR /home/vivado

ENV DISPLAY :0
ENV GEOMETRY 1920x1200

ENTRYPOINT ["/opt/entrypoint.sh"]