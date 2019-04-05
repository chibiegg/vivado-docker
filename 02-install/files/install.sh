#!/bin/bash

vncserver :0
tar -xzf Vivado_2018.2.tar.gz -C /opt/
/opt/Vivado_2018.2/xsetup --agree XilinxEULA,3rdPartyEULA,WebTalkTerms --batch Install --config /opt/install_config.txt
