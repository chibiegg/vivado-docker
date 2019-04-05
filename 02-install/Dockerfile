FROM ubuntu:18.04-updated

RUN mkdir -p /opt
CMD ls -alh
RUN echo "Getting Vivado_2018.2.tar.gz from CERNBox ... "
RUN x=$(wget -q -O - https://cernbox.cern.ch/index.php/s/S9IBjrEjWVCeXYy \
    | grep downloadURL | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*") \
    && wget -O /opt/Vivado_2018.2.tar.gz $x \
    | tar -xzf -C /opt/ /opt/Vivado_2018.2.tar.gz \
    && rm /opt/Vivado_2018.2.tar.gz
CMD ls -alh
COPY files/install_config.txt /opt/install_config.txt
COPY files/install.sh /opt/install.sh

RUN chmod +x /opt/Vivado_2018.2/xsetup

ENV DISPLAY :0

CMD ["/opt/install.sh"]
