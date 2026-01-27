# Minecraft Neoforge Server

A Docker-based Minecraft server running Neoforge with comprehensive configuration options.

## Configuration

### Build-time Arguments

| Argument | Default | Description |
|----------|---------|-------------|
| `RCON_ENABLED` | `0` | Enable RCON remote console (0=disabled, 1=enabled) |
| `TLS_ENABLED` | `0` | Enable TLS for management server (0=disabled, 1=enabled) |

### Environment Variables

All server properties can be configured via environment variables. Use uppercase with underscores instead of dashes (e.g., `MAX_PLAYERS` instead of `max-players`).

| Environment Variable | Default | Description | Secret Support |
|---------------------|---------|-------------|----------------|
| `ACCEPTS_TRANSFERS` | `false` | Allow server transfers | No |
| `ALLOW_FLIGHT` | `false` | Allow flying | No |
| `BROADCAST_CONSOLE_TO_OPS` | `true` | Broadcast console commands to ops | No |
| `BROADCAST_RCON_TO_OPS` | `true` | Broadcast RCON commands to ops | No |
| `BUG_REPORT_LINK` | `""` | Custom bug report link | No |
| `DIFFICULTY` | `easy` | Server difficulty (peaceful/easy/normal/hard) | No |
| `ENABLE_CODE_OF_CONDUCT` | `false` | Enable code of conduct | No |
| `ENABLE_JMX_MONITORING` | `false` | Enable JMX monitoring | No |
| `ENABLE_QUERY` | `false` | Enable query protocol | No |
| `ENABLE_RCON` | `false` | Enable RCON | No |
| `ENABLE_STATUS` | `true` | Enable server status | No |
| `ENFORCE_SECURE_PROFILE` | `true` | Enforce secure profile | No |
| `ENFORCE_WHITELIST` | `false` | Enforce whitelist | No |
| `ENTITY_BROADCAST_RANGE_PERCENTAGE` | `100` | Entity broadcast range percentage | No |
| `FORCE_GAMEMODE` | `false` | Force gamemode | No |
| `FUNCTION_PERMISSION_LEVEL` | `2` | Function permission level | No |
| `GAMEMODE` | `survival` | Default gamemode | No |
| `GENERATE_STRUCTURES` | `true` | Generate structures | No |
| `GENERATOR_SETTINGS` | `{}` | Generator settings JSON | No |
| `HARDCORE` | `false` | Hardcore mode | No |
| `HIDE_ONLINE_PLAYERS` | `false` | Hide online players | No |
| `INITIAL_DISABLED_PACKS` | `""` | Initially disabled packs | No |
| `INITIAL_ENABLED_PACKS` | `vanilla` | Initially enabled packs | No |
| `LEVEL_NAME` | `world` | World name | No |
| `LEVEL_SEED` | `""` | World seed | No |
| `LEVEL_TYPE` | `minecraft:normal` | Level type | No |
| `LOG_IPS` | `true` | Log player IPs | No |
| `MANAGEMENT_SERVER_ALLOWED_ORIGINS` | `""` | Allowed origins for management server | No |
| `MANAGEMENT_SERVER_ENABLED` | `false` | Enable management server | No |
| `MANAGEMENT_SERVER_HOST` | `localhost` | Management server host | No |
| `MANAGEMENT_SERVER_PORT` | `0` | Management server port | No |
| `MANAGEMENT_SERVER_SECRET` | *(auto-generated)* | Management server secret | **Required** (secret) |
| `MANAGEMENT_SERVER_TLS_ENABLED` | `true` | Enable TLS for management server | No |
| `MANAGEMENT_SERVER_TLS_KEYSTORE` | `""` | TLS keystore path | No |
| `MANAGEMENT_SERVER_TLS_KEYSTORE_PASSWORD` | `""` | TLS keystore password | **Optional** (secret) |
| `MAX_CHAINED_NEIGHBOR_UPDATES` | `1000000` | Max chained neighbor updates | No |
| `MAX_PLAYERS` | `20` | Maximum players | No |
| `MAX_TICK_TIME` | `60000` | Max tick time (ms) | No |
| `MAX_WORLD_SIZE` | `29999984` | Max world size | No |
| `MOTD` | `A Minecraft Server` | Server message of the day | No |
| `NETWORK_COMPRESSION_THRESHOLD` | `256` | Network compression threshold | No |
| `ONLINE_MODE` | `true` | Online mode authentication | No |
| `OP_PERMISSION_LEVEL` | `4` | OP permission level | No |
| `PAUSE_WHEN_EMPTY_SECONDS` | `60` | Pause when empty (seconds) | No |
| `PLAYER_IDLE_TIMEOUT` | `0` | Player idle timeout (minutes) | No |
| `PREVENT_PROXY_CONNECTIONS` | `false` | Prevent proxy connections | No |
| `QUERY_PORT` | `25565` | Query port | No |
| `RATE_LIMIT` | `0` | Rate limit | No |
| `RCON_PASSWORD` | `""` | RCON password | **Optional** (secret) |
| `RCON_PORT` | `25575` | RCON port | No |
| `REGION_FILE_COMPRESSION` | `deflate` | Region file compression | No |
| `REQUIRE_RESOURCE_PACK` | `false` | Require resource pack | No |
| `RESOURCE_PACK` | `""` | Resource pack URL | No |
| `RESOURCE_PACK_ID` | `""` | Resource pack ID | No |
| `RESOURCE_PACK_PROMPT` | `""` | Resource pack prompt | No |
| `RESOURCE_PACK_SHA1` | `""` | Resource pack SHA1 | No |
| `SERVER_IP` | `""` | Server IP binding | No |
| `SERVER_PORT` | `25565` | Server port | No |
| `SIMULATION_DISTANCE` | `10` | Simulation distance | No |
| `SPAWN_PROTECTION` | `16` | Spawn protection radius | No |
| `STATUS_HEARTBEAT_INTERVAL` | `0` | Status heartbeat interval | No |
| `SYNC_CHUNK_WRITES` | `true` | Sync chunk writes | No |
| `TEXT_FILTERING_CONFIG` | `""` | Text filtering config | No |
| `TEXT_FILTERING_VERSION` | `0` | Text filtering version | No |
| `USE_NATIVE_TRANSPORT` | `true` | Use native transport | No |
| `VIEW_DISTANCE` | `10` | View distance | No |
| `WHITELIST_ENABLED` | `false` | Enable whitelist | **Optional** (secret) |
| `WHITELIST_PLAYERS` | `""` | Whitelist players (comma-separated) | **Optional** (secret) |

