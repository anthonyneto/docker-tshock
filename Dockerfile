FROM frolvlad/alpine-mono

MAINTAINER Mark <willietgwb@gmail.com>

COPY start.sh /start

RUN mkdir /world /config /logs /plugins /tshock && \
        cd /tshock && \
        wget https://github.com/Pryaxis/TShock/releases/download/v4.4.0-pre13/TShock4.4.0_Pre13_Terraria1.4.1.1.zip && \
        unzip TShock4.4.0_Pre13_Terraria1.4.1.1.zip && \
        rm TShock4.4.0_Pre13_Terraria1.4.1.1.zip && \
        chmod +x /tshock/TerrariaServer.exe && \
        chmod +x /start

# External data
VOLUME ["/world", "/config", "/logs", "/plugins"]

# Back to the working directory for the server
WORKDIR /tshock

EXPOSE 7777

ENTRYPOINT ["/start"]
