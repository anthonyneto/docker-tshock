FROM frolvlad/alpine-mono

MAINTAINER Mark <willietgwb@gmail.com>

COPY start.sh /start

RUN mkdir /world /config /logs /plugins /tshock && \
        cd /tshock && \
        wget https://github.com/Pryaxis/TShock/releases/download/v4.5.2/TShock.4.5.2.Terraria.1.4.2.2a.zip && \
        unzip TShock.4.5.2.Terraria.1.4.2.2a.zip && \
        rm TShock.4.5.2.Terraria.1.4.2.2a.zip && \
        mv TShock.4.5.2.Terraria.1.4.2.2a deploy && \
        chmod +x /tshock/deploy/TerrariaServer.exe && \
        chmod +x /start

# External data
VOLUME ["/world", "/config", "/logs", "/plugins"]

# Back to the working directory for the server
WORKDIR /tshock/deploy

EXPOSE 7777

ENTRYPOINT ["/start"]
