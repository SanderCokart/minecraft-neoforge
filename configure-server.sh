#!/bin/bash

# Minecraft Server Properties Configuration Script
# Only overrides values when environment variables are provided
# Supports Docker secrets for sensitive data

set -e

echo "Configuring Minecraft server properties..."

# Function to get value from Docker secret or environment variable
get_secret_or_env() {
    local secret_name="$1"
    local env_var="$2"
    local secret_path="/run/secrets/$secret_name"

    if [ -f "$secret_path" ]; then
        cat "$secret_path" | tr -d '\n'
    elif [ -n "${!env_var}" ]; then
        echo "${!env_var}"
    fi
}

# Function to update a property in server.properties if env var or build secret is set
update_property() {
    local property="$1"
    local secret_id="$2"
    local env_var="$3"
    local value

    # Check build-time secret first, then environment variable
    if [ -f "/run/secrets/$secret_id" ]; then
        value=$(cat "/run/secrets/$secret_id" | tr -d '\n')
    elif [ -n "${!env_var}" ]; then
        value="${!env_var}"
    fi

    if [ -n "$value" ]; then
        echo "Setting $property=$value"
        sed -i "s|^$property=.*|$property=$value|" server.properties
    fi
}

# Update properties only if build secrets or environment variables are provided
update_property "accepts-transfers" "" "ACCEPTS_TRANSFERS"
update_property "allow-flight" "" "ALLOW_FLIGHT"
update_property "broadcast-console-to-ops" "" "BROADCAST_CONSOLE_TO_OPS"
update_property "broadcast-rcon-to-ops" "" "BROADCAST_RCON_TO_OPS"
update_property "bug-report-link" "" "BUG_REPORT_LINK"
update_property "difficulty" "" "DIFFICULTY"
update_property "enable-code-of-conduct" "" "ENABLE_CODE_OF_CONDUCT"
update_property "enable-jmx-monitoring" "" "ENABLE_JMX_MONITORING"
update_property "enable-query" "" "ENABLE_QUERY"
update_property "enable-rcon" "" "ENABLE_RCON"
update_property "enable-status" "" "ENABLE_STATUS"
update_property "enforce-secure-profile" "" "ENFORCE_SECURE_PROFILE"
update_property "enforce-whitelist" "" "ENFORCE_WHITELIST"
update_property "entity-broadcast-range-percentage" "" "ENTITY_BROADCAST_RANGE_PERCENTAGE"
update_property "force-gamemode" "" "FORCE_GAMEMODE"
update_property "function-permission-level" "" "FUNCTION_PERMISSION_LEVEL"
update_property "gamemode" "" "GAMEMODE"
update_property "generate-structures" "" "GENERATE_STRUCTURES"
update_property "generator-settings" "" "GENERATOR_SETTINGS"
update_property "hardcore" "" "HARDCORE"
update_property "hide-online-players" "" "HIDE_ONLINE_PLAYERS"
update_property "initial-disabled-packs" "" "INITIAL_DISABLED_PACKS"
update_property "initial-enabled-packs" "" "INITIAL_ENABLED_PACKS"
update_property "level-name" "" "LEVEL_NAME"
update_property "level-seed" "" "LEVEL_SEED"
update_property "level-type" "" "LEVEL_TYPE"
update_property "log-ips" "" "LOG_IPS"
update_property "management-server-allowed-origins" "" "MANAGEMENT_SERVER_ALLOWED_ORIGINS"
update_property "management-server-enabled" "" "MANAGEMENT_SERVER_ENABLED"
update_property "management-server-host" "" "MANAGEMENT_SERVER_HOST"
update_property "management-server-port" "" "MANAGEMENT_SERVER_PORT"
update_property "management-server-secret" "MANAGEMENT_SERVER_SECRET" "MANAGEMENT_SERVER_SECRET"
update_property "management-server-tls-enabled" "" "MANAGEMENT_SERVER_TLS_ENABLED"
update_property "management-server-tls-keystore" "" "MANAGEMENT_SERVER_TLS_KEYSTORE"
update_property "management-server-tls-keystore-password" "MANAGEMENT_SERVER_TLS_KEYSTORE_PASSWORD" "MANAGEMENT_SERVER_TLS_KEYSTORE_PASSWORD"
update_property "max-chained-neighbor-updates" "" "MAX_CHAINED_NEIGHBOR_UPDATES"
update_property "max-players" "" "MAX_PLAYERS"
update_property "max-tick-time" "" "MAX_TICK_TIME"
update_property "max-world-size" "" "MAX_WORLD_SIZE"
update_property "motd" "" "MOTD"
update_property "network-compression-threshold" "" "NETWORK_COMPRESSION_THRESHOLD"
update_property "online-mode" "" "ONLINE_MODE"
update_property "op-permission-level" "" "OP_PERMISSION_LEVEL"
update_property "pause-when-empty-seconds" "" "PAUSE_WHEN_EMPTY_SECONDS"
update_property "player-idle-timeout" "" "PLAYER_IDLE_TIMEOUT"
update_property "prevent-proxy-connections" "" "PREVENT_PROXY_CONNECTIONS"
update_property "query.port" "" "QUERY_PORT"
update_property "rate-limit" "" "RATE_LIMIT"
update_property "rcon.password" "RCON_PASSWORD" "RCON_PASSWORD"
update_property "rcon.port" "" "RCON_PORT"
update_property "region-file-compression" "" "REGION_FILE_COMPRESSION"
update_property "require-resource-pack" "" "REQUIRE_RESOURCE_PACK"
update_property "resource-pack" "" "RESOURCE_PACK"
update_property "resource-pack-id" "" "RESOURCE_PACK_ID"
update_property "resource-pack-prompt" "" "RESOURCE_PACK_PROMPT"
update_property "resource-pack-sha1" "" "RESOURCE_PACK_SHA1"
update_property "server-ip" "" "SERVER_IP"
update_property "server-port" "" "SERVER_PORT"
update_property "simulation-distance" "" "SIMULATION_DISTANCE"
update_property "spawn-protection" "" "SPAWN_PROTECTION"
update_property "status-heartbeat-interval" "" "STATUS_HEARTBEAT_INTERVAL"
update_property "sync-chunk-writes" "" "SYNC_CHUNK_WRITES"
update_property "text-filtering-config" "" "TEXT_FILTERING_CONFIG"
update_property "text-filtering-version" "" "TEXT_FILTERING_VERSION"
update_property "use-native-transport" "" "USE_NATIVE_TRANSPORT"
update_property "view-distance" "" "VIEW_DISTANCE"
update_property "white-list" "" "WHITELIST_ENABLED"

