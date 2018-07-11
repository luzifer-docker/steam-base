FROM debian:stretch

ENV DUMB_INIT_VERSION=1.2.1 \
    GOSU_VERSION=1.10 \
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/steam/steamcmd

RUN set -ex \
 && apt-get update \
 && apt-get install --no-install-recommends -y \
      ca-certificates \
      curl \
      lib32gcc1 \
      lib32ncurses5 \
      lib32z1 \
 && rm -rf /var/lib/apt/lists/* \
 && useradd -d /home/steam -m -u 1000 steam \
 && mkdir /home/steam/steamcmd \
 && curl -sSLf "http://media.steampowered.com/client/steamcmd_linux.tar.gz" | tar -C /home/steam/steamcmd -xvz \
 && chown -R steam /home/steam/steamcmd \
 && curl -sSfLo /usr/local/bin/dumb-init "https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64" \
 && curl -sSfLo /usr/local/bin/gosu      "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" \
 && chmod 0755 \
      /usr/local/bin/dumb-init \
      /usr/local/bin/gosu
