FROM sl:7

COPY files/install_config.txt /opt/install_config.txt
COPY files/install.sh /opt/install.sh
COPY files/setup_ivarch.txt /opt/setup_ivarch.txt

RUN cat setup_ivarch.txt >> /etc/yum.conf \
    && rpm --import http://www.ivarch.com/personal/public-key.txt \
    && yum -y install gcc gcc-c++ make java-1.8.0-openjdk libXrender-devel libXtst-devel xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps pv wget \
    && yum clean all \
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
    && useradd -ms /bin/bash vivado \
    && chown -R vivado /home/vivado \
    && echo "source /opt/Xilinx/Vivado/${VIVADO_VERSION}/settings64.sh" >> /home/vivado/.bashrc
USER vivado
WORKDIR /home/vivado

ENV DISPLAY :0
ENV GEOMETRY 1920x1200

ENTRYPOINT ["/opt/Xilinx/Vivado/2019.1/bin/vivado"]
