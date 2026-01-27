FROM sourcemation/jre-21

WORKDIR /app
COPY installer.jar installer.jar

RUN java -jar installer.jar --installServer

COPY . .

RUN echo "eula=true" > eula.txt
RUN chmod +x configure-server.sh

# Configure server properties with build-time secret
RUN --mount=type=secret,id=management_server_secret \
    ./configure-server.sh

CMD ["./run.sh"]