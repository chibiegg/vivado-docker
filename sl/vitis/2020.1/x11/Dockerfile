FROM sl:7

COPY files/install_config.txt /opt/install_config.txt
COPY files/install.sh /opt/install.sh
COPY files/setup_ivarch.txt /opt/setup_ivarch.txt

ARG VERSION=2020.1
ARG INSTALLER_NAME=Xilinx_Unified_2020.1_0602_1208
ARG INSTALLER_PATH=/opt/${INSTALLER_NAME}/
ARG TARBALL_NAME=${INSTALLER_NAME}.tar.gz
ARG TARBALL_PATH=/opt/${TARBALL_NAME}
ARG REFERENCE_MD5SUM=b018f7b331ab0446137756156ff944d9
ARG CERNBOX_URL_LIST="https://cernbox.cern.ch/index.php/s/oGsDXtAPEqFuFcT;\
		      https://cernbox.cern.ch/index.php/s/sPnMLubydWDRUCA;\
		      https://cernbox.cern.ch/index.php/s/A4KnUE4MBnoP7FH;\
		      https://cernbox.cern.ch/index.php/s/C8iaCwmrVHkytFM;\
		      https://cernbox.cern.ch/index.php/s/fIzt3VksuwnYbse;\
		      https://cernbox.cern.ch/index.php/s/CGz76LgFQhm7qM7;\
		      https://cernbox.cern.ch/index.php/s/BxCXVvADQqabMF0;\
		      https://cernbox.cern.ch/index.php/s/UWutGocd7oUynMu;\
		      https://cernbox.cern.ch/index.php/s/19R4SZRpMU9B1z1;\
		      https://cernbox.cern.ch/index.php/s/52Tg52HSmWcPxHo;\
		      https://cernbox.cern.ch/index.php/s/AqqnIJ9ngimfkb0;\
		      https://cernbox.cern.ch/index.php/s/Np2BLo8edMzJS6T;\
		      https://cernbox.cern.ch/index.php/s/33Q7wVTGHwvFYm5;\
		      https://cernbox.cern.ch/index.php/s/5aQyKoxVRvMcAjV;\
		      https://cernbox.cern.ch/index.php/s/beyXQSSPxVX0bdH;\
		      https://cernbox.cern.ch/index.php/s/NEhUbf57aL0ap78;\
		      https://cernbox.cern.ch/index.php/s/ndGQNJ6NbyNYdf1;\
		      https://cernbox.cern.ch/index.php/s/OIy8rgDEAnKucmL;\
		      https://cernbox.cern.ch/index.php/s/8nTAF0XDcQHtsvR;\
		      https://cernbox.cern.ch/index.php/s/YeD1G2VFaNd126Y;\
		      https://cernbox.cern.ch/index.php/s/4vMjfml7DogJDRF;\
		      https://cernbox.cern.ch/index.php/s/EJQTGXi4BJ6O90x;\
		      https://cernbox.cern.ch/index.php/s/lfLykbhQgYXVjjx;\
		      https://cernbox.cern.ch/index.php/s/47RLb696twmKaMy;\
		      https://cernbox.cern.ch/index.php/s/CJmKpRtWwKN453E;\
		      https://cernbox.cern.ch/index.php/s/t47ExCdgZepOr35;\
		      https://cernbox.cern.ch/index.php/s/sxFMyXUMdijt4TW;\
		      https://cernbox.cern.ch/index.php/s/M8TZ1SZlfHO7eq2;\
		      https://cernbox.cern.ch/index.php/s/xNqWAWxQIisTzKK;\
		      https://cernbox.cern.ch/index.php/s/lVp6IemZHg8zkEX;\
		      https://cernbox.cern.ch/index.php/s/DYzfqvDWyUwIuID;\
		      https://cernbox.cern.ch/index.php/s/UnUKLisLlQJirRn;\
		      https://cernbox.cern.ch/index.php/s/ZZuimRTIfzolGxw;\
		      https://cernbox.cern.ch/index.php/s/rWw2TDu0gvXuqs4;\
		      https://cernbox.cern.ch/index.php/s/Sx1F6E6B4pmMMf0;\
		      https://cernbox.cern.ch/index.php/s/R1gHFkp2S1uiGTS"
ARG REFERENCE_SPLIT_MD5SUM_LIST="63fe052446a8f3984b009b668edf0b28;\
				 d98f209d48d78b0fc88b6fcaafb126c5;\
				 4db3a920e1906bf9a00e0464c6007cef;\
				 110ddce30f90c0fe5022b879a99db5cd;\
				 e2ca7403c11db5bd6e04cc2f4ed6a6a2;\
				 b3657e26184ae09bd9181c04fc7c60f4;\
				 912cb70981e47711121bd00d8711b5b9;\
				 7d1611cf5471fedcd78de77cb5cc81d9;\
				 21325a4a8528c5069796d360114ddedf;\
				 347ca434e5acc88b91fe97b4eeb00d72;\
				 1a5d6c3485764e13e29ccf10d80b0e19;\
				 2699f618b14adf8dd24e5a21407bcd68;\
				 5343985ea99a632ca3e321d049f16650;\
				 2273210a7a866a67218df0f0de131659;\
				 7ab038c44588693355a53b1f0e5dac2e;\
				 b16d8b30246e76fd1298e93de3a839fe;\
				 50efd7c194ce48b19dcbd933e4ec45f4;\
				 2df222bad15970488e6d623834ce2c1a;\
				 c2f16f95a81f48e2d77f4941f3f7e890;\
				 9685cef10d30cf25ad11111c2cb581f6;\
				 33e22ccaeac01195a8aa5e593228c377;\
				 ccb3bb0e6de6ff024a74dcd44d655549;\
				 3d6b5583c43eb3bed2c6389e57882479;\
				 0e5e68a894462f3d6d7cf0ad160c2873;\
				 42f4de4468d7ca5cc9e1147432fd527d;\
				 f1296d317f38f1d4031a43df90efde29;\
				 cce7ef094a2fd489236f1c12fdc0c3f2;\
				 eaecb68df929dcbe1ae3764f9505d69d;\
				 b279b224e58317a8a185c82d5cea0292;\
				 4bce143dd85ac224c6e89544cc9ce912;\
				 532fd928e16c25031c792d3187076512;\
				 bfb09c8c9d6b2b228518489df9cf896e;\
				 76fc7385e7535e7d6827555d701ba1f7;\
				 38a968f5e9bc7192efd9066dfd03cf6c;\
				 445d4978fd068614c1011b750a080ac2;\
				 2a9aa1603a5ea54e5806c9d397079f80"

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
    && echo "source /opt/Xilinx/Vitis/${VERSION}/settings64.sh" >> /home/vitis/.bashrc
USER vitis
WORKDIR /home/vitis

ENV DISPLAY :0
ENV GEOMETRY 1920x1200
ENV VERSION=${VERSION}

ENTRYPOINT /opt/Xilinx/Vitis/${VERSION}/bin/vitis
