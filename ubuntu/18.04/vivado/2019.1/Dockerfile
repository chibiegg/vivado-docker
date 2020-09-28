FROM ubuntu:18.04

COPY files/install_config.txt.template /opt/install_config.txt.template
COPY files/entrypoint.sh /opt/entrypoint.sh

ENV VIVADO_VERSION=2019.1

RUN apt-get update \
    && apt-get -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential default-jre xorg libxrender-dev libxtst-dev vnc4server twm vim sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt
ADD files/Xilinx_Vivado_SDx_Update_2019.1.3_0904_0930.tar.gz /opt/


ARG VIVADO_EDITION="Vivado HL Design Edition"
ARG VIVADO_MODULES="Vivado:1,Vivado High Level Synthesis:0,Software Development Kit:0,DocNav:0,Artix-7,Kintex-7,Zynq-7000:1"

RUN mkdir ~/.vnc \
    && echo "29g8/XJ6FFg=" | base64 -d > ~/.vnc/passwd && chmod 600 ~/.vnc/passwd

RUN chmod +x /opt/Xilinx_Vivado_*/xsetup \
    && vncserver :0 \
    && cat /opt/install_config.txt.template | \
       sed -e 's/%%EDITION%%/${VIVADO_EDITION}/' \
           -e 's/%%MODULES%%/${VIVADO_MODULES}/' \
       > /opt/install_config.txt \
    && cat /opt/install_config.txt \
    && /opt/Xilinx_Vivado_*/xsetup --agree XilinxEULA,3rdPartyEULA,WebTalkTerms --batch Install --config /opt/install_config.txt \
    && rm -rf /opt/Xilinx_Vivado_*/ \
    && rm -rf /tmp/.X*

RUN useradd -ms /bin/bash vivado \
    && mkdir -p /home/vivado/.vnc \
    && echo "29g8/XJ6FFg=" | base64 -d > /home/vivado/passwd && chmod 600 /home/vivado/passwd \ 
    && echo "source /opt/Xilinx/Vivado/${VIVADO_VERSION}/settings64.sh" >> /home/vivado/.bashrc

COPY files/xstartup /home/vivado/.vnc/xstartup

RUN chown -R vivado /home/vivado

USER vivado
WORKDIR /home/vivado

ENV DISPLAY :0
ENV GEOMETRY 1920x1200

EXPOSE 5900
ENTRYPOINT ["/opt/entrypoint.sh"]
