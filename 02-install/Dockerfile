FROM ubuntu:18.04-updated

RUN mkdir -p /opt
RUN ls -alh
RUN x=$(wget -q -O - https://cernbox.cern.ch/index.php/s/KTD0iNlea0ecqnr \
    | grep downloadURL | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*") \
    && wget -O /opt/Vivado_2018.2.tar.gz $x
RUN ls -alh
RUN ls -alh /opt/
RUN tar -xzf -C /opt/ Vivado_2018.2.tar.gz \
    && rm /opt/Vivado_2018.2.tar.gz
RUN ls -alh
RUN ls -alh /opt/
COPY files/install_config.txt /opt/install_config.txt
COPY files/install.sh /opt/install.sh

RUN chmod +x /opt/Vivado_2018.2/xsetup

ENV DISPLAY :0

CMD ["/opt/install.sh"]
