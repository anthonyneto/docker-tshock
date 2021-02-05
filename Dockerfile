FROM frolvlad/alpine-mono

MAINTAINER Mark <willietgwb@gmail.com>

COPY start.sh /start

RUN mkdir /world /config /logs /plugins /tshock && \
        cd /tshock && \
        wget https://github.com/Pryaxis/TShock/releases/download/v4.4.0-pre15/TShock4.4.0_Pre15_Terraria1.4.1.2.zip && \
        unzip TShock4.4.0_Pre15_Terraria1.4.1.2.zip && \
        rm TShock4.4.0_Pre15_Terraria1.4.1.2.zip && \
        mv TShock4.4.0_Pre15_Terraria1.4.1.2 deploy && \
        chmod +x /tshock/deploy/TerrariaServer.exe && \
        chmod +x /start

# External data
VOLUME ["/world", "/config", "/logs", "/plugins"]

# Back to the working directory for the server
WORKDIR /tshock/deploy

EXPOSE 7777

ENTRYPOINT ["/start"]
