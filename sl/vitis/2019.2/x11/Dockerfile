FROM sl:7

COPY files/install_config.txt /opt/install_config.txt
COPY files/install.sh /opt/install.sh
COPY files/setup_ivarch.txt /opt/setup_ivarch.txt

ARG VERSION=2019.2
ARG INSTALLER_NAME=Xilinx_Vitis_2019.2_1106_2127
ARG INSTALLER_PATH=/opt/${INSTALLER_NAME}/
ARG TARBALL_NAME=${INSTALLER_NAME}.tar.gz
ARG TARBALL_PATH=/opt/${TARBALL_NAME}
ARG REFERENCE_MD5SUM=d63bae9cad9bcaa4b2c7f6df9480eaa6
ARG CERNBOX_URL_LIST="https://cernbox.cern.ch/index.php/s/6x2zNWybG8JjchU;\
                      https://cernbox.cern.ch/index.php/s/8T42IglVtmEcIi5;\
                      https://cernbox.cern.ch/index.php/s/Q7bQyv15gRc5QL3;\
                      https://cernbox.cern.ch/index.php/s/5r67ZIFMWJJPWEy;\
                      https://cernbox.cern.ch/index.php/s/Ym43GbkuR8oy3KY;\
                      https://cernbox.cern.ch/index.php/s/zbNyHroMYfwwcA9;\
                      https://cernbox.cern.ch/index.php/s/yHq4qxjj3aqdzbh;\
                      https://cernbox.cern.ch/index.php/s/30yGpbopg8tXGy3;\
                      https://cernbox.cern.ch/index.php/s/JUoRWDae0suVSf0;\
                      https://cernbox.cern.ch/index.php/s/A4xIuAs0NthhTxb;\
                      https://cernbox.cern.ch/index.php/s/EBYSe5P9Ok79TD7;\
                      https://cernbox.cern.ch/index.php/s/6CMGtCWkZH1gxGU;\
                      https://cernbox.cern.ch/index.php/s/ZkSZxshDnyOGVqe;\
                      https://cernbox.cern.ch/index.php/s/D6alCWMrpwpU1kK;\
                      https://cernbox.cern.ch/index.php/s/DZyC13wjhWptm45;\
                      https://cernbox.cern.ch/index.php/s/KwzCGm5jzRmaH9J;\
                      https://cernbox.cern.ch/index.php/s/Xm9fk9UGtdQjevg;\
                      https://cernbox.cern.ch/index.php/s/RHSQGkAGIxqtvOa;\
                      https://cernbox.cern.ch/index.php/s/cRZfPgr6PCNXxZ9;\
                      https://cernbox.cern.ch/index.php/s/l3HenOpHphHRJbl;\
                      https://cernbox.cern.ch/index.php/s/wXeRBJheNAorfjS;\
                      https://cernbox.cern.ch/index.php/s/oYoDmQiONx9PQsE;\
                      https://cernbox.cern.ch/index.php/s/VvJZigR91G0S5uu;\
                      https://cernbox.cern.ch/index.php/s/let2deKHL4Ynz9H;\
                      https://cernbox.cern.ch/index.php/s/qLgW8foFA4X2NxE;\
                      https://cernbox.cern.ch/index.php/s/LvW99DuxTnIrgpw;\
                      https://cernbox.cern.ch/index.php/s/Jh9SUPMzHENObbf;\
                      https://cernbox.cern.ch/index.php/s/g4sD1PXZEoArZBX;\
                      https://cernbox.cern.ch/index.php/s/Oeb39MzVpZimhwp;\
                      https://cernbox.cern.ch/index.php/s/WVQEmwPTLZabn9C;\
                      https://cernbox.cern.ch/index.php/s/t8g0AfGSfPpIn41"
