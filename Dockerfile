FROM frolvlad/alpine-mono

MAINTAINER Mark <willietgwb@gmail.com>

COPY start.sh /start

RUN mkdir -p /world /config /logs /plugins /tshock/deploy && \
        cd /tshock/deploy && \
        wget https://github.com/Pryaxis/TShock/releases/download/v4.5.3/TShock_4.5.3_Terraria_1.4.2.3.zip && \
        unzip TShock_4.5.3_Terraria_1.4.2.3.zip && \
        rm TShock_4.5.3_Terraria_1.4.2.3.zip && \
        chmod +x /tshock/deploy/TerrariaServer.exe && \
        chmod +x /start

# External data
VOLUME ["/world", "/config", "/logs", "/plugins"]

# Back to the working directory for the server
WORKDIR /tshock/deploy

EXPOSE 7777

ENTRYPOINT ["/start"]
