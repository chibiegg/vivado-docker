#!/bin/bash

vncserver :0
/opt/Vivado_2018.2/xsetup --agree XilinxEULA,3rdPartyEULA,WebTalkTerms --batch Install --config /opt/install_config.txt
