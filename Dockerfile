FROM itzg/minecraft-server

# Copy mods directory
COPY mods/ /data/mods/

EXPOSE 25565