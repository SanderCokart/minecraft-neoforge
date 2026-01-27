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

## Environment Variables

The `itzg/minecraft-server` image supports extensive configuration through environment variables. Below are the most commonly used ones for a NeoForge server setup.

### Core Server Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `EULA` | - | **REQUIRED**: Must be set to `TRUE` to accept Minecraft EULA |
| `TYPE` | `VANILLA` | Server type: `VANILLA`, `FORGE`, `NEOFORGE`, `FABRIC`, `PAPER`, etc. |
| `VERSION` | `LATEST` | Minecraft version: `LATEST`, `SNAPSHOT`, or specific version (e.g., `1.21.1`) |
| `NEOFORGE_VERSION` | `LATEST` | NeoForge version when `TYPE=NEOFORGE` |

### Server Properties

| Variable | Default | Description |
|----------|---------|-------------|
| `MOTD` | `A Minecraft Server` | Server message of the day |
| `DIFFICULTY` | `easy` | Server difficulty: `peaceful`, `easy`, `normal`, `hard` |
| `MAX_PLAYERS` | `20` | Maximum number of players |
| `MAX_WORLD_SIZE` | `29999984` | Maximum world size in blocks |
| `VIEW_DISTANCE` | `10` | Server-side viewing distance (chunks) |
| `SIMULATION_DISTANCE` | `10` | Simulation distance (chunks) |
| `SPAWN_PROTECTION` | `16` | Spawn protection radius |
| `LEVEL_NAME` | `world` | World save directory name |
| `LEVEL_SEED` | - | World seed |
| `GAME_MODE` | `survival` | Default game mode: `survival`, `creative`, `adventure`, `spectator` |
| `HARDCORE` | `false` | Enable hardcore mode |
| `ONLINE_MODE` | `true` | Enable online mode authentication |
| `PVP` | `true` | Enable player vs player combat |
| `ALLOW_FLIGHT` | `false` | Allow flying in survival mode |
| `ALLOW_NETHER` | `true` | Allow travel to the Nether |
| `SPAWN_ANIMALS` | `true` | Enable animal spawning |
| `SPAWN_MONSTERS` | `true` | Enable monster spawning |
| `SPAWN_NPCS` | `true` | Enable villager spawning |
| `GENERATE_STRUCTURES` | `true` | Generate structures (villages, etc.) |

### Memory & JVM Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `MEMORY` | `1G` | Initial and maximum Java heap size |
| `INIT_MEMORY` | `1G` | Initial Java heap size |
| `MAX_MEMORY` | `1G` | Maximum Java heap size |
| `USE_AIKAR_FLAGS` | `false` | Enable Aikar's optimized JVM flags |
| `USE_MEOWICE_FLAGS` | `false` | Enable MeowIce's JVM flags (Java 17+) |
| `JVM_OPTS` | - | Additional JVM options |
| `JVM_XX_OPTS` | - | Additional -XX JVM options |
| `JVM_DD_OPTS` | - | System properties (-D flags) as comma-separated list |

### RCON Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `ENABLE_RCON` | `true` | Enable RCON for remote administration |
| `RCON_PASSWORD` | *(randomly generated)* | RCON password |
| `RCON_PORT` | `25575` | RCON port |
| `BROADCAST_RCON_TO_OPS` | `false` | Broadcast RCON commands to operators |

### Whitelist & Security

| Variable | Default | Description |
|----------|---------|-------------|
| `ENABLE_WHITELIST` | `false` | Enable server whitelist |
| `WHITELIST` | - | Comma-separated list of players |
| `WHITELIST_FILE` | - | Path to whitelist JSON file |
| `ENFORCE_SECURE_PROFILE` | `true` | Enforce secure player profiles |
| `PREVENT_PROXY_CONNECTIONS` | `false` | Prevent proxy connections |

### Auto-Pause & Auto-Stop

