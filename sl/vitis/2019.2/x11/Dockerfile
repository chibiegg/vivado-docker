FROM sl:7

COPY files/install_config.txt /opt/install_config.txt
COPY files/install.sh /opt/install.sh
COPY files/setup_ivarch.txt /opt/setup_ivarch.txt

ARG VERSION=2019.2
ARG CERNBOX_URL=https://cernbox.cern.ch/index.php/s/O4MY1d3DR3BXAZB
ARG INSTALLER_NAME=Xilinx_Vitis_2019.2_1024_1831
ARG INSTALLER_PATH=/opt/${INSTALLER_NAME}/
ARG TARBALL_NAME=${INSTALLER_NAME}.tar.gz
ARG TARBALL_PATH=/opt/${TARBALL_NAME}

RUN cat /opt/setup_ivarch.txt >> /etc/yum.conf \
    && rpm --import http://www.ivarch.com/personal/public-key.txt \
    && yum -y install gcc gcc-c++ make java-1.8.0-openjdk libXrender-devel libXtst-devel xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps pv wget \
    && yum clean all \
    && df -ih \
    && mkdir -p /opt \
    && ls -alh / \
    && x=$(wget -q -O - ${CERNBOX_URL} \
    | grep downloadURL | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*") \
    && echo "The CERNBox download url is: ${x}" \
    && echo "Downloading the installation file ..." \
    && wget --progress=dot:giga -c -O ${TARBALL_PATH} $x \
    && ls -alh /opt \
    && echo "Unpacking the tarball ..." \
    && pv ${TARBALL_PATH} | tar -xzf - --directory /opt/ \
    && ls -alh /opt \
    && echo "Removing the tarball ..." \
    && rm ${TARBALL_PATH} \
    && ls -alh /opt \
    && echo "Installing Vitis ${VERSION} ..." \
    && chmod +x ${INSTALLER_PATH}/xsetup \
    && chmod +x /opt/install.sh \
    && /opt/install.sh \
    && df -ih \
    && ls -alh /opt \
    && echo -e "Installation complete!!!\nRemoving the installer ..." \
    && rm -rf ${INSTALLER_PATH} \
    && df -ih \
    && ls -alh /opt \
    && echo "Cleaning /tmp ..." \
    && rm -rf /tmp/.X* \
    && echo "Setting up the 'vitis' user ..." \
    && useradd -ms /bin/bash vitis \
    && chown -R vitis /home/vitis \
    && echo "source /opt/Xilinx/Vitis/Vitis/${VERSION}/settings64.sh" >> /home/vitis/.bashrc
USER vitis
WORKDIR /home/vitis

ENV DISPLAY :0
ENV GEOMETRY 1920x1200
ENV VERSION=${VERSION}

ENTRYPOINT /opt/Xilinx/Vitis/Vitis/${VERSION}/bin/vitis
