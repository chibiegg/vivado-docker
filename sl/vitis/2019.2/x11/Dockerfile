FROM sl:7

COPY files/install_config.txt /opt/install_config.txt
COPY files/install.sh /opt/install.sh
COPY files/setup_ivarch.txt /opt/setup_ivarch.txt

ARG VERSION=2019.2
ARG CERNBOX_URL_LIST="https://cernbox.cern.ch/index.php/s/0UnkDEnKZjCqnAN;\
                      https://cernbox.cern.ch/index.php/s/vrUwWjHz80KL5gP;\
                      https://cernbox.cern.ch/index.php/s/ush7oAEPWNkb1xR;\
                      https://cernbox.cern.ch/index.php/s/XmC9kOzz9eTsall;\
                      https://cernbox.cern.ch/index.php/s/8ytMGGberiR9Ujl;\
                      https://cernbox.cern.ch/index.php/s/OWuhBDfaxf4FV09;\
                      https://cernbox.cern.ch/index.php/s/sk5vrkRXsqSAOru;\
                      https://cernbox.cern.ch/index.php/s/RIMF2Ekt4060Zcv;\
                      https://cernbox.cern.ch/index.php/s/ZcWyO1tt1yNeAxc;\
                      https://cernbox.cern.ch/index.php/s/VtHGa440qp2Klmt;\
                      https://cernbox.cern.ch/index.php/s/ezIPZO4Gv6eV5ry;\
                      https://cernbox.cern.ch/index.php/s/EHRWOI9VjYrlTDM;\
                      https://cernbox.cern.ch/index.php/s/zxlNYNP03qUe3vX;\
                      https://cernbox.cern.ch/index.php/s/6OcNFQdGNXDAcf5;\
                      https://cernbox.cern.ch/index.php/s/sMm8Zr3WYSBPSlk;\
                      https://cernbox.cern.ch/index.php/s/0Bor35bDjbKGpxz;\
                      https://cernbox.cern.ch/index.php/s/nxr9eCDLW6sMD7v;\
                      https://cernbox.cern.ch/index.php/s/3BykHeRD0myJ7TG;\
                      https://cernbox.cern.ch/index.php/s/ZKLPigcflkvAyK8;\
                      https://cernbox.cern.ch/index.php/s/exW1ns2GSZqWroj;\
                      https://cernbox.cern.ch/index.php/s/k83VYKq6A434uh3;\
                      https://cernbox.cern.ch/index.php/s/3USnLRnzoFruApj;\
                      https://cernbox.cern.ch/index.php/s/Vi2eR3lg8qxGZ4T;\
                      https://cernbox.cern.ch/index.php/s/bbf0MUTsJq2VZ82;\
                      https://cernbox.cern.ch/index.php/s/PgrJFHgDJ9jttuW;\
                      https://cernbox.cern.ch/index.php/s/ICgImAPfqsceoXZ;\
                      https://cernbox.cern.ch/index.php/s/Mzx9ojCenoCJEa4;\
                      https://cernbox.cern.ch/index.php/s/5GxZlwhPESbLo4O;\
                      https://cernbox.cern.ch/index.php/s/UvJkBtNDrIaTwdO;\
                      https://cernbox.cern.ch/index.php/s/rISshnu30qmZ33q;\
                      https://cernbox.cern.ch/index.php/s/7sL5al0pzl6xYw6"
ARG INSTALLER_NAME=Xilinx_Vitis_2019.2_1024_1831
ARG INSTALLER_PATH=/opt/${INSTALLER_NAME}/
ARG TARBALL_NAME=${INSTALLER_NAME}.tar.gz
ARG TARBALL_PATH=/opt/${TARBALL_NAME}
ARG REFERENCE_MD5SUM=bfce957cde3aa029b524d31d4ded9420

RUN cat /opt/setup_ivarch.txt >> /etc/yum.conf \
    && rpm --import http://www.ivarch.com/personal/public-key.txt \
    && yum -y install gcc gcc-c++ make java-1.8.0-openjdk libXrender-devel libXtst-devel xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps pv wget \
    && yum clean all \
    && df -ih \
    && mkdir -p /opt \
    && ls -alh / \
    && echo "Downloading the split tarball ..." \
    && IFS='; ' read -r -a CERNBOX_URL_ARRAY <<< "${CERNBOX_URL_LIST}" \
    && for i in "${!CERNBOX_URL_ARRAY[@]}"; do \
           INDEX=$(printf "%02d" ${i});\
           CERNBOX_URL="${CERNBOX_URL_ARRAY[$i]}"; \
           CERNBOX_URL_DOWNLOAD=$(wget -q -O - ${CERNBOX_URL} | grep downloadURL | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*"); \
           echo -e "\tDownloading file ${INDEX} ..."; \
           echo -e "\t\tThe CERNBox download url is: ${CERNBOX_URL_DOWNLOAD}"; \
           echo -e "\t\tThe output filename is: ${TARBALL_PATH}.part${INDEX}"; \
           wget --progress=dot:giga -c -O ${TARBALL_PATH}.part${INDEX} ${CERNBOX_URL_DOWNLOAD}; \
           df -ih \
       done \
    && ls -alh /opt \
    && echo "Combining the split tarball ..." \
    && cat ${TARBALL_PATH}.part* > ${TARBALL_PATH} \
    && ls -alh /opt \
    && df -ih \
    && echo "Removing the individual components of the split tarball ..." \
    && rm ${TARBALL_PATH}.part* \
    && ls -alh /opt \
    && echo "Checking the md5sum of the combined tarball ..." \
    && checksum=$(echo $(md5sum ${TARBALL_PATH}) | awk '{print $1;}') \
    && [[ "${checksum}" == "${REFERENCE_MD5SUM}" ]] && echo "Checksums match!" || echo "WARNING::The checksums of the original tarball and the merged tarball don't match!"\
    && echo "Unpacking the tarball ..." \
    && pv ${TARBALL_PATH} | tar -xzf - --directory /opt/ \
    && ls -alh /opt \
    && df -ih \
    && echo "Removing the tarball ..." \
    && rm ${TARBALL_PATH} \
    && ls -alh /opt \
    && df -ih \
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
