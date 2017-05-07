FROM vivado:installed

RUN rm -rf /tmp/.X*

RUN useradd -ms /bin/bash vivado
USER vivado
WORKDIR /home/vivado

RUN mkdir -p /home/vivado/.vnc
ADD files/xstartup /home/vivado/.vnc/xstartup
ADD files/entrypoint.sh /opt/entrypoint.sh

ENV GEOMETRY 1024x768

CMD ["/opt/entrypoint.sh"]
