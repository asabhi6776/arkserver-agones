# --- First Stage: Downloading and Installing ---
FROM debian:buster-slim as builder

# Update and install dependencies
RUN apt-get update && \
    apt-get install -y lib32gcc1 wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a user for the ARK server
RUN useradd -m ark

# Switch to the new user
USER ark

# Set the home directory
WORKDIR /home/ark

# Install SteamCMD
RUN mkdir steamcmd && \
    cd steamcmd && \
    wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz && \
    ./steamcmd.sh +quit

# Download and install ARK server
RUN /home/ark/steamcmd/steamcmd.sh +login anonymous \
                                   +force_install_dir /home/ark/server \
                                   +app_update 376030 validate \
                                   +quit

# --- Second Stage: Setting up for Execution ---
FROM debian:buster-slim

# Update and install only the essential dependencies
RUN apt-get update && \
    apt-get install -y lib32gcc1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a user for the ARK server
RUN useradd -m ark

# Switch to the new user
USER ark

# Set the home directory
WORKDIR /home/ark

# Copy only the necessary directories from the builder image
COPY --from=builder /home/ark/server /home/ark/server

# Set the entrypoint
COPY entrypoint.sh /home/ark/entrypoint.sh
ENTRYPOINT ["/home/ark/entrypoint.sh"]