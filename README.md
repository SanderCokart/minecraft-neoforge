# Minecraft NeoForge Server

A Docker-based Minecraft server using the official [itzg/minecraft-server](https://github.com/itzg/docker-minecraft-server) image with NeoForge mod loader and pre-installed mods.

## Features

- **NeoForge Mod Loader**: Latest NeoForge for Minecraft compatibility
- **Pre-installed Mods**: 17 carefully selected mods for enhanced gameplay
- **Docker-based**: Easy deployment and management
- **Environment Variable Configuration**: Full configuration through environment variables
- **Persistent Storage**: World data and configurations preserved in volumes

## Quick Start

### Build the Image

```bash
docker build -t minecraft-neoforge-server .
```

### Run the Server

```bash
docker run -d \
  --name minecraft-server \
  -p 25565:25565 \
  -e EULA=TRUE \
  -e TYPE=NEOFORGE \
  -e VERSION=1.21.11 \
  -v minecraft-data:/data \
  minecraft-neoforge-server
```

## Environment Variables

Configure the server using environment variables. All variables from the [itzg/minecraft-server](https://docker-minecraft-server.readthedocs.io/en/latest/variables/) documentation are supported.

### Required Variables

| Variable | Value | Description |
|----------|-------|-------------|
| `EULA` | `TRUE` | **Required**: Accept Minecraft EULA |
| `TYPE` | `NEOFORGE` | Server type (automatically configured for NeoForge) |
| `VERSION` | `1.21.11` | Minecraft version (matches installed mods) |

### Common Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `MOTD` | `A Minecraft Server` | Server message of the day |
| `DIFFICULTY` | `easy` | Server difficulty (peaceful/easy/normal/hard) |
| `MAX_PLAYERS` | `20` | Maximum number of players |
| `MEMORY` | `1G` | Java heap memory size |
| `MAX_MEMORY` | `1G` | Maximum Java heap memory |
| `VIEW_DISTANCE` | `10` | Server-side viewing distance |
| `SIMULATION_DISTANCE` | `10` | Simulation distance |
| `ENABLE_RCON` | `true` | Enable RCON for remote administration |
| `RCON_PASSWORD` | *(auto-generated)* | RCON password |
| `ONLINE_MODE` | `true` | Enable online mode authentication |

## Pre-installed Mods

This server comes with the following NeoForge mods pre-installed:

### Quality of Life
- **FallingTree** - Auto-break entire trees
- **Jade** - WAILA (What Am I Looking At) mod
- **Just Enough Items (JEI)** - Item and recipe viewer
- **Inventory Essentials** - Enhanced inventory management
- **MouseTweaks** - Enhanced item moving/dragging
- **ToolSwap** - Auto-switch to appropriate tools
- **Stack Refill** - Auto-refill item stacks

### Storage & Automation
- **Sophisticated Core** - Advanced storage framework
- **Sophisticated Storage** - Advanced storage solutions
- **Wooden Hopper** - Wooden hopper blocks

### Utilities
- **Mod Menu** - In-game mod configuration menu
- **Spark** - Performance profiling and monitoring
- **TrashSlot** - Quick item disposal slot

### Farming & Animals
- **Animal Feeding Trough** - Automated animal feeding system

### Libraries
- **Architectury** - Cross-platform mod framework
- **Balm** - Library mod for other mods
- **Collective** - Shared library for mods

## File Structure

```
minecraft/
├── Dockerfile              # Docker image definition
├── server.properties      # Default server configuration
├── mods/                  # Pre-installed NeoForge mods
│   ├── FallingTree-*.jar
│   ├── Jade-*.jar
│   ├── jei-*.jar
│   └── ... (16 more mods)
├── .dockerignore         # Docker build exclusions
└── README.md             # This file
```

## Docker Configuration

### Dockerfile

The Dockerfile is based on `itzg/minecraft-server` and copies all mods into the container:

```dockerfile
FROM itzg/minecraft-server

# Copy mods directory
COPY mods/ /data/mods/

EXPOSE 25565
```

### Volumes

Mount persistent volumes for data persistence:

```bash
-v minecraft-world:/data  # World saves, configs, and mods
```

### Ports

- `25565` - Minecraft server port
- `25575` - RCON port (when enabled)

## Deployment Options

### Docker Compose

```yaml
version: '3.8'
services:
  minecraft:
    build: .
    ports:
      - "25565:25565"
    environment:
      EULA: TRUE
      TYPE: NEOFORGE
      VERSION: 1.21.11
      MOTD: "My NeoForge Server"
      DIFFICULTY: normal
      MAX_PLAYERS: 10
      MEMORY: 4G
      MAX_MEMORY: 4G
    volumes:
      - minecraft-data:/data
    restart: unless-stopped

volumes:
  minecraft-data:
```

### Dokploy/Kubernetes

Set environment variables in your deployment platform:

```bash
EULA=TRUE
TYPE=NEOFORGE
VERSION=1.21.11
MOTD=Welcome to My Server!
DIFFICULTY=normal
MAX_PLAYERS=20
MEMORY=4G
MAX_MEMORY=4G
ENABLE_RCON=TRUE
RCON_PASSWORD=secure_password
```

## Updating

To update the server:

1. Pull latest base image changes
2. Update mods if needed
3. Rebuild the Docker image
4. Restart your container

The `itzg/minecraft-server` image automatically handles NeoForge and Minecraft updates based on your `VERSION` setting.

## Mod Management

### Adding Mods

To add additional mods:

1. Download mod JAR files
2. Place them in the `mods/` directory
3. Rebuild the Docker image

### Updating Mods

1. Download updated mod versions
2. Replace files in `mods/` directory
3. Rebuild and redeploy

### Removing Mods

1. Delete mod files from `mods/` directory
2. Rebuild the Docker image

## Server Configuration

The `server.properties` file contains default Minecraft server settings. These can be overridden using environment variables. Common configurations:

### Performance Tuning

```bash
MEMORY=6G
MAX_MEMORY=6G
USE_AIKAR_FLAGS=TRUE
VIEW_DISTANCE=16
SIMULATION_DISTANCE=12
NETWORK_COMPRESSION_THRESHOLD=512
```

### Security Settings

```bash
ONLINE_MODE=TRUE
ENABLE_RCON=TRUE
RCON_PASSWORD=your_secure_password
PREVENT_PROXY_CONNECTIONS=TRUE
```

### Gameplay Settings

```bash
DIFFICULTY=hard
MAX_PLAYERS=50
PVP=TRUE
SPAWN_PROTECTION=0
HARDCORE=FALSE
```

## Troubleshooting

### Common Issues

1. **"EULA not accepted"**: Set `EULA=TRUE` environment variable
2. **Mods not loading**: Ensure mods are compatible with NeoForge and Minecraft version
3. **Memory issues**: Increase `MEMORY` and `MAX_MEMORY` values
4. **Port conflicts**: Change host port mapping or container port

### Logs

View server logs:
```bash
docker logs minecraft-server
```

### Debug Mode

Enable debugging:
```bash
DEBUG=TRUE
DEBUG_EXEC=TRUE
```

## License

This project uses Minecraft, which requires acceptance of the [Minecraft EULA](https://www.minecraft.net/en-us/eula).

## Contributing

1. Fork the repository
2. Add/modify mods in the `mods/` directory
3. Test your changes
4. Submit a pull request

## Support

- [itzg/minecraft-server Documentation](https://docker-minecraft-server.readthedocs.io/)
- [NeoForge Website](https://neoforged.net/)
- [Minecraft Wiki](https://minecraft.wiki/)