### Docker Secrets

Docker secrets provide a secure way to pass sensitive information to the container. Secrets are mounted at build-time and take precedence over environment variables.

| Secret Name | Required | Description | When Used |
|-------------|----------|-------------|-----------|
| `management_server_secret` | **Required** | Secret for management server authentication | Always |
| `rcon_password` | Optional | Password for RCON access | When `RCON_ENABLED=1` |
| `management_server_tls_keystore_password` | Optional | Password for TLS keystore | When `TLS_ENABLED=1` |
| `WHITELIST_ENABLED` | Optional | Enable/disable whitelist | When using whitelist |
| `WHITELIST_PLAYERS` | Optional | Comma-separated list of players | When whitelist enabled |

### Whitelist Configuration

When `WHITELIST_ENABLED=true`, you can specify players using `WHITELIST_PLAYERS`:

```bash
# Using player names (Minecraft resolves UUIDs)
WHITELIST_PLAYERS="player1,player2,player3"

# Using UUID:name format
WHITELIST_PLAYERS="uuid1:name1,uuid2:name2"
```

## Advanced Usage

### Building with RCON Enabled

```bash
docker build --build-arg RCON_ENABLED=1 -t minecraft-server-rcon .
```

### Building with TLS Enabled

```bash
docker build --build-arg TLS_ENABLED=1 -t minecraft-server-tls .
```

### Running with Custom Configuration

```bash
docker run -d \
  --name minecraft-server \
  -p 25565:25565 \
  -v minecraft-world:/app/world \
  -e MAX_PLAYERS=50 \
  -e MOTD="My Awesome Server" \
  -e DIFFICULTY=hard \
  minecraft-server
```

### Using Docker Secrets

```bash
# Create secrets
echo "my-secret-key" | docker secret create management_server_secret -
echo "rcon-pass" | docker secret create rcon_password -

# Build with secrets
docker build --secret id=management_server_secret --secret id=rcon_password -t minecraft-server .
```

## Mods Included

This server comes pre-configured with the following mods:

- FallingTree
- Jade
- Mod Menu (NeoForge Edition)
- MouseTweaks
- ToolSwap
- Animal Feeding Trough
- Architectury
- Balm
- Collective
- Inventory Essentials
- Just Enough Items (JEI)
- Sophisticated Core
- Sophisticated Storage
- Spark
- Stack Refill
- TrashSlot
- Wooden Hopper

## Volumes

- `/app/world` - Persistent world data

## Ports

- `25565` - Minecraft server port
- `25575` - RCON port (if enabled)

## JVM Configuration

JVM arguments can be customized by modifying `user_jvm_args.txt` before building the image.

Default recommended setting for modded servers: 4GB RAM (`-Xmx4G -Xms4G`)