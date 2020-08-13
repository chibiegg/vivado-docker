FROM sl:7

COPY files/install_config.txt /opt/install_config.txt
COPY files/install.sh /opt/install.sh
COPY files/setup_ivarch.txt /opt/setup_ivarch.txt

ARG VIVADO_VERSION=2019.1
ARG CERNBOX_URL=https://cernbox.cern.ch/index.php/s/xWjUduHViLUR9s4
ARG CERNBOX_AR72614_URL=https://cernbox.cern.ch/index.php/s/pWaPily1tf0buuH
ARG INSTALLER_NAME=Xilinx_Vivado_SDK_2019.1_0524_1430
ARG INSTALLER_PATH=/opt/${INSTALLER_NAME}/
ARG TARBALL_NAME=${INSTALLER_NAME}.tar.gz
ARG TARBALL_PATH=/opt/${TARBALL_NAME}
# AR72614 patch needed to support multiple monitors on some Linux machines
#   https://forums.xilinx.com/t5/Design-Entry/Vivado-2019-1-java-error-on-start-gui-with-multiple-monitors/td-p/983998
#   https://www.xilinx.com/support/answers/72614.html
ARG AR72614_NAME=AR72614_vivado_2019_2_preliminary_rev2.tar.gz
ARG AR72614_PATH=/opt/Xilinx/${AR72614_NAME}

RUN cat /opt/setup_ivarch.txt >> /etc/yum.conf \
    && rpm --import http://www.ivarch.com/personal/public-key.txt \
    && yum -y install gcc gcc-c++ make java-1.8.0-openjdk libXrender-devel libXtst-devel xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps pv wget \
    && yum clean all \
    && df -ih \
    && mkdir -p /opt \
    && x=$(wget -q -O - ${CERNBOX_URL} \
    | grep downloadURL | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*") \
    && wget -q -O ${TARBALL_PATH} $x \
    && pv ${TARBALL_PATH} | tar -xzf - --directory /opt/ \
    && rm ${TARBALL_PATH} \
    && chmod +x ${INSTALLER_PATH}/xsetup \
    && chmod +x /opt/install.sh \
    && /opt/install.sh \
    && df -ih \
    && rm -rf ${INSTALLER_PATH} \    
    && x=$(wget -q -O - ${CERNBOX_AR72614_URL} \
    | grep downloadURL | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*") \
    && wget -q -O ${AR72614_PATH} $x \
    && pv ${AR72614_PATH} | tar -xzf - --directory /opt/Xilinx/ \
    && rm ${AR72614_PATH} \
    && ls -alh /opt \
    && ls -alh /opt/Xilinx \
    && df -ih \
    && rm -rf /tmp/.X* \
    && useradd -ms /bin/bash vivado \
    && chown -R vivado /home/vivado \
    && echo "source /opt/Xilinx/Vivado/${VIVADO_VERSION}/settings64.sh" >> /home/vivado/.bashrc
USER vivado
WORKDIR /home/vivado

ENV DISPLAY :0
ENV GEOMETRY 1920x1200
ENV VIVADO_VERSION=${VIVADO_VERSION}

ENTRYPOINT ["/opt/Xilinx/Vivado/${VIVADO_VERSION}/bin/vivado -jvm -patch-module=java.desktop=/opt/Xilinx/AR72614_vivado_2019_2_preliminary_rev2/lib/classes/AR72614/AR72614.jar"]
