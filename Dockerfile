FROM itzg/minecraft-server

# Set NeoForge as the server type
ENV TYPE=NEOFORGE

# Set Minecraft version (based on your mods)
ENV VERSION=1.21.11

# Use NeoForge 21.11 for Minecraft 1.21.11
ENV NEOFORGE_VERSION=21.11.0

# Accept EULA (required) - will be overridden by Dokploy
ENV EULA=TRUE

# Copy server properties and other configuration
COPY server.properties /data/server.properties
COPY user_jvm_args.txt /data/user_jvm_args.txt

# Copy mods directory
COPY mods/ /data/mods/

# Expose Minecraft port
EXPOSE 25565

# Default command (inherited from base image)