echo "Server properties updated successfully!"

# Handle whitelist if enabled and players are specified
WHITELIST_VALUE=""
WHITELIST_PLAYERS_VALUE=""

# Check build secret first, then environment variable for whitelist settings
if [ -f "/run/secrets/WHITELIST_ENABLED" ]; then
    WHITELIST_VALUE=$(cat "/run/secrets/WHITELIST_ENABLED" | tr -d '\n')
elif [ -n "$WHITELIST_ENABLED" ]; then
    WHITELIST_VALUE="$WHITELIST_ENABLED"
fi

if [ -f "/run/secrets/WHITELIST_PLAYERS" ]; then
    WHITELIST_PLAYERS_VALUE=$(cat "/run/secrets/WHITELIST_PLAYERS" | tr -d '\n')
elif [ -n "$WHITELIST_PLAYERS" ]; then
    WHITELIST_PLAYERS_VALUE="$WHITELIST_PLAYERS"
fi

if [ "$WHITELIST_VALUE" = "true" ] && [ -n "$WHITELIST_PLAYERS_VALUE" ]; then
    echo "Configuring whitelist..."

    # Create whitelist.json from environment variable
    # Expected format: WHITELIST_PLAYERS="player1,player2,player3" or "uuid1:name1,uuid2:name2"
    players_json=""
    IFS=',' read -ra PLAYERS <<< "$WHITELIST_PLAYERS_VALUE"
    for player in "${PLAYERS[@]}"; do
        player=$(echo "$player" | xargs)  # trim whitespace
        if [[ $player == *":"* ]]; then
            # UUID:NAME format
            uuid=$(echo "$player" | cut -d':' -f1)
            name=$(echo "$player" | cut -d':' -f2)
            players_json="${players_json}{\"uuid\":\"$uuid\",\"name\":\"$name\"},"
        else
            # Just NAME format (Minecraft will resolve UUID)
            players_json="${players_json}{\"name\":\"$player\"},"
        fi
    done
    # Remove trailing comma and wrap in array
    players_json="[${players_json%,}]"
    echo "$players_json" > whitelist.json

    echo "Whitelist configured!"
fi

echo "Configuration complete!"