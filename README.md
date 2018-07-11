# luzifer-docker / steam-base

Base container for building steam game server containers including

- [dumb-init](https://github.com/Yelp/dumb-init)
- [gosu](https://github.com/tianon/gosu)
- steamcmd

## Usage

```
FROM luzifer/steam-base

COPY install.txt /tmp/install.txt
RUN gosu steam steamcmd.sh +runscript /tmp/install.txt
```