| Variable | Default | Description |
|----------|---------|-------------|
| `ENABLE_AUTOPAUSE` | `false` | Pause server when no players online |
| `AUTOPAUSE_TIMEOUT_EST` | `3600` | Time before pausing after last disconnect |
| `ENABLE_AUTOSTOP` | `false` | Stop server when no players online |
| `AUTOSTOP_TIMEOUT_EST` | `3600` | Time before stopping after last disconnect |

### Resource Pack

| Variable | Default | Description |
|----------|---------|-------------|
| `RESOURCE_PACK` | - | URL to resource pack |
| `RESOURCE_PACK_SHA1` | - | SHA1 hash of resource pack |
| `RESOURCE_PACK_ENFORCE` | `false` | Require clients to use resource pack |

### Performance & Monitoring

| Variable | Default | Description |
|----------|---------|-------------|
| `ENABLE_JMX` | `false` | Enable JMX monitoring |
| `JMX_HOST` | - | JMX host (requires port forwarding) |
| `USE_FLARE_FLAGS` | `false` | Enable JVM flags for Flare profiling |
| `USE_SIMD_FLAGS` | `false` | Enable SIMD optimizations |
| `NETWORK_COMPRESSION_THRESHOLD` | `256` | Network compression threshold |
| `RATE_LIMIT` | `0` | Connection rate limit |

### System Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `UID` | `1000` | User ID for container |
| `GID` | `1000` | Group ID for container |
| `TZ` | `UTC` | Timezone |
| `LOG_LEVEL` | `info` | Logging level |
| `STOP_DURATION` | `60` | Graceful shutdown timeout (seconds) |

### Dokploy Configuration Examples

**Basic NeoForge Server:**
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
```

**With RCON and Security:**
```bash
ENABLE_RCON=TRUE
RCON_PASSWORD=your_secure_password
ENFORCE_SECURE_PROFILE=TRUE
ONLINE_MODE=TRUE
```

**Performance Optimized:**
```bash
USE_AIKAR_FLAGS=TRUE
VIEW_DISTANCE=12
SIMULATION_DISTANCE=12
NETWORK_COMPRESSION_THRESHOLD=512
```

**Auto-Pause for Resource Saving:**
```bash
ENABLE_AUTOPAUSE=TRUE
AUTOPAUSE_TIMEOUT_EST=1800
AUTOPAUSE_TIMEOUT_INIT=300
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

1. **Build the image** in your CI/CD pipeline or locally:
   ```bash
   docker build -t minecraft-server .
   ```

2. **Deploy to Dokploy** with the environment variables above

3. **Mount persistent volumes** for `/data` to preserve world data:
   ```bash
   -v minecraft-data:/data
   ```

4. **Configure networking** to expose port 25565

### Complete Example Configuration

```bash
# Required
EULA=TRUE
TYPE=NEOFORGE
VERSION=1.21.11
NEOFORGE_VERSION=21.11.0

# Basic Server Settings
MOTD=Welcome to My NeoForge Server!
DIFFICULTY=normal
MAX_PLAYERS=20
GAME_MODE=survival
HARDCORE=false

# Performance & Memory
MEMORY=4G
MAX_MEMORY=4G
USE_AIKAR_FLAGS=TRUE
VIEW_DISTANCE=12
SIMULATION_DISTANCE=12

# Security & Administration
ENABLE_RCON=TRUE
RCON_PASSWORD=your_secure_password_here
ENFORCE_SECURE_PROFILE=TRUE
ONLINE_MODE=TRUE

# Optional Features
ENABLE_WHITELIST=FALSE
ALLOW_FLIGHT=FALSE
PVP=TRUE
```

## Updating

The `itzg/minecraft-server` image supports automatic updates. To update your server:

1. Pull the latest base image
2. Rebuild your custom image
3. Restart your Dokploy deployment

The server will automatically download the latest compatible versions based on your `VERSION` and `NEOFORGE_VERSION` settings.