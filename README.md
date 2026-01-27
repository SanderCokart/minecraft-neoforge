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

The `itzg/minecraft-server` image supports extensive configuration through environment variables. Below are all supported variables from the official documentation, organized by category.

### Core Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `EULA` | - | **REQUIRED**: Must be set to `TRUE` to accept Minecraft EULA |
| `TYPE` | `VANILLA` | Server type: `VANILLA`, `FORGE`, `NEOFORGE`, `FABRIC`, `PAPER`, etc. |
| `VERSION` | `LATEST` | Minecraft version: `LATEST`, `SNAPSHOT`, or specific version |

### Server Properties

| Variable | Default | Description |
|----------|---------|-------------|
| `ALLOW_FLIGHT` | `false` | Allow flying in survival mode |
| `ALLOW_NETHER` | `true` | Allow travel to the Nether |
| `ANNOUNCE_PLAYER_ACHIEVEMENTS` | `true` | Announce player achievements |
| `DIFFICULTY` | `easy` | Server difficulty: `peaceful`, `easy`, `normal`, `hard` |
| `ENABLE_COMMAND_BLOCK` | - | Enable command blocks |
| `ENABLE_STATUS` | - | Enable server status |
| `ENTITY_BROADCAST_RANGE_PERCENTAGE` | - | Entity broadcast range percentage |
| `FORCE_GAMEMODE` | `false` | Force players to join in the default game mode |
| `FUNCTION_PERMISSION_LEVEL` | - | Function permission level |
| `GENERATE_STRUCTURES` | `true` | Generate structures (villages, etc.) |
| `GENERATOR_SETTINGS` | - | World generator settings |
| `HARDCORE` | `false` | Enable hardcore mode |
| `LEVEL` | `world` | World save directory name |
| `LEVEL_TYPE` | `minecraft:default` | Level type |
| `MAX_BUILD_HEIGHT` | `256` | Maximum build height |
| `MAX_PLAYERS` | `20` | Maximum number of players |
| `MAX_WORLD_SIZE` | - | Maximum world size |
| `MODE` | - | Game mode (survival/creative/adventure/spectator) |
| `MOTD` | `A Minecraft Server` | Server message of the day |
| `NETWORK_COMPRESSION_THRESHOLD` | `256` | Network compression threshold |
| `ONLINE_MODE` | `true` | Enable online mode authentication |
| `OP_PERMISSION_LEVEL` | - | OP permission level |
| `PLAYER_IDLE_TIMEOUT` | - | Player idle timeout |
| `PREVENT_PROXY_CONNECTIONS` | `false` | Prevent proxy connections |
| `PVP` | `true` | Enable player vs player combat |
| `SEED` | - | World seed |
| `SERVER_NAME` | - | Server name |
| `SERVER_PORT` | - | Server port |
| `SIMULATION_DISTANCE` | - | Simulation distance |
| `SNOOPER_ENABLED` | `true` | Enable snooper |
| `SPAWN_ANIMALS` | `true` | Enable animal spawning |
| `SPAWN_MONSTERS` | `true` | Enable monster spawning |
| `SPAWN_NPCS` | `true` | Enable villager spawning |
| `SPAWN_PROTECTION` | - | Spawn protection radius |
| `STOP_SERVER_ANNOUNCE_DELAY` | - | Delay before announcing server stop |
| `SYNC_CHUNK_WRITES` | - | Sync chunk writes |
| `USE_NATIVE_TRANSPORT` | - | Use native transport |
| `VIEW_DISTANCE` | - | Server-side viewing distance |

### Memory & JVM Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `INIT_MEMORY` | `1G` | Initial Java heap size |
| `JVM_DD_OPTS` | - | System properties (-D flags) as comma-separated list |
| `JVM_OPTS` | - | Additional JVM options |
| `JVM_XX_OPTS` | - | Additional -XX JVM options |
| `MAX_MEMORY` | `1G` | Maximum Java heap size |
| `MEMORY` | `1G` | Initial and maximum Java heap size |
| `USE_AIKAR_FLAGS` | `false` | Enable Aikar's optimized JVM flags |
| `USE_FLARE_FLAGS` | - | Enable JVM flags for Flare profiling |
| `USE_MEOWICE_FLAGS` | `false` | Enable MeowIce's JVM flags |
| `USE_MEOWICE_GRAALVM_FLAGS` | `true` | Enable MeowIce's GraalVM flags |
| `USE_SIMD_FLAGS` | `false` | Enable SIMD optimizations |

### RCON Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `BROADCAST_RCON_TO_OPS` | `false` | Broadcast RCON commands to operators |
| `ENABLE_RCON` | `true` | Enable RCON for remote administration |
| `RCON_CMDS_FIRST_CONNECT` | - | RCON commands on first client connect |
| `RCON_CMDS_LAST_DISCONNECT` | - | RCON commands on last client disconnect |
| `RCON_CMDS_ON_CONNECT` | - | RCON commands on client connect |
| `RCON_CMDS_ON_DISCONNECT` | - | RCON commands on client disconnect |
| `RCON_CMDS_STARTUP` | - | RCON commands on server startup |
| `RCON_PASSWORD` | *(randomly generated)* | RCON password |
| `RCON_PORT` | `25575` | RCON port |

