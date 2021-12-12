FROM ubuntu:20.04

LABEL maintainer="Reinhard Pointner <rednoah@filebot.net>"


ENV SENCHA_CMD_VERSION 7.5.0.5
ENV SENCHA_CMD_URL https://trials.sencha.com/cmd/$SENCHA_CMD_VERSION/no-jre/SenchaCmd-$SENCHA_CMD_VERSION-linux-amd64.sh.zip
ENV SENCHA_CMD_SHA256 e63f6855d863ad4fcfc17d7f0bfbee0b06b35ea02ac7ae3961b8eb96bdca2026


ENV LANG C.UTF-8


RUN apt-get update \
 && apt-get install -y curl p7zip-full openjdk-8-jdk nodejs \
 && rm -rvf /var/lib/apt/lists/*


RUN set -eux \
 ## * fetch installer archive
 && curl -L -o /tmp/SenchaCmd.zip "$SENCHA_CMD_URL" \
 && echo "$SENCHA_CMD_SHA256 */tmp/SenchaCmd.zip" | sha256sum -c - \
 ## * extract installer
 && 7z x -y -o/tmp /tmp/SenchaCmd.zip \
 && /tmp/SenchaCmd-*.sh -q -dir /opt/sencha/cmd \
 && rm -v /tmp/*.sh /tmp/*.zip


EXPOSE 1841


WORKDIR /src


ENTRYPOINT ["/opt/sencha/cmd/sencha"]
