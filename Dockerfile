# Use a base image with SteamCMD, as Ark is distributed via Steam
FROM cm2network/steamcmd:latest

# Set environment variables for the Ark server
ENV ARK_DIR /home/steam/ark-server
ENV STEAMCMD_DIR /home/steam/steamcmd
ENV STEAMCMD_APPID 376030
ENV VALIDATE ""
ENV ADMIN_PASSWORD=defaultpassword
ENV ISLAND_NAME=TheIsland

# Create the directory for the Ark server
RUN mkdir -p $ARK_DIR

# Install the Ark server using SteamCMD
RUN $STEAMCMD_DIR/steamcmd.sh \
    +login anonymous \
    +force_install_dir $ARK_DIR \
    +app_update $STEAMCMD_APPID $VALIDATE \
    +quit

# Expose necessary ports
# Note: You might need to adjust these based on your server's configuration
EXPOSE 7777/udp
EXPOSE 7778/udp
EXPOSE 27015/udp

# Set the working directory
WORKDIR $ARK_DIR

# Command to run the Ark server
# CMD ["ShooterGame/Binaries/Linux/ShooterGameServer", "${ISLAND_NAME}?listen?ServerAdminPassword=${ADMIN_PASSWORD}", "-server", "-log"]
COPY start-ark.sh /start-ark.sh

# Set the entry point to the start script
ENTRYPOINT ["/start-ark.sh"]