### Whitelist Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `ENABLE_WHITELIST` | `false` | Enable server whitelist |
| `OVERRIDE_WHITELIST` | `false` | Override existing whitelist |
| `WHITELIST` | - | Comma-separated list of players |
| `WHITELIST_FILE` | - | Path to whitelist JSON file |

### Resource Pack Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `RESOURCE_PACK` | - | URL to resource pack |
| `RESOURCE_PACK_ENFORCE` | `FALSE` | Require clients to use resource pack |
| `RESOURCE_PACK_SHA1` | - | SHA1 hash of resource pack |

### Auto-Pause Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `AUTOPAUSE_KNOCK_INTERFACE` | `eth0` | Network interface for auto-pause |
| `AUTOPAUSE_PERIOD` | `10` | Auto-pause check period |
| `AUTOPAUSE_TIMEOUT_EST` | `3600` | Time before pausing after last disconnect |
| `AUTOPAUSE_TIMEOUT_INIT` | `600` | Time before pausing after startup |
| `AUTOPAUSE_TIMEOUT_KN` | `120` | Time before pausing after port knock |
| `DEBUG_AUTOPAUSE` | `false` | Enable auto-pause debugging |
| `ENABLE_AUTOPAUSE` | `FALSE` | Enable auto-pause functionality |

### Auto-Stop Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `AUTOSTOP_PERIOD` | `10` | Auto-stop check period |
| `AUTOSTOP_TIMEOUT_EST` | `3600` | Time before stopping after last disconnect |
| `AUTOSTOP_TIMEOUT_INIT` | `1800` | Time before stopping after startup |
| `DEBUG_AUTOSTOP` | `false` | Enable auto-stop debugging |
| `ENABLE_AUTOSTOP` | `FALSE` | Enable auto-stop functionality |

### CurseForge/Mod Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `CF_API_KEY` | - | CurseForge API key |
| `CF_API_KEY_FILE` | - | Path to file containing CurseForge API key |
| `CF_EXCLUDE_INCLUDE_FILE` | - | Path to exclude/include configuration file |
| `CF_EXCLUDE_MODS` | - | Comma/space separated list of mod slugs/IDs to exclude |
| `CF_FILE_ID` | - | Specific CurseForge file ID |
| `CF_FILENAME_MATCHER` | - | Filename pattern to match |
| `CF_FORCE_INCLUDE_MODS` | - | Comma/space separated list of mod slugs/IDs to force include |
| `CF_FORCE_SYNCHRONIZE` | `false` | Force re-evaluation of excludes/includes |
| `CF_MOD_LOADER_VERSION` | - | Override mod loader version |
| `CF_OVERRIDES_SKIP_EXISTING` | `false` | Skip existing files in overrides |
| `CF_PAGE_URL` | - | CurseForge page URL |
| `CF_PARALLEL_DOWNLOADS` | `4` | Number of parallel mod downloads |
| `CF_SET_LEVEL_FROM` | - | Set LEVEL from WORLD_FILE or OVERRIDES |
| `CF_SLUG` | - | CurseForge modpack slug |

### System & Logging Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `CONSOLE` | `TRUE` | Console mode for older servers |
| `DEBUG` | - | Enable general debugging |
| `DEBUG_EXEC` | - | Debug command-line execution |
| `DEBUG_MEMORY` | - | Debug memory allocation |
| `ENABLE_JMX` | `false` | Enable JMX monitoring |
| `ENABLE_ROLLING_LOGS` | `false` | Enable log rolling |
| `EXEC_DIRECTLY` | `false` | Execute server directly (attach console) |
| `EXTRA_ARGS` | - | Extra arguments for server jar |
| `GID` | `1000` | Group ID for container |
| `GUI` | `TRUE` | GUI mode (for older servers) |
| `JMX_HOST` | - | JMX host for monitoring |
| `LOG_CONSOLE_FORMAT` | `[%d{HH:mm:ss}] [%t/%level]: %msg%n` | Console log format |
| `LOG_FILE_FORMAT` | `[%d{HH:mm:ss}] [%t/%level]: %msg%n` | File log format |
| `LOG_LEVEL` | `info` | Root logger level |
| `LOG_TERMINAL_FORMAT` | `[%d{HH:mm:ss} %level]: %msg%n` | Terminal log format |
| `PROXY` | `false` | Enable HTTP proxy |
| `ROLLING_LOG_FILE_PATTERN` | `logs/%d{yyyy-MM-dd}-%i.log.gz` | Rolling log file pattern |
| `ROLLING_LOG_MAX_FILES` | `1000` | Maximum number of rolled log files |
| `SETUP_ONLY` | `false` | Setup files only, don't start server |
| `SKIP_CHOWN_DATA` | - | Skip changing ownership of /data directory |
| `STOP_DURATION` | `60` | Graceful shutdown timeout |
| `TZ` | `UTC` | Timezone |
| `UID` | `1000` | User ID for container |

### Dokploy Configuration Examples

**Basic NeoForge Server:**
```bash
EULA=TRUE
TYPE=NEOFORGE
VERSION=1.21.11
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
AUTOPAUSE_TIMEOUT_INIT=600
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

# Basic Server Settings
MOTD=Welcome to My NeoForge Server!
DIFFICULTY=normal
MAX_PLAYERS=20
MODE=survival
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