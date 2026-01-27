FROM sourcemation/jre-21

# Build args to control optional secret mounting
ARG RCON_ENABLED=0
ARG TLS_ENABLED=0

WORKDIR /app
COPY installer.jar installer.jar

RUN java -jar installer.jar --installServer

COPY . .

RUN echo "eula=true" > eula.txt
RUN chmod +x configure-server.sh

# Configure server properties with build-time secrets
# Only mount optional secrets if enabled via build args
RUN --mount=type=secret,id=management_server_secret \
    ${RCON_ENABLED:+--mount=type=secret,id=rcon_password} \
    ${TLS_ENABLED:+--mount=type=secret,id=management_server_tls_keystore_password} \
    ./configure-server.sh

CMD ["./run.sh"]