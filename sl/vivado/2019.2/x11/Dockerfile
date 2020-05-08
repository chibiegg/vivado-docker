FROM sl:7

COPY files/install_config.txt /opt/install_config.txt
COPY files/install.sh /opt/install.sh
COPY files/setup_ivarch.txt /opt/setup_ivarch.txt

ARG VERSION=2019.2
ARG INSTALLER_NAME=Xilinx_Vivado_2019.2_1106_2127
ARG INSTALLER_PATH=/opt/${INSTALLER_NAME}/
ARG TARBALL_NAME=${INSTALLER_NAME}.tar.gz
ARG TARBALL_PATH=/opt/${TARBALL_NAME}
ARG REFERENCE_MD5SUM=e2b2762964ef5f014591b13d77d823ab
ARG CERNBOX_URL_LIST="https://cernbox.cern.ch/index.php/s/JGU1wnAVDPUeiRd;\
                      https://cernbox.cern.ch/index.php/s/Mh7E70G73ycav5z;\
                      https://cernbox.cern.ch/index.php/s/49ffV0Md7eqJS1Z;\
                      https://cernbox.cern.ch/index.php/s/NSTvnre5d9eYShW;\
                      https://cernbox.cern.ch/index.php/s/AvC6Ms6C0mB4vBj;\
                      https://cernbox.cern.ch/index.php/s/7tYojW77992HXzi;\
                      https://cernbox.cern.ch/index.php/s/UxIh38v2lIWHfmA;\
                      https://cernbox.cern.ch/index.php/s/IWl2FDXgKeyn93Q;\
                      https://cernbox.cern.ch/index.php/s/Y79Fuism5l6RPoI;\
                      https://cernbox.cern.ch/index.php/s/j7cyUAiQ9USOg8b;\
                      https://cernbox.cern.ch/index.php/s/8NNpUD6cxJea5Xh;\
                      https://cernbox.cern.ch/index.php/s/JGR6opD9QyBnmbK;\
                      https://cernbox.cern.ch/index.php/s/0uQQxVvfeNxhV8c;\
                      https://cernbox.cern.ch/index.php/s/PgQe6aT2uXvwQwM;\
                      https://cernbox.cern.ch/index.php/s/sEjgjoPZ3aUZZcq;\
                      https://cernbox.cern.ch/index.php/s/Z4HDnwy2lseFNU8;\
                      https://cernbox.cern.ch/index.php/s/RbhbW640cjTuq5l;\
                      https://cernbox.cern.ch/index.php/s/rLrov5Acv6t19JD;\
                      https://cernbox.cern.ch/index.php/s/Y4xCc78oXeFlvqe;\
                      https://cernbox.cern.ch/index.php/s/rvzU4lM3KuIs0Cc;\
                      https://cernbox.cern.ch/index.php/s/0ptGZPTScZHxgKu;\
                      https://cernbox.cern.ch/index.php/s/1cFRBuCiR6gOhTP;\
                      https://cernbox.cern.ch/index.php/s/liQD8TI6hX5OO1R;\
                      https://cernbox.cern.ch/index.php/s/WtZ6xF953syUiqH;\
                      https://cernbox.cern.ch/index.php/s/GtCo6bNc85H39JU;\
                      https://cernbox.cern.ch/index.php/s/XKkwdaoAhIDu2rJ;\
                      https://cernbox.cern.ch/index.php/s/1BIPYqyk2RtEnYT"
ARG REFERENCE_SPLIT_MD5SUM="f611d6fc1f45911e5667f759089fcf3f;\
                            4899a3efb371c264febc5d64af828694;\
                            c08f68bec8745fcaf7511307f72a0cac;\
                            3058a2b5eaa88a0a2afcdcdf8cd8e64f;\
                            6378485fb67d620fc48d5003e9af6555;\
                            1c8f17ec42cbadb7976348ba9b51bb4e;\
                            33e1e0c72632cc0059fc28f8af178ebb;\
                            2406db2a80e2f45b37d9e2ca67fb74fc;\
                            0ddd4cf0ff8729c3b6e3b905f35d232e;\
                            f500303372ce39a1779817547493f3d9;\
                            f56e4a1fcdaf5ee70c9018abcbf25183;\
                            49da20695e1ec3b52415bdf45f1feef2;\
                            2f97c177acea621eccccb51a191f3328;\
                            991ba25a478d2c75ed585a110880ef26;\
                            f86422d7ea022f9676ea29c9115fbc59;\
                            a23ca055c55cb731f73d9de7855b98d2;\
                            fef1b9899ff8b52378ef24bf4d9b805f;\
                            c0b2e1fbe9d8adba37e0b5067e40e913;\
                            bbec88b77d8ce8b2335a3e06dc2c39fe;\
                            68258c436f76a8eb2d3ca8a196e6d51b;\
                            7947bf0349e8cae56031e25e257c4e90;\
                            7f134ef90a468bffc7aaeb9c5620af94;\
                            ab5c78ddb69e3f7126be970f81bf793c;\
                            6389de8d45a0387426826ffa8c2e307a;\
                            cad71456e78576a407b0b479224fcd81;\
                            005aaa902ceba12b82e9ac7499cfe63a;\
                            32cc297b01b41e3e08fd900538925b51"

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
           echo -e "\tChecking the md5sum ..."; \
           checksum=$(echo $(md5sum ${TARBALL_PATH}.part${INDEX}) | awk '{print $1;}'); \
           [[ "${checksum}" == "${REFERENCE_SPLIT_MD5SUM[$i]}" ]] && { echo -e "\tChecksums match!"; } || { echo -e "\tWARNING::The checksum of part $i (${checksum}) doesn't match its reference checksum (${REFERENCE_SPLIT_MD5SUM})!"; break; }; \
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
    && echo "Installing Vivado ${VERSION} ..." \
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
    && useradd -ms /bin/bash vivado \
    && chown -R vivado /home/vivado \
    && echo "source /opt/Xilinx/Vivado/${VERSION}/settings64.sh" >> /home/vivado/.bashrc
USER vivado
WORKDIR /home/vivado

ENV DISPLAY :0
ENV GEOMETRY 1920x1200
ENV VERSION=${VERSION}

ENTRYPOINT /opt/Xilinx/Vivado/${VERSION}/bin/vivado
