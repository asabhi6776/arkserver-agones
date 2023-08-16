#!/bin/bash

/home/ark/steamcmd/steamcmd.sh +login anonymous \
                                +force_install_dir /home/ark/server \
                                +app_update 376030 validate \
                                +quit

/home/ark/server/ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?SessionName=YourServerName -server -log
