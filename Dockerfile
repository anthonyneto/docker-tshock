FROM frolvlad/alpine-mono

MAINTAINER Mark <willietgwb@gmail.com>

COPY start.sh /start

RUN mkdir /world /config /logs /plugins /tshock && \
        cd /tshock && \
        wget https://github.com/Pryaxis/TShock/releases/download/v4.4.0-pre12/TShock4.4.0_Pre12_Terraria1.4.0.5.zip && \
        unzip TShock4.4.0_Pre12_Terraria1.4.0.5.zip && \
        rm TShock4.4.0_Pre12_Terraria1.4.0.5.zip && \
        chmod +x /tshock/TerrariaServer.exe && \
        chmod +x /start

# External data
VOLUME ["/world", "/config", "/logs", "/plugins"]

# Back to the working directory for the server
WORKDIR /tshock

EXPOSE 7777

ENTRYPOINT ["/start"]
