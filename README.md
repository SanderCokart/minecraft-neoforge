# Minecraft NeoForge Server with itzg/minecraft-server

A Docker-based Minecraft server using the official [itzg/minecraft-server](https://github.com/itzg/docker-minecraft-server) image with NeoForge mod loader.

## Overview

This server uses the `itzg/minecraft-server` Docker image configured for NeoForge, providing automatic server downloads, updates, and comprehensive configuration options through environment variables.

## Quick Start

Build and run the server:

```bash
docker build -t minecraft-server .
docker run -d -p 25565:25565 --name minecraft-server minecraft-server
```

## Dokploy Configuration

Configure the following environment variables in your Dokploy deployment:

### Required Variables
| Variable | Value | Description |
|----------|-------|-------------|
| `EULA` | `TRUE` | Accept Minecraft EULA (required) |
| `TYPE` | `NEOFORGE` | Server type (automatically set) |
| `VERSION` | `1.21.11` | Minecraft version (automatically set) |
| `NEOFORGE_VERSION` | `21.11.0` | NeoForge version (automatically set) |

### Common Configuration Variables
| Variable | Default | Description |
|----------|---------|-------------|
| `MOTD` | `A Minecraft Server` | Server message of the day |
| `DIFFICULTY` | `easy` | Server difficulty (peaceful/easy/normal/hard) |
| `MAX_PLAYERS` | `20` | Maximum number of players |
| `VIEW_DISTANCE` | `10` | Server-side viewing distance |
| `SIMULATION_DISTANCE` | `10` | Simulation distance |
| `MEMORY` | `1G` | Java heap memory limit |
| `MAX_MEMORY` | `1G` | Maximum Java heap memory |
| `ENABLE_RCON` | `true` | Enable RCON for remote administration |
| `RCON_PASSWORD` | *required if RCON enabled* | RCON password |

### Memory Configuration
For a modded server, set appropriate memory limits:
- `MEMORY=4G`
- `INIT_MEMORY=4G`
- `MAX_MEMORY=4G`

### RCON Configuration
```bash
ENABLE_RCON=TRUE
RCON_PASSWORD=your_secure_password
RCON_PORT=25575
```

### Whitelist Configuration
```bash
ENABLE_WHITELIST=TRUE
WHITELIST=player1,player2,player3
```

## Volumes

The container uses the following volumes:
- `/data` - Server data directory (world saves, configs, mods)

Mount a persistent volume for your world data:
```bash
-v minecraft-data:/data
```

## Mods Included

The server comes pre-installed with the following NeoForge mods:

- **FallingTree** - Auto-break entire trees
- **Jade** - WAILA (What Am I Looking At) mod
- **Mod Menu** - In-game mod configuration menu
- **MouseTweaks** - Enhanced item moving/dragging
- **ToolSwap** - Auto-switch to appropriate tools
- **Animal Feeding Trough** - Automated animal feeding
- **Architectury** - Cross-platform mod framework
- **Balm** - Library mod for other mods
- **Collective** - Shared library for mods
- **Inventory Essentials** - Enhanced inventory management
- **Just Enough Items (JEI)** - Item/recipe viewer
- **Sophisticated Core** - Storage mod framework
- **Sophisticated Storage** - Advanced storage solutions
- **Spark** - Performance profiling tool
- **Stack Refill** - Auto-refill stacks
- **TrashSlot** - Quick item disposal
- **Wooden Hopper** - Wooden hopper blocks

## Ports

- `25565` - Minecraft server port
- `25575` - RCON port (when enabled)

## Deployment with Dokploy

1. **Build the image** in your CI/CD pipeline or locally
2. **Deploy to Dokploy** with the environment variables above
3. **Mount persistent volumes** for `/data` to preserve world data
4. **Configure networking** to expose port 25565

### Example Dokploy Environment Variables

```bash
EULA=TRUE
TYPE=NEOFORGE
VERSION=1.21.11
NEOFORGE_VERSION=21.11.0
MOTD=Welcome to My NeoForge Server!
DIFFICULTY=normal
MAX_PLAYERS=10
MEMORY=4G
MAX_MEMORY=4G
ENABLE_RCON=TRUE
RCON_PASSWORD=secure_password_here
```

## Updating

The `itzg/minecraft-server` image supports automatic updates. To update your server:

1. Pull the latest base image
2. Rebuild your custom image
3. Restart your Dokploy deployment

The server will automatically download the latest compatible versions based on your `VERSION` and `NEOFORGE_VERSION` settings.