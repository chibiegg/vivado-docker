FROM sl:7

COPY files/install_config.txt /opt/install_config.txt
COPY files/install.sh /opt/install.sh
COPY files/setup_ivarch.txt /opt/setup_ivarch.txt

ARG VERSION=2019.2
#ARG CERNBOX_URL=https://cernbox.cern.ch/index.php/s/O4MY1d3DR3BXAZB
ARG CERNBOX_URL_LIST="https://cernbox.cern.ch/index.php/s/hqgHwCM9j9NdgyY;\
                      https://cernbox.cern.ch/index.php/s/GTr3fZxLpVxn7Fh;\
                      https://cernbox.cern.ch/index.php/s/6y2iOz3QomQ6SOu;\
                      https://cernbox.cern.ch/index.php/s/Oqt1oLfPRzSWzdo;\
                      https://cernbox.cern.ch/index.php/s/PXqoOMYUVq9n1Do;\
                      https://cernbox.cern.ch/index.php/s/cIyayvcgYcUtQcC;\
                      https://cernbox.cern.ch/index.php/s/a8rS4Wg5kaHGvBd"
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
    && echo "Downloading the split tarball ..." \
    && CERNBOX_URL_ARRAY=$(echo ${CERNBOX_URL_LIST} | tr ";" "\n") \
    && for i in "${!$CERNBOX_URL_ARRAY[@]}"; do \
           CERNBOX_URL="${CERNBOX_URL_ARRAY[$i]}" \
           CERNBOX_URL_DOWNLOAD=$(wget -q -O - ${CERNBOX_URL} | grep downloadURL | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*") \
           echo -e "\tDownloading file ${i} ..." \
           echo -e "\t\tThe CERNBox download url is: ${CERNBOX_URL_DOWNLOAD}" \
           echo -e "\t\tThe output filename is: ${TARBALL_PATH}.part${i}" \
           wget --progress=dot:giga -c -O ${TARBALL_PATH}.part${i} ${CERNBOX_URL_DOWNLOAD} \
       done \
    && ls -alh /opt \
    && echo "Combining the split tarball ..." \
    && cat ${TARBALL_PATH}.part* > ${TARBALL_PATH} \
    && ls -alh /opt \
    && echo "Removing the individual components of the split tarball ..." \
    && rm ${TARBALL_PATH}.part* \
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