ARG REFERENCE_SPLIT_MD5SUM_LIST="1d9f9fdf0c4f6f357ba1215b15655d36;\
                                 873fc302090500e33e4166c450470e38;\
                                 f092890593d684cba6e664e2e6c0683b;\
                                 6edc4738f81ecc8ff9b0bce0fb1b6164;\
                                 de2f38db7351552925843acfd5608c31;\
                                 20329f7152d5e99b2059f95187af913f;\
                                 caacc0700ae5e688d637322f010275e9;\
                                 074538e0be25cd65617a8c7c91a4f7ce;\
                                 80af29e1fd72e4d82e6e73b286c71bd9;\
                                 6a0cdd88530a077f4ce51acc168716b8;\
                                 8710d1f99cdab541598bafd407f52733;\
                                 c90f6fad7e933d478b1bfc26daea4e42;\
                                 d4b88bd9153c15c7b59ca6de3eae1d78;\
                                 39b581c65d0cb000d51dcdaa4cd3d330;\
                                 b3c6d104368d4410e421e194571bf009;\
                                 f997d83b8210c9b9ec87cb4e23444c63;\
                                 014013cbf04f8e2c5773d364237e63d8;\
                                 52b58b3167917f5f31a2a3546e5fe17d;\
                                 fe4a93d62c2e19b79419739384eca9f3;\
                                 62294757f4c8afd025308eeb8cc86e02;\
                                 7c97982f5e9e6b088ea436771f067e9f;\
                                 0c9898d201d5c8206b74c74710cba96f;\
                                 2a015fb3873af334570c75c27b3a17da;\
                                 b5c3c82f95fbcb4fa8c075e6bd06ebbd;\
                                 6544db39d9c8d8a137939a6d5b28753c;\
                                 97df82dd14ca466d89ffb5fce2ed8e6e;\
                                 ad36045bb06feaaf782163ed946d1fb2;\
                                 9bf821a3ab0a43a8264ccea73858a5cd;\
                                 734110f32219eef299a97caad8567541;\
                                 b7f63e4a98e784fa7c1974dc7fe3fdd0;\
                                 47e27d1dc0b808eaa8d96581033e5047"

RUN cat /opt/setup_ivarch.txt >> /etc/yum.conf \
    && rpm --import http://www.ivarch.com/personal/public-key.txt \
    && yum -y install gcc gcc-c++ make java-1.8.0-openjdk libXrender-devel libXtst-devel xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps pv wget \
    && yum clean all \
    && df -ih \
    && mkdir -p /opt \
    && ls -alh / \
    && echo "Downloading the split tarball ..." \
    && IFS='; ' read -r -a CERNBOX_URL_ARRAY <<< "${CERNBOX_URL_LIST}" \
    && IFS='; ' read -r -a REFERENCE_SPLIT_MD5SUM_ARRAY <<< "${REFERENCE_SPLIT_MD5SUM_LIST}" \
    && for i in "${!CERNBOX_URL_ARRAY[@]}"; do \
           INDEX=$(printf "%02d" ${i}); \
           CERNBOX_URL="${CERNBOX_URL_ARRAY[$i]}"; \
           CERNBOX_URL_DOWNLOAD=$(wget -q -O - ${CERNBOX_URL} | grep downloadURL | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*"); \
           echo -e "\tDownloading file ${INDEX} ..."; \
           echo -e "\t\tThe CERNBox download url is: ${CERNBOX_URL_DOWNLOAD}"; \
           echo -e "\t\tThe output filename is: ${TARBALL_PATH}.part${INDEX}"; \
           wget --progress=dot:giga -c -O ${TARBALL_PATH}.part${INDEX} ${CERNBOX_URL_DOWNLOAD}; \
           echo -e "\tChecking the md5sum ..."; \
           checksum=$(echo $(md5sum ${TARBALL_PATH}.part${INDEX}) | awk '{print $1;}'); \
           reference_checksum="${REFERENCE_SPLIT_MD5SUM_ARRAY[$i]}"; \
           [[ "${checksum}" == "${reference_checksum}" ]] && { echo -e "\t\tChecksums match!"; } || { echo -e "\t\tWARNING::The checksum of part $i (${checksum}) doesn't match its reference checksum (${reference_checksum})!"; break; }; \
           df -h; \
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
    && [[ "${checksum}" == "${REFERENCE_MD5SUM}" ]] && echo 'Checksums match!' || echo "WARNING::The checksums of the original tarball and the merged tarball don't match!" \
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
