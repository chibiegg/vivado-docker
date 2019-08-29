FROM ubuntu:18.04-updated

COPY files/install_config.txt /opt/install_config.txt
COPY files/install.sh /opt/install.sh

RUN mkdir -p /opt \
    && x=$(wget -q -O - https://cernbox.cern.ch/index.php/s/KTD0iNlea0ecqnr \
    | grep downloadURL | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*") \
    && wget -q -O /opt/Vivado_2018.2.tar.gz $x \
    && pv /opt/Vivado_2018.2.tar.gz | tar -xzf - --directory /opt/ \
    && rm /opt/Vivado_2018.2.tar.gz \
    && chmod +x /opt/Vivado_2018.2/xsetup \
    && /opt/install.sh

ENV DISPLAY :0
